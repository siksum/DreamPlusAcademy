pragma solidity 0.5.7;


library SafeMath 
{
    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
}


/******************************************/

/******************************************/

contract nerveShares {

  bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  string public name;
  bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }
  string public symbol;
  bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
  uint8 public decimals;
  bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
  uint256 public totalSupply;
  address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  uint256 public totalDividends;
    uint256 internal constant MAX_UINT = 2**256 - 1;

  bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }
  mapping (address => uint) public balanceOf;
  address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  mapping (address => mapping (address => uint)) public allowance;
  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  mapping (address => uint256) internal lastDividends;
  address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
  mapping (address => bool) public tradables;
    
  bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
  event Claim(address indexed _to, uint256 value);

    using SafeMath for uint256;

    constructor() public
    {
        decimals = 18;                              
        totalSupply = 1000000*10**18;               
        name = "Nerve";                             
        symbol = "NRV";                             

        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }

    /**
    * @dev Get the dividends of a user. Take prior payoffs into account.
    * @param account The address of the user.
    */
    function dividendBalanceOf(address account) public view returns (uint256) 
    {
        uint256 newDividends = totalDividends.sub(lastDividends[account]);
        uint256 product = balanceOf[account].mul(newDividends);
        return product.div(totalSupply);
    }
bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }   

    /**
    * @dev Get the dividends of a user. Take prior payoffs into account.
    * @param account The address of the user.
    */
    function internalDividendBalanceOf(address account, uint256 tempLastDividends) internal view returns (uint256) 
    {
        uint256 newDividends = totalDividends.sub(tempLastDividends);
        uint256 product = balanceOf[account].mul(newDividends);
        return product.div(totalSupply);
    }
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }   

    /**
    * @dev Claim dividends. Restrict dividends to new income.
    */
    function claimDividend() external 
    {
        uint256 tempLastDividends = lastDividends[msg.sender];
        lastDividends[msg.sender] = totalDividends;
        uint256 owing = internalDividendBalanceOf(msg.sender, tempLastDividends);

        require(owing > 0, "No dividends to claim.");

        msg.sender.transfer(owing);
        
        emit Claim(msg.sender, owing);
    }
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }

    /**
    * @dev Claim dividends internally. Get called on addresses opened for trade.
    */
    function internalClaimDividend(address payable from) internal 
    {
        uint256 tempLastDividends = lastDividends[from];
        lastDividends[from] = totalDividends;
        uint256 owing = internalDividendBalanceOf(from, tempLastDividends);

        if (owing > 0) {

        from.transfer(owing);

        emit Claim(from, owing);
        }
    }
bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }

    /**
    * @dev Open or close sending address for trade.
    * @param allow True -> open
    */
    function allowTrade(bool allow) external
    {
        tradables[msg.sender] = allow;
    }
bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }

    /**
    * @dev Transfer tokens
    * @param to The address of the recipient
    * @param value the amount to send
    */
    function transfer(address payable to, uint256 value) external returns(bool success)
    {
        _transfer(msg.sender, to, value);
        return true;
    }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

    /**
    * @dev Transfer tokens. Make sure that both participants have no open dividends left.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function _transfer(address payable from, address payable to, uint256 value) internal
    {   
        require(value > 0, "Transferred value has to be grater than 0.");
        require(to != address(0), "0x00 address not allowed.");
        require(value <= balanceOf[from], "Not enough funds on sender address.");
        require(balanceOf[to] + value >= balanceOf[to], "Overflow protection.");
 
        uint256 fromOwing = dividendBalanceOf(from);
        uint256 toOwing = dividendBalanceOf(to);

        if (tradables[from] == true && (tradables[to] == true || toOwing == 0)) 
        {

            internalClaimDividend(from);
            internalClaimDividend(to);
        } else {
            
            require(fromOwing == 0 && toOwing == 0, "Unclaimed dividends on sender and/or receiver");
        }
        
        balanceOf[from] -= value;
        balanceOf[to] += value;
 
        lastDividends[to] = lastDividends[from];    
 
        emit Transfer(from, to, value);
    }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }

    /**
    * @dev ERC20 transferFrom, modified such that an allowance of MAX_UINT represents an unlimited allowance.
    * @param from Address to transfer from.
    * @param to Address to transfer to.
    * @param value Amount to transfer.
    * @return Success of transfer.
    */
    function transferFrom(address payable from, address payable to, uint value) external returns (bool success)
    {
        uint256 allowanceTemp = allowance[from][msg.sender];
        
        require(allowanceTemp >= value, "Funds not approved."); 
        require(balanceOf[from] >= value, "Not enough funds on sender address.");
        require(balanceOf[to] + value >= balanceOf[to], "Overflow protection.");

        if (allowanceTemp < MAX_UINT) 
        {
            allowance[from][msg.sender] -= value;
        }
        
        _transfer(from, to, value);

        return true;
    }
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }

    /**
    * @dev `msg.sender` approves `addr` to spend `value` tokens.
    * @param spender The address of the account able to transfer the tokens.
    * @param value The amount of wei to be approved for transfer.
    */
    function approve(address spender, uint value) external returns (bool) 
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

    /**
    * @dev Set unlimited allowance for other address
    * @param target The address authorized to spend
    */   
    function giveAccess(address target) external
    {
        require(target != address(0), "0x00 address not allowed.");
        allowance[msg.sender][target] = MAX_UINT;
        emit Approval(msg.sender, target, MAX_UINT);
    }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

    /**
    * @dev Set allowance for other address to 0
    * @param target The address authorized to spend
    */   
    function revokeAccess(address target) external
    {
        require(target != address(0), "0x00 address not allowed.");
        allowance[msg.sender][target] = 0;
    }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
    
    /**
    * @dev Get contract ETH amount. 
    */ 
    function contractBalance() external view returns(uint256 amount)
    {
        return (address(this).balance);
    }
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
    
    /**
    * @dev Receive ETH from CONTRACT and increase the total historic amount of dividend eligible earnings.
    */
    function receiveETH() external payable
    {
        totalDividends = totalDividends.add(msg.value);
    }
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
    
    /**
    * @dev Receive ETH and increase the total historic amount of dividend eligible earnings.
    */
    function () external payable 
    {
        totalDividends = totalDividends.add(msg.value);
    }
address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
    
}