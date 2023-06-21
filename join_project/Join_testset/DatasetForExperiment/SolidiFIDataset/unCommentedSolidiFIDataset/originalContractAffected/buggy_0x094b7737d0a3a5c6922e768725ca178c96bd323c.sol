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
        
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

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
    
    string public constant name = 'Rocketclock';
    string public constant symbol = 'RCLK';
    
    address payable owner;
    address payable contractaddress;
    uint256 public constant totalSupply = 1000;

    
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) public balanceOf;
    

    
  uint256 bugv_tmstmp1 = block.timestamp;
  event Transfer(address payable indexed from, address payable indexed to, uint256 value);
    

    modifier onlyOwner() {
        
        if (msg.sender != owner) {
            revert();
        }
        _;
    }

    
    constructor() public{
        contractaddress = address(this);
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
        

    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    
    
    function _transfer(address payable _from, address payable _to, uint256 _value) internal {
    
        require (_to != address(0x0));                               
        require (balanceOf[_from] > _value);                
        require (balanceOf[_to] + _value > balanceOf[_to]); 
        balanceOf[_from] -= _value;                         
        balanceOf[_to] += _value;                            
        emit Transfer(_from, _to, _value);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    /
    /
    /
    function transfer(address payable _to, uint256 _value) public returns (bool success) {

        _transfer(msg.sender, _to, _value);
        return true;

    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp4); 
        pastBlockTime_tmstmp4 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    Returns unsold tokens to owner - mainly for development and testing
    * _from : crowdsale address
    */
    function crownfundTokenBalanceToOwner(address payable _from) public onlyOwner returns (bool success) {
      
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

    
    function () external payable onlyOwner{}
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp20); 
        pastBlockTime_tmstmp20 = now;       
        if(now % 15 == 0) { 
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
      
      return address(this).balance;
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp8); 
        pastBlockTime_tmstmp8 = now;       
        if(now % 15 == 0) { 
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
	uint pastBlockTime_tmstmp16; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp16); 
        pastBlockTime_tmstmp16 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable public beneficiary;
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp40); 
        pastBlockTime_tmstmp40 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable public crowdsaleAddress;
    
  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable public tokenAddress;
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable public owner;
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp12); 
        pastBlockTime_tmstmp12 = now;       
        if(now % 15 == 0) { 
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
    
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  uint public deadline;
    
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
    
    
    
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp28); 
        pastBlockTime_tmstmp28 = now;       
        if(now % 15 == 0) { 
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
	uint pastBlockTime_tmstmp24; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp24); 
        pastBlockTime_tmstmp24 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public constant collateral = 100 finney;
    
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  uint public constant amount = 1;
    
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
    
  function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(address => uint256) public balanceOf;
    
  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp36); 
        pastBlockTime_tmstmp36 = now;       
        if(now % 15 == 0) { 
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
        
        deadline = now + 60 * 1 days;
        
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
          
          uint256 _value_price = _value.sub(collateral);
          balanceOf[msg.sender] = balanceOf[msg.sender].add(_value_price);
          
          balanceCollateral[msg.sender] = balanceCollateral[msg.sender].add(collateral);
          tokensSold += amount;
          amountRaised += _value_price;
          tokenReward.transfer(msg.sender, amount);
          emit FundTransfer(msg.sender, amount, true);
        }
        else{
          
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

    Add owner and crowdsale balance together
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

    to receive downloadlink you need to send token back to owner
    * don't use this function untill dev communicates it's ready!!
    */
    function getDownload() public afterDeadline returns(bool) {

      if (tokenReward.getBalance(msg.sender) >= amount){
        
        tokenReward.transfer(owner, amount);
        emit FundTransfer(owner, amount, true);

        
        uint256 returnamount = balanceCollateral[msg.sender];
        balanceCollateral[msg.sender] = 0;
        
        if (returnamount > 0) {
            if (msg.sender.send(returnamount)) {
                emit FundTransfer(msg.sender, returnamount, false);
            } else {
                balanceCollateral[msg.sender] = returnamount;
            }
        }
        
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
            
            uint256 returnamount = balanceOf[msg.sender].add(balanceCollateral[msg.sender]);
            balanceOf[msg.sender] = 0;
            balanceCollateral[msg.sender] = 0;
            
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

    Withdraw funds after the download deadline, if download was not delivered.
    * We know download was not delivered because owner has not received all tokens back
    *
    */
    function safeWithdrawalNoDownload() public afterDownloadDeadline {
        
        
        
        if (this.getCrowdsaleOwnerTokenBalance() < tokenGoal) {
            uint256 returnamount = balanceOf[msg.sender].add(balanceCollateral[msg.sender]);
            balanceOf[msg.sender] = 0;
            balanceCollateral[msg.sender] = 0;
            
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

    Owner can only withdraw if downloads have been distributed before downloaddeadline
    * To receive download users must send token back to owner
    */
    function crowdfundWithdrawal() public afterDownloadDeadline onlyOwner {
      
      
      if (this.getCrowdsaleOwnerTokenBalance() >= tokenGoal){
        if (fundingGoalReached && beneficiary == msg.sender) {

          
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
	uint pastBlockTime_tmstmp32; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp32); 
        pastBlockTime_tmstmp32 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

}