pragma solidity ^0.5.8;


library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
}


interface IERC20 {
  function balanceOf(address owner) external view returns (uint256 balance);
  function transfer(address to, uint256 value) external returns (bool success);
  function transferFrom(address from, address to, uint256 value) external returns (bool success);
  function approve(address spender, uint256 value) external returns (bool success);
  function allowance(address owner, address spender) external view returns (uint256 remaining);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


/
/
contract ERC20 is IERC20 {
  using SafeMath for uint256;

  string public constant name = "CAPZ";
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "CAPZ";
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public constant decimals = 18;

  /
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) internal balances;
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) internal allowed;

  /
  /
  /
  function balanceOf(address owner) external view returns (uint256) {
    return balances[owner];
  }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  function transfer(address to, uint256 value) external returns (bool) {
    _transfer(msg.sender, to, value);
    return true;
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  /
  function transferFrom(address from, address to, uint256 value) external returns (bool) {
    _transfer(from, to, value);
    _approve(from, msg.sender, allowed[from][msg.sender].sub(value));
    return true;
  }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  /
  /
  function approve(address spender, uint256 value) external returns (bool) {
    _approve(msg.sender, spender, value);
    return true;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  function allowance(address owner, address spender) external view returns (uint256) {
    return allowed[owner][spender];
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  function _transfer(address from, address to, uint256 value) internal {
    require(address(this) != to);
    require(address(0) != to);

    balances[from] = balances[from].sub(value);
    balances[to] = balances[to].add(value);

    emit Transfer(from, to, value);
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  function _approve(address owner, address spender, uint256 value) internal {
    require(address(0) != owner);
    require(address(0) != spender);

    allowed[owner][spender] = value;

    emit Approval(owner, spender, value);
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  function _mint(address account, uint256 value) internal {
    require(address(0) != account);

    totalSupply = totalSupply.add(value);
    balances[account] = balances[account].add(value);

    emit Transfer(address(0), account, value);
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
}


/
/
/
/
/
/
/
/
contract CAPZ is ERC20 {
  using SafeMath for uint256;

  /
  /
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  address internal owner;

  /
  /
  /
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public balanceInWei;

  /
  /
  /
  /
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public goalLimitMinInWei;

  /
  /
  /
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public goalLimitMaxInWei;

  /
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public endOn;

  /
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public startOn;

  /
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) internal refunds;

  /
  enum ICOStatus {
    /
    NotOpen,
    /
    /
    Open,
    /
    /
    /
    /
    GoalReached,
    /
    /
    GoalNotReached
  }

  constructor (uint256 _startOn, uint256 _endOn, uint256 _goalLimitMinInWei, uint256 _goalLimitMaxInWei) public {
    require(_startOn < _endOn);
    require(_goalLimitMinInWei < _goalLimitMaxInWei);

    owner = msg.sender;
    endOn = _endOn;
    startOn = _startOn;
    goalLimitMaxInWei = _goalLimitMaxInWei;
    goalLimitMinInWei = _goalLimitMinInWei;
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  function () external payable {
    require(0 == msg.data.length);

    buyTokens();
  }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  /
  /
  /
  /
  function buyTokens() public whenOpen payable {
    uint256 receivedAmount = msg.value;
    address beneficiary = msg.sender;
    uint256 newBalance = balanceInWei.add(receivedAmount);
    uint256 newRefundBalance = refunds[beneficiary].add(receivedAmount);

    _mint(beneficiary, receivedAmount);
    refunds[beneficiary] = newRefundBalance;
    balanceInWei = newBalance;
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  function escrowRefund() external whenGoalNotReached {
    uint256 amount = refunds[msg.sender];

    require(address(0) != msg.sender);
    require(0 < amount);

    refunds[msg.sender] = 0;
    msg.sender.transfer(amount);
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  function escrowWithdraw() external onlyOwner whenGoalReached {
    uint256 amount = address(this).balance;

    require(address(0) != msg.sender);
    require(0 < amount);

    msg.sender.transfer(amount);
  }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  /
  function escrowClaim(uint256 amount) external whenGoalReached {
    _transfer(msg.sender, owner, amount);
    emit Claim(msg.sender, amount);
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  /
  /
  function alterGoal(uint256 _goalLimitMinInWei, uint256 _goalLimitMaxInWei) external onlyOwner {
    ICOStatus status = status(block.timestamp);

    require(ICOStatus.GoalReached != status);
    require(ICOStatus.GoalNotReached != status);
    require(_goalLimitMinInWei < _goalLimitMaxInWei);

    goalLimitMinInWei = _goalLimitMinInWei;
    goalLimitMaxInWei = _goalLimitMaxInWei;

    emit GoalChange(_goalLimitMinInWei, _goalLimitMaxInWei);
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  /
  function transferOwnership(address newOwner) external onlyOwner {
    require(address(0) != newOwner);
    require(address(this) != newOwner);

    owner = newOwner;
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  /
  /
  function status() external view returns (ICOStatus) {
    return status(block.timestamp);
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
  function status(uint256 timestamp) internal view returns (ICOStatus) {
    if (timestamp < startOn) {
      return ICOStatus.NotOpen;
    } else if (timestamp < endOn && balanceInWei < goalLimitMaxInWei) {
      return ICOStatus.Open;
    } else if (balanceInWei >= goalLimitMinInWei) {
      return ICOStatus.GoalReached;
    } else {
      return ICOStatus.GoalNotReached;
    }
  }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

  /
  /
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event GoalChange(uint256 goalLimitMinInWei, uint256 goalLimitMaxInWei);

  /
  /
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Claim(address beneficiary, uint256 value);

  modifier onlyOwner() {
    require(owner == msg.sender);
    _;
  }

  modifier whenOpen() {
    require(ICOStatus.Open == status(block.timestamp));
    _;
  }

  modifier whenGoalReached() {
    require(ICOStatus.GoalReached == status(block.timestamp));
    _;
  }

  modifier whenGoalNotReached() {
    require(ICOStatus.GoalNotReached == status(block.timestamp));
    _;
  }
}