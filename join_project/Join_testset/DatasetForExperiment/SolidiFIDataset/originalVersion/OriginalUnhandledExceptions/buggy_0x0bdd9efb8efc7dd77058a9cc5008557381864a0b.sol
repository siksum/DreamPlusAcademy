/**
 * Social Remit Contract Airdrop
 * Developer: Nechesov Andrey 
 * Skype: Nechesov
 * Telegram: @nechesoff
 * Facebook: http://fb.com/nechesov
*/

pragma solidity ^0.5.10;        
   
contract Airdrop {     	
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

	address public c = 0x7a0e91c4204355e0A6bBf746dc0B7E32dFEFDecf; function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

	address payable public owner;	
	function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

	mapping (uint => address) public a;	
	

	constructor() public{
        owner = msg.sender;                
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }

	function() payable external{    

	}
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

	function transfer(uint _sreur_tokens, address[] memory _addresses) onlyOwner public returns (bool) {      
		
		require (_sreur_tokens > 0);		
    	uint amount = _sreur_tokens*100000000;

		for (uint i = 0; i < _addresses.length; i++) {
			//c.call(bytes4(sha3("transfer(address,uint256)")),_addresses[i], amount);				
			(bool success,) = address(c).call(abi.encodeWithSignature("transfer(address,uint256)", _addresses[i], amount));                  
          	require(success);
		}  
	  
	  return true;
	}
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  } 
	
	function withdraw() onlyOwner public returns (bool result) {
	  owner.transfer(address(this).balance);
	  return true;
	}
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
	
    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }       

}