/**
 *Submitted for verification at Etherscan.io on 2019-12-16
*/

pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract CrowdsaleToken {
    /* Public variables of the token */
    string public constant name = 'Rocketclock';
    string public constant symbol = 'RCLK';
    //uint256 public constant decimals = 6;
    address payable owner;
    address payable contractaddress;
    uint256 public constant totalSupply = 1000;

    /* This creates an array with all balances */
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) public balanceOf;
    //mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
  uint256 bugv_tmstmp1 = block.timestamp;
  event Transfer(address payable indexed from, address payable indexed to, uint256 value);
    //event LogWithdrawal(address receiver, uint amount);

    modifier onlyOwner() {
        // Only owner is allowed to do this action.
        if (msg.sender != owner) {
            revert();
        }
        _;
    }

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor() public{
        contractaddress = address(this);
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
        //balanceOf[contractaddress] = totalSupply;

    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    /*ERC20*/
    /* Internal transfer, only can be called by this contract */
    function _transfer(address payable _from, address payable _to, uint256 _value) internal {
    //function _transfer(address _from, address _to, uint _value) public {
        require (_to != address(0x0));                               // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] > _value);                // Check if the sender has enough
        require (balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
        balanceOf[_from] -= _value;                         // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    /// @notice Send `_value` tokens to `_to` from your account
    /// @param _to The address of the recipient
    /// @param _value the amount to send
    function transfer(address payable _to, uint256 _value) public returns (bool success) {

        _transfer(msg.sender, _to, _value);
        return true;

    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    /*
    * Returns unsold tokens to owner - mainly for development and testing
    * _from : crowdsale address
    */
    function crownfundTokenBalanceToOwner(address payable _from) public onlyOwner returns (bool success) {
      // owner can not move tokens from participants
      CrowdSale c = CrowdSale(_from);
      address crowdsaleOwner = c.getOwner();
      if (crowdsaleOwner == owner ) {
        uint256 _value = balanceOf[_from];
        balanceOf[_from] = 0;
        balanceOf[owner] += _value;
        emit Transfer(_from, owner, _value);
        return true;
      }
      else{
        return false;
      }

    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /*fallback function*/
    function () external payable onlyOwner{}
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function getBalance(address addr) public view returns(uint256) {
      return balanceOf[addr];
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

    function getEtherBalance() public view returns(uint256) {
      //return contract ether balance;
      return address(this).balance;
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function getOwner() public view returns(address) {
      return owner;
    }

}

contract CrowdSale {
    using SafeMath for uint256;

  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable public beneficiary;
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable public crowdsaleAddress;
    //debugging
  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable public tokenAddress;
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable public owner;
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public fundingGoal;
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint public amountRaised;
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  uint public tokensSold;
    //crowdsaledeadline
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  uint public deadline;
    //download Deadline
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  uint public downloaddeadline;
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  uint public initiation;
    //uint public price;
    //0.25 eth = 250 finney
    // total price is 150 price + 100 collateral that participants get back when calling download function
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public constant totalprice = 250 finney;
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  uint256 public constant price = 150 finney;
  function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public constant collateral = 100 finney;
    // amount of tokens participants receive
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  uint public constant amount = 1;
    // the amount of tokens owner must have before he can withdraw crowdfund
  address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
  uint public constant tokenGoal = 990;

  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  CrowdsaleToken public tokenReward;
    //ether balance
  function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(address => uint256) public balanceOf;
    // to give participants an incentive to claim their tokens for download
  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(address => uint256) public balanceCollateral;
  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  bool public fundingGoalReached = false;
  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  bool public crowdsaleClosed = false;

  uint256 bugv_tmstmp4 = block.timestamp;
  event GoalReached(address beneficiary, uint amountRaised);
  uint256 bugv_tmstmp3 = block.timestamp;
  event FundTransfer(address backer, uint amount, bool isContribution);

    modifier onlyOwner() {
        // Only owner is allowed to do this action.
        if (msg.sender != owner) {
            revert();
        }
        _;
    }

    /**
     * Constructor function
     *
     * Setup the owner
     */
    constructor(
        address payable ifSuccessfulSendTo,
        address payable addressOfTokenUsedAsReward
    )public {
        beneficiary = ifSuccessfulSendTo;
        fundingGoal = 75 * 1 ether;
        //crowdfund deadline
        deadline = now + 60 * 1 days;
        //download deadline
        downloaddeadline = now + 120 * 1 days;
        initiation = now;
        crowdsaleAddress = address(this);
        tokenAddress = addressOfTokenUsedAsReward;
        tokenReward = CrowdsaleToken(addressOfTokenUsedAsReward);
        owner = msg.sender;
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

    /**
     * Fallback function
     *
     * The function without name is the default function that is called whenever anyone sends funds to a contract
     */

    function () external payable {

      require(!crowdsaleClosed);
      if (now <= deadline){

        uint256 _value = msg.value;
        if(_value >= totalprice){
          //add amount of eth sent minus collateral
          uint256 _value_price = _value.sub(collateral);
          balanceOf[msg.sender] = balanceOf[msg.sender].add(_value_price);
          //add collateral to collateral balance
          balanceCollateral[msg.sender] = balanceCollateral[msg.sender].add(collateral);
          tokensSold += amount;
          amountRaised += _value_price;
          tokenReward.transfer(msg.sender, amount);
          emit FundTransfer(msg.sender, amount, true);
        }
        else{
          //donation
          amountRaised += msg.value;
        }
      }
      else{
        revert();
      }

    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    modifier afterDeadline() { if (now >= deadline) _; }
    modifier afterDownloadDeadline() { if (now >= downloaddeadline) _; }
uint256 bugv_tmstmp2 = block.timestamp;
    modifier goalReached() { if (amountRaised >= fundingGoal) _; }
uint256 bugv_tmstmp5 = block.timestamp;

    /**
     * Check if goal was reached
     *
     * Checks if the goal or time limit has been reached and ends the campaign
     */
    function checkGoalReached() public afterDeadline returns(bool) {
        if (amountRaised >= fundingGoal){
            fundingGoalReached = true;
            emit GoalReached(beneficiary, amountRaised);
        }
        crowdsaleClosed = true;
        return crowdsaleClosed;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    /*
    * Add owner and crowdsale balance together
    *
    */
    function getCrowdsaleOwnerTokenBalance() view public returns (uint256){

      uint256 ownertokenbalance = tokenReward.getBalance(owner);
      uint256 crowdsaletokenbalance = tokenReward.getBalance(crowdsaleAddress);
      uint256 total = ownertokenbalance.add(crowdsaletokenbalance);
      return total;
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /*
    * to receive downloadlink you need to send token back to owner
    * don't use this function untill dev communicates it's ready!!
    */
    function getDownload() public afterDeadline returns(bool) {

      if (tokenReward.getBalance(msg.sender) >= amount){
        // tokens are returned to owner
        tokenReward.transfer(owner, amount);
        emit FundTransfer(owner, amount, true);

        // collateral is returned to participant
        uint256 returnamount = balanceCollateral[msg.sender];
        balanceCollateral[msg.sender] = 0;
        // refunds
        if (returnamount > 0) {
            if (msg.sender.send(returnamount)) {
                emit FundTransfer(msg.sender, returnamount, false);
            } else {
                balanceCollateral[msg.sender] = returnamount;
            }
        }
        // check javascript function that handles download distribution
        return true;
      }
      else{
        return false;
      }

    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    /**
     * Withdraw the funds
     *
     * Checks to see if goal or time limit has been reached, and if so, and the funding goal was not reached, each contributor can withdraw
     * the amount they contributed.
     */
    function safeWithdrawal() public afterDeadline {
        if (!fundingGoalReached) {
            //return balance + collateral
            uint256 returnamount = balanceOf[msg.sender].add(balanceCollateral[msg.sender]);
            balanceOf[msg.sender] = 0;
            balanceCollateral[msg.sender] = 0;
            // refunds
            if (returnamount >= totalprice) {
                if (msg.sender.send(returnamount)) {
                    emit FundTransfer(msg.sender, returnamount, false);
                } else {
                    balanceOf[msg.sender] = returnamount;
                }
            }
        }

    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /*
    * Withdraw funds after the download deadline, if download was not delivered.
    * We know download was not delivered because owner has not received all tokens back
    *
    */
    function safeWithdrawalNoDownload() public afterDownloadDeadline {
        /* people need to send coins back to owner to get a download link */
        /* if balance of owner is not close to 1000 ( > 990), users have voted against */
        // must be tokenbalance
        if (this.getCrowdsaleOwnerTokenBalance() < tokenGoal) {
            uint256 returnamount = balanceOf[msg.sender].add(balanceCollateral[msg.sender]);
            balanceOf[msg.sender] = 0;
            balanceCollateral[msg.sender] = 0;
            // refunds
            if (returnamount >= totalprice) {
                if (msg.sender.send(returnamount)) {
                    emit FundTransfer(msg.sender, returnamount, false);
                } else {
                    balanceOf[msg.sender] = returnamount;
                }
            }
        }

    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    /*
    * Owner can only withdraw if downloads have been distributed before downloaddeadline
    * To receive download users must send token back to owner
    */
    function crowdfundWithdrawal() public afterDownloadDeadline onlyOwner {
      // only if almost everyone has returned their token to owner will owner be able to withdraw crowdfund
      // getCrowdsaleOwnerTokenBalance() adds balance of crowdfund and owner together
      if (this.getCrowdsaleOwnerTokenBalance() >= tokenGoal){
        if (fundingGoalReached && beneficiary == msg.sender) {

          //users need to send their token back to owner to download
          if (beneficiary.send(amountRaised)) {
              emit FundTransfer(beneficiary, amountRaised, false);
          }

        }
      }

    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

    /* in case goal is reached early, close crowdsale deadline */
    function closeDeadline() public goalReached onlyOwner {
      deadline = now;
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function getcrowdsaleClosed() public view returns(bool) {
      return crowdsaleClosed;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

    function getfundingGoalReached() public view returns(bool) {
      return fundingGoalReached;
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

    function getOwner() public view returns(address) {
      return owner;
    }

    function getbalanceOf(address _from) public view returns(uint256) {
      return balanceOf[_from];
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

}