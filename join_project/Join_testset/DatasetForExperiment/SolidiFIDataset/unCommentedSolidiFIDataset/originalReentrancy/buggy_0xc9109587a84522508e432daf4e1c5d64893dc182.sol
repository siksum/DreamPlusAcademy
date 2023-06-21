/**
 *Submitted for verification at Etherscan.io on 2020-09-15
*/


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
 * @dev https:
 */
interface IERC20 {
    /
    function transfer(address to, uint256 tokens) external returns (bool);
    
    /
    function approve(address spender, uint256 tokens) external returns (bool);
    
    /
    function transferFrom(address from, address to, uint256 tokens) external returns (bool);

    /
    function totalSupply() external view returns (uint256);
    
    /
    function balanceOf(address account) external view returns (uint256);
    
    /
    function allowance(address account, address spender) external view returns (uint256);

    /
    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}

/**
 * @title Wrappers over Solidity's arithmetic operations with added overflow checks.
 * @author OpenZeppelin
 * @dev https:
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
        /
        /
        /
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
        /
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        /

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
    using SafeMath for uint256;		                            /

  mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
  string public constant name = "TokenHook";                  /
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  string public constant symbol = "THK";                      /
  mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
  uint8 public constant decimals = 18;                        /
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  address payable private owner;                              /
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  uint256 public exchangeRate = 100;                          /
  mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
  uint256 private initialSupply = 200e6;                      /
  bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  bool private locked;                                        /
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  bool private paused;                                        /
    

  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  mapping(address => mapping (address => uint256)) private allowances;	/
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  mapping(address => mapping (address => uint256)) private transferred;	/
  mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
  mapping(address => uint256) public balances;                            /

    /**
     * @dev Token constructor that runs only once upon contract creation. The final code of the contract is deployed to the blockchain,
     * after the constructor has run.
     */
    constructor(uint256 supply) public {
        owner = msg.sender;                                                 /
        initialSupply = (supply != 0) ? supply :                            /
                        initialSupply.mul(10 ** uint256(decimals));         /
        balances[owner] = initialSupply;                                    /
        emit Transfer(address(0), owner, initialSupply);                    /
    }
    
    /**
     * @dev Fallback function to accept ETH. It is compatible with 2300 gas for receiving funds via send or transfer methods.
     */
    function() external payable{
        
        
        emit Received(msg.sender, msg.value);                               /
    }
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
    
    /**
     * @dev Transfers `tokens` amount of tokens to address `to`, and fires Transfer event. Transferring zero tokens is also allowed.
     */
    function transfer(address to, uint256 tokens) external notPaused validAddress(to) noReentrancy returns (bool success) {
        require(balances[msg.sender] >= tokens, "Not enough balance");          /
        require(balances[to].add(tokens) >= balances[to], "Overflow error");    /
        balances[msg.sender] = balances[msg.sender].sub(tokens);                /
        balances[to] = balances[to].add(tokens);                                /
        emit Transfer(msg.sender, to, tokens);                                  /
        return true;
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
 
    /**
     * @dev Special type of Transfer that makes it possible to give permission to another address for spending tokens on your behalf. 
     * It sends `tokens` from address `from` to address `to`. The `transferFrom` method is used for a withdraw work-flow, allowing 
     * contracts to send tokens on your behalf, for example to deposit to a contract address and/or to charge fees in sub-currencies.
     * The function call fails unless the `from` account has deliberately authorized the sender of the message via `approve` function.
     */
    function transferFrom(address from, address to, uint256 tokens) external notPaused validAddress(to) noReentrancy returns (bool success) {
        require(balances[from] >= tokens, "Not enough tokens");                     /
        require(tokens <= (                                                         /
                           (allowances[from][msg.sender] > transferred[from][msg.sender]) ? 
                            allowances[from][msg.sender].sub(transferred[from][msg.sender]) : 0)
                            , "Transfer more than allowed");                               
        balances[from] = balances[from].sub(tokens);                                /
        balances[to] = balances[to].add(tokens);                                    /
        transferred[from][msg.sender] = transferred[from][msg.sender].add(tokens);  /
        emit Transfer(from, to, tokens);                                            /
        return true;
    }

    /**
     * @dev It approves another address to spend tokens on your behalf. It allows `spender` to withdraw from your account, multiple times, 
     * up to the `tokens` amount. If this function is called again, it overwrites the current allowance with `tokens`.
     */
    function approve(address spender, uint256 tokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(spender != msg.sender, "Approver is spender");                      /
        require(balances[msg.sender] >= tokens, "Not enough balance");              /
        allowances[msg.sender][spender] = tokens;                                   /
        emit Approval(msg.sender, spender, tokens);                                 /
        return true;
    }
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
    
    /**
     * @dev Implements another way of approving tokens by increasing current approval. It is not defined in the standard.
     * https:
     */
    function increaseAllowance(address spender, uint256 addedTokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(balances[msg.sender] >= addedTokens, "Not enough token");                       /
        allowances[msg.sender][spender] = allowances[msg.sender][spender].add(addedTokens);     /
        emit Approval(msg.sender, spender, addedTokens);                                        /
        return true;
    }
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

    /**
     * @dev Implements another way of approving tokens by decreasing current approval. It is not defined in the standard.
     * https:
     */
    function decreaseAllowance(address spender, uint256 subtractedTokens) external notPaused validAddress(spender) noReentrancy returns (bool success) {
        require(allowances[msg.sender][spender] >= subtractedTokens, "Not enough token");       /
        allowances[msg.sender][spender] = allowances[msg.sender][spender].sub(subtractedTokens);/
        emit Approval(msg.sender, spender, subtractedTokens);                                   /
        return true;
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
    
    /**
     * @dev Supports selling tokens to the contract. It uses msg.sender.call.value() mrthod to be compatible with EIP-1884.
     * In addition to CEI, Mutex (noReentrancy modifier is also used to mitigate cross-function re-entrancy attack (along with same-function re-entrancy).
     */
    function sell(uint256 tokens) external notPaused noReentrancy returns(bool success)
    {
        require(tokens > 0, "No token to sell");                                /
        require(balances[msg.sender] >= tokens, "Not enough token");            /
        uint256 _wei = tokens.div(exchangeRate);                                /
        require(address(this).balance >= _wei, "Not enough wei");               /
        
        
        /
        balances[msg.sender] = balances[msg.sender].sub(tokens);                /
        balances[owner] = balances[owner].add(tokens);                          /
        
        
        emit Sell(msg.sender, tokens, address(this), _wei, owner);              /
        (success, ) = msg.sender.call.value(_wei)("");                          /
        require(success, "Ether transfer failed");                              /
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    
    /**
     * @dev Supports buying token by transferring Ether
     */ 
    function buy() external payable notPaused noReentrancy returns(bool success){
        require(msg.sender != owner, "Called by the Owner");                /
        uint256 _tokens = msg.value.mul(exchangeRate);                      /
        require(balances[owner] >= _tokens, "Not enough tokens");           /

        balances[msg.sender] = balances[msg.sender].add(_tokens);           /
        balances[owner] = balances[owner].sub(_tokens);                     /
        
        emit Buy(msg.sender, msg.value, owner, _tokens);                    /
        return true;
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    
    /**
     * @dev Withdraw Ether from the contract and send it to the address that is specified by the owner. It can be called only by the owner.
     */
    function withdraw(uint256 amount) external onlyOwner returns(bool success){
        require(address(this).balance >= amount, "Not enough fund");        /
        

        emit Withdrawal(msg.sender, address(this), amount);                 /
        (success, ) = msg.sender.call.value(amount)("");                    /
        require(success, "Ether transfer failed");                          /
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
    
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
    
    function mint(uint256 newTokens) external onlyOwner {
        initialSupply = initialSupply.add(newTokens);               /
        balances[owner] = balances[owner].add(newTokens);           /
        emit Mint(msg.sender, newTokens);                           /
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }

    /**
     * @dev Burns tokens from the owner, decreases the total supply as well.
     */
    function burn(uint256 tokens) external onlyOwner {
        require(balances[owner] >= tokens, "Not enough tokens");    /
        balances[owner] = balances[owner].sub(tokens);              /
        initialSupply = initialSupply.sub(tokens);                  /
        emit Burn(msg.sender, tokens);                              /
    }
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   
        redeemableEther_re_ent4[msg.sender] = 0;
    }
    
    /**
     * @dev Sets new exchange rate. It can be called only by the owner.
     */
    function setExchangeRate(uint256 newRate) external onlyOwner returns(bool success)
    {
        uint256 _currentRate = exchangeRate;
        exchangeRate = newRate;                             /
        emit Change(_currentRate, exchangeRate);            /
        return true;
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
    
    /**
     * @dev Changes owner of the contract
     */
    function changeOwner(address payable newOwner) external onlyOwner validAddress(newOwner) {
        address _current = owner;
        owner = newOwner;
        emit ChangeOwner(_current, owner);
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
     * @dev Pause the contract as result of self-checks (off-chain computations).
     */
    function pause() external onlyOwner {
        paused = true;                  
        emit Pause(msg.sender, paused);
    }
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   
        redeemableEther_re_ent18[msg.sender] = 0;
    }
    
    /**
     * @dev Unpause the contract after self-checks.
     */
    function unpause() external onlyOwner {
        paused = false;
        emit Pause(msg.sender, paused);
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

    /**
     * @dev Returns the total token supply.
     */
    function totalSupply() external view returns (uint256 tokens) {
        return initialSupply;                       /
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
    
    /**
     * @dev Returns the account balance of another account with address `tokenHolder`.
     */
    function balanceOf(address tokenHolder) external view returns (uint256 tokens) {
        return balances[tokenHolder];               /
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    
    /**
     * @dev Returns the amount of tokens approved by the owner that can be transferred to the spender's account.
     */
    function allowance(address tokenHolder, address spender) external view notPaused returns (uint256 tokens) {
        uint256 _transferred = transferred[tokenHolder][spender];       /
        return allowances[tokenHolder][spender].sub(_transferred);      /
    }
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
    
    /**
     * @dev Returns the amount of transferred tokens by spender's account.
     */
    function transfers(address tokenHolder, address spender) external view notPaused returns (uint256 tokens) {
        return transferred[tokenHolder][spender];    /
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   
        redeemableEther_re_ent25[msg.sender] = 0;
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
    * @author https:
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
    
    /
  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  event Buy(address indexed _buyer, uint256 _wei, address indexed _owner, uint256 _tokens);
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event Sell(address indexed _seller, uint256 _tokens, address indexed _contract, uint256 _wei, address indexed _owner);
  mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
  event Received(address indexed _sender, uint256 _wei);
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  event Withdrawal(address indexed _by, address indexed _contract, uint256 _wei);
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event Change(uint256 _current, uint256 _new);
  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  event ChangeOwner(address indexed _current, address indexed _new);
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  event Pause(address indexed _owner, bool _state);
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  event Mint(address indexed _owner, uint256 _tokens);
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  event Burn(address indexed _owner, uint256 _tokens);
}