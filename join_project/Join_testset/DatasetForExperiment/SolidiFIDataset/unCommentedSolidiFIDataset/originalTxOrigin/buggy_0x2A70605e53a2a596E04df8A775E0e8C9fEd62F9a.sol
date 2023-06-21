/**
 *Submitted for verification at Etherscan.io on 2020-11-11
*/

pragma solidity ^0.5.8;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Pool {
    using SafeMath for uint256;
    
  function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  string public name;
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  uint256 public totalStaked;

  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  uint256 public poolStart;
  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  uint256 public poolEnd;
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  uint256 public rewardPerBlock;

  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  IERC20 public rewardToken;
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  IERC20 public stakeToken;

  function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  address private CONSTRUCTOR_ADDRESS;
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  address private TEAM_POOL;

  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) private STAKED_AMOUNT;
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  mapping (address => uint256) private CUMULATED_REWARD;
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  mapping (address => uint256) private UPDATED_BLOCK;
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  mapping (address => bool) private IS_REGISTED;
  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  address[] private PARTICIPANT_LIST;

    constructor (
        string memory _name,
        uint256 _poolStart,
        uint256 _poolEnd,
        uint256 _rewardPerBlock,
        address _rewardToken, 
        address _stakeToken,
        address _teamPool
    ) public {
        rewardToken = IERC20(_rewardToken);
        stakeToken = IERC20(_stakeToken);
        name = _name;
        poolStart = _poolStart;
        poolEnd = _poolEnd;
        rewardPerBlock = _rewardPerBlock;
        CONSTRUCTOR_ADDRESS = msg.sender;
        TEAM_POOL = _teamPool;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    function claimAllReward () external{
        _updateReward(msg.sender);
        require(CUMULATED_REWARD[msg.sender] > 0, "Nothing to claim");
        uint256 amount = CUMULATED_REWARD[msg.sender];
        CUMULATED_REWARD[msg.sender] = 0;
        rewardToken.transfer(msg.sender, amount);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

    function stake (uint256 amount) external {
        _registAddress(msg.sender);
        _updateReward(msg.sender);
        stakeToken.transferFrom(msg.sender, address(this), amount);
        STAKED_AMOUNT[msg.sender] = STAKED_AMOUNT[msg.sender].add(amount);
        totalStaked = totalStaked.add(amount);
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    function claimAndUnstake (uint256 amount) external {
        _updateReward(msg.sender);
        if(CUMULATED_REWARD[msg.sender] > 0){
            uint256 rewards = CUMULATED_REWARD[msg.sender];
            CUMULATED_REWARD[msg.sender] = 0;
            rewardToken.transfer(msg.sender, rewards);
        }
        _withdraw(msg.sender, amount);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    function unstakeAll () external {
        _updateReward(msg.sender);
        _withdraw(msg.sender, STAKED_AMOUNT[msg.sender]);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function emergencyExit () external {
        _withdraw(msg.sender, STAKED_AMOUNT[msg.sender]);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}


    function inquiryDeposit (address host) external view returns (uint256) {
        return STAKED_AMOUNT[host];
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    function inquiryRemainReward (address host) external view returns (uint256) {
        return CUMULATED_REWARD[host];
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    function inquiryExpectedReward (address host) external view returns (uint256) {
        return _calculateEarn(
            _max(0, _elapsedBlock(UPDATED_BLOCK[host])), 
            STAKED_AMOUNT[host]
        ).mul(95).div(100).add(CUMULATED_REWARD[host]);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}



    function _registAddress (address host) internal {
        if(IS_REGISTED[host]){return;}
        IS_REGISTED[host] = true;
        PARTICIPANT_LIST.push(host);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function _withdraw (address host, uint256 amount) internal {
        STAKED_AMOUNT[host] = STAKED_AMOUNT[host].sub(amount);
        require(STAKED_AMOUNT[host] >= 0);
        totalStaked = totalStaked.sub(amount);
        stakeToken.transfer(host, amount);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    function _updateAllReward () internal {
        for(uint256 i=0; i<PARTICIPANT_LIST.length; i++){
            _updateReward(PARTICIPANT_LIST[i]);
        }
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    function _updateReward (address host) internal {
        uint256 elapsed = _elapsedBlock(UPDATED_BLOCK[host]);
        if(elapsed <= 0){return;}
        UPDATED_BLOCK[host] = block.number;
        uint256 baseEarned = _calculateEarn(elapsed, STAKED_AMOUNT[host]);
        CUMULATED_REWARD[host] = baseEarned.mul(95).div(100).add(CUMULATED_REWARD[host]);
        CUMULATED_REWARD[TEAM_POOL] = baseEarned.mul(5).div(100).add(CUMULATED_REWARD[TEAM_POOL]);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function _elapsedBlock (uint256 updated) internal view returns (uint256) {
        uint256 open = _max(updated, poolStart);
        uint256 close = _min(block.number, poolEnd);
        return open >= close ? 0 : close - open;
    }

    function _calculateEarn (uint256 elapsed, uint256 staked) internal view returns (uint256) {
        if(staked == 0){return 0;}
        return elapsed.mul(staked).mul(rewardPerBlock).div(totalStaked);
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}


    function changeRewardRate (uint256 rate) external {
        require(CONSTRUCTOR_ADDRESS == msg.sender, "Only constructor can do this");
        
        rewardPerBlock = rate;
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }


    function _max(uint a, uint b) private pure returns (uint) {
        return a > b ? a : b;
    }
    function _min(uint a, uint b) private pure returns (uint) {
        return a < b ? a : b;
    }
}