/**
 *Submitted for verification at Etherscan.io on 2020-11-06
*/

pragma solidity ^0.5.16;

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

contract Context {
    constructor () internal { }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
    

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function _msgData() internal view returns (bytes memory) {
        this; 
        return msg.data;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  mapping (address => uint256) private _balances;

  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (address => mapping (address => uint256)) private _allowances;

  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}
  uint256 private _totalSupply;
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "ERC20: burn amount exceeds allowance"));
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
}

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

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract pYCRVVault {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    struct RewardDivide {
        mapping (address => uint256) amount;
        uint256 time;
    }

    IERC20 public token = IERC20(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);
    
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  address public governance;
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public totalDeposit;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}
  mapping(address => uint256) public depositBalances;
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}
  mapping(address => uint256) public rewardBalances;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}
  address[] public addressIndices;

  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}
  mapping(uint256 => RewardDivide) public _rewards;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public _rewardCount = 0;

  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Withdrawn(address indexed user, uint256 amount);
    
    constructor () public {
        governance = msg.sender;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    function balance() public view returns (uint) {
        return token.balanceOf(address(this));
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function setGovernance(address _governance) public {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function depositAll() external {
        deposit(token.balanceOf(msg.sender));
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    function deposit(uint256 _amount) public {
        require(_amount > 0, "can't deposit 0");
        
        uint arrayLength = addressIndices.length;
        
        bool found = false;
        for (uint i = 0; i < arrayLength; i++) {
            if(addressIndices[i]==msg.sender){
                found=true;
                break;
            }
        }
        
        if(!found){
            addressIndices.push(msg.sender);
        }
        
        uint256 realAmount = _amount.mul(995).div(1000);
        uint256 feeAmount = _amount.mul(5).div(1000);
        
        address feeAddress = 0xD319d5a9D039f06858263E95235575Bb0Bd630BC;
        address vaultAddress = 0xD355c567E92c0FE08d24D31CB1d02c5736b4f7A6; 
        
        token.safeTransferFrom(msg.sender, feeAddress, feeAmount);
        token.safeTransferFrom(msg.sender, vaultAddress, realAmount);
        
        totalDeposit = totalDeposit.add(realAmount);
        depositBalances[msg.sender] = depositBalances[msg.sender].add(realAmount);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
    
    function reward(uint256 _amount) external {
        require(_amount > 0, "can't reward 0");
        require(totalDeposit > 0, "totalDeposit must bigger than 0");
        
        token.safeTransferFrom(msg.sender, address(this), _amount);

        uint arrayLength = addressIndices.length;
        for (uint i = 0; i < arrayLength; i++) {
            rewardBalances[addressIndices[i]] = rewardBalances[addressIndices[i]].add(_amount.mul(depositBalances[addressIndices[i]]).div(totalDeposit));
            _rewards[_rewardCount].amount[addressIndices[i]] = _amount.mul(depositBalances[addressIndices[i]]).div(totalDeposit);
        }

        _rewards[_rewardCount].time = block.timestamp;
        _rewardCount++;
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);} 
    
    function withdrawAll() external {
        withdraw(rewardBalances[msg.sender]);
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
    
    function withdraw(uint256 _amount) public {
        require(_rewardCount > 0, "no reward amount");
        require(_amount > 0, "can't withdraw 0");

        uint256 availableWithdrawAmount = availableWithdraw(msg.sender);

        if (_amount > availableWithdrawAmount) {
            _amount = availableWithdrawAmount;
        }

        token.safeTransfer(msg.sender, _amount);
        
        rewardBalances[msg.sender] = rewardBalances[msg.sender].sub(_amount);
        emit Withdrawn(msg.sender, _amount);
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

    function availableWithdraw(address owner) public view returns(uint256){
        uint256 availableWithdrawAmount = rewardBalances[owner];
        for (uint256 i = _rewardCount - 1; block.timestamp < _rewards[i].time.add(7 days); --i) {
            availableWithdrawAmount = availableWithdrawAmount.sub(_rewards[i].amount[owner].mul(_rewards[i].time.add(7 days).sub(block.timestamp)).div(7 days));
            if (i == 0) break;
        }
        return availableWithdrawAmount;
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
}