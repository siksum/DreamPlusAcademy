pragma solidity 0.5.4;


interface IERC20 {
    function TRANSFER372(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE469(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM899(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY280() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF660(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE959(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER985(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL516(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                
    function MUL658(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV827(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB407(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD689(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD639(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD689(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS905(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE470(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS905(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS905(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY280() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF660(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE959(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER372(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER473(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE469(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL516(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM899(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB407(value);
        _TRANSFER473(from, to, value);
        emit APPROVAL516(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE142(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD689(addedValue);
        emit APPROVAL516(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE751(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB407(subtractedValue);
        emit APPROVAL516(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER473(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB407(value);
        _balances[to] = _balances[to].ADD689(value);
        emit TRANSFER985(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT578(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD689(value);
        _balances[account] = _balances[account].ADD689(value);
        emit TRANSFER985(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN552(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB407(value);
        _balances[account] = _balances[account].SUB407(value);
        emit TRANSFER985(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM658(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB407(value);
        _BURN552(account, value);
        emit APPROVAL516(account, msg.sender, _allowed[account][msg.sender]);
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED113(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED351(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER956(msg.sender);
    }

    modifier ONLYMINTER816() {	//inject NONSTANDARD NAMING
        require(ISMINTER758(msg.sender));
        _;
    }

    function ISMINTER758(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS905(account);
    }

    function ADDMINTER321(address account) public ONLYMINTER816 {	//inject NONSTANDARD NAMING
        _ADDMINTER956(account);
    }

    function RENOUNCEMINTER626() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER415(msg.sender);
    }

    function _ADDMINTER956(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD689(account);
        emit MINTERADDED113(account);
    }

    function _REMOVEMINTER415(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE470(account);
        emit MINTERREMOVED351(account);
    }
}

contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT47(address to, uint256 value) public ONLYMINTER816 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT578(to, value);
        return true;
    }
}

contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;

    constructor (uint256 cap) public {
        require(cap > 0);
        _cap = cap;
    }

                                                             
    function CAP115() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

    function _MINT578(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY280().ADD689(value) <= _cap);
        super._MINT578(account, value);
    }
}

contract FOX is ERC20, ERC20Capped {
	
	string public constant name478 = "FOX";	//inject NONSTANDARD NAMING
	string public constant symbol21 = "FOX";	//inject NONSTANDARD NAMING
	uint8 public constant decimals573 = 18;	//inject NONSTANDARD NAMING

	constructor() ERC20Capped(1000001337 * (uint(10) ** decimals573)) public {
		MINT47(msg.sender, 1000001337 * (uint(10) ** decimals573));
	}
}