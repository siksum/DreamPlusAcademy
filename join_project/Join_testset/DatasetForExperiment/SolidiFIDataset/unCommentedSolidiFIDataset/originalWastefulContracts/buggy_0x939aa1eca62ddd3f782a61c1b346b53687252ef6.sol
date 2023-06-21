pragma solidity ^0.5.0;

/**
 * Syndicate
 *
 * A way to distribute ownership of ether in time
 **/

contract Syndicate {

function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balances;

  struct Payment {
    address sender;
    address payable receiver;
    uint256 timestamp;
    uint256 time;
    uint256 weiValue;
    uint256 weiPaid;
    bool isFork;
    uint256 parentIndex;
    bool isForked;
    uint256 fork1Index;
    uint256 fork2Index;
  }

function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  Payment[] public payments;

function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event PaymentUpdated(uint256 index);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event PaymentCreated(uint256 index);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event BalanceUpdated(address payable target);

  /**
   * Deposit to a given address over a certain amount of time.
   **/
  function deposit(address payable _receiver, uint256 _time) external payable {
    balances[msg.sender] += msg.value;
    emit BalanceUpdated(msg.sender);
    pay(_receiver, msg.value, _time);
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Pay from sender to receiver a certain amount over a certain amount of time.
   **/
  function pay(address payable _receiver, uint256 _weiValue, uint256 _time) public {
    
    require(_weiValue <= balances[msg.sender] && _weiValue > 0);
    
    require(_time > 0);
    payments.push(Payment({
      sender: msg.sender,
      receiver: _receiver,
      timestamp: block.timestamp,
      time: _time,
      weiValue: _weiValue,
      weiPaid: 0,
      isFork: false,
      parentIndex: 0,
      isForked: false,
      fork1Index: 0,
      fork2Index: 0
    }));
    
    balances[msg.sender] -= _weiValue;
    emit BalanceUpdated(msg.sender);
    emit PaymentCreated(payments.length - 1);
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Settle an individual payment at the current point in time.
   *
   * Can be called idempotently.
   **/
  function paymentSettle(uint256 index) public {
    uint256 owedWei = paymentWeiOwed(index);
    balances[payments[index].receiver] += owedWei;
    emit BalanceUpdated(payments[index].receiver);
    payments[index].weiPaid += owedWei;
    emit PaymentUpdated(index);
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Return the wei owed on a payment at the current block timestamp.
   **/
  function paymentWeiOwed(uint256 index) public view returns (uint256) {
    requirePaymentIndexInRange(index);
    Payment memory payment = payments[index];
    
    return max(payment.weiPaid, payment.weiValue * min(block.timestamp - payment.timestamp, payment.time) / payment.time) - payment.weiPaid;
  }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Forks a payment to another address for the duration of a payment. Allows
   * responsibility of funds to be delegated to other addresses by payment
   * recipient.
   *
   * Payment completion time is unaffected by forking, the only thing that
   * changes is recipient(s).
   *
   * Payments can be forked until weiValue is 0, at which point the Payment is
   * settled. Child payments can also be forked.
   *
   * The genealogy of a payment can be represented as a binary tree.
   **/
  function paymentFork(uint256 index, address payable _receiver, uint256 _weiValue) public {
    Payment memory payment = payments[index];
    
    require(msg.sender == payment.receiver);

    uint256 remainingWei = payment.weiValue - payment.weiPaid;
    uint256 remainingTime = max(0, payment.time - (block.timestamp - payment.timestamp));

    
    require(remainingWei > _weiValue);
    require(_weiValue > 0);

    
    
    payments[index].weiValue = payments[index].weiPaid;
    emit PaymentUpdated(index);

    payments.push(Payment({
      sender: msg.sender,
      receiver: _receiver,
      timestamp: block.timestamp,
      time: remainingTime,
      weiValue: _weiValue,
      weiPaid: 0,
      isFork: true,
      parentIndex: index,
      isForked: false,
      fork1Index: 0,
      fork2Index: 0
    }));
    payments[index].fork1Index = payments.length - 1;
    emit PaymentCreated(payments.length - 1);

    payments.push(Payment({
      sender: payment.receiver,
      receiver: payment.receiver,
      timestamp: block.timestamp,
      time: remainingTime,
      weiValue: remainingWei - _weiValue,
      weiPaid: 0,
      isFork: true,
      parentIndex: index,
      isForked: false,
      fork1Index: 0,
      fork2Index: 0
    }));
    payments[index].fork2Index = payments.length - 1;
    emit PaymentCreated(payments.length - 1);

    payments[index].isForked = true;
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Accessor for determining if a given payment is fully settled.
   **/
  function isPaymentSettled(uint256 index) public view returns (bool) {
    requirePaymentIndexInRange(index);
    return payments[index].weiValue == payments[index].weiPaid;
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Reverts if the supplied payment index is out of range.
   **/
  function requirePaymentIndexInRange(uint256 index) public view {
    require(index < payments.length);
  }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Withdraw target address balance from Syndicate to ether.
   **/
  function withdraw(address payable target, uint256 weiValue) public {
    require(balances[target] >= weiValue);
    balances[target] -= weiValue;
    emit BalanceUpdated(target);
    target.transfer(weiValue);
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * One argument, target address.
   **/
  function withdraw(address payable target) public {
    withdraw(target, balances[target]);
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * No arguments, withdraws full balance to sender from sender balance.
   **/
  function withdraw() public {
    withdraw(msg.sender, balances[msg.sender]);
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Accessor for array length.
   **/
  function paymentCount() public view returns (uint) {
    return payments.length;
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Return the smaller of two values.
   **/
  function min(uint a, uint b) private pure returns (uint) {
    return a < b ? a : b;
  }

  /**
   * Return the larger of two values.
   **/
  function max(uint a, uint b) private pure returns (uint) {
    return a > b ? a : b;
  }
}