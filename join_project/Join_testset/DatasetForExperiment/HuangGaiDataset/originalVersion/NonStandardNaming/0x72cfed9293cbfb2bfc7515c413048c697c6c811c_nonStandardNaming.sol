                                                                 

pragma solidity 0.5.15;

// YAM v2 to YAM v3 migrator contract

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD730(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB907(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB907(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB907(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL195(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV8(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV8(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV8(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD970(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD970(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD970(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}
                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY963() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF646(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER83(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE237(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE672(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM697(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER444(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL817(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT960(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE816(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function FUNCTIONCALL510(address target, bytes memory data) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
      return FUNCTIONCALL510(target, data, "Address: low-level call failed");
    }

                                                                                                                                                                                                                       
    function FUNCTIONCALL510(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _FUNCTIONCALLWITHVALUE572(target, data, 0, errorMessage);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function FUNCTIONCALLWITHVALUE791(address target, bytes memory data, uint256 value) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return FUNCTIONCALLWITHVALUE791(target, data, value, "Address: low-level call with value failed");
    }

                                                                                                                                                                                                                                                 
    function FUNCTIONCALLWITHVALUE791(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _FUNCTIONCALLWITHVALUE572(target, data, value, errorMessage);
    }

    function _FUNCTIONCALLWITHVALUE572(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(ISCONTRACT960(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call.value(weiValue)(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER950(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.TRANSFER83.selector, to, value));
    }

    function SAFETRANSFERFROM43(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.TRANSFERFROM697.selector, from, to, value));
    }

                                                                                                                                                                                                                                                             
    function SAFEAPPROVE327(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE237(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE817(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE237(address(this), spender).ADD730(value);
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE944(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE237(address(this), spender).SUB907(value, "SafeERC20: decreased allowance below zero");
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function _CALLOPTIONALRETURN479(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).FUNCTIONCALL510(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }

    function _MSGSENDER596() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA861() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED137(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER596();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED137(address(0), msgSender);
    }

                                                                     
    function OWNER80() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER576() {	//inject NONSTANDARD NAMING
        require(_owner == _MSGSENDER596(), "Ownable: caller is not the owner");
        _;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP142() public ONLYOWNER576 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED137(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP41(address newOwner) public ONLYOWNER576 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED137(_owner, newOwner);
        _owner = newOwner;
    }
}


interface YAMv2 {
  function BALANCEOF646(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface YAMv3 {
  function MINT801(address owner, uint256 amount) external;	//inject NONSTANDARD NAMING
}


                                                                                                              
contract Migrator is Context, Ownable {

    using SafeMath for uint256;

    address public constant yamv2494 = address(0xAba8cAc6866B83Ae4eec97DD07ED254282f6aD8A);	//inject NONSTANDARD NAMING

    address public yamV3;

    bool public token_initialized;

    bool public delegatorRewardsSet;

    uint256 public constant vestingduration577 = 30 days;	//inject NONSTANDARD NAMING

    uint256 public constant delegatorvestingduration505 = 90 days;	//inject NONSTANDARD NAMING

    uint256 public constant starttime572 = 1600444800; // Friday, September 18, 2020 4:00:00 PM	//inject NONSTANDARD NAMING

    uint256 public constant base875 = 10**18;	//inject NONSTANDARD NAMING

    mapping(address => uint256) public delegator_vesting;

    mapping(address => uint256) public delegator_claimed;

    mapping(address => uint256) public vesting;

    mapping(address => uint256) public claimed;

    constructor () public {
    }



                                                           
    function SETV3ADDRESS235(address yamV3_) public ONLYOWNER576 {	//inject NONSTANDARD NAMING
        require(!token_initialized, "already set");
        token_initialized = true;
        yamV3 = yamV3_;
    }

    // Tells contract delegator rewards setting is done
    function DELEGATORREWARDSDONE313() public ONLYOWNER576 {	//inject NONSTANDARD NAMING
        delegatorRewardsSet = true;
    }


    function VESTED290(address who) public view returns (uint256) {	//inject NONSTANDARD NAMING
      // completion percentage of vesting
      uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

      uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

      if (vestedPerc > base875) {
          vestedPerc = base875;
      }
      if (delegatorVestedPerc > base875) {
          delegatorVestedPerc = base875;
      }

      // add to total vesting
      uint256 totalVesting = vesting[who];

      // get redeemable total vested by checking how much time has passed
      uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

      uint256 totalVestingDelegator = delegator_vesting[who].MUL195(delegatorVestedPerc).DIV8(base875);

      // get already claimed vested rewards
      uint256 alreadyClaimed = claimed[who].ADD730(delegator_claimed[who]);

      // get current redeemable
      return totalVestingRedeemable.ADD730(totalVestingDelegator).SUB907(alreadyClaimed);
    }


    modifier STARTED58() {	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime572, "!started");
        require(token_initialized, "!initialized");
        require(delegatorRewardsSet, "!delegatorRewards");
        _;
    }

                                                                                                                                                                                          
    function MIGRATE19()	//inject NONSTANDARD NAMING
        external
        STARTED58
    {
        // completion percentage of vesting
        uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

        // completion percentage of delegator vesting
        uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

        if (vestedPerc > base875) {
            vestedPerc = base875;
        }
        if (delegatorVestedPerc > base875) {
            delegatorVestedPerc = base875;
        }

        // gets the yamValue for a user.
        uint256 yamValue = YAMv2(yamv2494).BALANCEOF646(_MSGSENDER596());

        // half is instant redeemable
        uint256 halfRedeemable = yamValue / 2;

        uint256 mintAmount;

        // scope
        {
            // add to total vesting
            uint256 totalVesting = vesting[_MSGSENDER596()].ADD730(halfRedeemable);

            // update vesting
            vesting[_MSGSENDER596()] = totalVesting;

            // get redeemable total vested by checking how much time has passed
            uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

            uint256 totalVestingDelegator = delegator_vesting[_MSGSENDER596()].MUL195(delegatorVestedPerc).DIV8(base875);

            // get already claimed
            uint256 alreadyClaimed = claimed[_MSGSENDER596()];

            // get already claimed delegator
            uint256 alreadyClaimedDelegator = delegator_claimed[_MSGSENDER596()];

            // get current redeemable
            uint256 currVested = totalVestingRedeemable.SUB907(alreadyClaimed);

            // get current redeemable delegator
            uint256 currVestedDelegator = totalVestingDelegator.SUB907(alreadyClaimedDelegator);

            // add instant redeemable to current redeemable to get mintAmount
            mintAmount = halfRedeemable.ADD730(currVested).ADD730(currVestedDelegator);

            // update claimed
            claimed[_MSGSENDER596()] = claimed[_MSGSENDER596()].ADD730(currVested);

            // update delegator rewards claimed
            delegator_claimed[_MSGSENDER596()] = delegator_claimed[_MSGSENDER596()].ADD730(currVestedDelegator);
        }


        // BURN YAMv2 - UNRECOVERABLE.
        SafeERC20.SAFETRANSFERFROM43(
            IERC20(yamv2494),
            _MSGSENDER596(),
            address(0x000000000000000000000000000000000000dEaD),
            yamValue
        );

        // mint, this is in raw internalDecimals. Handled by updated _mint function
        YAMv3(yamV3).MINT801(_MSGSENDER596(), mintAmount);
    }


    function CLAIMVESTED340()	//inject NONSTANDARD NAMING
        external
        STARTED58
    {
        // completion percentage of vesting
        uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

        // completion percentage of delegator vesting
        uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

        if (vestedPerc > base875) {
            vestedPerc = base875;
        }
        if (delegatorVestedPerc > base875) {
          delegatorVestedPerc = base875;
        }

        // add to total vesting
        uint256 totalVesting = vesting[_MSGSENDER596()];

        // get redeemable total vested by checking how much time has passed
        uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

        uint256 totalVestingDelegator = delegator_vesting[_MSGSENDER596()].MUL195(delegatorVestedPerc).DIV8(base875);

        // get already claimed vested rewards
        uint256 alreadyClaimed = claimed[_MSGSENDER596()];

        // get already claimed delegator
        uint256 alreadyClaimedDelegator = delegator_claimed[_MSGSENDER596()];

        // get current redeemable
        uint256 currVested = totalVestingRedeemable.SUB907(alreadyClaimed);

        // get current redeemable delegator
        uint256 currVestedDelegator = totalVestingDelegator.SUB907(alreadyClaimedDelegator);

        // update claimed
        claimed[_MSGSENDER596()] = claimed[_MSGSENDER596()].ADD730(currVested);

        // update delegator rewards claimed
        delegator_claimed[_MSGSENDER596()] = delegator_claimed[_MSGSENDER596()].ADD730(currVestedDelegator);

        // mint, this is in raw internalDecimals. Handled by updated _mint function
        YAMv3(yamV3).MINT801(_MSGSENDER596(), currVested.ADD730(currVestedDelegator));
    }


    // this is a gas intensive airdrop of sorts
    function ADDDELEGATORREWARD436(	//inject NONSTANDARD NAMING
        address[] calldata delegators,
        uint256[] calldata amounts,
        bool under27 // indicates this batch is for those who delegated under 27 yams
    )
        external
        ONLYOWNER576
    {
        require(!delegatorRewardsSet, "set");
        require(delegators.length == amounts.length, "!len");
        if (!under27) {
            for (uint256 i = 0; i < delegators.length; i++) {
                delegator_vesting[delegators[i]] = amounts[i]; // must be on order of 1e24;
            }
        } else {
            for (uint256 i = 0; i < delegators.length; i++) {
                delegator_vesting[delegators[i]] = 27 * 10**24; // flat distribution;
            }
        }
    }

    // if people are dumb and send tokens here, give governance ability to save them.
    function RESCUETOKENS188(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 amount
    )
        external
        ONLYOWNER576
    {
        // transfer to
        SafeERC20.SAFETRANSFER950(IERC20(token), to, amount);
    }
}