                                                                 

pragma solidity 0.5.14;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD644(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB557(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB557(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB557(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL867(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV389(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV389(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV389(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD589(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD589(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD589(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                              
library SafeMathUint {
  function TOINT256SAFE415(uint256 a) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 b = int256(a);
    require(b >= 0);
    return b;
  }
}

                                                                                                                                                                                                                                                                                            
library SafeMathInt {
  function MUL867(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when multiplying INT256_MIN with -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && !(b == - 2**255 && a == -1));

    int256 c = a * b;
    require((b == 0) || (c / b == a));
    return c;
  }

  function DIV389(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when dividing INT256_MIN by -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && (b > 0));

    return a / b;
  }

  function SUB557(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    require((b >= 0 && a - b <= a) || (b < 0 && a - b > a));

    return a - b;
  }

  function ADD644(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 c = a + b;
    require((b >= 0 && c >= a) || (b < 0 && c < a));
    return c;
  }

  function TOUINT256SAFE376(int256 a) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(a >= 0);
    return uint256(a);
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER905() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA244() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD644(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS107(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE573(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS107(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS107(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED877(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED58(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    modifier ONLYMINTER206() {	//inject NONSTANDARD NAMING
        require(ISMINTER398(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER398(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS107(account);
    }

    function ADDMINTER58(address account) public ONLYMINTER206 {	//inject NONSTANDARD NAMING
        _ADDMINTER440(account);
    }

    function RENOUNCEMINTER678() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER770(msg.sender);
    }

    function _ADDMINTER440(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD644(account);
        emit MINTERADDED877(account);
    }

    function _REMOVEMINTER770(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE573(account);
        emit MINTERREMOVED58(account);
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED991(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                     
    function OWNER144() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER307() {	//inject NONSTANDARD NAMING
        require(ISOWNER933(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER933() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER905() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP300() public ONLYOWNER307 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED991(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP626(address newOwner) public ONLYOWNER307 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP567(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP567(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED991(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                      
contract Restrictable is Ownable {
    // State variable to track whether restrictions are enabled.  Defaults to true.
    bool private _restrictionsEnabled = true;

    // Event emitted when flag is disabled
    event RESTRICTIONSDISABLED105(address indexed owner);	//inject NONSTANDARD NAMING

                                                                          
    function ISRESTRICTIONENABLED142() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _restrictionsEnabled;
    }

                                                                                                                                                                                 
    function DISABLERESTRICTIONS981() public ONLYOWNER307 {	//inject NONSTANDARD NAMING
        require(_restrictionsEnabled, "Restrictions are already disabled.");
        
        // Set the flag
        _restrictionsEnabled = false;

        // Trigger the event
        emit RESTRICTIONSDISABLED105(msg.sender);
    }
}

                                                                                                                                                                                                                                      
contract Administratable is Ownable {
    // The mapping to track administrator accounts - true is reserved for admin addresses.
    mapping (address => bool) public administrators;

    // Events to allow tracking add/remove.
    event ADMINADDED833(address indexed addedAdmin, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADMINREMOVED880(address indexed removedAdmin, address indexed removedBy);	//inject NONSTANDARD NAMING

                                                                            
    modifier ONLYADMINISTRATOR801() {	//inject NONSTANDARD NAMING
        require(ISADMINISTRATOR644(msg.sender), "Calling account is not an administrator.");
        _;
    }

                                                                                  
    function ISADMINISTRATOR644(address addressToTest) public view returns (bool) {	//inject NONSTANDARD NAMING
        return administrators[addressToTest];
    }

                                                                                                         
    function ADDADMIN55(address adminToAdd) public ONLYOWNER307 {	//inject NONSTANDARD NAMING
        // Verify the account is not already an admin
        require(administrators[adminToAdd] == false, "Account to be added to admin list is already an admin");

        // Set the address mapping to true to indicate it is an administrator account.
        administrators[adminToAdd] = true;

        // Emit the event for any watchers.
        emit ADMINADDED833(adminToAdd, msg.sender);
    }

                                                                                                              
    function REMOVEADMIN678(address adminToRemove) public ONLYOWNER307 {	//inject NONSTANDARD NAMING
        // Verify the account is an admin
        require(administrators[adminToRemove] == true, "Account to be removed from admin list is not already an admin");

        // Set the address mapping to false to indicate it is NOT an administrator account.  
        administrators[adminToRemove] = false;

        // Emit the event for any watchers.
        emit ADMINREMOVED880(adminToRemove, msg.sender);
    }
}

                                                                                                                                                                                                                      
contract Whitelistable is Administratable {
                                                                                                                                                                                                                            
    function ADDTOWHITELIST155(address[] memory addressToAdd, uint8 whitelist) public ONLYADMINISTRATOR801 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < addressToAdd.length; i++) {
        // Verify the whitelist is valid
        require(whitelist != no_whitelist948, "Invalid whitelist ID supplied");

        // Save off the previous whitelist
        uint8 previousWhitelist = addressWhitelists[addressToAdd[i]];

        // Set the address's whitelist ID
        addressWhitelists[addressToAdd[i]] = whitelist;        

        // If the previous whitelist existed then we want to indicate it has been removed
        if(previousWhitelist != no_whitelist948) {
            // Emit the event for tracking
            emit ADDRESSREMOVEDFROMWHITELIST635(addressToAdd[i], previousWhitelist, msg.sender);
        }

        // Emit the event for new whitelist
        emit ADDRESSADDEDTOWHITELIST652(addressToAdd[i], whitelist, msg.sender);
        }
    }

                                                                                                                
    function REMOVEFROMWHITELIST17(address[] memory addressToRemove) public ONLYADMINISTRATOR801 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < addressToRemove.length; i++) {
        // Save off the previous whitelist
        uint8 previousWhitelist = addressWhitelists[addressToRemove[i]];

        // Zero out the previous whitelist
        addressWhitelists[addressToRemove[i]] = no_whitelist948;

        // Emit the event for tracking
        emit ADDRESSREMOVEDFROMWHITELIST635(addressToRemove[i], previousWhitelist, msg.sender);
        }
    }
        
    // Zero is reserved for indicating it is not on a whitelist
    uint8 constant no_whitelist948 = 0;	//inject NONSTANDARD NAMING

    // The mapping to keep track of which whitelist any address belongs to.
    // 0 is reserved for no whitelist and is the default for all addresses.
    mapping (address => uint8) public addressWhitelists;

    // The mapping to keep track of each whitelist's outbound whitelist flags.
    // Boolean flag indicates whether outbound transfers are enabled.
    mapping(uint8 => mapping (uint8 => bool)) public outboundWhitelistsEnabled;

    // Events to allow tracking add/remove.
    event ADDRESSADDEDTOWHITELIST652(address indexed addedAddress, uint8 indexed whitelist, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADDRESSREMOVEDFROMWHITELIST635(address indexed removedAddress, uint8 indexed whitelist, address indexed removedBy);	//inject NONSTANDARD NAMING
    event OUTBOUNDWHITELISTUPDATED273(address indexed updatedBy, uint8 indexed sourceWhitelist, uint8 indexed destinationWhitelist, bool from, bool to);	//inject NONSTANDARD NAMING

                                                                                                                                                                             
    function UPDATEOUTBOUNDWHITELISTENABLED681(uint8 sourceWhitelist, uint8 destinationWhitelist, bool newEnabledValue) public ONLYADMINISTRATOR801 {	//inject NONSTANDARD NAMING
        // Get the old enabled flag
        bool oldEnabledValue = outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist];

        // Update to the new value
        outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist] = newEnabledValue;

        // Emit event for tracking
        emit OUTBOUNDWHITELISTUPDATED273(msg.sender, sourceWhitelist, destinationWhitelist, oldEnabledValue, newEnabledValue);
    }

                                                                                                                                                                            
    function CHECKWHITELISTALLOWED675(address sender, address receiver) public view returns (bool) {	//inject NONSTANDARD NAMING
        // First get each address whitelist
        uint8 senderWhiteList = addressWhitelists[sender];
        uint8 receiverWhiteList = addressWhitelists[receiver];

        // If either address is not on a whitelist then the check should fail
        if(senderWhiteList == no_whitelist948 || receiverWhiteList == no_whitelist948){
            return false;
        }

        // Determine if the sending whitelist is allowed to send to the destination whitelist        
        return outboundWhitelistsEnabled[senderWhiteList][receiverWhiteList];
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY6() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF633(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER520(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE632(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE168(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM600(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER674(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL259(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY6() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF633(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER520(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER582(_MSGSENDER905(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE632(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE168(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE159(_MSGSENDER905(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM600(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER582(sender, recipient, amount);
        _APPROVE159(sender, _MSGSENDER905(), _allowances[sender][_MSGSENDER905()].SUB557(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE46(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE159(_MSGSENDER905(), spender, _allowances[_MSGSENDER905()][spender].ADD644(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE842(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE159(_MSGSENDER905(), spender, _allowances[_MSGSENDER905()][spender].SUB557(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER582(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB557(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD644(amount);
        emit TRANSFER674(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT237(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD644(amount);
        _balances[account] = _balances[account].ADD644(amount);
        emit TRANSFER674(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN351(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB557(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB557(amount);
        emit TRANSFER674(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE159(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL259(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM236(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN351(account, amount);
        _APPROVE159(account, _MSGSENDER905(), _allowances[account][_MSGSENDER905()].SUB557(amount, "ERC20: burn amount exceeds allowance"));
    }
}

                                                           
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME599() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL182() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECIMALS434() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                                                                                                                                                     
contract ERC20Mintable is MinterRole, ERC20 {
                                                                                                                                 
    function MINT936(address account, uint256 amount) public ONLYMINTER206 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT237(account, amount);
        return true;
    }
}

contract ERC1404 is IERC20 {
                                                                                                      
                                   
                                   
                                                       
                                                                          
                                                                  
    function DETECTTRANSFERRESTRICTION835 (address from, address to, uint256 value) public view returns (uint8);	//inject NONSTANDARD NAMING

                                                                             
                                                                  
                                                        
                                                                            
    function MESSAGEFORTRANSFERRESTRICTION300 (uint8 restrictionCode) public view returns (string memory);	//inject NONSTANDARD NAMING
}

interface IFundsDistributionToken {
	                                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF847(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING

	                                                                                    
	function WITHDRAWFUNDS727() external;	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                         
	event FUNDSDISTRIBUTED176(address indexed by, uint256 fundsDistributed);	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                               
	event FUNDSWITHDRAWN72(address indexed by, uint256 fundsWithdrawn);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
contract FundsDistributionToken is ERC20Detailed, ERC20Mintable, IFundsDistributionToken {
	using SafeMath for uint256;
	using SafeMathUint for uint256;
	using SafeMathInt for int256;

	// optimize, see https://github.com/ethereum/EIPs/issues/1726#issuecomment-472352728
	uint256 constant internal pointsmultiplier799 = 2**128;	//inject NONSTANDARD NAMING
	uint256 internal pointsPerShare;

	mapping(address => int256) internal pointsCorrection;
	mapping(address => uint256) internal withdrawnFunds;

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	function _DISTRIBUTEFUNDS860(uint256 value) internal {	//inject NONSTANDARD NAMING
		require(TOTALSUPPLY6() > 0, "FundsDistributionToken._distributeFunds: SUPPLY_IS_ZERO");

		if (value > 0) {
			pointsPerShare = pointsPerShare.ADD644(
				value.MUL867(pointsmultiplier799) / TOTALSUPPLY6()
			);
			emit FUNDSDISTRIBUTED176(msg.sender, value);
		}
	}

	                                                                                                                                                                        
	function _PREPAREWITHDRAW866() internal returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 _withdrawableDividend = WITHDRAWABLEFUNDSOF847(msg.sender);

		withdrawnFunds[msg.sender] = withdrawnFunds[msg.sender].ADD644(_withdrawableDividend);

		emit FUNDSWITHDRAWN72(msg.sender, _withdrawableDividend);

		return _withdrawableDividend;
	}

	                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF847(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return ACCUMULATIVEFUNDSOF35(_owner).SUB557(withdrawnFunds[_owner]);
	}

	                                                                                                                                                                                                                        
	function WITHDRAWNFUNDSOF446(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return withdrawnFunds[_owner];
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                              
	function ACCUMULATIVEFUNDSOF35(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return pointsPerShare.MUL867(BALANCEOF633(_owner)).TOINT256SAFE415()
			.ADD644(pointsCorrection[_owner]).TOUINT256SAFE376() / pointsmultiplier799;
	}

	                                                                                                                                                                                                                                                                                 
	function _TRANSFER582(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._TRANSFER582(from, to, value);

		int256 _magCorrection = pointsPerShare.MUL867(value).TOINT256SAFE415();
		pointsCorrection[from] = pointsCorrection[from].ADD644(_magCorrection);
		pointsCorrection[to] = pointsCorrection[to].SUB557(_magCorrection);
	}

	                                                                                                                                                                                                                                                
	function _MINT237(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._MINT237(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.SUB557( (pointsPerShare.MUL867(value)).TOINT256SAFE415() );
	}

	                                                                                                                                                                                                                                                          
	function _BURN351(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._BURN351(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.ADD644( (pointsPerShare.MUL867(value)).TOINT256SAFE415() );
	}
}

contract LAOtoken is Restrictable, Whitelistable, ERC1404, FundsDistributionToken {
	using SafeMathUint for uint256;
	using SafeMathInt for int256;
	
	// ERC1404 Error codes and messages
    uint8 public constant success_code697 = 0;	//inject NONSTANDARD NAMING
    uint8 public constant failure_non_whitelist216 = 1;	//inject NONSTANDARD NAMING
    string public constant success_message416 = "SUCCESS";	//inject NONSTANDARD NAMING
    string public constant failure_non_whitelist_message412 = "The transfer was restricted due to whitelist configuration.";	//inject NONSTANDARD NAMING
    string public constant unknown_error676 = "Unknown Error Code";	//inject NONSTANDARD NAMING

    // stored message related to LT 
    string public stamp;
    
	// token in which the funds can be sent to the LT
	IERC20 public fundsToken;

	// balance of fundsToken that the LT currently holds
	uint256 public fundsTokenBalance;

	modifier ONLYFUNDSTOKEN869 () {	//inject NONSTANDARD NAMING
		require(msg.sender == address(fundsToken), "LAOtoken: UNAUTHORIZED_SENDER");
		_;
	}

	constructor(
		string memory name, 
		string memory symbol,
		string memory _stamp,
		uint8 decimals,
		IERC20 _fundsToken,
        address[] memory ownership,
        uint256[] memory issuance
	) 
		public 
		ERC20Detailed(name, symbol, decimals)
	{
		require(address(_fundsToken) != address(0), "LAOtoken: INVALID_FUNDS_TOKEN_ADDRESS");

        for (uint256 i = 0; i < ownership.length; i++) {
		    _MINT237(ownership[i], issuance[i]);
        }

        stamp = _stamp;
		fundsToken = _fundsToken;
        _ADDMINTER440(ownership[0]); 
        _TRANSFEROWNERSHIP567(ownership[0]);
        administrators[ownership[0]] = true;
	}

                                                                                                                                                                          
    function DETECTTRANSFERRESTRICTION835 (address from, address to, uint256)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8)
    {               
        // If the restrictions have been disabled by the owner, then just return success
        // Logic defined in Restrictable parent class
        if(!ISRESTRICTIONENABLED142()) {
            return success_code697;
        }

        // If the contract owner is transferring, then ignore restrictions        
        if(from == OWNER144()) {
            return success_code697;
        }

        // Restrictions are enabled, so verify the whitelist config allows the transfer.
        // Logic defined in Whitelistable parent class
        if(!CHECKWHITELISTALLOWED675(from, to)) {
            return failure_non_whitelist216;
        }

        // If no restrictions were triggered return success
        return success_code697;
    }
    
                                                                                                                                                                                                                              
    function MESSAGEFORTRANSFERRESTRICTION300 (uint8 restrictionCode)	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory)
    {
        if (restrictionCode == success_code697) {
            return success_message416;
        }

        if (restrictionCode == failure_non_whitelist216) {
            return failure_non_whitelist_message412;
        }

        // An unknown error code was passed in.
        return unknown_error676;
    }

                                                                          
    modifier NOTRESTRICTED126 (address from, address to, uint256 value) {        	//inject NONSTANDARD NAMING
        uint8 restrictionCode = DETECTTRANSFERRESTRICTION835(from, to, value);
        require(restrictionCode == success_code697, MESSAGEFORTRANSFERRESTRICTION300(restrictionCode));
        _;
    }

                                                                                               
    function TRANSFER520 (address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED126(msg.sender, to, value)
        returns (bool success)
    {
        success = super.TRANSFER520(to, value);
    }

                                                                                                   
    function TRANSFERFROM600 (address from, address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED126(from, to, value)
        returns (bool success)
    {
        success = super.TRANSFERFROM600(from, to, value);
    }

	                                                                     
	function WITHDRAWFUNDS727() 	//inject NONSTANDARD NAMING
		external 
	{
		uint256 withdrawableFunds = _PREPAREWITHDRAW866();

		require(fundsToken.TRANSFER520(msg.sender, withdrawableFunds), "LAOtoken: TRANSFER_FAILED");

		_UPDATEFUNDSTOKENBALANCE482();
	}

	                                                                                                                                                                                                                                
	function _UPDATEFUNDSTOKENBALANCE482() internal returns (int256) {	//inject NONSTANDARD NAMING
		uint256 prevFundsTokenBalance = fundsTokenBalance;

		fundsTokenBalance = fundsToken.BALANCEOF633(address(this));

		return int256(fundsTokenBalance).SUB557(int256(prevFundsTokenBalance));
	}

	                                                                                                                                                                                                                                                                                                                                             
	function UPDATEFUNDSRECEIVED308() external {	//inject NONSTANDARD NAMING
		int256 newFunds = _UPDATEFUNDSTOKENBALANCE482();

		if (newFunds > 0) {
			_DISTRIBUTEFUNDS860(newFunds.TOUINT256SAFE376());
		}
	}
}