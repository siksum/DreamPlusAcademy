pragma solidity ^0.5.6;

                                                                                                    
library SafeMath {
                                                                            
  function MUL18(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                     
  function DIV313(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // Solidity only automatically asserts when dividing by 0
    require(b > 0);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

                                                                                                                        
  function SUB534(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

                                                                      
  function ADD234(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

                                                                                                                                            
  function MOD502(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b != 0);
    return a % b;
  }
}

                                                                                   
interface IERC20 {
  function TRANSFER926(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE122(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  function TRANSFERFROM849(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    external
    returns (bool);

  function TOTALSUPPLY503() external view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF301(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE88(address owner, address spender)	//inject NONSTANDARD NAMING
    external
    view
    returns (uint256);

  event TRANSFER361(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

  event APPROVAL435(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract IDEX is IERC20 {
  using SafeMath for uint256;

  mapping(address => uint256) private _balances;
  mapping(address => mapping(address => uint256)) private _allowed;
  uint256 private _totalSupply;
  string private _name;
  string private _symbol;
  uint8 private _decimals;
  IERC20 _oldToken;

  event SWAP817(address indexed owner, uint256 value);	//inject NONSTANDARD NAMING

  constructor(
    string memory name,
    string memory symbol,
    uint8 decimals,
    IERC20 oldToken
  ) public {
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
    _totalSupply = oldToken.TOTALSUPPLY503();
    _balances[address(this)] = _totalSupply;
    _oldToken = oldToken;

    emit TRANSFER361(address(0), address(this), _totalSupply);
  }

  function SWAP558(uint256 value) external returns (bool) {	//inject NONSTANDARD NAMING
    require(
      _oldToken.TRANSFERFROM849(msg.sender, address(this), value),
      "AURA transfer failed"
    );
    require(this.TRANSFER926(msg.sender, value), "IDEX transfer failed");

    emit SWAP817(msg.sender, value);

    return true;
  }

                                               
  function NAME723() public view returns (string memory) {	//inject NONSTANDARD NAMING
    return _name;
  }

                                                 
  function SYMBOL594() public view returns (string memory) {	//inject NONSTANDARD NAMING
    return _symbol;
  }

                                                             
  function DECIMALS27() public view returns (uint8) {	//inject NONSTANDARD NAMING
    return _decimals;
  }

                                                          
  function TOTALSUPPLY503() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

                                                                                                                                                                                                   
  function BALANCEOF301(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _balances[owner];
  }

                                                                                                                                                                                                                                                                                                                        
  function ALLOWANCE88(address owner, address spender)	//inject NONSTANDARD NAMING
    public
    view
    returns (uint256)
  {
    return _allowed[owner][spender];
  }

                                                                                                                                                       
  function TRANSFER926(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    _TRANSFER330(msg.sender, to, value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function APPROVE122(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    _APPROVE646(msg.sender, spender, value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function TRANSFERFROM849(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    public
    returns (bool)
  {
    _TRANSFER330(from, to, value);
    _APPROVE646(from, msg.sender, _allowed[from][msg.sender].SUB534(value));
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function INCREASEALLOWANCE375(address spender, uint256 addedValue)	//inject NONSTANDARD NAMING
    public
    returns (bool)
  {
    _APPROVE646(
      msg.sender,
      spender,
      _allowed[msg.sender][spender].ADD234(addedValue)
    );
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function DECREASEALLOWANCE486(address spender, uint256 subtractedValue)	//inject NONSTANDARD NAMING
    public
    returns (bool)
  {
    _APPROVE646(
      msg.sender,
      spender,
      _allowed[msg.sender][spender].SUB534(subtractedValue)
    );
    return true;
  }

                                                                                                                                                                                                         
  function _TRANSFER330(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
    require(from != address(0), "Invalid from");
    require(to != address(0), "Invalid to");

    _balances[from] = _balances[from].SUB534(value);
    _balances[to] = _balances[to].ADD234(value);
    emit TRANSFER361(from, to, value);
  }

                                                                                                                                                                                                                                                      
  function _APPROVE646(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
    require(spender != address(0), "Invalid spender");

    _allowed[owner][spender] = value;
    emit APPROVAL435(owner, spender, value);
  }
}