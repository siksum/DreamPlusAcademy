pragma solidity ^0.5.1;

contract Owned {
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    address internal owner;
    address internal newOwner;
    function changeOwner(address _newOwner) public onlyOwner {
        newOwner = _newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function acceptOwnership() public {
        if (msg.sender == newOwner) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
}

contract ERC20 {
    uint256 public totalSupply;
    function balanceOf(address _owner) view public returns (uint256 balance);
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) view public returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract Token is Owned,  ERC20 {
    string public symbol;
    string public name;
    uint8 public decimals;
    mapping (address=>uint256) balances;
    mapping (address=>mapping (address=>uint256)) allowed;
    
    function balanceOf(address _owner) view public returns (uint256 balance) {return balances[_owner];}	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        require (balances[msg.sender]>=_amount&&_amount>0&&balances[_to]+_amount>balances[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[msg.sender]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to]+=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(msg.sender,_to,_amount);
        return true;
    }
  
    function transferFrom(address _from,address _to,uint256 _amount) public returns (bool success) {
        require (balances[_from]>=_amount&&allowed[_from][msg.sender]>=_amount&&_amount>0&&balances[_to]+_amount>balances[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_from]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowed[_from][msg.sender]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to]+=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from, _to, _amount);
        return true;
    }
  
    function approve(address _spender, uint256 _amount) public returns (bool success) {
        allowed[msg.sender][_spender]=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
    
    function allowance(address _owner, address _spender) view public returns (uint256 remaining) {
      return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function mint(uint256 _amount) public onlyOwner returns (bool success) {
        require (_amount>0);
        balances[owner]+=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }
}

contract SEC is Token{
    
    constructor() public{
        symbol = "SEC";
        name = "BitSender";
        decimals = 0;
        totalSupply = 1000000;
        owner = msg.sender;
        balances[owner] = totalSupply;
    }
    
    function () payable external {
        revert();
    }
}