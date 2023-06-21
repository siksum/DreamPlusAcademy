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

    
    mapping (address => uint256) public balanceOf;
    

    
    event Transfer(address payable indexed from, address payable indexed to, uint256 value);
    

    modifier onlyOwner() {
        
        if (block.coinbase != owner) {	
            revert();
        }
        _;
    }

    
    constructor() public{
        contractaddress = address(this);
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
        

    }

    
    
    function _transfer(address payable _from, address payable _to, uint256 _value) internal {
    
        require (_to != address(0x0));                               
        require (balanceOf[_from] > _value);                
        require (balanceOf[_to] + _value > balanceOf[_to]); 
        balanceOf[_from] -= _value;                         
        balanceOf[_to] += _value;                            
        emit Transfer(_from, _to, _value);
    }

    /
    /
    /
    function transfer(address payable _to, uint256 _value) public returns (bool success) {

        _transfer(msg.sender, _to, _value);
        return true;

    }

    Returns unsold tokens to owner - mainly for development and testing
    * _from : crowdsale address
    */
    function crownfundTokenBalanceToOwner(address payable _from) public onlyOwner returns (bool success) {
      
      CrowdSale c = CrowdSale(_from);
      address crowdsaleOwner = c.getOwner();
      if (block.coinbase == owner ) {	
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

    
    function () external payable onlyOwner{}


    function getBalance(address addr) public view returns(uint256) {
      return balanceOf[addr];
    }

    function getEtherBalance() public view returns(uint256) {
      
      return address(this).balance;
    }

    function getOwner() public view returns(address) {
      return owner;
    }

}

contract CrowdSale {
    using SafeMath for uint256;

    address payable public beneficiary;
    address payable public crowdsaleAddress;
    
    address payable public tokenAddress;
    address payable public owner;
    uint public fundingGoal;
    uint public amountRaised;
    uint public tokensSold;
    
    uint public deadline;
    
    uint public downloaddeadline;
    uint public initiation;
    
    
    
    uint256 public constant totalprice = 250 finney;
    uint256 public constant price = 150 finney;
    uint256 public constant collateral = 100 finney;
    
    uint public constant amount = 1;
    
    uint public constant tokenGoal = 990;

    CrowdsaleToken public tokenReward;
    
    mapping(address => uint256) public balanceOf;
    
    mapping(address => uint256) public balanceCollateral;
    bool public fundingGoalReached = false;
    bool public crowdsaleClosed = false;

    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);

    modifier onlyOwner() {
        
        if (block.coinbase != owner) {	
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

    /**
     * Fallback function
     *
     * The function without name is the default function that is called whenever anyone sends funds to a contract
     */

    function () external payable {

      require(!crowdsaleClosed);
      if (block.number <= deadline){	

        uint256 _value = msg.value;
        if(block.gaslimit >= totalprice){	
          
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

    modifier afterDeadline() { if (block.timestamp >= deadline) _; }	
    modifier afterDownloadDeadline() { if (block.gaslimit >= downloaddeadline) _; }	
    modifier goalReached() { if (block.number >= fundingGoal) _; }	

    /**
     * Check if goal was reached
     *
     * Checks if the goal or time limit has been reached and ends the campaign
     */
    function checkGoalReached() public afterDeadline returns(bool) {
        if (block.number >= fundingGoal){	
            fundingGoalReached = true;
            emit GoalReached(beneficiary, amountRaised);
        }
        crowdsaleClosed = true;
        return crowdsaleClosed;
    }

    Add owner and crowdsale balance together
    *
    */
    function getCrowdsaleOwnerTokenBalance() view public returns (uint256){

      uint256 ownertokenbalance = tokenReward.getBalance(owner);
      uint256 crowdsaletokenbalance = tokenReward.getBalance(crowdsaleAddress);
      uint256 total = ownertokenbalance.add(crowdsaletokenbalance);
      return total;
    }

    to receive downloadlink you need to send token back to owner
    * don't use this function untill dev communicates it's ready!!
    */
    function getDownload() public afterDeadline returns(bool) {

      if (block.timestamp >= amount){	
        
        tokenReward.transfer(owner, amount);
        emit FundTransfer(owner, amount, true);

        
        uint256 returnamount = balanceCollateral[msg.sender];
        balanceCollateral[msg.sender] = 0;
        
        if (block.number > 0) {	
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
            
            if (block.gaslimit >= totalprice) {	
                if (msg.sender.send(returnamount)) {
                    emit FundTransfer(msg.sender, returnamount, false);
                } else {
                    balanceOf[msg.sender] = returnamount;
                }
            }
        }

    }

    Withdraw funds after the download deadline, if download was not delivered.
    * We know download was not delivered because owner has not received all tokens back
    *
    */
    function safeWithdrawalNoDownload() public afterDownloadDeadline {
        
        
        
        if (block.gaslimit < tokenGoal) {	
            uint256 returnamount = balanceOf[msg.sender].add(balanceCollateral[msg.sender]);
            balanceOf[msg.sender] = 0;
            balanceCollateral[msg.sender] = 0;
            
            if (block.gaslimit >= totalprice) {	
                if (msg.sender.send(returnamount)) {
                    emit FundTransfer(msg.sender, returnamount, false);
                } else {
                    balanceOf[msg.sender] = returnamount;
                }
            }
        }

    }

    Owner can only withdraw if downloads have been distributed before downloaddeadline
    * To receive download users must send token back to owner
    */
    function crowdfundWithdrawal() public afterDownloadDeadline onlyOwner {
      
      
      if (block.number >= tokenGoal){	
        if (fundingGoalReached && beneficiary == msg.sender) {

          
          if (beneficiary.send(amountRaised)) {
              emit FundTransfer(beneficiary, amountRaised, false);
          }

        }
      }

    }

    
    function closeDeadline() public goalReached onlyOwner {
      deadline = now;
    }

    function getcrowdsaleClosed() public view returns(bool) {
      return crowdsaleClosed;
    }

    function getfundingGoalReached() public view returns(bool) {
      return fundingGoalReached;
    }

    function getOwner() public view returns(address) {
      return owner;
    }

    function getbalanceOf(address _from) public view returns(uint256) {
      return balanceOf[_from];
    }

}