/**
 *Submitted for verification at Etherscan.io on 2020-09-15
*/

// SPDX-License-Identifier: ECLv2
/**
 * @title TokenHook (THK).
 * @author Currently ANONYMOUS.
 * @notice You may use this code under ECLv2.
 * @dev For new token deployment:
 * 1- Install MetaMask (Chrome/Firefox extension).
 * 2- Connect to Rinkeby (or other private/public chains).
 * 3- Run RemixIDE and set environment as "Injected Web3".
 * 4- Copy and past this code in RemixIDE.
 * 5- Deploy the token contract (ERC20).
 * @dev The code is compatible with version 0.5.x of Solidity complier.
 * Version 0.5.11 has been selected for compatibility with the following auditing tools:
 * 1- EY Review Tool by Ernst & Young Global Limited.
 * 2- SmartCheck by SmartDec.
 * 3- Securify by ChainSecurity.
 * 4- ContractGuard by GuardStrike.
 * 5- MythX by ConsenSys.
 * 6- Slither Analyzer by Crytic.
 * 7- Odin by Sooho.
 */
 
pragma solidity 0.5.11;

/**
 * @title ERC20 Interface
 * @author Fabian Vogelsteller, Vitalik Buterin
 * @dev https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 */
interface IERC20 {
    /// Transfers tokens and fires the Transfer event.
    function transfer(address to, uint256 tokens) external returns (bool);
    
    /// Allows to withdraw from your account multiple times, up to the approved tokens.
    function approve(address spender, uint256 tokens) external returns (bool);
    
    /// Transfers approved tokens and fires the Transfer event
    function transferFrom(address from, address to, uint256 tokens) external returns (bool);

    /// Returns the total token supply
    function totalSupply() external view returns (uint256);
    
    /// Returns token balance of an account
    function balanceOf(address account) external view returns (uint256);
    
    /// Returns the allowed tokens to withdraw from an account
    function allowance(address account, address spender) external view returns (uint256);

    /// Events
    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}

