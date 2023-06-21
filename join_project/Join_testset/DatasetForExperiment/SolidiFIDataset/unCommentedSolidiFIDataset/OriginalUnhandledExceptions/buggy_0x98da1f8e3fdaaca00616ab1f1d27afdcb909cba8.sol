pragma solidity ^0.5.1;



interface ERC223Handler { 
    function tokenFallback(address _from, uint _value, bytes calldata _data) external;
}

contract SaltynessToken{
    using SafeMath for uint256;
    using SafeMath for uint;
    
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}
    
    constructor() public{
        owner = msg.sender;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

	address owner;function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

	address newOwner;
    
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping(address => uint256) public balanceOf;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  mapping(address => mapping (address => uint256)) allowances;
    
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  string constant public name = "Saltyness";
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}
  string constant public symbol = "SALT";
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint8 constant public decimals = 18;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 public totalSupply;
    
    
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Transfer(address indexed from, address indexed to, uint value);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
    
    
    
    function setNewOwner(address o) public onlyOwner {
		newOwner = o;
	}
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

	function acceptNewOwner() public {
		require(msg.sender == newOwner);
		owner = msg.sender;
	}
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
	
    
	function giveSalt(address _saltee, uint256 _salt) public onlyOwner {
	    totalSupply = totalSupply.add(_salt);
	    balanceOf[_saltee] = balanceOf[_saltee].add(_salt);
        emit Transfer(address(this), _saltee, _salt, "");
        emit Transfer(address(this), _saltee, _salt);
	}
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
	
    
    
    function transfer(address _to, uint _value, bytes memory _data, string memory _function) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, _data, _function, true);
        return true;
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function transfer(address _to, uint _value, bytes memory _data) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, _data, "", true);
        return true;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
    function transfer(address _to, uint _value) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, "", "", true);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function approve(address _spender, uint _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        uint256 _allowance = allowances[_from][msg.sender];
        require(_allowance > 0, "Not approved");
        require(_allowance >= _value, "Over spending limit");
        allowances[_from][msg.sender] = _allowance.sub(_value);
        actualTransfer(_from, _to, _value, "", "", false);
        return true;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    
     
    
    
    function allowance(address _sugardaddy, address _spender) public view returns (uint remaining) {
        return allowances[_sugardaddy][_spender];
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
    
    
    
    
    
    
    
    function actualTransfer(address _from, address _to, uint _value, bytes memory _data, string memory _function, bool _careAboutHumanity) private{
        require(balanceOf[_from] >= _value, "Insufficient balance"); 
        require(_to != address(this), "You can't sell back your tokens");
        
        
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        
        if(_careAboutHumanity && isContract(_to)) {
            if (bytes(_function).length == 0){
                ERC223Handler receiver = ERC223Handler(_to);
                receiver.tokenFallback(_from, _value, _data);
            }else{
                bool success;
                bytes memory returnData;
                (success, returnData) = _to.call.value(0)(abi.encodeWithSignature(_function, _from, _value, _data));
                assert(success);
            }
        }
        emit Transfer(_from, _to, _value, _data);
        emit Transfer(_from, _to, _value);
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
    
    function isContract(address _addr) private view returns (bool is_contract) {
        uint length;
        assembly {
            
            
            length := extcodesize(_addr)
        }
        return (length>0);
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    
    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0 || b == 0) {
           return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }
    
    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        return a / b;
    }
    
    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    
    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}