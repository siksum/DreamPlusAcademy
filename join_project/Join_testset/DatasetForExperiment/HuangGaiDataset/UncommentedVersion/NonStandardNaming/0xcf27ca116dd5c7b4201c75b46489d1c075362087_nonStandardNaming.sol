                                                                 

pragma solidity 0.5.15;




                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT465(address account) internal view returns (bool) {	
        
        
        

        uint256 size;
        
        assembly { size := extcodesize(account) }
        return size > 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE314(address payable recipient, uint256 amount) internal {	
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function FUNCTIONCALL48(address target, bytes memory data) internal returns (bytes memory) {	
      return FUNCTIONCALL48(target, data, "Address: low-level call failed");
    }

                                                                                                                                                                                                                       
    function FUNCTIONCALL48(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {	
        return _FUNCTIONCALLWITHVALUE158(target, data, 0, errorMessage);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function FUNCTIONCALLWITHVALUE437(address target, bytes memory data, uint256 value) internal returns (bytes memory) {	
        return FUNCTIONCALLWITHVALUE437(target, data, value, "Address: low-level call with value failed");
    }

                                                                                                                                                                                                                                                 
    function FUNCTIONCALLWITHVALUE437(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {	
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _FUNCTIONCALLWITHVALUE158(target, data, value, errorMessage);
    }

    function _FUNCTIONCALLWITHVALUE158(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {	
        require(ISCONTRACT465(target), "Address: call to non-contract");

        
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

                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY680() external view returns (uint256);	

                                                                            
    function BALANCEOF211(address account) external view returns (uint256);	

                                                                                                                                                                                                                     
    function TRANSFER401(address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                            
    function ALLOWANCE474(address owner, address spender) external view returns (uint256);	

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE90(address spender, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM272(address sender, address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                  
    event TRANSFER18(address indexed from, address indexed to, uint256 value);	

                                                                                                                                                        
    event APPROVAL708(address indexed owner, address indexed spender, uint256 value);	
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD270(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB289(uint256 a, uint256 b) internal pure returns (uint256) {	
        return SUB289(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB289(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL96(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV580(uint256 a, uint256 b) internal pure returns (uint256) {	
        return DIV580(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV580(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD945(uint256 a, uint256 b) internal pure returns (uint256) {	
        return MOD945(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD945(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b != 0, errorMessage);
        return a % b;
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER169(IERC20 token, address to, uint256 value) internal {	
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.TRANSFER401.selector, to, value));
    }

    function SAFETRANSFERFROM0(IERC20 token, address from, address to, uint256 value) internal {	
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.TRANSFERFROM272.selector, from, to, value));
    }

                                                                                                                                                                                                                                                             
    function SAFEAPPROVE638(IERC20 token, address spender, uint256 value) internal {	
        
        
        
        
        require((value == 0) || (token.ALLOWANCE474(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE729(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE474(address(this), spender).ADD270(value);
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE788(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE474(address(this), spender).SUB289(value, "SafeERC20: decreased allowance below zero");
        _CALLOPTIONALRETURN999(token, abi.encodeWithSelector(token.APPROVE90.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function _CALLOPTIONALRETURN999(IERC20 token, bytes memory data) private {	
        
        
        

        bytes memory returndata = address(token).FUNCTIONCALL48(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

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

                                                                              
    uint256 public constant internaldecimals400 = 10**24;	

                                                        
    uint256 public constant base443 = 10**18;	

                                                                              
    uint256 public yamsScalingFactor;

    mapping (address => uint256) internal _yamBalances;

    mapping (address => mapping (address => uint256)) internal _allowedFragments;

    uint256 public initSupply;


    
    bytes32 public constant permit_typehash214 = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;	
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

                                                              
    bytes32 public constant domain_typehash398 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	

                                                                                   
    bytes32 public constant delegation_typehash654 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	

                                                                      
    mapping (address => uint) public nonces;
}




contract YAMTokenInterface is YAMTokenStorage, YAMGovernanceStorage {

                                                                           
    event DELEGATECHANGED643(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	

                                                                                     
    event DELEGATEVOTESCHANGED218(address indexed delegate, uint previousBalance, uint newBalance);	

                                                                    
    event REBASE207(uint256 epoch, uint256 prevYamsScalingFactor, uint256 newYamsScalingFactor);	

                        

                                                                       
    event NEWPENDINGGOV652(address oldPendingGov, address newPendingGov);	

                                                                
    event NEWGOV174(address oldGov, address newGov);	

                                                        
    event NEWREBASER918(address oldRebaser, address newRebaser);	

                                                         
    event NEWMIGRATOR606(address oldMigrator, address newMigrator);	

                                                             
    event NEWINCENTIVIZER7(address oldIncentivizer, address newIncentivizer);	

                          

                                                   
    event TRANSFER18(address indexed from, address indexed to, uint amount);	

                                                   
    event APPROVAL708(address indexed owner, address indexed spender, uint amount);	

                          
                                                  
    event MINT671(address to, uint256 amount);	

    
    function TRANSFER401(address to, uint256 value) external returns(bool);	
    function TRANSFERFROM272(address from, address to, uint256 value) external returns(bool);	
    function BALANCEOF211(address who) external view returns(uint256);	
    function BALANCEOFUNDERLYING710(address who) external view returns(uint256);	
    function ALLOWANCE474(address owner_, address spender) external view returns(uint256);	
    function APPROVE90(address spender, uint256 value) external returns (bool);	
    function INCREASEALLOWANCE321(address spender, uint256 addedValue) external returns (bool);	
    function DECREASEALLOWANCE911(address spender, uint256 subtractedValue) external returns (bool);	
    function MAXSCALINGFACTOR586() external view returns (uint256);	
    function YAMTOFRAGMENT475(uint256 yam) external view returns (uint256);	
    function FRAGMENTTOYAM449(uint256 value) external view returns (uint256);	

                                  
    function GETPRIORVOTES286(address account, uint blockNumber) external view returns (uint256);	
    function DELEGATEBYSIG332(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) external;	
    function DELEGATE451(address delegatee) external;	
    function DELEGATES410(address delegator) external view returns (address);	
    function GETCURRENTVOTES913(address account) external view returns (uint256);	

                                               
    function MINT825(address to, uint256 amount) external returns (bool);	
    function REBASE784(uint256 epoch, uint256 indexDelta, bool positive) external returns (uint256);	
    function _SETREBASER532(address rebaser_) external;	
    function _SETINCENTIVIZER612(address incentivizer_) external;	
    function _SETPENDINGGOV262(address pendingGov_) external;	
    function _ACCEPTGOV962() external;	
}


contract YAMReserves {

    
    address public reserveToken;

    address public gov;

    address public pendingGov;

    address public rebaser;

    address public yamAddress;

                        

                                                                       
    event NEWPENDINGGOV652(address oldPendingGov, address newPendingGov);	

                                                                
    event NEWGOV174(address oldGov, address newGov);	

                                                                    
    event NEWREBASER918(address oldRebaser, address newRebaser);	


    modifier ONLYGOV717() {	
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

    function _SETREBASER532(address rebaser_)	
        external
        ONLYGOV717
    {
        address oldRebaser = rebaser;
        YAMTokenInterface(yamAddress).DECREASEALLOWANCE911(oldRebaser, uint256(-1));
        rebaser = rebaser_;
        YAMTokenInterface(yamAddress).APPROVE90(rebaser_, uint256(-1));
        emit NEWREBASER918(oldRebaser, rebaser_);
    }

                                                                                                                                
    function _SETPENDINGGOV262(address pendingGov_)	
        external
        ONLYGOV717
    {
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NEWPENDINGGOV652(oldPendingGov, pendingGov_);
    }

                                                                
    function _ACCEPTGOV962()	
        external
    {
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NEWGOV174(oldGov, gov);
    }

                                                          
    function MIGRATERESERVES292(	
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

                                                                               
    function RESERVES683()	
        public
        view
        returns (uint256)
    {
        return IERC20(reserveToken).BALANCEOF211(address(this));
    }
}