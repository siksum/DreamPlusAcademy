                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY871() external view returns (uint);	
    function BALANCEOF150(address account) external view returns (uint);	
    function TRANSFER293(address recipient, uint amount) external returns (bool);	
    function ALLOWANCE262(address owner, address spender) external view returns (uint);	
    function APPROVE730(address spender, uint amount) external returns (bool);	
    function TRANSFERFROM415(address sender, address recipient, uint amount) external returns (bool);	
    event TRANSFER370(address indexed from, address indexed to, uint value);	
    event APPROVAL452(address indexed owner, address indexed spender, uint value);	
}

contract Context {
    constructor () internal { }
    

    function _MSGSENDER35() internal view returns (address payable) {	
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY871() public view returns (uint) {	
        return _totalSupply;
    }
    function BALANCEOF150(address account) public view returns (uint) {	
        return _balances[account];
    }
    function TRANSFER293(address recipient, uint amount) public returns (bool) {	
        _TRANSFER6(_MSGSENDER35(), recipient, amount);
        return true;
    }
    function ALLOWANCE262(address owner, address spender) public view returns (uint) {	
        return _allowances[owner][spender];
    }
    function APPROVE730(address spender, uint amount) public returns (bool) {	
        _APPROVE291(_MSGSENDER35(), spender, amount);
        return true;
    }
    function TRANSFERFROM415(address sender, address recipient, uint amount) public returns (bool) {	
        _TRANSFER6(sender, recipient, amount);
        _APPROVE291(sender, _MSGSENDER35(), _allowances[sender][_MSGSENDER35()].SUB275(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE713(address spender, uint addedValue) public returns (bool) {	
        _APPROVE291(_MSGSENDER35(), spender, _allowances[_MSGSENDER35()][spender].ADD341(addedValue));
        return true;
    }
    function DECREASEALLOWANCE777(address spender, uint subtractedValue) public returns (bool) {	
        _APPROVE291(_MSGSENDER35(), spender, _allowances[_MSGSENDER35()][spender].SUB275(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER6(address sender, address recipient, uint amount) internal {	
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB275(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD341(amount);
        emit TRANSFER370(sender, recipient, amount);
    }

    function _BURN453(address account, uint amount) internal {	
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB275(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB275(amount);
        emit TRANSFER370(account, address(0), amount);
    }

    function ADDBALANCE296(address account, uint amount) internal {	
        require(account != address(0), "ERC20: add to the zero address");

        _balances[account] = _balances[account].ADD341(amount);
        _totalSupply = _totalSupply.ADD341(amount);
        emit TRANSFER370(address(0), account, amount);
    }



    function _APPROVE291(address owner, address spender, uint amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL452(owner, spender, amount);
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
    function NAME158() public view returns (string memory) {	
        return _name;
    }
    function SYMBOL487() public view returns (string memory) {	
        return _symbol;
    }
    function DECIMALS296() public view returns (uint8) {	
        return _decimals;
    }
}

library SafeMath {
    function ADD341(uint a, uint b) internal pure returns (uint) {	
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB275(uint a, uint b) internal pure returns (uint) {	
        return SUB275(a, b, "SafeMath: subtraction overflow");
    }
    function SUB275(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL367(uint a, uint b) internal pure returns (uint) {	
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV844(uint a, uint b) internal pure returns (uint) {	
        return DIV844(a, b, "SafeMath: division by zero");
    }
    function DIV844(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT717(address account) internal view returns (bool) {	
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER429(IERC20 token, address to, uint value) internal {	
        CALLOPTIONALRETURN936(token, abi.encodeWithSelector(token.TRANSFER293.selector, to, value));
    }

    function SAFETRANSFERFROM505(IERC20 token, address from, address to, uint value) internal {	
        CALLOPTIONALRETURN936(token, abi.encodeWithSelector(token.TRANSFERFROM415.selector, from, to, value));
    }

    function SAFEAPPROVE763(IERC20 token, address spender, uint value) internal {	
        require((value == 0) || (token.ALLOWANCE262(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN936(token, abi.encodeWithSelector(token.APPROVE730.selector, spender, value));
    }
    function CALLOPTIONALRETURN936(IERC20 token, bytes memory data) private {	
        require(address(token).ISCONTRACT717(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract LOX is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  uint256 public tokenSalePrice = 0.0001 ether;
  uint public liquidityTokens = 0;  
  bool public _tokenSaleMode = true;
  uint256 public teamLockTime;
  address public admin;
  bool public teamUnlocked = false;
  bool public liquidityTokensAdded = false;
  address public _loxPreAddress = 0x4C08F3aCc79463aDA063EFcd5888161006601964;
  uint public minLoxPreTokens = 1000e18;
  uint public presaleMultiplier = 2;
  uint public minPreSalePurchase = 0.25 ether;
  
 
  constructor () public ERC20Detailed("UniLox.io", "LOX", 18) {
      admin = msg.sender;
      teamLockTime = now + 360*86400; 
  }

    function CHECKPREBALANCE156(address _user)  public view returns(bool) {	
      IERC20 preLox = IERC20(_loxPreAddress); 

      if (preLox.BALANCEOF150(_user) >= minLoxPreTokens) {
          return true;
      } else {
        return false;
      }  
  }

function CHECKMYBONUS978()  public view returns(bool) {	
      IERC20 preLox = IERC20(_loxPreAddress); 

      if (preLox.BALANCEOF150(msg.sender) >= minLoxPreTokens) {
          return true;
      } else {
        return false;
      }  
  }

   function BURN347(uint256 amount) public {	
      _BURN453(msg.sender, amount);
  }
  
  function BUYTOKEN454() public payable {	
      require(_tokenSaleMode, "token sale is over");
      require(msg.value >= minPreSalePurchase, "minimum purchase amount not met");
      uint256 tokenMultiplier = 1;

      if (CHECKPREBALANCE156(msg.sender)) {
          tokenMultiplier = presaleMultiplier;
      } else {
          tokenMultiplier = 1;
      }

      uint256 newTokens = SafeMath.MUL367(SafeMath.DIV844(msg.value, tokenSalePrice),1e18);
      newTokens = newTokens * tokenMultiplier;
      ADDBALANCE296(msg.sender, newTokens);
      liquidityTokens = liquidityTokens.ADD341(newTokens);
  }

   function UNLOCKTEAMTOKENS581() public payable {    
      require(msg.sender == admin, "!not allowed");
      require(now > teamLockTime, "!too early");   
      require(!teamUnlocked, "!already unlocked");  
      teamUnlocked = true;
      uint256 newTokens = 400000e18;  
      ADDBALANCE296(msg.sender, newTokens);
      
  }

  function() external payable {
      BUYTOKEN454();
  }

  function GETLIQUIDITYTOKENS121() public {	
      require(msg.sender == admin, "!not allowed");
      require(!liquidityTokensAdded, "!already added");
      liquidityTokensAdded = true;
      uint _liqTokens = SafeMath.MUL367(liquidityTokens,4);
      ADDBALANCE296(msg.sender, _liqTokens);
  } 


  function ENDTOKENSALE768() public {	
      require(msg.sender == admin, "!not allowed");
      _tokenSaleMode = false;
  }

   function SETPRELOXADDRESS20(address loxPreAddress) public {	
      require(msg.sender == admin, "!not allowed");
      _loxPreAddress = loxPreAddress;
  }

   function WITHDRAW209() external {	
      require(msg.sender == admin, "!not allowed");
      msg.sender.transfer(address(this).balance);
  }

   function WITHDRAWPARTIAL419(uint _amount) external {	
      require(msg.sender == admin, "!not allowed");
      require(_amount <= address(this).balance, "!exceeds balance");
      msg.sender.transfer(_amount);
  }

   function MYPRELOX469() external view returns(uint) {	
      IERC20 preLox = IERC20(_loxPreAddress); 
      return preLox.BALANCEOF150(msg.sender);
  }

 function SETPRELOXMIN634(uint _min) external {	
      require(msg.sender == admin, "!not allowed");
      minLoxPreTokens = _min;
  }

   function SETPRESALEMULTIPLIER770(uint _mult) external {	
      require(msg.sender == admin, "!not allowed");
      presaleMultiplier = _mult;
  }

   function SETMINPRESALE871(uint _min) external {	
      require(msg.sender == admin, "!not allowed");
      minPreSalePurchase = _min;
  }
  


}