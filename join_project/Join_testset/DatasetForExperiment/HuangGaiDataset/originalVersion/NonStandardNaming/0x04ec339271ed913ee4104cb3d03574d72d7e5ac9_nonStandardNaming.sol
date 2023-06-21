// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER36(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE730(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM215(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY687() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF441(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE824(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER175(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL389(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL578(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV808(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB210(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD650(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD838(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY687() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF441(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE824(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER36(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER153(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE730(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM215(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER153(from, to, value);
        _APPROVE642(from, msg.sender, _allowed[from][msg.sender].SUB210(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE812(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(msg.sender, spender, _allowed[msg.sender][spender].ADD650(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE999(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(msg.sender, spender, _allowed[msg.sender][spender].SUB210(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER153(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB210(value);
        _balances[to] = _balances[to].ADD650(value);
        emit TRANSFER175(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT494(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD650(value);
        _balances[account] = _balances[account].ADD650(value);
        emit TRANSFER175(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN703(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB210(value);
        _balances[account] = _balances[account].SUB210(value);
        emit TRANSFER175(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE642(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL389(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM10(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN703(account, value);
        _APPROVE642(account, msg.sender, _allowed[account][msg.sender].SUB210(value));
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME89() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL10() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS46() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD650(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS251(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE102(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS251(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS251(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/MinterRole.sol

pragma solidity ^0.5.2;


contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED454(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED24(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER857(msg.sender);
    }

    modifier ONLYMINTER545() {	//inject NONSTANDARD NAMING
        require(ISMINTER938(msg.sender));
        _;
    }

    function ISMINTER938(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS251(account);
    }

    function ADDMINTER669(address account) public ONLYMINTER545 {	//inject NONSTANDARD NAMING
        _ADDMINTER857(account);
    }

    function RENOUNCEMINTER695() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER947(msg.sender);
    }

    function _ADDMINTER857(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD650(account);
        emit MINTERADDED454(account);
    }

    function _REMOVEMINTER947(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE102(account);
        emit MINTERREMOVED24(account);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol

pragma solidity ^0.5.2;



                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT160(address to, uint256 value) public ONLYMINTER545 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT494(to, value);
        return true;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Capped.sol

pragma solidity ^0.5.2;


                                                                       
contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;

    constructor (uint256 cap) public {
        require(cap > 0);
        _cap = cap;
    }

                                                             
    function CAP463() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

    function _MINT494(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY687().ADD650(value) <= _cap);
        super._MINT494(account, value);
    }
}

// File: contracts/GemsToken.sol

pragma solidity ^0.5.2;





contract GemsToken is ERC20, ERC20Detailed, ERC20Capped  {
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
		uint32 cap
    )
		ERC20()
		ERC20Detailed(name, symbol, decimals)
		ERC20Capped(cap * (10 ** uint256(decimals)))
        public
    {
		_MINT494(msg.sender, cap * (10 ** uint256(decimals)));
	}
}