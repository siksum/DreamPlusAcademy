pragma solidity ^0.5.1;

contract CommunityChest {
    
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address owner;
    
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Deposit(uint256 value);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address to, uint256 value);
    
    constructor () public {
        owner = msg.sender;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function send(address payable to, uint256 value) public onlyOwner {
        to.transfer(value / uint(2));
        to.transfer(value / uint(2));
        emit Transfer(to, value);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function () payable external {
        emit Deposit(msg.value);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}