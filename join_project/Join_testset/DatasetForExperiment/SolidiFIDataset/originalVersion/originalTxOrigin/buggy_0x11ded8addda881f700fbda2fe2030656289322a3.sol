pragma solidity 0.5.8;

interface IERC20 
{
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ApproveAndCallFallBack {

    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
}

library SafeMath 
{
    function mul(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        if (a == 0) 
        {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a / b;
        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        assert(b <= a);
        return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
    
    function ceil(uint256 a, uint256 m) internal pure returns (uint256) 
    {
        uint256 c = add(a,m);
        uint256 d = sub(c,1);
        return mul(div(d,m),m);
    }
}

contract ERC20Detailed is IERC20 
{
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    
    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    
    function name() public view returns(string memory) {
        return _name;
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
    
    function symbol() public view returns(string memory) {
        return _symbol;
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
    
    function decimals() public view returns(uint8) {
        return _decimals;
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
}

contract AfterShock is ERC20Detailed 
{
    using SafeMath for uint256;
    
    mapping (address => uint256) private _balances;
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  mapping (address => mapping (address => uint256)) private _allowed;
    
  function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  string constant tokenName = "AfterShock";//"AfterShock";
  function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  string constant tokenSymbol = "SHOCK";//"SHOCK"; 
  function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  uint8  constant tokenDecimals = 18;
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  uint256 _totalSupply = 0;
    
    // ------------------------------------------------------------------------
  
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  address public contractOwner;

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  uint256 public fullUnitsStaked_total = 0;
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  mapping (address => bool) public excludedFromStaking; //exchanges/other contracts will be excluded from staking

  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  uint256 _totalRewardsPerUnit = 0;
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) private _totalRewardsPerUnit_positions;
  function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) private _savedRewards;
    
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    // ------------------------------------------------------------------------
    
    constructor() public ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) 
    {
        contractOwner = msg.sender;
        excludedFromStaking[msg.sender] = true;
        excludedFromStaking[address(this)] = true;
        _mint(msg.sender, 1000000 * (10**uint256(tokenDecimals)));
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
    
    // ------------------------------------------------------------------------

    function transferOwnership(address newOwner) public 
    {
        require(msg.sender == contractOwner);
        require(newOwner != address(0));
        emit OwnershipTransferred(contractOwner, newOwner);
        contractOwner = newOwner;
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
    
    function totalSupply() public view returns (uint256) 
    {
        return _totalSupply;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    
    function balanceOf(address owner) public view returns (uint256) 
    {
        return _balances[owner];
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    
    function fullUnitsStaked(address owner) public view returns (uint256) 
    {
        return toFullUnits(_balances[owner]);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    
    function toFullUnits(uint256 valueWithDecimals) public pure returns (uint256) 
    {
        return valueWithDecimals.div(10**uint256(tokenDecimals));
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
    
    function allowance(address owner, address spender) public view returns (uint256) 
    {
        return _allowed[owner][spender];
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    
    function transfer(address to, uint256 value) public returns (bool) 
    {
        _executeTransfer(msg.sender, to, value);
        return true;
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
    
    function multiTransfer(address[] memory receivers, uint256[] memory values) public
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _executeTransfer(msg.sender, receivers[i], values[i]);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    function transferFrom(address from, address to, uint256 value) public returns (bool) 
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _executeTransfer(from, to, value);
        return true;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    function approve(address spender, uint256 value) public returns (bool) 
    {
        require(spender != address(0));
        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) 
    {
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) 
    {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) 
    {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    function _mint(address account, uint256 value) internal 
    {
        require(value != 0);
        
        uint256 initalBalance = _balances[account];
        uint256 newBalance = initalBalance.add(value);
        
        _balances[account] = newBalance;
        _totalSupply = _totalSupply.add(value);
        
        //update full units staked
        if(!excludedFromStaking[account])
        {
            uint256 fus_total = fullUnitsStaked_total;
            fus_total = fus_total.sub(toFullUnits(initalBalance));
            fus_total = fus_total.add(toFullUnits(newBalance));
            fullUnitsStaked_total = fus_total;
        }
        emit Transfer(address(0), account, value);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    function burn(uint256 value) external 
    {
        _burn(msg.sender, value);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    function burnFrom(address account, uint256 value) external 
    {
        require(value <= _allowed[account][msg.sender]);
        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(value);
        _burn(account, value);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    function _burn(address account, uint256 value) internal 
    {
        require(value != 0);
        require(value <= _balances[account]);
        
        uint256 initalBalance = _balances[account];
        uint256 newBalance = initalBalance.sub(value);
        
        _balances[account] = newBalance;
        _totalSupply = _totalSupply.sub(value);
        
        //update full units staked
        if(!excludedFromStaking[account])
        {
            uint256 fus_total = fullUnitsStaked_total;
            fus_total = fus_total.sub(toFullUnits(initalBalance));
            fus_total = fus_total.add(toFullUnits(newBalance));
            fullUnitsStaked_total = fus_total;
        }
        
        emit Transfer(account, address(0), value);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    /*
    *   transfer with additional burn and stake rewards
    *   the receiver gets 94% of the sent value
    *   6% are split to be burnt and distributed to holders
    */
    function _executeTransfer(address from, address to, uint256 value) private
    {
        require(value <= _balances[from]);
        require(to != address(0) && to != address(this));

        //Update sender and receivers rewards - changing balances will change rewards shares
        updateRewardsFor(from);
        updateRewardsFor(to);
        
        uint256 sixPercent = value.mul(6).div(100);
        
        //set a minimum burn rate to prevent no-burn-txs due to precision loss
        if(sixPercent == 0 && value > 0)
            sixPercent = 1;
            
        uint256 initalBalance_from = _balances[from];
        uint256 newBalance_from = initalBalance_from.sub(value);
        
        value = value.sub(sixPercent);
        
        uint256 initalBalance_to = _balances[to];
        uint256 newBalance_to = initalBalance_to.add(value);
        
        //transfer
        _balances[from] = newBalance_from;
        _balances[to] = newBalance_to;
        emit Transfer(from, to, value);
         
        //update full units staked
        uint256 fus_total = fullUnitsStaked_total;
        if(!excludedFromStaking[from])
        {
            fus_total = fus_total.sub(toFullUnits(initalBalance_from));
            fus_total = fus_total.add(toFullUnits(newBalance_from));
        }
        if(!excludedFromStaking[to])
        {
            fus_total = fus_total.sub(toFullUnits(initalBalance_to));
            fus_total = fus_total.add(toFullUnits(newBalance_to));
        }
        fullUnitsStaked_total = fus_total;
        
        uint256 amountToBurn = sixPercent;
        
        if(fus_total > 0)
        {
            uint256 stakingRewards = sixPercent.div(2);
            //split up to rewards per unit in stake
            uint256 rewardsPerUnit = stakingRewards.div(fus_total);
            //apply rewards
            _totalRewardsPerUnit = _totalRewardsPerUnit.add(rewardsPerUnit);
            _balances[address(this)] = _balances[address(this)].add(stakingRewards);
            emit Transfer(msg.sender, address(this), stakingRewards);
    
            amountToBurn = amountToBurn.sub(stakingRewards);
        }
        
        //update total supply
        _totalSupply = _totalSupply.sub(amountToBurn);
        emit Transfer(msg.sender, address(0), amountToBurn);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    //catch up with the current total rewards. This needs to be done before an addresses balance is changed
    function updateRewardsFor(address staker) private
    {
        _savedRewards[staker] = viewUnpaidRewards(staker);
        _totalRewardsPerUnit_positions[staker] = _totalRewardsPerUnit;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    //get all rewards that have not been claimed yet
    function viewUnpaidRewards(address staker) public view returns (uint256)
    {
        if(excludedFromStaking[staker])
            return _savedRewards[staker];
        uint256 newRewardsPerUnit = _totalRewardsPerUnit.sub(_totalRewardsPerUnit_positions[staker]);
        
        uint256 newRewards = newRewardsPerUnit.mul(fullUnitsStaked(staker));
        return _savedRewards[staker].add(newRewards);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    //pay out unclaimed rewards
    function payoutRewards() public
    {
        updateRewardsFor(msg.sender);
        uint256 rewards = _savedRewards[msg.sender];
        require(rewards > 0 && rewards <= _balances[address(this)]);
        
        _savedRewards[msg.sender] = 0;
        
        uint256 initalBalance_staker = _balances[msg.sender];
        uint256 newBalance_staker = initalBalance_staker.add(rewards);
        
        //update full units staked
        if(!excludedFromStaking[msg.sender])
        {
            uint256 fus_total = fullUnitsStaked_total;
            fus_total = fus_total.sub(toFullUnits(initalBalance_staker));
            fus_total = fus_total.add(toFullUnits(newBalance_staker));
            fullUnitsStaked_total = fus_total;
        }
        
        //transfer
        _balances[address(this)] = _balances[address(this)].sub(rewards);
        _balances[msg.sender] = newBalance_staker;
        emit Transfer(address(this), msg.sender, rewards);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    //exchanges or other contracts can be excluded from receiving stake rewards
    function excludeAddressFromStaking(address excludeAddress, bool exclude) public
    {
        require(msg.sender == contractOwner);
        require(excludeAddress != address(this)); //contract may never be included
        require(exclude != excludedFromStaking[excludeAddress]);
        updateRewardsFor(excludeAddress);
        excludedFromStaking[excludeAddress] = exclude;
        fullUnitsStaked_total = exclude ? fullUnitsStaked_total.sub(fullUnitsStaked(excludeAddress)) : fullUnitsStaked_total.add(fullUnitsStaked(excludeAddress));
    }
    
    //withdraw tokens that were sent to this contract by accident
    function withdrawERC20Tokens(address tokenAddress, uint256 amount) public
    {
        require(msg.sender == contractOwner);
        require(tokenAddress != address(this));
        IERC20(tokenAddress).transfer(msg.sender, amount);
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
}