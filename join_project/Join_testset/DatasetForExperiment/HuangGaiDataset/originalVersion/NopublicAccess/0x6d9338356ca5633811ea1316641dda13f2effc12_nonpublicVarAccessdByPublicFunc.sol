/**
 *Submitted for verification at Etherscan.io on 2019-12-16
*/

pragma solidity ^0.5.10;

contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract Ownable {
  address internal owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


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
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

}

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool internal paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {
    paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {
    paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Unpause();
  }
}

contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

  /**
  * @dev total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

}

contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    require(_value <= allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    balances[_from] = balances[_from].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    return true;
  }

}

contract MintableToken is StandardToken, Ownable {
  event Mint(address indexed to, uint256 amount);
  event MintFinished();

  bool internal mintingFinished = false;


  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    totalSupply_ = totalSupply_.add(_amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] = balances[_to].add(_amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }

  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() onlyOwner canMint public returns (bool) {
    mintingFinished = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit MintFinished();
    return true;
  }
}

contract PausableToken is StandardToken, Pausable {

  function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
    return super.approve(_spender, _value);
  }

  function increaseApproval(address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
}

contract CappedToken is MintableToken {

  uint256 internal cap;

  constructor(uint256 _cap) public {
    require(_cap > 0);
    cap = _cap;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    require(totalSupply_.add(_amount) <= cap);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    return super.mint(_to, _amount);
  }

}

contract KittiefightToken is PausableToken, CappedToken {

    /* Set the token symbol for display */
    string public constant symbol = "KTY";

    /* Set the token name for display */
    string public constant name = "Kittiefight";

    /* Set the number of decimals for display */
    uint8 public constant decimals = 18;

    /* 100 milion KTY specified */
    uint256 public constant amountOfTokenToMint = 10**8 * 10**uint256(decimals);

    /* Is crowdsale filtering non registered users. false by default */
    bool internal isTransferWhitelistOnly = false;

    /* Mapping of whitelisted users */
    mapping (address => bool) transfersWhitelist;

    event UserTransferWhitelistStatusChange(address user, bool whitelisted);

    event TransferWhitelistOnly(bool flag);


    constructor() CappedToken(amountOfTokenToMint) public {
        
    }

    /**
     * @notice Is the address allowed to transfer
     * @return true if the sender can transfer
     */
    function isUserAllowedToTransfer(address _user) public view returns (bool) {
        require(_user != address(0));
        return transfersWhitelist[_user];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @notice Enabling / Disabling transfers of non whitelisted users
     */
    function setWhitelistedOnly(bool _isWhitelistOnly) onlyOwner public {
        if (isTransferWhitelistOnly != _isWhitelistOnly) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            isTransferWhitelistOnly = _isWhitelistOnly;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit TransferWhitelistOnly(_isWhitelistOnly);
        }
    }

    /**
     * @notice Adding a user to the whitelist
     */
    function whitelistUserForTransfers(address _user) onlyOwner public {
        require(!isUserAllowedToTransfer(_user));
        transfersWhitelist[_user] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit UserTransferWhitelistStatusChange(_user, true);
    }

    /**
     * @notice Remove a user from the whitelist
     */
    function blacklistUserForTransfers(address _user) onlyOwner public {
        require(isUserAllowedToTransfer(_user));
        transfersWhitelist[_user] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit UserTransferWhitelistStatusChange(_user, false);
    }

    /**
    * @notice transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
      if (isTransferWhitelistOnly) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(isUserAllowedToTransfer(msg.sender));
      }
      return super.transfer(_to, _value);
    }

    /**
     * @notice Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        if (isTransferWhitelistOnly) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            require(isUserAllowedToTransfer(_from));
        }
        return super.transferFrom(_from, _to, _value);
    }

}