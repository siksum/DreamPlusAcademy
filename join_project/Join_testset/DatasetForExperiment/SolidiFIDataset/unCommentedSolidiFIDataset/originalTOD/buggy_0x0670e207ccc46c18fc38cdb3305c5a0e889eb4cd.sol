/**
 *Submitted for verification at Etherscan.io on 2020-07-15
*/

pragma solidity ^0.5.16;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract Context {
    constructor () internal { }
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
    

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
}

contract Ownable is Context {
    address private _owner;
    constructor () internal {
        _owner = _msgSender();
    }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
    function owner() public view returns (address) {
        return _owner;
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
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
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
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
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
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
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
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
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
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
    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
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
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
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
    function name() public view returns (string memory) {
        return _name;
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
    function symbol() public view returns (string memory) {
        return _symbol;
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
    function decimals() public view returns (uint8) {
        return _decimals;
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
}

contract ReentrancyGuard {
  address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  uint private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
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

    modifier nonReentrant() {
        _guardCounter += 1;
        uint localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint a, uint b) internal pure returns (uint) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint a, uint b) internal pure returns (uint) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
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

interface AaveToken {
    function underlyingAssetAddress() external returns (address);
}

interface Oracle {
    function getPriceUSD(address reserve) external view returns (uint);
}

interface UniswapRouter {
  function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
  ) external returns (uint amountA, uint amountB, uint liquidity);
  function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function factory() external view returns (address);
    function claim(address, address) external;
    function redirectInterestStream(address) external;
}
interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

contract SupplyToken is ERC20, ERC20Detailed, Ownable {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;

  constructor (
      string memory name,
      string memory symbol,
      uint8 decimals
  ) public ERC20Detailed(name, symbol, decimals) {}
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

  function mint(address account, uint amount) public onlyOwner {
      _mint(account, amount);
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
  function burn(address account, uint amount) public onlyOwner {
      _burn(account, amount);
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
}

contract StableAMM is ERC20, ERC20Detailed, ReentrancyGuard {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    address public constant link = address(0x5f0711c689Ed216f97D91126C112Ad585d1a7aba);
    address public constant unirouter = address(0x7Ba29E643Ef0B7A56FB850Ac0E2023f938B78435);
    address public constant vault = address(0xb99a40fcE04cb740EB79fC04976CA15aF69AaaaE);

  bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
  mapping (address => address) public tokens;
    
    
    
  bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }
  mapping (address => uint) public index;
  address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
  mapping (address => uint) public bal;
  address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }
  mapping (address => mapping (address => uint)) public supplyIndex;

    
    constructor () public ERC20Detailed("AMM USD", "aUSD", 8) {}
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
    
    function rewardInterest(address token) public {
        address _uni = getUNI(token);
        if (IERC20(_uni).totalSupply() > 0) {
            uint256 _bal = IERC20(token).balanceOf(address(this));
            if (_bal > 0) {
                uint256 _diff = _bal.sub(bal[token]);
                if (_diff > 0) {
                    uint256 _ratio = _diff.mul(ERC20Detailed(_uni).decimals()).div(IERC20(_uni).totalSupply());
                    if (_ratio > 0) {
                      index[token] = index[token].add(_ratio);
                      bal[token] = _bal;
                    }
                }
            }
        }
        uint _supplied = IERC20(_uni).balanceOf(msg.sender);
        if (_supplied > 0) {
            uint256 _supplyIndex = supplyIndex[token][msg.sender];
            supplyIndex[token][msg.sender] = index[token];
            uint256 _delta = index[token].sub(_supplyIndex);
            if (_delta > 0) {
              uint256 _share = _supplied.mul(_delta).div(ERC20Detailed(_uni).decimals());

              IERC20(token).safeTransfer(msg.sender, _share);
              bal[token] = IERC20(token).balanceOf(address(this));
            }
        } else {
            supplyIndex[token][msg.sender] = index[token];
        }
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
    
    function getUNI(address _token) public view returns (address) {
        address pair = IUniswapV2Factory(UniswapRouter(unirouter).factory()).getPair(_token, address(this));
        return tokens[pair];
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
    
    function depositAave(address token, uint amount) external nonReentrant {
        rewardInterest(token);
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        address underlying = AaveToken(token).underlyingAssetAddress();
        _deposit(token, underlying, amount);
        rewardInterest(token);
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
    
    function deposit(address token, uint amount) external nonReentrant {
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        _deposit(token, token, amount);
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
    
    function _deposit(address token, address underlying, uint amount) internal {
        uint value = Oracle(link).getPriceUSD(underlying).mul(amount).div(uint256(10)**ERC20Detailed(underlying).decimals());
        require(value > 0, "!value");
        _mint(address(this), value); 

        IERC20(token).safeApprove(unirouter, 0);
        IERC20(token).safeApprove(unirouter, amount);

        IERC20(address(this)).safeApprove(unirouter, 0);
        IERC20(address(this)).safeApprove(unirouter, value);
        
        (,,uint liquidity) = UniswapRouter(unirouter).addLiquidity(
            token,
            address(this),
            amount,
            value,
            0,
            0,
            address(this),
            now.add(1800)
        );

        address pair = IUniswapV2Factory(UniswapRouter(unirouter).factory()).getPair(token, address(this));
        require(pair != address(0), "!pair");
        if (tokens[pair] == address(0)) {
            tokens[pair] = address(new SupplyToken(
                string(abi.encodePacked(ERC20Detailed(token).symbol(), " ", ERC20Detailed(pair).name())),
                string(abi.encodePacked(ERC20Detailed(token).symbol(), ERC20Detailed(pair).symbol())),
                ERC20Detailed(pair).decimals()
            ));
            if (token != underlying) {
                UniswapRouter(unirouter).redirectInterestStream(token);
            }
        }
        
        SupplyToken(tokens[pair]).mint(msg.sender, liquidity);
        uint dust = IERC20(token).balanceOf(address(this));
        if (dust > 0){
            IERC20(token).safeTransfer(msg.sender, dust);
        }
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
    
    function withdrawAave(address token, uint amount) external nonReentrant {
        rewardInterest(token);
        (uint amountA, uint amountB) = _withdraw(token, amount);
        address underlying = AaveToken(token).underlyingAssetAddress();
        _return(token, underlying, amountA, amountB, amountA);
        rewardInterest(token);
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
    
    function withdraw(address token, uint amount) external nonReentrant {
        (uint amountA, uint amountB) = _withdraw(token, amount);
        _return(token, token, amountA, amountB, amountA);
    }
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

    function _withdraw(address token, uint amount) internal returns (uint amountA, uint amountB) {
        address pair = IUniswapV2Factory(UniswapRouter(unirouter).factory()).getPair(token, address(this));
        SupplyToken(tokens[pair]).burn(msg.sender, amount);
        
        IERC20(pair).safeApprove(unirouter, 0);
        IERC20(pair).safeApprove(unirouter, amount);
        
        (amountA, amountB) = UniswapRouter(unirouter).removeLiquidity(
          token,
          address(this),
          amount,
          0,
          0,
          address(this),
          now.add(1800)
        );
    }
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
    
    function _return(address token, address underlying, uint amountA, uint amountB, uint amountUnderlying) internal {
        uint valueA = Oracle(link).getPriceUSD(underlying).mul(amountUnderlying).div(uint256(10)**ERC20Detailed(underlying).decimals());
        require(valueA > 0, "!value");
        if (valueA > amountB) {
            amountA = amountA.mul(amountB).div(valueA);
            valueA = amountB;
        }
        _burn(address(this), valueA); 
        IERC20(token).safeTransfer(msg.sender, amountA);
        if (amountB > valueA) {
            IERC20(address(this)).transfer(msg.sender, amountB.sub(valueA));
        }
        uint dust = IERC20(token).balanceOf(address(this));
        if (dust > 0) {
            IERC20(token).safeTransfer(vault,IERC20(token).balanceOf(address(this)));
            IERC20(address(this)).safeTransfer(vault,IERC20(token).balanceOf(address(this)));
        }
    }
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
}