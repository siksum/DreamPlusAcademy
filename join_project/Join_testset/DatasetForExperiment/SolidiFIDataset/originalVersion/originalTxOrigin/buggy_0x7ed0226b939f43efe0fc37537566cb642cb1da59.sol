pragma solidity ^0.5.8;

/**
 * @title ERC20 interface
 * @dev see https://eips.ethereum.org/EIPS/eip-20
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
        mapping(address => uint256) mapToIndex; // start with index 1
        address[] indexes;
    }
    
    function insert(IMap storage self, address _address, uint256 _value) internal returns (bool replaced) {
      
        require(_address != address(0));
        
        if(self.mapToIndex[_address] == 0){
            
            // add new
            self.indexes.push(_address);
            self.mapToIndex[_address] = self.indexes.length;
            self.mapToData[_address] = _value;
            return false;
        }
        
        // replace
        self.mapToData[_address] = _value;
        return true;
    }
    
    function remove(IMap storage self, address _address) internal returns (bool success) {
       
        require(_address != address(0));
        
        // not existing
        if(self.mapToIndex[_address] == 0){
            return false;   
        }
        
        uint256 deleteIndex = self.mapToIndex[_address];
        if(deleteIndex <= 0 || deleteIndex > self.indexes.length){
            return false;
        }
       
         // if index to be deleted is not the last index, swap position.
        if (deleteIndex < self.indexes.length) {
            // swap 
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

    // start with index 0
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
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
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
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

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
  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  address public owner;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
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
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
}

contract ZmineVoteKeep is Ownable {
  
    // Use itmap for all functions on the struct
    using IterableMap for IterableMap.IMap;
    using SafeMath for uint256;
    
    // ERC20 basic token contract being held
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  IERC20 public token;
  
    // map address => vote
  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  IterableMap.IMap voteRecordMap;
    // map address => token available for reclaim
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  IterableMap.IMap reclaimTokenMap;
    
    // time to start vote period
  function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  uint256 public timestampStartVote;
    // time to end vote period
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  uint256 public timestampEndVote;
    // time to enable reclaim token process
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  uint256 public timestampReleaseToken;
    
    // cumulative count for total vote
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  uint256 _totalVote;
    
    constructor(IERC20 _token) public {

        token = _token;
        
        // (Mainnet) May 22, 2019 GMT (epoch time 1558483200)
        // (Kovan) from now
        timestampStartVote = 1558483200; 
        
        // (Mainnet) May 28, 2019 GMT (epoch time 1559001600)
        // (Kovan) period for 10 years
        timestampEndVote = 1559001600; 
        
        // (Mainnet) May 30, 2019 GMT (epoch time 1559174400)
        // (Kovan) from now
        timestampReleaseToken = 1559174400; 
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    /**
     * modifier
     */
     
    // during the votable period?
    modifier onlyVotable() {
        require(isVotable());
        _;
    }
    
    // during the reclaimable period?
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
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    function isReclaimable() public view returns (bool){
        return (block.timestamp >= timestampReleaseToken);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    function countVoteUser() public view returns (uint256){
        return voteRecordMap.size();
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    function countVoteScore() public view returns (uint256){
        return _totalVote;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    function getVoteByAddress(address _address) public view returns (uint256){
        return voteRecordMap.get(_address);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    // vote by transfer token into this contract as collateral
    // This process require approval from sender, to allow contract transfer token on the sender behalf.
    function voteKeep(uint256 amount) public onlyVotable {

        require(token.balanceOf(msg.sender) >= amount);
        
        // transfer token on the sender behalf.
        token.transferFrom(msg.sender, address(this), amount);
        
        // calculate cumulative vote
        uint256 newAmount = voteRecordMap.get(msg.sender).add(amount);
        
        // save to map
        reclaimTokenMap.insert(msg.sender, newAmount);
        voteRecordMap.insert(msg.sender, newAmount);
        
        // cumulative count total vote
        _totalVote = _totalVote.add(amount);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    // Take the token back to the sender after reclaimable period has come.
    function reclaimToken() public onlyReclaimable {
      
        uint256 amount = reclaimTokenMap.get(msg.sender);
        require(amount > 0);
        require(token.balanceOf(address(this)) >= amount);
          
        // transfer token back to sender
        token.transfer(msg.sender, amount);
        
        // remove from map
        reclaimTokenMap.remove(msg.sender);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    /**
     * admin methods
     */
     
    function adminCountReclaimableUser() public view onlyOwner returns (uint256){
        return reclaimTokenMap.size();
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    function adminCheckReclaimableAddress(uint256 index) public view onlyOwner returns (address){
        
        require(index >= 0); 
        
        if(reclaimTokenMap.size() > index){
            return reclaimTokenMap.getKey(index);
        }else{
            return address(0);
        }
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    function adminCheckReclaimableToken(uint256 index) public view onlyOwner returns (uint256){
    
        require(index >= 0); 
    
        if(reclaimTokenMap.size() > index){
            return reclaimTokenMap.get(reclaimTokenMap.getKey(index));
        }else{
            return 0;
        }
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function adminCheckVoteAddress(uint256 index) public view onlyOwner returns (address){
        
        require(index >= 0); 
        
        if(voteRecordMap.size() > index){
            return voteRecordMap.getKey(index);
        }else{
            return address(0);
        }
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    function adminCheckVoteToken(uint256 index) public view onlyOwner returns (uint256){
    
        require(index >= 0); 
    
        if(voteRecordMap.size() > index){
            return voteRecordMap.get(voteRecordMap.getKey(index));
        }else{
            return 0;
        }
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    // perform reclaim token by admin 
    function adminReclaimToken(address _address) public onlyOwner {
      
        uint256 amount = reclaimTokenMap.get(_address);
        require(amount > 0);
        require(token.balanceOf(address(this)) >= amount);
          
        token.transfer(_address, amount);
        
        // remove from map
        reclaimTokenMap.remove(_address);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    // Prevent deposit tokens by accident to a contract with the transfer function? 
    // The transaction will succeed but this will not be recognized by the contract.
    // After reclaim process was ended, admin will able to transfer the remain tokens to himself. 
    // And return the remain tokens to senders by manual process.
    function adminSweepMistakeTransferToken() public onlyOwner {
        
        require(reclaimTokenMap.size() == 0);
        require(token.balanceOf(address(this)) > 0);
        token.transfer(owner, token.balanceOf(address(this)));
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
}