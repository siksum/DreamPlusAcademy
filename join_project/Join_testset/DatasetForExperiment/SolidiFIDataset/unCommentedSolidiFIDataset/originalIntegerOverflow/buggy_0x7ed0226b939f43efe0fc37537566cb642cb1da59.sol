pragma solidity ^0.5.8;

/**
 * @title ERC20 interface
 * @dev see https:
 */
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library IterableMap {
    
    struct IMap {
        mapping(address => uint256) mapToData;
        mapping(address => uint256) mapToIndex; 
        address[] indexes;
    }
    
    function insert(IMap storage self, address _address, uint256 _value) internal returns (bool replaced) {
      
        require(_address != address(0));
        
        if(self.mapToIndex[_address] == 0){
            
            
            self.indexes.push(_address);
            self.mapToIndex[_address] = self.indexes.length;
            self.mapToData[_address] = _value;
            return false;
        }
        
        
        self.mapToData[_address] = _value;
        return true;
    }
    
    function remove(IMap storage self, address _address) internal returns (bool success) {
       
        require(_address != address(0));
        
        
        if(self.mapToIndex[_address] == 0){
            return false;   
        }
        
        uint256 deleteIndex = self.mapToIndex[_address];
        if(deleteIndex <= 0 || deleteIndex > self.indexes.length){
            return false;
        }
       
         
        if (deleteIndex < self.indexes.length) {
            
            self.indexes[deleteIndex-1] = self.indexes[self.indexes.length-1];
            self.mapToIndex[self.indexes[deleteIndex-1]] = deleteIndex;
        }
        self.indexes.length -= 1;
        delete self.mapToData[_address];
        delete self.mapToIndex[_address];
       
        return true;
    }
  
    function contains(IMap storage self, address _address) internal view returns (bool exists) {
        return self.mapToIndex[_address] > 0;
    }
      
    function size(IMap storage self) internal view returns (uint256) {
        return self.indexes.length;
    }
  
    function get(IMap storage self, address _address) internal view returns (uint256) {
        return self.mapToData[_address];
    }

    
    function getKey(IMap storage self, uint256 _index) internal view returns (address) {
        
        if(_index < self.indexes.length){
            return self.indexes[_index];
        }
        return address(0);
    }
}

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }
  address public owner;

  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
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
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}
}

contract ZmineVoteKeep is Ownable {
  
    
    using IterableMap for IterableMap.IMap;
    using SafeMath for uint256;
    
    
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }
  IERC20 public token;
  
    
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }
  IterableMap.IMap voteRecordMap;
    
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  IterableMap.IMap reclaimTokenMap;
    
    
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}
  uint256 public timestampStartVote;
    
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  uint256 public timestampEndVote;
    
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }
  uint256 public timestampReleaseToken;
    
    
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  uint256 _totalVote;
    
    constructor(IERC20 _token) public {

        token = _token;
        
        
        
        timestampStartVote = 1558483200; 
        
        
        
        timestampEndVote = 1559001600; 
        
        
        
        timestampReleaseToken = 1559174400; 
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    
    /**
     * modifier
     */
     
    
    modifier onlyVotable() {
        require(isVotable());
        _;
    }
    
    
    modifier onlyReclaimable() {
        require(isReclaimable());
        _;
    }
  
    /**
     * public methods
     */
     
    function isVotable() public view returns (bool){
        return (timestampStartVote <= block.timestamp && block.timestamp <= timestampEndVote);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}
    
    function isReclaimable() public view returns (bool){
        return (block.timestamp >= timestampReleaseToken);
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }
    
    function countVoteUser() public view returns (uint256){
        return voteRecordMap.size();
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}
    
    function countVoteScore() public view returns (uint256){
        return _totalVote;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    
    function getVoteByAddress(address _address) public view returns (uint256){
        return voteRecordMap.get(_address);
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
    
    
    
    function voteKeep(uint256 amount) public onlyVotable {

        require(token.balanceOf(msg.sender) >= amount);
        
        
        token.transferFrom(msg.sender, address(this), amount);
        
        
        uint256 newAmount = voteRecordMap.get(msg.sender).add(amount);
        
        
        reclaimTokenMap.insert(msg.sender, newAmount);
        voteRecordMap.insert(msg.sender, newAmount);
        
        
        _totalVote = _totalVote.add(amount);
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    
    
    function reclaimToken() public onlyReclaimable {
      
        uint256 amount = reclaimTokenMap.get(msg.sender);
        require(amount > 0);
        require(token.balanceOf(address(this)) >= amount);
          
        
        token.transfer(msg.sender, amount);
        
        
        reclaimTokenMap.remove(msg.sender);
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
    
    /**
     * admin methods
     */
     
    function adminCountReclaimableUser() public view onlyOwner returns (uint256){
        return reclaimTokenMap.size();
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    
    function adminCheckReclaimableAddress(uint256 index) public view onlyOwner returns (address){
        
        require(index >= 0); 
        
        if(reclaimTokenMap.size() > index){
            return reclaimTokenMap.getKey(index);
        }else{
            return address(0);
        }
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function adminCheckReclaimableToken(uint256 index) public view onlyOwner returns (uint256){
    
        require(index >= 0); 
    
        if(reclaimTokenMap.size() > index){
            return reclaimTokenMap.get(reclaimTokenMap.getKey(index));
        }else{
            return 0;
        }
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }
    
    function adminCheckVoteAddress(uint256 index) public view onlyOwner returns (address){
        
        require(index >= 0); 
        
        if(voteRecordMap.size() > index){
            return voteRecordMap.getKey(index);
        }else{
            return address(0);
        }
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    
    function adminCheckVoteToken(uint256 index) public view onlyOwner returns (uint256){
    
        require(index >= 0); 
    
        if(voteRecordMap.size() > index){
            return voteRecordMap.get(voteRecordMap.getKey(index));
        }else{
            return 0;
        }
    }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
    
    
    function adminReclaimToken(address _address) public onlyOwner {
      
        uint256 amount = reclaimTokenMap.get(_address);
        require(amount > 0);
        require(token.balanceOf(address(this)) >= amount);
          
        token.transfer(_address, amount);
        
        
        reclaimTokenMap.remove(_address);
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
    
    
    
    
    
    function adminSweepMistakeTransferToken() public onlyOwner {
        
        require(reclaimTokenMap.size() == 0);
        require(token.balanceOf(address(this)) > 0);
        token.transfer(owner, token.balanceOf(address(this)));
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
}