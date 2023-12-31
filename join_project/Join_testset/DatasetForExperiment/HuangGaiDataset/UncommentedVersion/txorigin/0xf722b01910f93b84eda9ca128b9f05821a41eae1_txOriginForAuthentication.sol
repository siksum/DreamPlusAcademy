pragma solidity ^0.5.1;

/**
 * @title Vrenelium Token - VRE
 * @author Vrenelium AG 2018/2019
 */

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(tx.origin == owner);	
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}

/**
 * @title SafeMath
 *
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    
    
    
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    
    
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * See https:
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https:
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender)
    public view returns (uint256);

  function transferFrom(address from, address to, uint256 value)
    public returns (bool);

  function approve(address spender, uint256 value) public returns (bool);
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

/**
 * @title Basic token
 *
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

  /**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

}


/**
 * @title ERC20 token implementation
 *
 * @dev Implementation of the ERC20 token.
 */
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;

  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https:
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}


/**
 * @title Mintable token with logarithmic approximation to token cap
 */
contract MintableTokenWithCap is StandardToken, Ownable {

  event Mint(address indexed to, uint256 amount);

  uint256 public constant TOTAL_TOKEN_CAP      = 78000000 * 10 ** 18; 
  uint256 public constant PRE_MINTED_TOKEN_CAP = 24100000 * 10 ** 18; 

  uint256 public constant PRE_MINTING_END      = 1577750400; 
  uint256 public constant MINTING_END          = 3187295999; 


  modifier hasMintPermission() {
    require(tx.origin == owner);	
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    hasMintPermission
    public
    returns (bool)
  {
    require(totalSupply_ + _amount <= getCurrentMintingLimit());

    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }

  function getCurrentMintingLimit()
    public
    view
    returns(uint256)
  {
    if(now <= PRE_MINTING_END) {

      return PRE_MINTED_TOKEN_CAP;
    }
    else if(now <= MINTING_END) {

      
      
      

      if(now <= 1609459199) { 
            return 28132170 *10 ** 18;
      }
      else if(now <= 1640995199) { 
            return 31541205 *10 ** 18;
      }
      else if(now <= 1672531199) { 
            return 34500660 *10 ** 18;
      }
      else if(now <= 1704067199) { 
            return 37115417 *10 ** 18;
      }
      else if(now <= 1735603199) { 
            return 39457461 *10 ** 18;
      }
      else if(now <= 1767225599) { 
            return 41583887 *10 ** 18;
      }
      else if(now <= 1798761599) { 
            return 43521339 *10 ** 18;
      }
      else if(now <= 1830297599) { 
            return 45304967 *10 ** 18;
      }
      else if(now <= 1861919999) { 
            return 46961775 *10 ** 18;
      }
      else if(now <= 1893455999) { 
            return 48500727 *10 ** 18;
      }
      else if(now <= 1924991999) { 
            return 49941032 *10 ** 18;
      }
      else if(now <= 1956527999) { 
            return 51294580 *10 ** 18;
      }
      else if(now <= 1988150399) { 
            return 52574631 *10 ** 18;
      }
      else if(now <= 2019686399) { 
            return 53782475 *10 ** 18;
      }
      else if(now <= 2051222399) { 
            return 54928714 *10 ** 18;
      }
      else if(now <= 2082758399) { 
            return 56019326 *10 ** 18;
      }
      else if(now <= 2114380799) { 
            return 57062248 *10 ** 18;
      }
      else if(now <= 2145916799) { 
            return 58056255 *10 ** 18;
      }
      else if(now <= 2177452799) { 
            return 59008160 *10 ** 18;
      }
      else if(now <= 2208988799) { 
            return 59921387 *10 ** 18;
      }
      else if(now <= 2240611199) { 
            return 60801313 *10 ** 18;
      }
      else if(now <= 2272147199) { 
            return 61645817 *10 ** 18;
      }
      else if(now <= 2303683199) { 
            return 62459738 *10 ** 18;
      }
      else if(now <= 2335219199) { 
            return 63245214 *10 ** 18;
      }
      else if(now <= 2366841599) { 
            return 64006212 *10 ** 18;
      }
      else if(now <= 2398377599) { 
            return 64740308 *10 ** 18;
      }
      else if(now <= 2429913599) { 
            return 65451186 *10 ** 18;
      }
      else if(now <= 2461449599) { 
            return 66140270 *10 ** 18;
      }
      else if(now <= 2493071999) { 
            return 66810661 *10 ** 18;
      }
      else if(now <= 2524607999) { 
            return 67459883 *10 ** 18;
      }
      else if(now <= 2556143999) { 
            return 68090879 *10 ** 18;
      }
      else if(now <= 2587679999) { 
            return 68704644 *10 ** 18;
      }
      else if(now <= 2619302399) { 
            return 69303710 *10 ** 18;
      }
      else if(now <= 2650838399) { 
            return 69885650 *10 ** 18;
      }
      else if(now <= 2682374399) { 
            return 70452903 *10 ** 18;
      }
      else if(now <= 2713910399) { 
            return 71006193 *10 ** 18;
      }
      else if(now <= 2745532799) { 
            return 71547652 *10 ** 18;
      }
      else if(now <= 2777068799) { 
            return 72074946 *10 ** 18;
      }
      else if(now <= 2808604799) { 
            return 72590155 *10 ** 18;
      }
      else if(now <= 2840140799) { 
            return 73093818 *10 ** 18;
      }
      else if(now <= 2871763199) { 
            return 73587778 *10 ** 18;
      }
      else if(now <= 2903299199) { 
            return 74069809 *10 ** 18;
      }
      else if(now <= 2934835199) { 
            return 74541721 *10 ** 18;
      }
      else if(now <= 2966371199) { 
            return 75003928 *10 ** 18;
      }
      else if(now <= 2997993599) { 
            return 75458050 *10 ** 18;
      }
      else if(now <= 3029529599) { 
            return 75901975 *10 ** 18;
      }
      else if(now <= 3061065599) { 
            return 76337302 *10 ** 18;
      }
      else if(now <= 3092601599) { 
            return 76764358 *10 ** 18;
      }
      else if(now <= 3124223999) { 
            return 77184590 *10 ** 18;
      }
      else if(now <= 3155759999) { 
            return 77595992 *10 ** 18;
      }
      else if(now <= 3187295999) { 
            return 78000000 *10 ** 18;
      }
    }
    else {

      return TOTAL_TOKEN_CAP;
    }
  }
}


/**
* @title Vrenelium Token Smart Contract
*/
contract VreneliumToken is MintableTokenWithCap {

    
    string public constant name = "Vrenelium Token";
    string public constant symbol = "VRE";
    uint8 public constant decimals = 18;

    /**
    * @dev Modifier to not allow transfers
    * to this contract
    */
    modifier validDestination(address _to) {
        require(_to != address(this));
        _;
    }

    constructor() public {
    }

    function transferFrom(address _from, address _to, uint256 _value) public
        validDestination(_to)
        returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public
        returns (bool) {
        return super.approve(_spender, _value);
    }

    function increaseApproval (address _spender, uint _addedValue) public
        returns (bool) {
        return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval (address _spender, uint _subtractedValue) public
        returns (bool) {
        return super.decreaseApproval(_spender, _subtractedValue);
    }

    function transfer(address _to, uint256 _value) public
        validDestination(_to)
        returns (bool) {
        return super.transfer(_to, _value);
    }
}