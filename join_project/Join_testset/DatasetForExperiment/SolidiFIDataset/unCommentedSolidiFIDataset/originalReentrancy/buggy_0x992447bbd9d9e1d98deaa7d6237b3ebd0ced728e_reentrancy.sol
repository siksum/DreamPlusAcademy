pragma solidity ^0.5.0;

/**
 * Syndicate
 *
 * A way to distribute ownership of ether in time
 **/

contract Syndicate {

mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
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
  }

mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  Payment[] public payments;

  
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
  mapping (uint256 => uint256[2]) public forkIndexes;

uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  event PaymentUpdated(uint256 index);
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  event PaymentCreated(uint256 index);
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  event BalanceUpdated(address payable target);

  /**
   * Deposit to a given address over a certain amount of time.
   **/
  function deposit(address payable _receiver, uint256 _time) external payable {
    balances[msg.sender] += msg.value;
    emit BalanceUpdated(msg.sender);
    pay(_receiver, msg.value, _time);
  }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

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
      parentIndex: 0
    }));
    
    balances[msg.sender] -= _weiValue;
    emit BalanceUpdated(msg.sender);
    emit PaymentCreated(payments.length - 1);
  }
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   
        redeemableEther_re_ent18[msg.sender] = 0;
    }

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
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

  /**
   * Return the wei owed on a payment at the current block timestamp.
   **/
  function paymentWeiOwed(uint256 index) public view returns (uint256) {
    assertPaymentIndexInRange(index);
    Payment memory payment = payments[index];
    
    return max(payment.weiPaid, payment.weiValue * min(block.timestamp - payment.timestamp, payment.time) / payment.time) - payment.weiPaid;
  }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

  /**
   * Forks a payment to another address for the duration of a payment. Allows
   * responsibility of funds to be delegated to other addresses by payment
   * recipient.
   *
   * Payment completion time is unaffected by forking, the only thing that
   * changes is recipient.
   *
   * Payments can be forked until weiValue is 0, at which point the Payment is
   * settled. Child payments can also be forked.
   **/
  function paymentFork(uint256 index, address payable _receiver, uint256 _weiValue) public {
    Payment memory payment = payments[index];
    
    require(msg.sender == payment.receiver);

    uint256 remainingWei = payment.weiValue - payment.weiPaid;
    uint256 remainingTime = max(0, payment.time - (block.timestamp - payment.timestamp));

    
    require(remainingWei >= _weiValue);
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
      parentIndex: index
    }));
    forkIndexes[index][0] = payments.length - 1;
    emit PaymentCreated(payments.length - 1);

    payments.push(Payment({
      sender: payment.receiver,
      receiver: payment.receiver,
      timestamp: block.timestamp,
      time: remainingTime,
      weiValue: remainingWei - _weiValue,
      weiPaid: 0,
      isFork: true,
      parentIndex: index
    }));
    forkIndexes[index][1] = payments.length - 1;
    emit PaymentCreated(payments.length - 1);
  }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }

  function paymentForkIndexes(uint256 index) public view returns (uint256[2] memory) {
    assertPaymentIndexInRange(index);
    return forkIndexes[index];
  }
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

  function isPaymentForked(uint256 index) public view returns (bool) {
    assertPaymentIndexInRange(index);
    return forkIndexes[index][0] != 0 && forkIndexes[index][1] != 0;
  }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   
        redeemableEther_re_ent25[msg.sender] = 0;
    }

  /**
   * Accessor for determining if a given payment is fully settled.
   **/
  function isPaymentSettled(uint256 index) public view returns (bool) {
    assertPaymentIndexInRange(index);
    Payment memory payment = payments[index];
    return payment.weiValue == payment.weiPaid;
  }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

  /**
   * Reverts if the supplied payment index is out of range
   **/
  function assertPaymentIndexInRange(uint256 index) public view {
    require(index < payments.length);
  }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }

  /**
   * Withdraw target address balance from Syndicate to ether.
   **/
  function withdraw(address payable target, uint256 weiValue) public {
    require(balances[target] >= weiValue);
    target.call.value(1)("");	
balances[target] -= weiValue;
    emit BalanceUpdated(target);
    target.transfer(weiValue);
  }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }

  /**
   * One argument, target address.
   **/
  function withdraw(address payable target) public {
    withdraw(target, balances[target]);
  }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   
        redeemableEther_re_ent39[msg.sender] = 0;
    }

  /**
   * No arguments, withdraws full balance to sender from sender balance.
   **/
  function withdraw() public {
    withdraw(msg.sender, balances[msg.sender]);
  }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }

  /**
   * Accessor for array length
   **/
  function paymentCount() public view returns (uint) {
    return payments.length;
  }
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }

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