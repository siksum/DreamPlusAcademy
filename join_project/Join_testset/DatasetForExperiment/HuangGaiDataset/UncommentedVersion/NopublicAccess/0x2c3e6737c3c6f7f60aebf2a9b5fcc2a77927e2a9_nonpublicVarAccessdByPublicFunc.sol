/**
 *Submitted for verification at Etherscan.io on 2020-09-24
*/

/**
 *Submitted for verification at Etherscan.io on 2017-11-28
*/

pragma solidity ^0.5.12;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        uint256 c = a / b;
        
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address internal owner;

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
        if (newOwner != address(0)) {
            owner = newOwner;	
        }
    }

}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https:
 */
contract ERC20Basic {
    uint internal _totalSupply;
    function totalSupply() public view returns (uint);
    function balanceOf(address who) public view returns (uint);
    function transfer(address to, uint value) public;
    event Transfer(address indexed from, address indexed to, uint value);
}

/**
 * @title ERC20 interface
 * @dev see https:
 */
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint);
    function transferFrom(address from, address to, uint value) public;
    function approve(address spender, uint value) public;
    event Approval(address indexed owner, address indexed spender, uint value);
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) internal balances;

    
    uint public maximumFee = 0;

    /**
    * @dev Fix for the ERC20 short address attack.
    */
    modifier onlyPayloadSize(uint size) {
        require(!(msg.data.length < size + 4));
        _;
    }

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint _value) public onlyPayloadSize(2 * 32) {
        balances[msg.sender] = balances[msg.sender].sub(_value);	
        balances[_to] = balances[_to].add(_value);	
        emit Transfer(msg.sender, _to, _value);
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];	
    }

}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https:
 * @dev Based oncode by FirstBlood: https:
 */
contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) internal allowed;

    uint internal MAX_UINT = 2**256 - 1;

    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint _value) public onlyPayloadSize(3 * 32) {
        uint256 _allowance = allowed[_from][msg.sender];	

        
        
        if (_allowance < MAX_UINT) {	
            allowed[_from][msg.sender] = _allowance.sub(_value);	
        }

        balances[_from] = balances[_from].sub(_value);	
        balances[_to] = balances[_to].add(_value);	

        emit Transfer(_from, _to, _value);
    }

    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    * @param _spender The address which will spend the funds.
    * @param _value The amount of tokens to be spent.
    */
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {

        
        
        
        
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));	

        allowed[msg.sender][_spender] = _value;	
        emit Approval(msg.sender, _spender, _value);
    }

    /**
    * @dev Function to check the amount of tokens than an owner allowed to a spender.
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint specifying the amount of tokens still available for the spender.
    */
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];	
    }

}


/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
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
        paused = true;	
        emit Pause();
    }

    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function unpause() onlyOwner whenPaused public {
        paused = false;	
        emit Unpause();
    }
}

contract BlackList is Ownable, BasicToken {

    /////// Getters to allow the same blacklist to be used also by other contracts (including upgraded DBP) ///////
    function getBlackListStatus(address _maker) external view returns (bool) {
        return isBlackListed[_maker];	
    }

    function getOwner() external view returns (address) {
        return owner;	
    }

    mapping (address => bool) internal isBlackListed;

    function addBlackList (address _evilUser) public onlyOwner {
        isBlackListed[_evilUser] = true;	
        emit AddedBlackList(_evilUser);
    }

    function removeBlackList (address _clearedUser) public onlyOwner {
        isBlackListed[_clearedUser] = false;	
        emit RemovedBlackList(_clearedUser);
    }

    function destroyBlackFunds (address _blackListedUser) public onlyOwner {
        require(isBlackListed[_blackListedUser]);	
        uint dirtyFunds = balanceOf(_blackListedUser);
        balances[_blackListedUser] = 0;	
        _totalSupply -= dirtyFunds;	
        emit DestroyedBlackFunds(_blackListedUser, dirtyFunds);
    }

    event DestroyedBlackFunds(address _blackListedUser, uint _balance);

    event AddedBlackList(address _user);

    event RemovedBlackList(address _user);

}

contract UpgradedStandardToken is StandardToken{
    
    
    function transferByLegacy(address from, address to, uint value) public;
    function transferFromByLegacy(address sender, address from, address spender, uint value) public;
    function approveByLegacy(address from, address spender, uint value) public;
}

contract ERCToken is Pausable, StandardToken, BlackList {

    string public name;
    string public symbol;
    uint public decimals;
    address internal upgradedAddress;
    bool internal deprecated;

    
    
    
    
    
    
    
    constructor(uint _initialSupply, string memory _name, string memory _symbol, uint _decimals) public {
        _totalSupply = _initialSupply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        balances[owner] = _initialSupply;
        deprecated = false;
    }

    
    function transfer(address _to, uint _value) public whenNotPaused {
        require(!isBlackListed[msg.sender]);	
        if (deprecated) {	
            return UpgradedStandardToken(upgradedAddress).transferByLegacy(msg.sender, _to, _value);	
        } else {
            return super.transfer(_to, _value);
        }
    }

    
    function transferFrom(address _from, address _to, uint _value) public whenNotPaused {
        require(!isBlackListed[_from]);	
        if (deprecated) {	
            return UpgradedStandardToken(upgradedAddress).transferFromByLegacy(msg.sender, _from, _to, _value);	
        } else {
            return super.transferFrom(_from, _to, _value);
        }
    }

    
    function balanceOf(address who) public view returns (uint) {
        if (deprecated) {	
            return UpgradedStandardToken(upgradedAddress).balanceOf(who);	
        } else {
            return super.balanceOf(who);
        }
    }

    
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {
        if (deprecated) {	
            return UpgradedStandardToken(upgradedAddress).approveByLegacy(msg.sender, _spender, _value);	
        } else {
            return super.approve(_spender, _value);
        }
    }

    
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        if (deprecated) {	
            return StandardToken(upgradedAddress).allowance(_owner, _spender);	
        } else {
            return super.allowance(_owner, _spender);
        }
    }

    
    function deprecate(address _upgradedAddress) public onlyOwner {
        deprecated = true;	
        upgradedAddress = _upgradedAddress;	
        emit Deprecate(_upgradedAddress);
    }

    
    function totalSupply() public view returns (uint) {
        if (deprecated) {	
            return StandardToken(upgradedAddress).totalSupply();	
        } else {
            return _totalSupply;	
        }
    }

    
    
    
    
    function issue(uint amount) public onlyOwner {
        require(_totalSupply + amount > _totalSupply);	
        require(balances[owner] + amount > balances[owner]);	

        balances[owner] += amount;	
        _totalSupply += amount;	
        emit Issue(amount);
    }

    
    
    
    
    
    function redeem(uint amount) public onlyOwner {
        require(_totalSupply >= amount);	
        require(balances[owner] >= amount);	

        _totalSupply -= amount;	
        balances[owner] -= amount;	
        emit Redeem(amount);
    }

    
    event Issue(uint amount);

    
    event Redeem(uint amount);

    
    event Deprecate(address newAddress);

}