/**
 *Submitted for verification at Etherscan.io on 2020-10-23
*/

pragma solidity ^0.5.1;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
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

contract Ownable {
    address public owner;


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
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner public{
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

}

contract ERC20Basic {
    uint256 public totalSupply;
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);

    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
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
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);

    
    event Approval(address indexed _owner, address indexed _spender, uint _value);
    
}

contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) allowed;


    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amout of tokens to be transfered
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        uint256 _allowance = allowed[_from][msg.sender];

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    /**
     * @dev Aprove the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * @param _spender The address which will spend the funds.
     * @param _value The amount of tokens to be spent.
     */
    function approve(address _spender, uint256 _value) public returns (bool) {

        
        
        
        
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifing the amount of tokens still avaible for the spender.
     */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

}

contract CNDT is StandardToken, Ownable {
    string  public  constant name = "CNDT";
    string  public  constant symbol = "CNDT";
    uint    public  constant decimals = 18;

    modifier validDestination( address to ) {
        require(to != address(0x0));
        require(to != address(this) );
        _;
    }

    constructor() public {
        totalSupply = 2000000000 * (10 ** decimals);
        address to = msg.sender;
        balances[to] = totalSupply;
        emit Transfer(address(0x0), to, totalSupply);
        transferOwnership(msg.sender); 
    }

    function transfer(address _to, uint _value)
    validDestination(_to)
    public returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint _value)
    validDestination(_to)
    public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }


    function emergencyERC20Drain( ERC20 token, uint amount ) onlyOwner public {
        token.transfer( owner, amount );
    }

    function mint(address receiver, uint256 amount ) onlyOwner public {
        require(amount > 0);
        totalSupply = totalSupply.add(amount);
        balances[receiver] = balances[receiver].add(amount);
        emit Transfer(address(0x0), receiver, amount);
    }
}