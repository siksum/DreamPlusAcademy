                                                                 

pragma solidity 0.5.15;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD730(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB907(uint256 a, uint256 b) internal pure returns (uint256) {	
        return SUB907(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB907(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL195(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV8(uint256 a, uint256 b) internal pure returns (uint256) {	
        return DIV8(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV8(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD970(uint256 a, uint256 b) internal pure returns (uint256) {	
        return MOD970(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD970(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b != 0, errorMessage);
        return a % b;
    }
}
                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY963() external view returns (uint256);	

                                                                            
    function BALANCEOF646(address account) external view returns (uint256);	

                                                                                                                                                                                                                     
    function TRANSFER83(address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                            
    function ALLOWANCE237(address owner, address spender) external view returns (uint256);	

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE672(address spender, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM697(address sender, address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                  
    event TRANSFER444(address indexed from, address indexed to, uint256 value);	

                                                                                                                                                        
    event APPROVAL817(address indexed owner, address indexed spender, uint256 value);	
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT960(address account) internal view returns (bool) {	
        
        
        

        uint256 size;
        
        assembly { size := extcodesize(account) }
        return size > 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE816(address payable recipient, uint256 amount) internal {	
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function FUNCTIONCALL510(address target, bytes memory data) internal returns (bytes memory) {	
      return FUNCTIONCALL510(target, data, "Address: low-level call failed");
    }

                                                                                                                                                                                                                       
    function FUNCTIONCALL510(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {	
        return _FUNCTIONCALLWITHVALUE572(target, data, 0, errorMessage);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function FUNCTIONCALLWITHVALUE791(address target, bytes memory data, uint256 value) internal returns (bytes memory) {	
        return FUNCTIONCALLWITHVALUE791(target, data, value, "Address: low-level call with value failed");
    }

                                                                                                                                                                                                                                                 
    function FUNCTIONCALLWITHVALUE791(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {	
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _FUNCTIONCALLWITHVALUE572(target, data, value, errorMessage);
    }

    function _FUNCTIONCALLWITHVALUE572(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {	
        require(ISCONTRACT960(target), "Address: call to non-contract");

        
        (bool success, bytes memory returndata) = target.call.value(weiValue)(data);
        if (success) {
            return returndata;
        } else {
            
            if (returndata.length > 0) {
                

                
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

    function SAFETRANSFER950(IERC20 token, address to, uint256 value) internal {	
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.TRANSFER83.selector, to, value));
    }

    function SAFETRANSFERFROM43(IERC20 token, address from, address to, uint256 value) internal {	
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.TRANSFERFROM697.selector, from, to, value));
    }

                                                                                                                                                                                                                                                             
    function SAFEAPPROVE327(IERC20 token, address spender, uint256 value) internal {	
        
        
        
        
        require((value == 0) || (token.ALLOWANCE237(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE817(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE237(address(this), spender).ADD730(value);
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE944(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE237(address(this), spender).SUB907(value, "SafeERC20: decreased allowance below zero");
        _CALLOPTIONALRETURN479(token, abi.encodeWithSelector(token.APPROVE672.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function _CALLOPTIONALRETURN479(IERC20 token, bytes memory data) private {	
        
        
        

        bytes memory returndata = address(token).FUNCTIONCALL510(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    
    
    constructor () internal { }

    function _MSGSENDER596() internal view returns (address payable) {	
        return msg.sender;
    }

    function _MSGDATA861() internal view returns (bytes memory) {	
        this; 
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED137(address indexed previousOwner, address indexed newOwner);	

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER596();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED137(address(0), msgSender);
    }

                                                                     
    function OWNER80() public view returns (address) {	
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER576() {	
        require(_owner == _MSGSENDER596(), "Ownable: caller is not the owner");
        _;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP142() public ONLYOWNER576 {	
        emit OWNERSHIPTRANSFERRED137(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP41(address newOwner) public ONLYOWNER576 {	
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED137(_owner, newOwner);
        _owner = newOwner;
    }
}


interface YAMv2 {
  function BALANCEOF646(address owner) external view returns (uint256);	
}

interface YAMv3 {
  function MINT801(address owner, uint256 amount) external;	
}


                                                                                                              
contract Migrator is Context, Ownable {

    using SafeMath for uint256;

    address public constant yamv2494 = address(0xAba8cAc6866B83Ae4eec97DD07ED254282f6aD8A);	

    address public yamV3;

    bool public token_initialized;

    bool public delegatorRewardsSet;

    uint256 public constant vestingduration577 = 30 days;	

    uint256 public constant delegatorvestingduration505 = 90 days;	

    uint256 public constant starttime572 = 1600444800; 

    uint256 public constant base875 = 10**18;	

    mapping(address => uint256) public delegator_vesting;

    mapping(address => uint256) public delegator_claimed;

    mapping(address => uint256) public vesting;

    mapping(address => uint256) public claimed;

    constructor () public {
    }



                                                           
    function SETV3ADDRESS235(address yamV3_) public ONLYOWNER576 {	
        require(!token_initialized, "already set");
        token_initialized = true;
        yamV3 = yamV3_;
    }

    
    function DELEGATORREWARDSDONE313() public ONLYOWNER576 {	
        delegatorRewardsSet = true;
    }


    function VESTED290(address who) public view returns (uint256) {	
      
      uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

      uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

      if (vestedPerc > base875) {
          vestedPerc = base875;
      }
      if (delegatorVestedPerc > base875) {
          delegatorVestedPerc = base875;
      }

      
      uint256 totalVesting = vesting[who];

      
      uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

      uint256 totalVestingDelegator = delegator_vesting[who].MUL195(delegatorVestedPerc).DIV8(base875);

      
      uint256 alreadyClaimed = claimed[who].ADD730(delegator_claimed[who]);

      
      return totalVestingRedeemable.ADD730(totalVestingDelegator).SUB907(alreadyClaimed);
    }


    modifier STARTED58() {	
        require(block.timestamp >= starttime572, "!started");
        require(token_initialized, "!initialized");
        require(delegatorRewardsSet, "!delegatorRewards");
        _;
    }

                                                                                                                                                                                          
    function MIGRATE19()	
        external
        STARTED58
    {
        
        uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

        
        uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

        if (vestedPerc > base875) {
            vestedPerc = base875;
        }
        if (delegatorVestedPerc > base875) {
            delegatorVestedPerc = base875;
        }

        
        uint256 yamValue = YAMv2(yamv2494).BALANCEOF646(_MSGSENDER596());

        
        uint256 halfRedeemable = yamValue / 2;

        uint256 mintAmount;

        
        {
            
            uint256 totalVesting = vesting[_MSGSENDER596()].ADD730(halfRedeemable);

            
            vesting[_MSGSENDER596()] = totalVesting;

            
            uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

            uint256 totalVestingDelegator = delegator_vesting[_MSGSENDER596()].MUL195(delegatorVestedPerc).DIV8(base875);

            
            uint256 alreadyClaimed = claimed[_MSGSENDER596()];

            
            uint256 alreadyClaimedDelegator = delegator_claimed[_MSGSENDER596()];

            
            uint256 currVested = totalVestingRedeemable.SUB907(alreadyClaimed);

            
            uint256 currVestedDelegator = totalVestingDelegator.SUB907(alreadyClaimedDelegator);

            
            mintAmount = halfRedeemable.ADD730(currVested).ADD730(currVestedDelegator);

            
            claimed[_MSGSENDER596()] = claimed[_MSGSENDER596()].ADD730(currVested);

            
            delegator_claimed[_MSGSENDER596()] = delegator_claimed[_MSGSENDER596()].ADD730(currVestedDelegator);
        }


        
        SafeERC20.SAFETRANSFERFROM43(
            IERC20(yamv2494),
            _MSGSENDER596(),
            address(0x000000000000000000000000000000000000dEaD),
            yamValue
        );

        
        YAMv3(yamV3).MINT801(_MSGSENDER596(), mintAmount);
    }


    function CLAIMVESTED340()	
        external
        STARTED58
    {
        
        uint256 vestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(vestingduration577);

        
        uint256 delegatorVestedPerc = now.SUB907(starttime572).MUL195(base875).DIV8(delegatorvestingduration505);

        if (vestedPerc > base875) {
            vestedPerc = base875;
        }
        if (delegatorVestedPerc > base875) {
          delegatorVestedPerc = base875;
        }

        
        uint256 totalVesting = vesting[_MSGSENDER596()];

        
        uint256 totalVestingRedeemable = totalVesting.MUL195(vestedPerc).DIV8(base875);

        uint256 totalVestingDelegator = delegator_vesting[_MSGSENDER596()].MUL195(delegatorVestedPerc).DIV8(base875);

        
        uint256 alreadyClaimed = claimed[_MSGSENDER596()];

        
        uint256 alreadyClaimedDelegator = delegator_claimed[_MSGSENDER596()];

        
        uint256 currVested = totalVestingRedeemable.SUB907(alreadyClaimed);

        
        uint256 currVestedDelegator = totalVestingDelegator.SUB907(alreadyClaimedDelegator);

        
        claimed[_MSGSENDER596()] = claimed[_MSGSENDER596()].ADD730(currVested);

        
        delegator_claimed[_MSGSENDER596()] = delegator_claimed[_MSGSENDER596()].ADD730(currVestedDelegator);

        
        YAMv3(yamV3).MINT801(_MSGSENDER596(), currVested.ADD730(currVestedDelegator));
    }


    
    function ADDDELEGATORREWARD436(	
        address[] calldata delegators,
        uint256[] calldata amounts,
        bool under27 
    )
        external
        ONLYOWNER576
    {
        require(!delegatorRewardsSet, "set");
        require(delegators.length == amounts.length, "!len");
        if (!under27) {
            for (uint256 i = 0; i < delegators.length; i++) {
                delegator_vesting[delegators[i]] = amounts[i]; 
            }
        } else {
            for (uint256 i = 0; i < delegators.length; i++) {
                delegator_vesting[delegators[i]] = 27 * 10**24; 
            }
        }
    }

    
    function RESCUETOKENS188(	
        address token,
        address to,
        uint256 amount
    )
        external
        ONLYOWNER576
    {
        
        SafeERC20.SAFETRANSFER950(IERC20(token), to, amount);
    }
}