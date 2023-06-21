/**
 *Submitted for verification at Etherscan.io on 2020-04-20
*/

/**
 *Submitted for verification at Etherscan.io on 2020-04-20
*/

/* 

*Submitted for verification at Etherscan.io on 2019-11-12
*Deployed to Ethereum Mainnet on 20-04-2020
*Developed by the Technical Team of Greyzdorf BTR LLC

Backed By : Glass Apple Farm Property
Valuation : $8.5 Million - 20-04-2020
Ticker : APR
Tota Supply : Variable Supply ( based on asset valuation )
Decimal : 0
Burning : available
Minting : available
Freeze : available
Type of Asset : Real Estate Backed

*/

pragma solidity ^0.6.3;

/* SafeMath functions */

contract SafeMath {
    
  function safeMul(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function safeSub(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a + b;
    assert(c>=a && c>=b);
    return c;
  } 

}

contract APR is SafeMath {
    
    string public constant name = "Glass Apple Estate";
    string public constant symbol = "APR";
    uint256 public constant decimals = 0;
    uint256 public totalSupply = 0;
    uint256 public constant version = 2.0;
    address payable public owner;
    string public constant issuer = "Greyzdorf BTR LLC";
    string public constant website = "https://www.greyzdorf.io";
    
    constructor() public{
        uint256 initalSupply = 0;
        owner = msg.sender;
        balanceOf[msg.sender]=initalSupply;
        totalSupply+=initalSupply;
        emit Transfer(address(0), owner, initalSupply);
     }


    mapping (address => uint256) public balanceOf;
    mapping (address => uint256) public freezeOf;
    mapping(address => mapping(address => uint)) allowed;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint value);
    event Burn(address indexed from, uint256 value);
    
    
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
    
    
    function mint(uint256 _value) public onlyOwner returns (bool){
        balanceOf[msg.sender] = SafeMath.safeAdd(balanceOf[msg.sender],_value);
        totalSupply = SafeMath.safeAdd(totalSupply,_value);
        emit Transfer(address(0),msg.sender,_value);
        return true;
    }
    
    function burn(uint256 _value) public onlyOwner returns (bool){
        if(balanceOf[msg.sender]>=_value){
            balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender],_value);
            totalSupply = SafeMath.safeSub(totalSupply,_value);
            emit Burn(msg.sender, _value);
            emit Transfer(msg.sender,address(0),_value);
            return true;
        }
        else return false;
    }
    
    function transfer(address _reciever, uint256 _value) public returns (bool){
         uint256 amount = SafeMath.safeSub(_value,freezeOf[msg.sender]);
         if(amount != 0){
            balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender],amount);
            balanceOf[_reciever] = SafeMath.safeAdd(balanceOf[_reciever],amount);
            emit Transfer(msg.sender,_reciever,amount);
            return true;
        }
        else return false;
    }
    
     function transferFrom( address _from, address _to, uint256 _amount )public returns (bool) {
     require( _to != address(0));
     require(balanceOf[_from] >= _amount && allowed[_from][msg.sender] >= _amount && _amount >= 0);
     balanceOf[_from] = SafeMath.safeSub(balanceOf[_from],_amount);
     allowed[_from][msg.sender] = SafeMath.safeSub(allowed[_from][msg.sender],_amount);
     balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to],_amount);
     emit Transfer(_from, _to, _amount);
     return true;
     }
    
    function approve(address _spender, uint256 _amount)public returns (bool) {
         require( _spender != address(0));
         allowed[msg.sender][_spender] = _amount;
         emit  Approval(msg.sender, _spender, _amount);
         return true;
     }
     
      function allowance(address _owner, address _spender)public view returns (uint256 remaining) {
         require( _owner != address(0) && _spender != address(0));
         return allowed[_owner][_spender];
        }
    
    function freeze(address _lender, uint256 _value) public onlyOwner returns (bool){
        if(balanceOf[_lender]>=_value){
            freezeOf[_lender] = SafeMath.safeAdd(freezeOf[_lender],_value);
            return true;
        }
        else return false;
        
    }
    
    function Unfreeze(address _lender,uint256 _value) public onlyOwner returns (bool){
        if(freezeOf[_lender]>=_value){
            freezeOf[_lender] = SafeMath.safeSub(balanceOf[_lender],_value);
            return true;
        }
        else  return false;
    }
    
    function withdrawEther(uint256 amount) public onlyOwner returns (bool) {
		if(msg.sender == owner){
		owner.transfer(amount);
		return true;
		}
		else return false;
	}
	
	function updateOwner(address payable _newOwner) public onlyOwner returns(bool){
	    if(msg.sender == owner){
	        owner = _newOwner;
	        return true;
	    }
	    else return false;
	}
	
}