/**
 * @title Wrappers over Solidity's arithmetic operations with added overflow checks.
 * @author OpenZeppelin
 * @dev https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.Using this library instead of the unchecked operations
 * eliminates an entire class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on overflow.
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
        require(b <= a, "SafeMath: subtraction overflow");
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
        /// Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        /// benefit is lost if 'b' is also tested.
        /// See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
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
        /// Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        /// assert(a == b * c + a % b); /// There is no case in which this doesn't hold

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
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

/**
 * @title ERC20 Token contract
 * @dev When verify the code in EtherScan and if you used the default initialSupply,
 * set this value as "Constructor Arguments":
 * 0000000000000000000000000000000000000000000000000000000000000000
 * @dev The token will be created with 18 decimal places,
 * so it takes a balance of 10 ** 18 token units to equal one token.
 * In other word, if we want to have x initial tokens, we need to pass in,
 * x * 10 ** 18 to the constructor.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;		                            /// Attach SafeMath functions with uint256 to mitigate integer overflow

  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  string public constant name = "TokenHook";                  /// Token name
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  string public constant symbol = "THK";                      /// Token symbol
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint8 public constant decimals = 18;                        /// Divisible to 18 decimal places
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  address payable private owner;                              /// Token owner
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public exchangeRate = 100;                          /// 100 tokens per 1ETH, default exchange rate
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  uint256 private initialSupply = 200e6;                      /// Controls economy of the token by limiting initial supply to 200M
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  bool private locked;                                        /// Mutex variable to mitigate re-entrancy attack
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  bool private paused;                                        /// Boolean variable to support Fail-Safe mode
    //uint256 private contractBalance = 0;                        /// Can be used for integrity check

  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  mapping(address => mapping (address => uint256)) private allowances;	/// Allowed token to transfer by spenders
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  mapping(address => mapping (address => uint256)) private transferred;	/// Transferred tokens by spenders
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping(address => uint256) public balances;                            /// Balance of token holders

    /**
     * @dev Token constructor that runs only once upon contract creation. The final code of the contract is deployed to the blockchain,
     * after the constructor has run.
     */
    constructor(uint256 supply) public {
        owner = msg.sender;                                                 /// Owner of the token
        initialSupply = (supply != 0) ? supply :                            /// Initialize token supply
                        initialSupply.mul(10 ** uint256(decimals));         /// With 18 zero
        balances[owner] = initialSupply;                                    /// Owner gets all initial tokens
        emit Transfer(address(0), owner, initialSupply);                    /// Logs transferred tokens to the owner
    }
    
    /**
     * @dev Fallback function to accept ETH. It is compatible with 2300 gas for receiving funds via send or transfer methods.
     */
    function() external payable{
        //require(msg.data.length == 0, "Only plain Ether");                  /// Checks for only calls without data
        //contractBalance = contractBalance.add(msg.value);                   /// Adjusting contract balance
        emit Received(msg.sender, msg.value);                               /// Logs received ETH
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    /**
     * @dev Transfers `tokens` amount of tokens to address `to`, and fires Transfer event. Transferring zero tokens is also allowed.
     */
    function transfer(address to, uint256 tokens) external notPaused validAddress(to) noReentrancy returns (bool success) {
        require(balances[msg.sender] >= tokens, "Not enough balance");          /// Checks the sender's balance
        require(balances[to].add(tokens) >= balances[to], "Overflow error");    /// Checks overflows
        balances[msg.sender] = balances[msg.sender].sub(tokens);                /// Subtracts from the sender
        balances[to] = balances[to].add(tokens);                                /// Adds to the recipient
        emit Transfer(msg.sender, to, tokens);                                  /// Logs transferred tokens
        return true;
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
 
    /**
     * @dev Special type of Transfer that makes it possible to give permission to another address for spending tokens on your behalf. 
     * It sends `tokens` from address `from` to address `to`. The `transferFrom` method is used for a withdraw work-flow, allowing 
     * contracts to send tokens on your behalf, for example to deposit to a contract address and/or to charge fees in sub-currencies.
     * The function call fails unless the `from` account has deliberately authorized the sender of the message via `approve` function.
     */
    function transferFrom(address from, address to, uint256 tokens) external notPaused validAddress(to) noReentrancy returns (bool success) {
        require(balances[from] >= tokens, "Not enough tokens");                     /// Checks the sender's balance
        require(tokens <= (                                                         /// Prevent token transfer more than allowed
                           (allowances[from][msg.sender] > transferred[from][msg.sender]) ? 
                            allowances[from][msg.sender].sub(transferred[from][msg.sender]) : 0)
                            , "Transfer more than allowed");                               
        balances[from] = balances[from].sub(tokens);                                /// Decreases balance of approver
        balances[to] = balances[to].add(tokens);                                    /// Increases balance of spender
        transferred[from][msg.sender] = transferred[from][msg.sender].add(tokens);  /// Tracks transferred tokens
        emit Transfer(from, to, tokens);                                            /// Logs transferred tokens
        return true;
    }

    /**
     * @dev It approves another address to spend tokens on your behalf. It allows `spender` to withdraw from your account, multiple times, 
     * up to the `tokens` amount. If this function is called again, it overwrites the current allowance with `tokens`.
     */
    function approve(address spender, uint256 tokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(spender != msg.sender, "Approver is spender");                      /// Spender cannot approve himself
        require(balances[msg.sender] >= tokens, "Not enough balance");              /// Checks the approver's balance
        allowances[msg.sender][spender] = tokens;                                   /// Sets allowance of the spender
        emit Approval(msg.sender, spender, tokens);                                 /// Logs approved tokens
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    /**
     * @dev Implements another way of approving tokens by increasing current approval. It is not defined in the standard.
     * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
     */
    function increaseAllowance(address spender, uint256 addedTokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(balances[msg.sender] >= addedTokens, "Not enough token");                       /// Checks the approver's balance
        allowances[msg.sender][spender] = allowances[msg.sender][spender].add(addedTokens);     /// Adds allowance of the spender
        emit Approval(msg.sender, spender, addedTokens);                                        /// Logs approved tokens
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    /**
     * @dev Implements another way of approving tokens by decreasing current approval. It is not defined in the standard.
     * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
     */
    function decreaseAllowance(address spender, uint256 subtractedTokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(allowances[msg.sender][spender] >= subtractedTokens, "Not enough token");       /// Checks the spenders's allowance
        allowances[msg.sender][spender] = allowances[msg.sender][spender].sub(subtractedTokens);/// Adds allowance of the spender
        emit Approval(msg.sender, spender, subtractedTokens);                                   /// Logs approved tokens
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    /**
     * @dev Supports selling tokens to the contract. It uses msg.sender.call.value() mrthod to be compatible with EIP-1884.
     * In addition to CEI, Mutex (noReentrancy modifier is also used to mitigate cross-function re-entrancy attack (along with same-function re-entrancy).
     */
    function sell(uint256 tokens) external notPaused noReentrancy returns(bool success)
    {
        require(tokens > 0, "No token to sell");                                /// Selling zero token is not allowed
        require(balances[msg.sender] >= tokens, "Not enough token");            /// Checks the seller's balance
        uint256 _wei = tokens.div(exchangeRate);                                /// Calculates equivalent of tokens in Wei
        require(address(this).balance >= _wei, "Not enough wei");               /// Checks the contract's ETH balance
        //require(contractBalance >= _wei, "Not enough wei");                     /// Contract does not have enough Wei
        
        /// Using Checks-Effects-Interactions (CEI) pattern to mitigate re-entrancy attack
        balances[msg.sender] = balances[msg.sender].sub(tokens);                /// Decreases tokens of seller
        balances[owner] = balances[owner].add(tokens);                          /// Increases tokens of owner
        //contractBalance = contractBalance.sub(_wei);                            /// Adjusts contract balance
        
        emit Sell(msg.sender, tokens, address(this), _wei, owner);              /// Logs sell event
        (success, ) = msg.sender.call.value(_wei)("");                          /// Transfers Wei to the seller
        require(success, "Ether transfer failed");                              /// Checks successful transfer
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
    /**
     * @dev Supports buying token by transferring Ether
     */ 
    function buy() external payable notPaused noReentrancy returns(bool success){
        require(msg.sender != owner, "Called by the Owner");                /// The owner cannot be seller/buyer
        uint256 _tokens = msg.value.mul(exchangeRate);                      /// Calculates token equivalents
        require(balances[owner] >= _tokens, "Not enough tokens");           /// Checks owner's balance

        balances[msg.sender] = balances[msg.sender].add(_tokens);           /// Increases token balance of buyer
        balances[owner] = balances[owner].sub(_tokens);                     /// Decreases token balance of owner
        //contractBalance = contractBalance.add(msg.value);                   /// Adjustes contract balance
        emit Buy(msg.sender, msg.value, owner, _tokens);                    /// Logs Buy event
        return true;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    
    /**
     * @dev Withdraw Ether from the contract and send it to the address that is specified by the owner. It can be called only by the owner.
     */
    function withdraw(uint256 amount) external onlyOwner returns(bool success){
        require(address(this).balance >= amount, "Not enough fund");        /// Checks the contract's ETH balance
        //require(contractBalance >= amount, "Not enough fund");              /// Checks the contract's ETH balance

        emit Withdrawal(msg.sender, address(this), amount);                 /// Logs withdrawal event
        (success, ) = msg.sender.call.value(amount)("");                    /// Transfers amount (EIP-1884 compatible)
        require(success, "Ether transfer failed");                          /// Checks successful transfer
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
    
    /**
     * @dev Returns balance of the Contract
     *
    function getContractBalance() public view onlyOwner returns(uint256, uint256){
        return (address(this).balance, contractBalance);
    }
    
    /** 
     * @dev Checks for unexpected received Ether (forced to the contract without using payable functions)
     *
    function unexpectedEther() public view onlyOwner returns(bool){
        return (contractBalance != address(this).balance);
    }
    */
    
    /**
    /* @dev Creates new tokens and assigns them to the owner, increases the total supply as well.
     */
    function mint(uint256 newTokens) external onlyOwner {
        initialSupply = initialSupply.add(newTokens);               /// Increases token supply
        balances[owner] = balances[owner].add(newTokens);           /// Increases balance of the owner
        emit Mint(msg.sender, newTokens);                           /// Logs Mint event
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * @dev Burns tokens from the owner, decreases the total supply as well.
     */
    function burn(uint256 tokens) external onlyOwner {
        require(balances[owner] >= tokens, "Not enough tokens");    /// Checks owner's balance
        balances[owner] = balances[owner].sub(tokens);              /// Decreases balance of the owner
        initialSupply = initialSupply.sub(tokens);                  /// Decreases token supply
        emit Burn(msg.sender, tokens);                              /// Logs Burn event
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    /**
     * @dev Sets new exchange rate. It can be called only by the owner.
     */
    function setExchangeRate(uint256 newRate) external onlyOwner returns(bool success)
    {
        uint256 _currentRate = exchangeRate;
        exchangeRate = newRate;                             /// Sets new exchange rate
        emit Change(_currentRate, exchangeRate);            /// Logs Change event
        return true;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /**
     * @dev Changes owner of the contract
     */
    function changeOwner(address payable newOwner) external onlyOwner validAddress(newOwner) {
        address _current = owner;
        owner = newOwner;
        emit ChangeOwner(_current, owner);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    
    /**
     * @dev Pause the contract as result of self-checks (off-chain computations).
     */
    function pause() external onlyOwner {
        paused = true;                  
        emit Pause(msg.sender, paused);
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
    
    /**
     * @dev Unpause the contract after self-checks.
     */
    function unpause() external onlyOwner {
        paused = false;
        emit Pause(msg.sender, paused);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    /**
     * @dev Returns the total token supply.
     */
    function totalSupply() external view returns (uint256 tokens) {
        return initialSupply;                       /// Total supply of the token.
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    
    /**
     * @dev Returns the account balance of another account with address `tokenHolder`.
     */
    function balanceOf(address tokenHolder) external view returns (uint256 tokens) {
        return balances[tokenHolder];               /// Balance of token holder.
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    /**
     * @dev Returns the amount of tokens approved by the owner that can be transferred to the spender's account.
     */
    function allowance(address tokenHolder, address spender) external view notPaused returns (uint256 tokens) {
        uint256 _transferred = transferred[tokenHolder][spender];       /// Already transferred tokens by `spender`.
        return allowances[tokenHolder][spender].sub(_transferred);      /// Remained tokens to transfer by `spender`.
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /**
     * @dev Returns the amount of transferred tokens by spender's account.
     */
    function transfers(address tokenHolder, address spender) external view notPaused returns (uint256 tokens) {
        return transferred[tokenHolder][spender];    /// Transfers by `spender` (approved by `tokenHolder`).
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    /**
     * @dev Checks whether the caller is the owner. 
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
    
    /**
     * @dev Checks validity of the address.
     */
    modifier validAddress(address addr){
        require(addr != address(0x0), "Zero address");
        require(addr != address(this), "Contract address");
        _;
    }
    
    /**
    * @author https://solidity.readthedocs.io/en/latest/contracts.html#function-modifiers
    * @dev Mutex modifier to mitigate Re-entrancy Attack. Operation will succeed if and only if the locking thread is the one that already holds the lock.
    */
    modifier noReentrancy() 
    {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }
    
    /**
    * @dev Modifier to support Fail-Safe Mode. In case, it disables most of the toekn features, hands off control to the owner.
    */
    modifier notPaused() 
    {
        require(!paused, "Fail-Safe mode");
        _;
    }
    
    /// Events
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  event Buy(address indexed _buyer, uint256 _wei, address indexed _owner, uint256 _tokens);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Sell(address indexed _seller, uint256 _tokens, address indexed _contract, uint256 _wei, address indexed _owner);
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  event Received(address indexed _sender, uint256 _wei);
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  event Withdrawal(address indexed _by, address indexed _contract, uint256 _wei);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Change(uint256 _current, uint256 _new);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event ChangeOwner(address indexed _current, address indexed _new);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event Pause(address indexed _owner, bool _state);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Mint(address indexed _owner, uint256 _tokens);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Burn(address indexed _owner, uint256 _tokens);
}