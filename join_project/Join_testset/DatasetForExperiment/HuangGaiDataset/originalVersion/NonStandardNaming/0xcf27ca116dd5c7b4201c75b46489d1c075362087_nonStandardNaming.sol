                                                                 

pragma solidity 0.5.15;

// YAMv3 Reserves


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT465(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE314(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function FUNCTIONCALL48(address target, bytes memory data) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
      return FUNCTIONCALL48(target, data, "Address: low-level call failed");
    }

                                                                                                                                                                                                                       
    function FUNCTIONCALL48(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _FUNCTIONCALLWITHVALUE158(target, data, 0, errorMessage);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function FUNCTIONCALLWITHVALUE437(address target, bytes memory data, uint256 value) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return FUNCTIONCALLWITHVALUE437(target, data, value, "Address: low-level call with value failed");
    }

                                                                                                                                                                                                                                                 
    function FUNCTIONCALLWITHVALUE437(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _FUNCTIONCALLWITHVALUE158(target, data, value, errorMessage);
    }

    function _FUNCTIONCALLWITHVALUE158(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(ISCONTRACT465(target), "Address: call to non-contract");

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

                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY680() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF211(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER401(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE474(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE90(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM272(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER18(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL708(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD270(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB289(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB289(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB289(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL96(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV580(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV580(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV580(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD945(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD945(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD945(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER169(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.TRANSFER401.selector, to, value));
    }

    function SAFETRANSFERFROM0(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.TRANSFERFROM272.selector, from, to, value));
    }

                                                                                                                                                                                                                                                             
    function SAFEAPPROVE638(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE474(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE729(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE474(address(this), spender).ADD270(value);
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE788(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE474(address(this), spender).SUB289(value, "SafeERC20: decreased allowance below zero");
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function _CALLOPTIONALRETURN999(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).FUNCTIONCALL48(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}
// Storage for a YAM token
contract YAMTokenStorage {

    using SafeMath for uint256;

                                                                                     
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                         
    address public gov;

                                                                   
    address public pendingGov;

                                                                 
    address public rebaser;

                                                                  
    address public migrator;

                                                                   
    address public incentivizer;

                                                   
    uint256 public totalSupply;

                                                                              
    uint256 public constant internaldecimals400 = 10**24;	//inject NONSTANDARD NAMING

                                                        
    uint256 public constant base443 = 10**18;	//inject NONSTANDARD NAMING

                                                                              
    uint256 public yamsScalingFactor;

    mapping (address => uint256) internal _yamBalances;

    mapping (address => mapping (address => uint256)) internal _allowedFragments;

    uint256 public initSupply;


    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant permit_typehash214 = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;	//inject NONSTANDARD NAMING
    bytes32 public DOMAIN_SEPARATOR;
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             


contract YAMGovernanceStorage {
                                                  
    mapping (address => address) internal _delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash398 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                                   
    bytes32 public constant delegation_typehash654 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	//inject NONSTANDARD NAMING

                                                                      
    mapping (address => uint) public nonces;
}




contract YAMTokenInterface is YAMTokenStorage, YAMGovernanceStorage {

                                                                           
    event DELEGATECHANGED643(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED218(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                                    
    event REBASE207(uint256 epoch, uint256 prevYamsScalingFactor, uint256 newYamsScalingFactor);	//inject NONSTANDARD NAMING

                        

                                                                       
    event NEWPENDINGGOV652(address oldPendingGov, address newPendingGov);	//inject NONSTANDARD NAMING

                                                                
    event NEWGOV174(address oldGov, address newGov);	//inject NONSTANDARD NAMING

                                                        
    event NEWREBASER918(address oldRebaser, address newRebaser);	//inject NONSTANDARD NAMING

                                                         
    event NEWMIGRATOR606(address oldMigrator, address newMigrator);	//inject NONSTANDARD NAMING

                                                             
    event NEWINCENTIVIZER7(address oldIncentivizer, address newIncentivizer);	//inject NONSTANDARD NAMING

                          

                                                   
    event TRANSFER18(address indexed from, address indexed to, uint amount);	//inject NONSTANDARD NAMING

                                                   
    event APPROVAL708(address indexed owner, address indexed spender, uint amount);	//inject NONSTANDARD NAMING

                          
                                                  
    event MINT671(address to, uint256 amount);	//inject NONSTANDARD NAMING

    // Public functions
    function TRANSFER401(address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM272(address from, address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function BALANCEOF211(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCEOFUNDERLYING710(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE474(address owner_, address spender) external view returns(uint256);	//inject NONSTANDARD NAMING
    function APPROVE90(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INCREASEALLOWANCE321(address spender, uint256 addedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function DECREASEALLOWANCE911(address spender, uint256 subtractedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function MAXSCALINGFACTOR586() external view returns (uint256);	//inject NONSTANDARD NAMING
    function YAMTOFRAGMENT475(uint256 yam) external view returns (uint256);	//inject NONSTANDARD NAMING
    function FRAGMENTTOYAM449(uint256 value) external view returns (uint256);	//inject NONSTANDARD NAMING

                                  
    function GETPRIORVOTES286(address account, uint blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DELEGATEBYSIG332(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING
    function DELEGATE451(address delegatee) external;	//inject NONSTANDARD NAMING
    function DELEGATES410(address delegator) external view returns (address);	//inject NONSTANDARD NAMING
    function GETCURRENTVOTES913(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                               
    function MINT825(address to, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function REBASE784(uint256 epoch, uint256 indexDelta, bool positive) external returns (uint256);	//inject NONSTANDARD NAMING
    function _SETREBASER532(address rebaser_) external;	//inject NONSTANDARD NAMING
    function _SETINCENTIVIZER612(address incentivizer_) external;	//inject NONSTANDARD NAMING
    function _SETPENDINGGOV262(address pendingGov_) external;	//inject NONSTANDARD NAMING
    function _ACCEPTGOV962() external;	//inject NONSTANDARD NAMING
}


contract YAMReserves {

    // Token that serves as a reserve for YAM
    address public reserveToken;

    address public gov;

    address public pendingGov;

    address public rebaser;

    address public yamAddress;

                        

                                                                       
    event NEWPENDINGGOV652(address oldPendingGov, address newPendingGov);	//inject NONSTANDARD NAMING

                                                                
    event NEWGOV174(address oldGov, address newGov);	//inject NONSTANDARD NAMING

                                                                    
    event NEWREBASER918(address oldRebaser, address newRebaser);	//inject NONSTANDARD NAMING


    modifier ONLYGOV717() {	//inject NONSTANDARD NAMING
        require(msg.sender == gov);
        _;
    }

    constructor(
        address reserveToken_,
        address yamAddress_
    )
        public
    {
        reserveToken = reserveToken_;
        yamAddress = yamAddress_;
        gov = msg.sender;
    }

    function _SETREBASER532(address rebaser_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV717
    {
        address oldRebaser = rebaser;
        YAMTokenInterface(yamAddress).DECREASEALLOWANCE911(oldRebaser, uint256(-1));
        rebaser = rebaser_;
        YAMTokenInterface(yamAddress).APPROVE90(rebaser_, uint256(-1));
        emit NEWREBASER918(oldRebaser, rebaser_);
    }

                                                                                                                                
    function _SETPENDINGGOV262(address pendingGov_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV717
    {
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NEWPENDINGGOV652(oldPendingGov, pendingGov_);
    }

                                                                
    function _ACCEPTGOV962()	//inject NONSTANDARD NAMING
        external
    {
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NEWGOV174(oldGov, gov);
    }

                                                          
    function MIGRATERESERVES292(	//inject NONSTANDARD NAMING
        address newReserve,
        address[] memory tokens
    )
        public
        ONLYGOV717
    {
        for (uint256 i = 0; i < tokens.length; i++) {
            IERC20 token =  IERC20(tokens[i]);
            uint256 bal = token.BALANCEOF211(address(this));
            SafeERC20.SAFETRANSFER169(token, newReserve, bal);
        }
    }

                                                                               
    function RESERVES683()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        return IERC20(reserveToken).BALANCEOF211(address(this));
    }
}