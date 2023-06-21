                                                                 



pragma solidity ^0.5.10;

                                                                                   
interface IERC20 {
    function TRANSFER10(address to, uint256 value) external returns (bool);	
    function APPROVE267(address spender, uint256 value) external returns (bool);	
    function TRANSFERFROM708(address from, address to, uint256 value) external returns (bool);	
    function TOTALSUPPLY494() external view returns (uint256);	
    function BALANCEOF251(address who) external view returns (uint256);	
    function ALLOWANCE692(address owner, address spender) external view returns (uint256);	
    event TRANSFER450(address indexed from, address indexed to, uint256 value);	
    event APPROVAL178(address indexed owner, address indexed spender, uint256 value);	
}



pragma solidity ^0.5.10;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL538(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV450(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                              
    function SUB503(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD578(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD790(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0);
        return a % b;
    }
}



pragma solidity ^0.5.10;

                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY494() public view returns (uint256) {	
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF251(address owner) public view returns (uint256) {	
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE692(address owner, address spender) public view returns (uint256) {	
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER10(address to, uint256 value) public returns (bool) {	
        _TRANSFER501(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE267(address spender, uint256 value) public returns (bool) {	
        _APPROVE603(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM708(address from, address to, uint256 value) public returns (bool) {	
        _TRANSFER501(from, to, value);
        _APPROVE603(from, msg.sender, _allowed[from][msg.sender].SUB503(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE546(address spender, uint256 addedValue) public returns (bool) {	
        _APPROVE603(msg.sender, spender, _allowed[msg.sender][spender].ADD578(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE79(address spender, uint256 subtractedValue) public returns (bool) {	
        _APPROVE603(msg.sender, spender, _allowed[msg.sender][spender].SUB503(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER501(address from, address to, uint256 value) internal {	
        require(to != address(0));

        _balances[from] = _balances[from].SUB503(value);
        _balances[to] = _balances[to].ADD578(value);
        emit TRANSFER450(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT797(address account, uint256 value) internal {	
        require(account != address(0));

        _totalSupply = _totalSupply.ADD578(value);
        _balances[account] = _balances[account].ADD578(value);
        emit TRANSFER450(address(0), account, value);
    }


                                                                                                                                                                                                                                                                  
    function _APPROVE603(address owner, address spender, uint256 value) internal {	
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL178(owner, spender, value);
    }

}



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

                                                     
    function NAME874() public view returns (string memory) {	
        return _name;
    }

                                                       
    function SYMBOL784() public view returns (string memory) {	
        return _symbol;
    }

                                                                   
    function DECIMALS379() public view returns (uint8) {	
        return _decimals;
    }
}



pragma solidity ^0.5.10;

contract MYRT is ERC20, ERC20Detailed {
    constructor() ERC20Detailed('MYRT (MYRToken.com)', 'MYRT', 6) public {
        _MINT797(msg.sender, 1000_000_000_000 * 10 ** 6);
    }
}