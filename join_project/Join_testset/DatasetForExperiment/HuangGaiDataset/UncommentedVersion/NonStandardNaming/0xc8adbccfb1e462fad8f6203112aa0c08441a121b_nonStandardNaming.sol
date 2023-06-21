                                                                 

                                                                                                                                                                                                               

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY95() external view returns (uint);	
    function BALANCEOF137(address account) external view returns (uint);	
    function TRANSFER331(address recipient, uint amount) external returns (bool);	
    function ALLOWANCE406(address owner, address spender) external view returns (uint);	
    function APPROVE709(address spender, uint amount) external returns (bool);	
    function TRANSFERFROM344(address sender, address recipient, uint amount) external returns (bool);	
    event TRANSFER580(address indexed from, address indexed to, uint value);	
    event APPROVAL383(address indexed owner, address indexed spender, uint value);	
}

contract Context {
    constructor () internal { }
    

    function _MSGSENDER634() internal view returns (address payable) {	
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY95() public view returns (uint) {	
        return _totalSupply;
    }
    function BALANCEOF137(address account) public view returns (uint) {	
        return _balances[account];
    }
    function TRANSFER331(address recipient, uint amount) public returns (bool) {	
        
        _TRANSFER640(_MSGSENDER634(), recipient, amount);
        return true;
    }
    function ALLOWANCE406(address owner, address spender) public view returns (uint) {	
        return _allowances[owner][spender];
    }
    function APPROVE709(address spender, uint amount) public returns (bool) {	
        _APPROVE437(_MSGSENDER634(), spender, amount);
        return true;
    }
    function TRANSFERFROM344(address sender, address recipient, uint amount) public returns (bool) {	
        
        _TRANSFER640(sender, recipient, amount);
        _APPROVE437(sender, _MSGSENDER634(), _allowances[sender][_MSGSENDER634()].SUB555(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE162(address spender, uint addedValue) public returns (bool) {	
        _APPROVE437(_MSGSENDER634(), spender, _allowances[_MSGSENDER634()][spender].ADD403(addedValue));
        return true;
    }
    function DECREASEALLOWANCE49(address spender, uint subtractedValue) public returns (bool) {	
        _APPROVE437(_MSGSENDER634(), spender, _allowances[_MSGSENDER634()][spender].SUB555(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER640(address sender, address recipient, uint amount) internal {	
        
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB555(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD403(amount);
        emit TRANSFER580(sender, recipient, amount);
    }
    function _MINT848(address account, uint amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD403(amount);
        _balances[account] = _balances[account].ADD403(amount);
        emit TRANSFER580(address(0), account, amount);
    }
    function _BURN501(address account, uint amount) internal {	
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB555(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB555(amount);
        emit TRANSFER580(account, address(0), amount);
    }
    function _APPROVE437(address owner, address spender, uint amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL383(owner, spender, amount);
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
    function NAME18() public view returns (string memory) {	
        return _name;
    }
    function SYMBOL181() public view returns (string memory) {	
        return _symbol;
    }
    function DECIMALS652() public view returns (uint8) {	
        return _decimals;
    }
}

library SafeMath {
    function ADD403(uint a, uint b) internal pure returns (uint) {	
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB555(uint a, uint b) internal pure returns (uint) {	
        return SUB555(a, b, "SafeMath: subtraction overflow");
    }
    function SUB555(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL87(uint a, uint b) internal pure returns (uint) {	
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV372(uint a, uint b) internal pure returns (uint) {	
        return DIV372(a, b, "SafeMath: division by zero");
    }
    function DIV372(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT216(address account) internal view returns (bool) {	
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER975(IERC20 token, address to, uint value) internal {	
        
        CALLOPTIONALRETURN612(token, abi.encodeWithSelector(token.TRANSFER331.selector, to, value));
    }

    function SAFETRANSFERFROM689(IERC20 token, address from, address to, uint value) internal {	
        
        CALLOPTIONALRETURN612(token, abi.encodeWithSelector(token.TRANSFERFROM344.selector, from, to, value));
    }

    function SAFEAPPROVE151(IERC20 token, address spender, uint value) internal {	
        require((value == 0) || (token.ALLOWANCE406(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN612(token, abi.encodeWithSelector(token.APPROVE709.selector, spender, value));
    }
    function CALLOPTIONALRETURN612(IERC20 token, bytes memory data) private {	
        require(address(token).ISCONTRACT216(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract SaladSwap is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  address public governance;
  mapping (address => bool) public minters;


  constructor () public ERC20Detailed("SaladSwap", "Salad", 18) {
      governance = msg.sender;
      minters[msg.sender] = true;
  }

  function MINT265(address account, uint256 amount) public {	
      require(minters[msg.sender], "!minter");
      _MINT848(account, amount);
  }

   function BURN709(uint256 amount) public {	
      _BURN501(msg.sender, amount);
  }

  function SETGOVERNANCE774(address _governance) public {	
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }

  function ADDMINTER22(address _minter) public {	
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }

  function REMOVEMINTER553(address _minter) public {	
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }

  function() external payable {

  }

   function WITHDRAW793() external {	
      require(msg.sender == governance, "!governance");
      msg.sender.transfer(address(this).balance);
  }

}