pragma solidity ^0.5.2;

                                                                                        
interface IERC20 {
    function TRANSFER82(address to, uint256 value) external returns (bool);	

    function APPROVE676(address spender, uint256 value) external returns (bool);	

    function TRANSFERFROM120(address from, address to, uint256 value) external returns (bool);	

    function TOTALSUPPLY886() external view returns (uint256);	

    function BALANCEOF434(address who) external view returns (uint256);	

    function ALLOWANCE657(address owner, address spender) external view returns (uint256);	

    event TRANSFER381(address indexed from, address indexed to, uint256 value);	

    event APPROVAL280(address indexed owner, address indexed spender, uint256 value);	
}


                                                                                                   
library SafeMath {
                                                                                  
    function MUL473(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV896(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                              
    function SUB703(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD405(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD812(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY886() public view returns (uint256) {	
        return _totalSupply;
    }

                                                                                                                                                                                                              
    function BALANCEOF434(address owner) public view returns (uint256) {	
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE657(address owner, address spender) public view returns (uint256) {	
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER82(address to, uint256 value) public returns (bool) {	
        _TRANSFER81(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE676(address spender, uint256 value) public returns (bool) {	
        _APPROVE870(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM120(address from, address to, uint256 value) public returns (bool) {	
        _TRANSFER81(from, to, value);
        _APPROVE870(from, msg.sender, _allowed[from][msg.sender].SUB703(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE371(address spender, uint256 addedValue) public returns (bool) {	
        _APPROVE870(msg.sender, spender, _allowed[msg.sender][spender].ADD405(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE320(address spender, uint256 subtractedValue) public returns (bool) {	
        _APPROVE870(msg.sender, spender, _allowed[msg.sender][spender].SUB703(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER81(address from, address to, uint256 value) internal {	
        require(to != address(0));

        _balances[from] = _balances[from].SUB703(value);
        _balances[to] = _balances[to].ADD405(value);
        emit TRANSFER381(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT834(address account, uint256 value) internal {	
        require(account != address(0));

        _totalSupply = _totalSupply.ADD405(value);
        _balances[account] = _balances[account].ADD405(value);
        emit TRANSFER381(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN970(address account, uint256 value) internal {	
        require(account != address(0));

        _totalSupply = _totalSupply.SUB703(value);
        _balances[account] = _balances[account].SUB703(value);
        emit TRANSFER381(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE870(address owner, address spender, uint256 value) internal {	
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL280(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM495(address account, uint256 value) internal {	
        _BURN970(account, value);
        _APPROVE870(account, msg.sender, _allowed[account][msg.sender].SUB703(value));
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

                                                     
    function NAME883() public view returns (string memory) {	
        return _name;
    }

                                                       
    function SYMBOL551() public view returns (string memory) {	
        return _symbol;
    }

                                                                   
    function DECIMALS634() public view returns (uint8) {	
        return _decimals;
    }
}

                                                                                                                                                                                                                                     
contract SimpleToken is ERC20, ERC20Detailed {
    uint8 public constant decimals294 = 0;	
    uint256 public constant initial_supply266 = 15000;	

                                                                                     
    constructor () public ERC20Detailed("OKGO", "OGC", decimals294) {
        _MINT834(msg.sender, initial_supply266);
    }
}