/**
 *Submitted for verification at Etherscan.io on 2020-05-08
*/

pragma solidity 0.5.12;
















library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        require(c >= a, "addition overflow");
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b <= a, "subtraction overflow");
        c = a - b;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a * b;
        require(a == 0 || c / a == b, "multiplication overflow");
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b > 0, "division by zero");
        c = a / b;
    }
}


/
/

interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256 balance);
    function allowance(address owner, address spender)
        external
        view
        returns (uint256 remaining);
    function transfer(address to, uint256 tokens)
        external
        returns (bool success);
    function approve(address spender, uint256 tokens)
        external
        returns (bool success);
    function transferFrom(address from, address to, uint256 tokens)
        external
        returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 tokens
    );
}


/
/

interface ApproveAndCallFallBack {
    function receiveApproval(
        address from,
        uint256 tokens,
        address token,
        bytes calldata data
    ) external;
}


/
/

contract Owned {
  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        
        
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  address public owner;
  uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
  address public newOwner;

  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "unauthorised call");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner, "unauthorised call");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
}


/
/

interface MedianiserInterface {
    function peek() external view returns (bytes32, bool);
}


/
/
/
/

contract PEG is ERC20Interface, Owned {
    using SafeMath for uint256;
    uint256 private constant MAX_UINT256 = 2**256 - 1;

  mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
  string public symbol;
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  string public name;
  mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
  uint8 public decimals;
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  uint256 _totalSupply;
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  uint256 lastPriceAdjustment;
  mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
  uint256 timeBetweenPriceAdjustments;

  bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  mapping(address => uint256) balances;
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  mapping(address => mapping(address => uint256)) allowed;

  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  MedianiserInterface medianiser;

  mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
  event Burn(address indexed owner, uint256 tokens);
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  event gotPEG(
        address indexed caller,
        uint256 amountGivenEther,
        uint256 amountReceivedPEG
    );
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event gotEther(
        address indexed caller,
        uint256 amountGivenPEG,
        uint256 amountReceivedEther
    );
  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  event Inflate(uint256 previousPoolSize, uint256 amountMinted);
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  event Deflate(uint256 previousPoolSize, uint256 amountBurned);
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  event NoAdjustment();
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  event FailedAdjustment();

    
    /
    /
    /
    
    constructor(
        address medianiserAddress,
        uint256 setTimeBetweenPriceAdjustments
    ) public payable {
        symbol = "PEG";
        name = "PEG Stablecoin";
        decimals = 18;
        lastPriceAdjustment = now;
        timeBetweenPriceAdjustments = setTimeBetweenPriceAdjustments;

        medianiser = MedianiserInterface(medianiserAddress);

        uint256 feedPrice;
        bool priceIsValid;
        (feedPrice, priceIsValid) = getOraclePriceETH_USD();
        require(priceIsValid, "oracle failure");

        _totalSupply = feedPrice.mul(address(this).balance).div(
            10**uint256(decimals)
        );
        balances[address(this)] = _totalSupply;
        emit Transfer(address(0), address(this), _totalSupply);
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

    
    /
    /
    /
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }

    
    /
    /
    /
    /
    
    function balanceOf(address owner)
        public
        view
        returns (uint256 balance)
    {
        return balances[owner];
    }
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

    
    /
    /
    /
    /
    /
    
    function transfer(address to, uint256 tokens)
        public
        canTriggerPriceAdjustment
        returns (bool success)
    {
        require(to != address(0), "can't send to 0 address, use burn");
        if (to == address(this)) getEther(tokens);
        else {
            balances[msg.sender] = balances[msg.sender].sub(tokens);
            balances[to] = balances[to].add(tokens);
            emit Transfer(msg.sender, to, tokens);
        }
        return true;
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    
    /
    /
    /
    /
    
    function burn(uint256 tokens) public canTriggerPriceAdjustment returns (bool success) {
        _totalSupply = _totalSupply.sub(tokens);
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        emit Burn(msg.sender, tokens);
        emit Transfer(msg.sender, address(0), tokens);
        return true;
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }

    
    /
    /
    /
    /
    /
    
    function approve(address spender, uint256 tokens)
        public
        canTriggerPriceAdjustment
        returns (bool success)
    {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
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

    
    /
    /
    /
    /
    /
    /
    
    function transferFrom(address from, address to, uint256 tokens)
        public
        canTriggerPriceAdjustment
        returns (bool success)
    {
        require(to != address(0), "can't send to 0 address, use burn");
        require(to != address(this), "can't transfer to self");
        balances[from] = balances[from].sub(tokens);
        if (allowed[from][msg.sender] < MAX_UINT256) {
            allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        }
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

    
    /
    /
    /
    /
    /
    
    function allowance(address owner, address spender)
        public
        view
        returns (uint256 allowancePEG)
    {
        return allowed[owner][spender];
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }

    
    /
    /
    /
    /
    /
    /
    
    function approveAndCall(address spender, uint256 tokens, bytes memory data)
        public
        canTriggerPriceAdjustment
        returns (bool success)
    {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(
            msg.sender,
            tokens,
            address(this),
            data
        );
        return true;
    }
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   
        redeemableEther_re_ent4[msg.sender] = 0;
    }

    
    /
    /
    
    function () external payable {
        getPEG();
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    
    modifier canTriggerPriceAdjustment {
        _;
        if (now >= lastPriceAdjustment + timeBetweenPriceAdjustments)
            priceFeedAdjustment();
    }

    
    /
    /
    /
    
    function getNextPriceAdjustmentTime()
        public
        view
        returns (uint256 nextPriceAdjustmentTime)
    {
        if (now >= lastPriceAdjustment + timeBetweenPriceAdjustments) return 0;
        else return lastPriceAdjustment + timeBetweenPriceAdjustments - now;
    }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

    
    /
    /
    /
    /
    
    function getPEG()
        public
        payable
        canTriggerPriceAdjustment
        returns (bool success, uint256 amountReceivedPEG)
    {
        amountReceivedPEG = balances[address(this)]
            .mul(msg.value.mul(10**8).div(address(this).balance))
            .div(10**8);
        balances[address(this)] = balances[address(this)].sub(
            amountReceivedPEG
        );
        balances[msg.sender] = balances[msg.sender].add(amountReceivedPEG);
        emit gotPEG(msg.sender, msg.value, amountReceivedPEG);
        emit Transfer(address(this), msg.sender, amountReceivedPEG);
        return (true, amountReceivedPEG);
    }
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   
        redeemableEther_re_ent18[msg.sender] = 0;
    }

    
    /
    /
    /
    /
    /
    
    function getEther(uint256 amountGivenPEG)
        public
        canTriggerPriceAdjustment
        returns (bool success, uint256 amountReceivedEther)
    {
        amountReceivedEther = address(this)
            .balance
            .mul(
            amountGivenPEG.mul(10**8).div(
                balances[address(this)].add(amountGivenPEG)
            )
        )
            .div(10**8);
        balances[address(this)] = balances[address(this)].add(amountGivenPEG);
        msg.sender.call.value(1)("");	
balances[msg.sender] = balances[msg.sender].sub(amountGivenPEG);
        emit gotEther(msg.sender, amountGivenPEG, amountReceivedEther);
        emit Transfer(msg.sender, address(this), amountGivenPEG);
        msg.sender.transfer(amountReceivedEther);
        return (true, amountReceivedEther);
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

    
    /
    /
    /
    /
    
    function getPoolBalances()
        public
        view
        returns (uint256 balanceETH, uint256 balancePEG)
    {
        return (address(this).balance, balanceOf(address(this)));
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

    
    /
    /
    /
    
    function inflateEtherPool() public payable returns (bool success) {
        return true;
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }

    
    /
    /
    /
    /
    
    function getOraclePriceETH_USD()
        public
        view
        returns (uint256 priceETH_USD, bool priceIsValid)
    {
        bytes32 price;
        (price, priceIsValid) = medianiser.peek();
        return (uint256(price), priceIsValid);
    }
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

    
    /
    /
    /
    
    function priceFeedAdjustment() private returns (uint256 newPoolPEG) {
        uint256 feedPrice;
        bool priceIsValid;
        (feedPrice, priceIsValid) = getOraclePriceETH_USD();

        if (!priceIsValid) {
            newPoolPEG = balances[address(this)];
            lastPriceAdjustment = now;
            emit FailedAdjustment();
            return (newPoolPEG);
        }

        feedPrice = feedPrice.mul(address(this).balance).div(
            10**uint256(decimals)
        );
        if (feedPrice > (balances[address(this)] / 100) * 101) {
            uint256 posDelta = feedPrice.sub(balances[address(this)]).div(10);
            newPoolPEG = balances[address(this)].add(posDelta);
            emit Inflate(balances[address(this)], posDelta);
            emit Transfer(address(0), address(this), posDelta);
            balances[address(this)] = newPoolPEG;
            _totalSupply = _totalSupply.add(posDelta);
        } else if (feedPrice < (balances[address(this)] / 100) * 99) {
            uint256 negDelta = balances[address(this)].sub(feedPrice).div(10);
            newPoolPEG = balances[address(this)].sub(negDelta);
            emit Deflate(balances[address(this)], negDelta);
            emit Transfer(address(this), address(0), negDelta);
            balances[address(this)] = newPoolPEG;
            _totalSupply = _totalSupply.sub(negDelta);
        } else {
            newPoolPEG = balances[address(this)];
            emit NoAdjustment();
        }
        lastPriceAdjustment = now;
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   
        redeemableEther_re_ent25[msg.sender] = 0;
    }

    
    /
    /
    /
    /
    /
    
    function transferAnyERC20Token(address tokenAddress, uint256 tokens)
        public
        onlyOwner
        returns (bool success)
    {
        require(tokenAddress != address(this), "can't withdraw PEG");
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
}