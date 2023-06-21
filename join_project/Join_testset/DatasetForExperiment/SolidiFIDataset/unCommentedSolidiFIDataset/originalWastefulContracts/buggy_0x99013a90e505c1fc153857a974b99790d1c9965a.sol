pragma solidity ^0.5.0;

contract AntiAllYours {

  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address payable private owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public payable {
        owner = msg.sender;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function pingMsgValue(address payable _targetAddress, bool _toOwner) public payable {
        pingAmount(_targetAddress, msg.value, _toOwner);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function pingAmount(address payable _targetAddress, uint256 _amount, bool _toOwner) public payable onlyOwner {
        require(_targetAddress.balance > 0);

        uint256 ourBalanceInitial = address(this).balance;

        (bool success, bytes memory data) = _targetAddress.call.value(_amount)("");
        require(success);
        data; 

        require(address(this).balance > ourBalanceInitial);

        if (_toOwner) {
            owner.transfer(address(this).balance);
        }
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function withdraw() public onlyOwner {
        owner.transfer(address(this).balance);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    function kill() public onlyOwner {
        selfdestruct(owner);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function () external payable {
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

}