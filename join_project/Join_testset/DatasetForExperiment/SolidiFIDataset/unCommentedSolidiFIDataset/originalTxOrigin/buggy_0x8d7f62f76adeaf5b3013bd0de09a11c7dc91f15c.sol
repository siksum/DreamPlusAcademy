/**
 *Submitted for verification at Etherscan.io on 2020-05-15
*/

 STOS is a project in beta.

/
//
///

~presented by Open, ESQ || lexDAO LLC
*/

pragma solidity 0.5.14;

interface IToken { 
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

/***************
SMART TERMS OF SERVICE
> `Legal Wrapper for Ross Campbell Legal Engineering_$RCLE`
***************/
contract $RCLETermsOfService { 
    
  function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  address public leethToken = 0x5A844590c5b8f40ae56190771d06c60b9ab1Da1C; 
    IToken private leeth = IToken(leethToken);
    
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  address public offeror;
  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  uint8 public version;
  function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  string public emoji = "11";
  function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  string public terms;
    
    
  function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
  uint256 public signature; 
  function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  mapping (uint256 => Signature) public sigs;
    
    struct Signature {  
        address signatory; 
        uint256 number;
        uint8 version;
        string details;
        string terms;
    }
    
  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event Amended(uint8 indexed version, string indexed terms);
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Signed(address indexed signatory, uint256 indexed number, string indexed details);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Upgraded(address indexed signatory, uint256 indexed number, string indexed details);
    
    constructor (address _offeror, string memory _terms) public {
        offeror = _offeror;
        terms = _terms;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
} 
    
    /***************
    STOS FUNCTIONS
    ***************/
    function signTerms(string memory details) public {
        require(leeth.balanceOf(msg.sender) > 0, "leethToken balance insufficient");
	    uint256 number = signature + 1; 
	    signature = signature + 1;
	    
        sigs[number] = Signature( 
                msg.sender,
                number,
                version,
                details,
                terms);
                
        leeth.transfer(msg.sender, leeth.balanceOf(msg.sender) / 10);
        emit Signed(msg.sender, number, details);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
} 
    
    function upgradeSignature(uint256 number, string memory details) public {
        Signature storage sig = sigs[number];
        require(msg.sender == sig.signatory);
        
        sig.version = version;
        sig.details = details;
        sig.terms = terms;

        emit Upgraded(msg.sender, number, details);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    } 
    
    /***************
    MGMT FUNCTIONS
    ***************/
    function amendTerms(string memory _terms) public {
        require(msg.sender == offeror, "Sender not authorized.");
        version = version + 1;
        terms = _terms;
        
        emit Amended(version, terms);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
} 
    
    function withdrawLEETH() public {
        require(msg.sender == offeror, "Sender not authorized.");
        leeth.transfer(msg.sender, leeth.balanceOf(address(this)));
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
} 
}