                                                                                                                    
 
pragma solidity 0.5.3;
pragma experimental ABIEncoderV2;


                                                                                                                          
contract ERC20Basic {
  function TOTALSUPPLY509() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF328(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER90(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER976(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE795(address _owner, address _spender)	//inject NONSTANDARD NAMING
    public view returns (uint256);

  function TRANSFERFROM574(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  function APPROVE261(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL787(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract EIP20 is ERC20 {
    string public name;
    uint8 public decimals;
    string public symbol;
}

interface NonCompliantEIP20 {
    function TRANSFER90(address _to, uint256 _value) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM574(address _from, address _to, uint256 _value) external;	//inject NONSTANDARD NAMING
    function APPROVE261(address _spender, uint256 _value) external;	//inject NONSTANDARD NAMING
}

contract EIP20Wrapper {

    function EIP20TRANSFER810(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).TRANSFER90(to, value);

        assembly {
            switch returndatasize()   
            case 0 {                        // non compliant ERC20
                result := not(0)            // result is true
            }
            case 32 {                       // compliant ERC20
                returndatacopy(0, 0, 32) 
                result := mload(0)          // result == returndata of external call
            }
            default {                       // not an not an ERC20 token
                revert(0, 0) 
            }
        }

        require(result, "eip20Transfer failed");
    }

    function EIP20TRANSFERFROM923(	//inject NONSTANDARD NAMING
        address token,
        address from,
        address to,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).TRANSFERFROM574(from, to, value);

        assembly {
            switch returndatasize()   
            case 0 {                        // non compliant ERC20
                result := not(0)            // result is true
            }
            case 32 {                       // compliant ERC20
                returndatacopy(0, 0, 32) 
                result := mload(0)          // result == returndata of external call
            }
            default {                       // not an not an ERC20 token
                revert(0, 0) 
            }
        }

        require(result, "eip20TransferFrom failed");
    }

    function EIP20APPROVE789(	//inject NONSTANDARD NAMING
        address token,
        address spender,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).APPROVE261(spender, value);

        assembly {
            switch returndatasize()   
            case 0 {                        // non compliant ERC20
                result := not(0)            // result is true
            }
            case 32 {                       // compliant ERC20
                returndatacopy(0, 0, 32) 
                result := mload(0)          // result == returndata of external call
            }
            default {                       // not an not an ERC20 token
                revert(0, 0) 
            }
        }

        require(result, "eip20Approve failed");
    }
}

                                                                                         
library SafeMath {

                                                               
  function MUL113(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

                                                                             
  function DIV505(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(_b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = _a / _b;
    // assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold
    return _a / _b;
  }

                                                                                            
  function DIVCEIL913(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (_a == 0) {
      return 0;
    }

    return ((_a - 1) / _b) + 1;
  }

                                                                                                           
  function SUB744(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(_b <= _a);
    return _a - _b;
  }

                                                         
  function ADD936(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}

                                                                                                                                                                                             
contract Ownable {
  address public owner;

  event OWNERSHIPTRANSFERRED260(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER974() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP620(address _newOwner) public ONLYOWNER974 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP425(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP425(address _newOwner) internal {	//inject NONSTANDARD NAMING
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED260(owner, _newOwner);
    owner = _newOwner;
  }
}

contract BZxOwnable is Ownable {

    address public bZxContractAddress;

    event BZXOWNERSHIPTRANSFERRED276(address indexed previousBZxContract, address indexed newBZxContract);	//inject NONSTANDARD NAMING

    // modifier reverts if bZxContractAddress isn't set
    modifier ONLYBZX628() {	//inject NONSTANDARD NAMING
        require(msg.sender == bZxContractAddress, "only bZx contracts can call this function");
        _;
    }

                                                                                                                                                                                                     
    function TRANSFERBZXOWNERSHIP99(address newBZxContractAddress) public ONLYOWNER974 {	//inject NONSTANDARD NAMING
        require(newBZxContractAddress != address(0) && newBZxContractAddress != owner, "transferBZxOwnership::unauthorized");
        emit BZXOWNERSHIPTRANSFERRED276(bZxContractAddress, newBZxContractAddress);
        bZxContractAddress = newBZxContractAddress;
    }

                                                                                                                                                                                                                                                                                
    function TRANSFEROWNERSHIP620(address newOwner) public ONLYOWNER974 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0) && newOwner != bZxContractAddress, "transferOwnership::unauthorized");
        emit OWNERSHIPTRANSFERRED260(owner, newOwner);
        owner = newOwner;
    }
}

contract ExchangeV2Interface {

    struct OrderV2 {
        address makerAddress;           // Address that created the order.
        address takerAddress;           // Address that is allowed to fill the order. If set to 0, any address is allowed to fill the order.
        address feeRecipientAddress;    // Address that will recieve fees when order is filled.
        address senderAddress;          // Address that is allowed to call Exchange contract methods that affect this order. If set to 0, any address is allowed to call these methods.
        uint256 makerAssetAmount;       // Amount of makerAsset being offered by maker. Must be greater than 0.
        uint256 takerAssetAmount;       // Amount of takerAsset being bid on by maker. Must be greater than 0.
        uint256 makerFee;               // Amount of ZRX paid to feeRecipient by maker when order is filled. If set to 0, no transfer of ZRX from maker to feeRecipient will be attempted.
        uint256 takerFee;               // Amount of ZRX paid to feeRecipient by taker when order is filled. If set to 0, no transfer of ZRX from taker to feeRecipient will be attempted.
        uint256 expirationTimeSeconds;  // Timestamp in seconds at which order expires.
        uint256 salt;                   // Arbitrary number to facilitate uniqueness of the order's hash.
        bytes makerAssetData;           // Encoded data that can be decoded by a specified proxy contract when transferring makerAsset. The last byte references the id of this proxy.
        bytes takerAssetData;           // Encoded data that can be decoded by a specified proxy contract when transferring takerAsset. The last byte references the id of this proxy.
    }

    struct FillResults {
        uint256 makerAssetFilledAmount;  // Total amount of makerAsset(s) filled.
        uint256 takerAssetFilledAmount;  // Total amount of takerAsset(s) filled.
        uint256 makerFeePaid;            // Total amount of ZRX paid by maker(s) to feeRecipient(s).
        uint256 takerFeePaid;            // Total amount of ZRX paid by taker to feeRecipients(s).
    }

                                   
                                                                     
                                                                  
                                                                         
                                                                    
                                                                
    function FILLORDERNOTHROW738(	//inject NONSTANDARD NAMING
        OrderV2 memory order,
        uint256 takerAssetFillAmount,
        bytes memory signature)
        public
        returns (FillResults memory fillResults);

                                                                                                                  
                                                                     
                                                    
                                                                         
                                                                        
                                                                 
    function MARKETSELLORDERSNOTHROW432(	//inject NONSTANDARD NAMING
        OrderV2[] memory orders,
        uint256 takerAssetFillAmount,
        bytes[] memory signatures)
        public
        returns (FillResults memory totalFillResults);


                                                
                                                
                                                                            
                                          
                                            
    function ISVALIDSIGNATURE364(	//inject NONSTANDARD NAMING
        bytes32 hash,
        address signerAddress,
        bytes calldata signature)
        external
        view
        returns (bool isValid);
}

contract BZxTo0xShared {
    using SafeMath for uint256;

                                                                                     
                                                 
                                   
                                       
                                                    
                                                     
    function _SAFEGETPARTIALAMOUNTFLOOR925(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
        internal
        pure
        returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        require(
            !_ISROUNDINGERRORFLOOR497(
                numerator,
                denominator,
                target
            ),
            "ROUNDING_ERROR"
        );
        
        partialAmount = SafeMath.DIV505(
            SafeMath.MUL113(numerator, target),
            denominator
        );
        return partialAmount;
    }

                                                                 
                                   
                                       
                                                                   
                                          
    function _ISROUNDINGERRORFLOOR497(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
        internal
        pure
        returns (bool isError)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );
        
        // The absolute rounding error is the difference between the rounded
        // value and the ideal value. The relative rounding error is the
        // absolute rounding error divided by the absolute value of the
        // ideal value. This is undefined when the ideal value is zero.
        //
        // The ideal value is `numerator * target / denominator`.
        // Let's call `numerator * target % denominator` the remainder.
        // The absolute error is `remainder / denominator`.
        //
        // When the ideal value is zero, we require the absolute error to
        // be zero. Fortunately, this is always the case. The ideal value is
        // zero iff `numerator == 0` and/or `target == 0`. In this case the
        // remainder and absolute error are also zero. 
        if (target == 0 || numerator == 0) {
            return false;
        }
        
        // Otherwise, we want the relative rounding error to be strictly
        // less than 0.1%.
        // The relative error is `remainder / (numerator * target)`.
        // We want the relative error less than 1 / 1000:
        //        remainder / (numerator * denominator)  <  1 / 1000
        // or equivalently:
        //        1000 * remainder  <  numerator * target
        // so we have a rounding error iff:
        //        1000 * remainder  >=  numerator * target
        uint256 remainder = mulmod(
            target,
            numerator,
            denominator
        );
        isError = SafeMath.MUL113(1000, remainder) >= SafeMath.MUL113(numerator, target);
        return isError;
    }
}

contract BZxTo0xV2 is BZxTo0xShared, EIP20Wrapper, BZxOwnable {
    using SafeMath for uint256;

    event LOGFILLRESULTS314(	//inject NONSTANDARD NAMING
        uint256 makerAssetFilledAmount,
        uint256 takerAssetFilledAmount,
        uint256 makerFeePaid,
        uint256 takerFeePaid
    );

    bool public DEBUG = false;

    address public exchangeV2Contract;
    address public zrxTokenContract;
    address public erc20ProxyContract;

    constructor(
        address _exchangeV2,
        address _zrxToken,
        address _proxy)
        public
    {
        exchangeV2Contract = _exchangeV2;
        zrxTokenContract = _zrxToken;
        erc20ProxyContract = _proxy;
    }

    function()
        external {
        revert();
    }

    // 0xc78429c4 == "take0xV2Trade(address,address,uint256,(address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,bytes,bytes)[],bytes[])"
    function TAKE0XV2TRADE625(	//inject NONSTANDARD NAMING
        address trader,
        address vaultAddress,
        uint256 sourceTokenAmountToUse,
        ExchangeV2Interface.OrderV2[] memory orders0x, // Array of 0x V2 order structs
        bytes[] memory signatures0x) // Array of signatures for each of the V2 orders
        public
        ONLYBZX628
        returns (
            address destTokenAddress,
            uint256 destTokenAmount,
            uint256 sourceTokenUsedAmount)
    {
        address sourceTokenAddress;

        //destTokenAddress==makerToken, sourceTokenAddress==takerToken
        (destTokenAddress, sourceTokenAddress) = GETV2TOKENS490(orders0x[0]);

        (sourceTokenUsedAmount, destTokenAmount) = _TAKE0XV2TRADE117(
            trader,
            sourceTokenAddress,
            sourceTokenAmountToUse,
            orders0x,
            signatures0x);

        if (sourceTokenUsedAmount < sourceTokenAmountToUse) {
            // all sourceToken has to be traded
            revert("BZxTo0xV2::take0xTrade: sourceTokenUsedAmount < sourceTokenAmountToUse");
        }

        // transfer the destToken to the vault
        EIP20TRANSFER810(
            destTokenAddress,
            vaultAddress,
            destTokenAmount);
    }

                                                                        
                                   
                                       
                                                    
                                        
    function GETPARTIALAMOUNT374(uint256 numerator, uint256 denominator, uint256 target)	//inject NONSTANDARD NAMING
        public
        pure
        returns (uint256)
    {
        return SafeMath.DIV505(SafeMath.MUL113(numerator, target), denominator);
    }

                                                                                      
                                        
                                                        
    function GETV2TOKENS490(	//inject NONSTANDARD NAMING
        ExchangeV2Interface.OrderV2 memory order)
        public
        pure
        returns (
            address makerTokenAddress,
            address takerTokenAddress)
    {
        bytes memory makerAssetData = order.makerAssetData;
        bytes memory takerAssetData = order.takerAssetData;
        bytes4 makerProxyID;
        bytes4 takerProxyID;

        // example data: 0xf47261b00000000000000000000000001dc4c1cefef38a777b15aa20260a54e584b16c48
        assembly {
            makerProxyID := mload(add(makerAssetData, 32))
            takerProxyID := mload(add(takerAssetData, 32))

            makerTokenAddress := mload(add(makerAssetData, 36))
            takerTokenAddress := mload(add(takerAssetData, 36))
        }

        // ERC20 Proxy ID -> bytes4(keccak256("ERC20Token(address)")) = 0xf47261b0
        require(makerProxyID == 0xf47261b0 && takerProxyID == 0xf47261b0, "BZxTo0xV2::getV2Tokens: 0x V2 orders must use ERC20 tokens");
    }

    function SET0XV2EXCHANGE155 (	//inject NONSTANDARD NAMING
        address _exchange)
        public
        ONLYOWNER974
    {
        exchangeV2Contract = _exchange;
    }

    function SETZRXTOKEN21 (	//inject NONSTANDARD NAMING
        address _zrxToken)
        public
        ONLYOWNER974
    {
        zrxTokenContract = _zrxToken;
    }

    function SET0XTOKENPROXY629 (	//inject NONSTANDARD NAMING
        address _proxy)
        public
        ONLYOWNER974
    {
        erc20ProxyContract = _proxy;
    }

    function APPROVEFOR899 (	//inject NONSTANDARD NAMING
        address token,
        address spender,
        uint256 value)
        public
        ONLYOWNER974
        returns (bool)
    {
        EIP20APPROVE789(
            token,
            spender,
            value);

        return true;
    }

    function TOGGLEDEBUG431 (	//inject NONSTANDARD NAMING
        bool isDebug)
        public
        ONLYOWNER974
    {
        DEBUG = isDebug;
    }

    function _TAKE0XV2TRADE117(	//inject NONSTANDARD NAMING
        address trader,
        address sourceTokenAddress,
        uint256 sourceTokenAmountToUse,
        ExchangeV2Interface.OrderV2[] memory orders0x, // Array of 0x V2 order structs
        bytes[] memory signatures0x)
        internal
        returns (uint256 sourceTokenUsedAmount, uint256 destTokenAmount)
    {
        uint256 zrxTokenAmount = 0;
        uint256 takerAssetRemaining = sourceTokenAmountToUse;
        for (uint256 i = 0; i < orders0x.length; i++) {
            // Note: takerAssetData (sourceToken) is confirmed to be the same in 0x for batch orders
            // To confirm makerAssetData is the same for each order, rather than doing a more expensive per order bytes
            // comparison, we will simply set makerAssetData the same in each order to the first value observed. The 0x
            // trade will fail for invalid orders.
            if (i > 0)
                orders0x[i].makerAssetData = orders0x[0].makerAssetData;

            // calculate required takerFee
            if (takerAssetRemaining > 0 && orders0x[i].takerFee > 0) { // takerFee
                if (takerAssetRemaining >= orders0x[i].takerAssetAmount) {
                    zrxTokenAmount = zrxTokenAmount.ADD936(orders0x[i].takerFee);
                    takerAssetRemaining = takerAssetRemaining.SUB744(orders0x[i].takerAssetAmount);
                } else {
                    zrxTokenAmount = zrxTokenAmount.ADD936(_SAFEGETPARTIALAMOUNTFLOOR925(
                        takerAssetRemaining,
                        orders0x[i].takerAssetAmount,
                        orders0x[i].takerFee
                    ));
                    takerAssetRemaining = 0;
                }
            }
        }

        if (zrxTokenAmount > 0) {
            // The 0x erc20ProxyContract already has unlimited transfer allowance for ZRX from this contract (set during deployment of this contract)
            EIP20TRANSFERFROM923(
                zrxTokenContract,
                trader,
                address(this),
                zrxTokenAmount);
        }

        // Make sure there is enough allowance for 0x Exchange Proxy to transfer the sourceToken needed for the 0x trade
        uint256 tempAllowance = EIP20(sourceTokenAddress).ALLOWANCE795(address(this), erc20ProxyContract);
        if (tempAllowance < sourceTokenAmountToUse) {
            if (tempAllowance > 0) {
                // reset approval to 0
                EIP20APPROVE789(
                    sourceTokenAddress,
                    erc20ProxyContract,
                    0);
            }

            EIP20APPROVE789(
                sourceTokenAddress,
                erc20ProxyContract,
                sourceTokenAmountToUse);
        }

        ExchangeV2Interface.FillResults memory fillResults;
        if (orders0x.length > 1) {
            fillResults = ExchangeV2Interface(exchangeV2Contract).MARKETSELLORDERSNOTHROW432(
                orders0x,
                sourceTokenAmountToUse,
                signatures0x);
        } else {
            fillResults = ExchangeV2Interface(exchangeV2Contract).FILLORDERNOTHROW738(
                orders0x[0],
                sourceTokenAmountToUse,
                signatures0x[0]);
        }

        if (zrxTokenAmount > 0 && fillResults.takerFeePaid < zrxTokenAmount) {
            // refund unused ZRX token (if any)
            EIP20TRANSFER810(
                zrxTokenContract,
                trader,
                zrxTokenAmount.SUB744(fillResults.takerFeePaid));
        }

        if (DEBUG) {
            emit LOGFILLRESULTS314(
                fillResults.makerAssetFilledAmount,
                fillResults.takerAssetFilledAmount,
                fillResults.makerFeePaid,
                fillResults.takerFeePaid
            );
        }

        sourceTokenUsedAmount = fillResults.takerAssetFilledAmount;
        destTokenAmount = fillResults.makerAssetFilledAmount;
    }
}