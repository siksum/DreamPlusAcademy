/**
 *Submitted for verification at Etherscan.io on 2020-09-19
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

contract Owned {
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    address owner;
    address newOwner;
    function changeOwner(address payable _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        if (msg.sender == newOwner) {
            owner = newOwner;
        }
    }
}

contract ERC20 {
    string public symbol;
    string public name;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping (address=>uint256) balances;
    mapping (address=>mapping (address=>uint256)) allowed;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    function balanceOf(address _owner) view public returns (uint256 balance) {return balances[_owner];}
    
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        require (balances[msg.sender]>=_amount&&_amount>0&&balances[_to]+_amount>balances[_to]);
        balances[msg.sender]-=_amount;
        balances[_to]+=_amount;
        emit Transfer(msg.sender,_to,_amount);
        return true;
    }
  
    function transferFrom(address _from,address _to,uint256 _amount) public returns (bool success) {
        require (balances[_from]>=_amount&&allowed[_from][msg.sender]>=_amount&&_amount>0&&balances[_to]+_amount>balances[_to]);
        balances[_from]-=_amount;
        allowed[_from][msg.sender]-=_amount;
        balances[_to]+=_amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }
  
    function approve(address _spender, uint256 _amount) public returns (bool success) {
        allowed[msg.sender][_spender]=_amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
    
    function allowance(address _owner, address _spender) view public returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }
}

contract VGXToken is Owned,ERC20{
    
    constructor(address _owner) {
        symbol = "VGX";
        name = "Vegas Token";
        decimals = 18;
        totalSupply = 100000000000000000000000000;
        owner = _owner;
        balances[owner] = totalSupply;
    }
    
    receive() external payable {
        revert();
    }
    
    function burn(uint256 _amount) public onlyOwner returns (bool){
        require(_amount>0&&_amount<=balances[owner],"lowbalance");
        balances[owner]-=_amount;
        totalSupply-=_amount;
        emit Transfer(owner, address(0), _amount);
        return true;
    }
}