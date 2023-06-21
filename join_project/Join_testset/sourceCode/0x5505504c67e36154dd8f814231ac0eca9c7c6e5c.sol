/**
 *Submitted for verification at Etherscan.io on 2020-10-13
*/

pragma solidity ^0.4.20;

contract ERC20Interface {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint public totalSupply;
    
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}

contract owned {
    address public owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function transferOwnerShip(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

contract ERC20 is ERC20Interface {
    mapping(address => uint256) public balanceOf;
    
    constructor(string _name, string _symbol, uint8 _decimals, uint _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0));
        require(_to != address(0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
}

contract AdvanceToken is ERC20,owned {
    mapping(address => bool) public frozenAccount;
    
    event FrozenFunds(address target, bool frozen);
    event Burn(address target, uint amount);
    
    constructor (string _name, string _symbol, uint8 _decimals, uint _totalSupply) ERC20(_name, _symbol, _decimals, _totalSupply) public {
        
    }
    
    function freezeAccount(address target, bool freeze) public onlyOwner {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(!frozenAccount[msg.sender]);
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0));
        require(_to != address(0));
        require(!frozenAccount[_from]);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    function burn(uint256 _value) public onlyOwner returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        
        totalSupply -= _value;
        balanceOf[msg.sender] -= _value;
        
        emit Burn(msg.sender, _value);
        
        return true;
    }
    
    function burnFrom(address _from, uint256 _value) public onlyOwner returns (bool success) {
        require(balanceOf[_from] >= _value);
        
        totalSupply -= _value;
        balanceOf[_from] -= _value;
        
        emit Burn(_from, _value);
        
        return true;
    }
}