pragma solidity ^0.5.2;
contract Hoouusch {
   address owner;
 function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  mapping(address => uint256) balances;
   constructor() public {
        owner = msg.sender;
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    
function () payable external {
    balances[msg.sender] += msg.value;
}
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }  
  function withdraw(address payable receiver, uint256 amount) public {
      require(owner == msg.sender);
        receiver.transfer(amount);
        }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}    
  
    function transferOwnership(address newOwner) public  {
    require(owner == msg.sender);
    owner = newOwner;
  }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  
}