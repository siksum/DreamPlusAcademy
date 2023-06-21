/**
 *Submitted for verification at Etherscan.io on 2020-07-30
*/

pragma solidity ^0.5.16;

interface ISynthetix {
    function exchangeOnBehalf(address, bytes32, uint, bytes32) external returns (uint);
}

contract Implementation {

  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  bool initialized;
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  ISynthetix synthetix;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public latestID;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping (uint256 => LimitOrder) public orders;

    struct LimitOrder {
        address payable submitter;
        bytes32 sourceCurrencyKey;
        uint256 sourceAmount;
        bytes32 destinationCurrencyKey;
        uint256 minDestinationAmount;
        uint256 weiDeposit;
        uint256 executionFee;
    }

    function initialize(address synthetixAddress) public {
        require(initialized == false, "Already initialized");
        initialized = true;
        synthetix = ISynthetix(synthetixAddress);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function newOrder(bytes32 sourceCurrencyKey, uint sourceAmount, bytes32 destinationCurrencyKey, uint minDestinationAmount, uint executionFee) payable public returns (uint) {
        require(msg.value > executionFee, "wei deposit must be larger than executionFee");
        latestID++;
        orders[latestID] = LimitOrder(
            msg.sender,
            sourceCurrencyKey,
            sourceAmount,
            destinationCurrencyKey,
            minDestinationAmount,
            msg.value,
            executionFee
        );
        emit Order(latestID, msg.sender, sourceCurrencyKey, sourceAmount, destinationCurrencyKey, minDestinationAmount, executionFee, msg.value);
        return latestID;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function cancelOrder(uint orderID) public {
        require(orderID <= latestID, "Order does not exist");
        LimitOrder storage order = orders[orderID];
        require(order.submitter == msg.sender, "Order already executed or cancelled");
        msg.sender.transfer(order.weiDeposit);
        delete orders[orderID];
        emit Cancel(orderID);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function executeOrder(uint orderID) public {
        uint gasUsed = gasleft();
        require(orderID <= latestID, "Order does not exist");
        LimitOrder storage order = orders[orderID];
        require(order.submitter != address(0), "Order already executed or cancelled");
        uint destinationAmount = synthetix.exchangeOnBehalf(order.submitter, order.sourceCurrencyKey, order.sourceAmount, order.destinationCurrencyKey);
        require(destinationAmount >= order.minDestinationAmount, "target price not reached");
        emit Execute(orderID, order.submitter, msg.sender);
        gasUsed -= gasleft();
        uint refund = ((gasUsed + 32231) * tx.gasprice) + order.executionFee; // magic number generated using tests
        require(order.weiDeposit >= refund, "Insufficient weiDeposit");
        order.submitter.transfer(order.weiDeposit - refund);
        delete orders[orderID];
        msg.sender.transfer(refund);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Order(uint indexed orderID, address indexed submitter, bytes32 sourceCurrencyKey, uint sourceAmount, bytes32 destinationCurrencyKey, uint minDestinationAmount, uint executionFee, uint weiDeposit);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Cancel(uint indexed orderID);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Execute(uint indexed orderID, address indexed submitter, address executer);

}