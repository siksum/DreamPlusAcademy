                                                                 

pragma solidity 0.5.14;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD644(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB557(uint256 a, uint256 b) internal pure returns (uint256) {	
        return SUB557(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB557(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL867(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV389(uint256 a, uint256 b) internal pure returns (uint256) {	
        return DIV389(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV389(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD589(uint256 a, uint256 b) internal pure returns (uint256) {	
        return MOD589(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD589(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                              
library SafeMathUint {
  function TOINT256SAFE415(uint256 a) internal pure returns (int256) {	
    int256 b = int256(a);
    require(b >= 0);
    return b;
  }
}

                                                                                                                                                                                                                                                                                            
library SafeMathInt {
  function MUL867(int256 a, int256 b) internal pure returns (int256) {	
    
    
    require(!(a == - 2**255 && b == -1) && !(b == - 2**255 && a == -1));

    int256 c = a * b;
    require((b == 0) || (c / b == a));
    return c;
  }

  function DIV389(int256 a, int256 b) internal pure returns (int256) {	
    
    
    require(!(a == - 2**255 && b == -1) && (b > 0));

    return a / b;
  }

  function SUB557(int256 a, int256 b) internal pure returns (int256) {	
    require((b >= 0 && a - b <= a) || (b < 0 && a - b > a));

    return a - b;
  }

  function ADD644(int256 a, int256 b) internal pure returns (int256) {	
    int256 c = a + b;
    require((b >= 0 && c >= a) || (b < 0 && c < a));
    return c;
  }

  function TOUINT256SAFE376(int256 a) internal pure returns (uint256) {	
    require(a >= 0);
    return uint256(a);
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    
    
    constructor () internal { }
    

    function _MSGSENDER905() internal view returns (address payable) {	
        return msg.sender;
    }

    function _MSGDATA244() internal view returns (bytes memory) {	
        this; 
        return msg.data;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD644(Role storage role, address account) internal {	
        require(!HAS107(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE573(Role storage role, address account) internal {	
        require(HAS107(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS107(Role storage role, address account) internal view returns (bool) {	
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED877(address indexed account);	
    event MINTERREMOVED58(address indexed account);	

    Roles.Role private _minters;

    modifier ONLYMINTER206() {	
        require(ISMINTER398(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER398(address account) public view returns (bool) {	
        return _minters.HAS107(account);
    }

    function ADDMINTER58(address account) public ONLYMINTER206 {	
        _ADDMINTER440(account);
    }

    function RENOUNCEMINTER678() public {	
        _REMOVEMINTER770(msg.sender);
    }

    function _ADDMINTER440(address account) internal {	
        _minters.ADD644(account);
        emit MINTERADDED877(account);
    }

    function _REMOVEMINTER770(address account) internal {	
        _minters.REMOVE573(account);
        emit MINTERREMOVED58(account);
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED991(address indexed previousOwner, address indexed newOwner);	

                                                                     
    function OWNER144() public view returns (address) {	
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER307() {	
        require(ISOWNER933(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER933() public view returns (bool) {	
        return _MSGSENDER905() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP300() public ONLYOWNER307 {	
        emit OWNERSHIPTRANSFERRED991(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP626(address newOwner) public ONLYOWNER307 {	
        _TRANSFEROWNERSHIP567(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP567(address newOwner) internal {	
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED991(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                      
contract Restrictable is Ownable {
    
    bool private _restrictionsEnabled = true;

    
    event RESTRICTIONSDISABLED105(address indexed owner);	

                                                                          
    function ISRESTRICTIONENABLED142() public view returns (bool) {	
        return _restrictionsEnabled;
    }

                                                                                                                                                                                 
    function DISABLERESTRICTIONS981() public ONLYOWNER307 {	
        require(_restrictionsEnabled, "Restrictions are already disabled.");
        
        
        _restrictionsEnabled = false;

        
        emit RESTRICTIONSDISABLED105(msg.sender);
    }
}

                                                                                                                                                                                                                                      
contract Administratable is Ownable {
    
    mapping (address => bool) public administrators;

    
    event ADMINADDED833(address indexed addedAdmin, address indexed addedBy);	
    event ADMINREMOVED880(address indexed removedAdmin, address indexed removedBy);	

                                                                            
    modifier ONLYADMINISTRATOR801() {	
        require(ISADMINISTRATOR644(msg.sender), "Calling account is not an administrator.");
        _;
    }

                                                                                  
    function ISADMINISTRATOR644(address addressToTest) public view returns (bool) {	
        return administrators[addressToTest];
    }

                                                                                                         
    function ADDADMIN55(address adminToAdd) public ONLYOWNER307 {	
        
        require(administrators[adminToAdd] == false, "Account to be added to admin list is already an admin");

        
        administrators[adminToAdd] = true;

        
        emit ADMINADDED833(adminToAdd, msg.sender);
    }

                                                                                                              
    function REMOVEADMIN678(address adminToRemove) public ONLYOWNER307 {	
        
        require(administrators[adminToRemove] == true, "Account to be removed from admin list is not already an admin");

        
        administrators[adminToRemove] = false;

        
        emit ADMINREMOVED880(adminToRemove, msg.sender);
    }
}

                                                                                                                                                                                                                      
contract Whitelistable is Administratable {
                                                                                                                                                                                                                            
    function ADDTOWHITELIST155(address[] memory addressToAdd, uint8 whitelist) public ONLYADMINISTRATOR801 {	
        for (uint256 i = 0; i < addressToAdd.length; i++) {
        
        require(whitelist != no_whitelist948, "Invalid whitelist ID supplied");

        
        uint8 previousWhitelist = addressWhitelists[addressToAdd[i]];

        
        addressWhitelists[addressToAdd[i]] = whitelist;        

        
        if(previousWhitelist != no_whitelist948) {
            
            emit ADDRESSREMOVEDFROMWHITELIST635(addressToAdd[i], previousWhitelist, msg.sender);
        }

        
        emit ADDRESSADDEDTOWHITELIST652(addressToAdd[i], whitelist, msg.sender);
        }
    }

                                                                                                                
    function REMOVEFROMWHITELIST17(address[] memory addressToRemove) public ONLYADMINISTRATOR801 {	
        for (uint256 i = 0; i < addressToRemove.length; i++) {
        
        uint8 previousWhitelist = addressWhitelists[addressToRemove[i]];

        
        addressWhitelists[addressToRemove[i]] = no_whitelist948;

        
        emit ADDRESSREMOVEDFROMWHITELIST635(addressToRemove[i], previousWhitelist, msg.sender);
        }
    }
        
    
    uint8 constant no_whitelist948 = 0;	

    
    
    mapping (address => uint8) public addressWhitelists;

    
    
    mapping(uint8 => mapping (uint8 => bool)) public outboundWhitelistsEnabled;

    
    event ADDRESSADDEDTOWHITELIST652(address indexed addedAddress, uint8 indexed whitelist, address indexed addedBy);	
    event ADDRESSREMOVEDFROMWHITELIST635(address indexed removedAddress, uint8 indexed whitelist, address indexed removedBy);	
    event OUTBOUNDWHITELISTUPDATED273(address indexed updatedBy, uint8 indexed sourceWhitelist, uint8 indexed destinationWhitelist, bool from, bool to);	

                                                                                                                                                                             
    function UPDATEOUTBOUNDWHITELISTENABLED681(uint8 sourceWhitelist, uint8 destinationWhitelist, bool newEnabledValue) public ONLYADMINISTRATOR801 {	
        
        bool oldEnabledValue = outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist];

        
        outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist] = newEnabledValue;

        
        emit OUTBOUNDWHITELISTUPDATED273(msg.sender, sourceWhitelist, destinationWhitelist, oldEnabledValue, newEnabledValue);
    }

                                                                                                                                                                            
    function CHECKWHITELISTALLOWED675(address sender, address receiver) public view returns (bool) {	
        
        uint8 senderWhiteList = addressWhitelists[sender];
        uint8 receiverWhiteList = addressWhitelists[receiver];

        
        if(senderWhiteList == no_whitelist948 || receiverWhiteList == no_whitelist948){
            return false;
        }

        
        return outboundWhitelistsEnabled[senderWhiteList][receiverWhiteList];
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY6() external view returns (uint256);	

                                                                            
    function BALANCEOF633(address account) external view returns (uint256);	

                                                                                                                                                                                                                     
    function TRANSFER520(address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                            
    function ALLOWANCE632(address owner, address spender) external view returns (uint256);	

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE168(address spender, uint256 amount) external returns (bool);	

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM600(address sender, address recipient, uint256 amount) external returns (bool);	

                                                                                                                                                                  
    event TRANSFER674(address indexed from, address indexed to, uint256 value);	

                                                                                                                                                        
    event APPROVAL259(address indexed owner, address indexed spender, uint256 value);	
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY6() public view returns (uint256) {	
        return _totalSupply;
    }

                                                   
    function BALANCEOF633(address account) public view returns (uint256) {	
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER520(address recipient, uint256 amount) public returns (bool) {	
        _TRANSFER582(_MSGSENDER905(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE632(address owner, address spender) public view returns (uint256) {	
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE168(address spender, uint256 amount) public returns (bool) {	
        _APPROVE159(_MSGSENDER905(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM600(address sender, address recipient, uint256 amount) public returns (bool) {	
        _TRANSFER582(sender, recipient, amount);
        _APPROVE159(sender, _MSGSENDER905(), _allowances[sender][_MSGSENDER905()].SUB557(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE46(address spender, uint256 addedValue) public returns (bool) {	
        _APPROVE159(_MSGSENDER905(), spender, _allowances[_MSGSENDER905()][spender].ADD644(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE842(address spender, uint256 subtractedValue) public returns (bool) {	
        _APPROVE159(_MSGSENDER905(), spender, _allowances[_MSGSENDER905()][spender].SUB557(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER582(address sender, address recipient, uint256 amount) internal {	
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB557(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD644(amount);
        emit TRANSFER674(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT237(address account, uint256 amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD644(amount);
        _balances[account] = _balances[account].ADD644(amount);
        emit TRANSFER674(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN351(address account, uint256 amount) internal {	
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB557(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB557(amount);
        emit TRANSFER674(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE159(address owner, address spender, uint256 amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL259(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM236(address account, uint256 amount) internal {	
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

                                                          
    function NAME599() public view returns (string memory) {	
        return _name;
    }

                                                                                                          
    function SYMBOL182() public view returns (string memory) {	
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECIMALS434() public view returns (uint8) {	
        return _decimals;
    }
}

                                                                                                                                                                                                                                     
contract ERC20Mintable is MinterRole, ERC20 {
                                                                                                                                 
    function MINT936(address account, uint256 amount) public ONLYMINTER206 returns (bool) {	
        _MINT237(account, amount);
        return true;
    }
}

contract ERC1404 is IERC20 {
                                                                                                      
                                   
                                   
                                                       
                                                                          
                                                                  
    function DETECTTRANSFERRESTRICTION835 (address from, address to, uint256 value) public view returns (uint8);	

                                                                             
                                                                  
                                                        
                                                                            
    function MESSAGEFORTRANSFERRESTRICTION300 (uint8 restrictionCode) public view returns (string memory);	
}

interface IFundsDistributionToken {
	                                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF847(address owner) external view returns (uint256);	

	                                                                                    
	function WITHDRAWFUNDS727() external;	

	                                                                                                                                                                                                         
	event FUNDSDISTRIBUTED176(address indexed by, uint256 fundsDistributed);	

	                                                                                                                                                                                                               
	event FUNDSWITHDRAWN72(address indexed by, uint256 fundsWithdrawn);	
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
contract FundsDistributionToken is ERC20Detailed, ERC20Mintable, IFundsDistributionToken {
	using SafeMath for uint256;
	using SafeMathUint for uint256;
	using SafeMathInt for int256;

	
	uint256 constant internal pointsmultiplier799 = 2**128;	
	uint256 internal pointsPerShare;

	mapping(address => int256) internal pointsCorrection;
	mapping(address => uint256) internal withdrawnFunds;

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	function _DISTRIBUTEFUNDS860(uint256 value) internal {	
		require(TOTALSUPPLY6() > 0, "FundsDistributionToken._distributeFunds: SUPPLY_IS_ZERO");

		if (value > 0) {
			pointsPerShare = pointsPerShare.ADD644(
				value.MUL867(pointsmultiplier799) / TOTALSUPPLY6()
			);
			emit FUNDSDISTRIBUTED176(msg.sender, value);
		}
	}

	                                                                                                                                                                        
	function _PREPAREWITHDRAW866() internal returns (uint256) {	
		uint256 _withdrawableDividend = WITHDRAWABLEFUNDSOF847(msg.sender);

		withdrawnFunds[msg.sender] = withdrawnFunds[msg.sender].ADD644(_withdrawableDividend);

		emit FUNDSWITHDRAWN72(msg.sender, _withdrawableDividend);

		return _withdrawableDividend;
	}

	                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF847(address _owner) public view returns(uint256) {	
		return ACCUMULATIVEFUNDSOF35(_owner).SUB557(withdrawnFunds[_owner]);
	}

	                                                                                                                                                                                                                        
	function WITHDRAWNFUNDSOF446(address _owner) public view returns(uint256) {	
		return withdrawnFunds[_owner];
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                              
	function ACCUMULATIVEFUNDSOF35(address _owner) public view returns(uint256) {	
		return pointsPerShare.MUL867(BALANCEOF633(_owner)).TOINT256SAFE415()
			.ADD644(pointsCorrection[_owner]).TOUINT256SAFE376() / pointsmultiplier799;
	}

	                                                                                                                                                                                                                                                                                 
	function _TRANSFER582(address from, address to, uint256 value) internal {	
		super._TRANSFER582(from, to, value);

		int256 _magCorrection = pointsPerShare.MUL867(value).TOINT256SAFE415();
		pointsCorrection[from] = pointsCorrection[from].ADD644(_magCorrection);
		pointsCorrection[to] = pointsCorrection[to].SUB557(_magCorrection);
	}

	                                                                                                                                                                                                                                                
	function _MINT237(address account, uint256 value) internal {	
		super._MINT237(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.SUB557( (pointsPerShare.MUL867(value)).TOINT256SAFE415() );
	}

	                                                                                                                                                                                                                                                          
	function _BURN351(address account, uint256 value) internal {	
		super._BURN351(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.ADD644( (pointsPerShare.MUL867(value)).TOINT256SAFE415() );
	}
}

contract LAOtoken is Restrictable, Whitelistable, ERC1404, FundsDistributionToken {
	using SafeMathUint for uint256;
	using SafeMathInt for int256;
	
	
    uint8 public constant success_code697 = 0;	
    uint8 public constant failure_non_whitelist216 = 1;	
    string public constant success_message416 = "SUCCESS";	
    string public constant failure_non_whitelist_message412 = "The transfer was restricted due to whitelist configuration.";	
    string public constant unknown_error676 = "Unknown Error Code";	

    
    string public stamp;
    
	
	IERC20 public fundsToken;

	
	uint256 public fundsTokenBalance;

	modifier ONLYFUNDSTOKEN869 () {	
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

                                                                                                                                                                          
    function DETECTTRANSFERRESTRICTION835 (address from, address to, uint256)	
        public
        view
        returns (uint8)
    {               
        
        
        if(!ISRESTRICTIONENABLED142()) {
            return success_code697;
        }

        
        if(from == OWNER144()) {
            return success_code697;
        }

        
        
        if(!CHECKWHITELISTALLOWED675(from, to)) {
            return failure_non_whitelist216;
        }

        
        return success_code697;
    }
    
                                                                                                                                                                                                                              
    function MESSAGEFORTRANSFERRESTRICTION300 (uint8 restrictionCode)	
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

        
        return unknown_error676;
    }

                                                                          
    modifier NOTRESTRICTED126 (address from, address to, uint256 value) {        	
        uint8 restrictionCode = DETECTTRANSFERRESTRICTION835(from, to, value);
        require(restrictionCode == success_code697, MESSAGEFORTRANSFERRESTRICTION300(restrictionCode));
        _;
    }

                                                                                               
    function TRANSFER520 (address to, uint256 value)	
        public
        NOTRESTRICTED126(msg.sender, to, value)
        returns (bool success)
    {
        success = super.TRANSFER520(to, value);
    }

                                                                                                   
    function TRANSFERFROM600 (address from, address to, uint256 value)	
        public
        NOTRESTRICTED126(from, to, value)
        returns (bool success)
    {
        success = super.TRANSFERFROM600(from, to, value);
    }

	                                                                     
	function WITHDRAWFUNDS727() 	
		external 
	{
		uint256 withdrawableFunds = _PREPAREWITHDRAW866();

		require(fundsToken.TRANSFER520(msg.sender, withdrawableFunds), "LAOtoken: TRANSFER_FAILED");

		_UPDATEFUNDSTOKENBALANCE482();
	}

	                                                                                                                                                                                                                                
	function _UPDATEFUNDSTOKENBALANCE482() internal returns (int256) {	
		uint256 prevFundsTokenBalance = fundsTokenBalance;

		fundsTokenBalance = fundsToken.BALANCEOF633(address(this));

		return int256(fundsTokenBalance).SUB557(int256(prevFundsTokenBalance));
	}

	                                                                                                                                                                                                                                                                                                                                             
	function UPDATEFUNDSRECEIVED308() external {	
		int256 newFunds = _UPDATEFUNDSTOKENBALANCE482();

		if (newFunds > 0) {
			_DISTRIBUTEFUNDS860(newFunds.TOUINT256SAFE376());
		}
	}
}