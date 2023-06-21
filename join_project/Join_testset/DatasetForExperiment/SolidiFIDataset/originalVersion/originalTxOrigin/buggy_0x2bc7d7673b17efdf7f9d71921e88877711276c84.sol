/**
 *Submitted for verification at Etherscan.io on 2020-07-16
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
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
}

contract Ownable is Context {
    address private _owner;
    constructor () internal {
        _owner = _msgSender();
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
    function owner() public view returns (address) {
        return _owner;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
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
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
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
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    function name() public view returns (string memory) {
        return _name;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
}

contract ReentrancyGuard {
    uint private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
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
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
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

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
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
  function setRouter(address _router) external;
  function setAMM(address _amm) external;
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
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

  function mint(address account, uint amount) public onlyOwner {
      _mint(account, amount);
  }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  function burn(address account, uint amount) public onlyOwner {
      _burn(account, amount);
  }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
}

contract StableAMM is ERC20, ERC20Detailed, ReentrancyGuard {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    address public link = address(0x5f0711c689Ed216f97D91126C112Ad585d1a7aba);
    address public vault = address(0xb99a40fcE04cb740EB79fC04976CA15aF69AaaaE);
    address public unirouter;
    address public governance;
    
    mapping (address => address) public tokens;
    
    // Reward system
    
    mapping (address => uint) public index;
    mapping (address => uint) public bal;
    mapping (address => mapping (address => uint)) public supplyIndex;

    
    constructor (address router) public ERC20Detailed("AMM USD", "aUSD", 8) {
        unirouter = router;
        governance = msg.sender;
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
    
    function setRouter(address router) external {
        require(msg.sender == governance, "!governance");
        unirouter = router;
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    function setLink(address _link) external {
        require(msg.sender == governance, "!governance");
        link = _link;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    function setVault(address _vault) external {
        require(msg.sender == governance, "!governance");
        vault = _vault;
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    function setGovernance(address _governance) external {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    function setFactoryRouter(address _router) external {
        require(msg.sender == governance,  "!governance");
        UniswapRouter(unirouter).setRouter(_router);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    function setRouterAMM(address _amm) external {
        require(msg.sender == governance,  "!governance");
        UniswapRouter(unirouter).setAMM(_amm);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    function claim(address pair, address token) external {
        require(msg.sender == governance,  "!governance");
        uint _before = IERC20(token).balanceOf(address(this));
        UniswapRouter(unirouter).claim(pair, token);
        uint _after = IERC20(token).balanceOf(address(this));
        if (_after > _before) {
            IERC20(token).safeTransfer(vault, _after.sub(_before));
        }
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    function rewardInterest(address token) public {
        address _uni = getUNI(token);
        if (_uni != address(0)) {
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
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    function getUNI(address _token) public view returns (address) {
        address pair = IUniswapV2Factory(UniswapRouter(unirouter).factory()).getPair(_token, address(this));
        return tokens[pair];
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    function depositAave(address token, uint amount) external nonReentrant {
        rewardInterest(token);
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        address underlying = AaveToken(token).underlyingAssetAddress();
        _deposit(token, underlying, amount);
        rewardInterest(token);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    function deposit(address token, uint amount) external nonReentrant {
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        _deposit(token, token, amount);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function _deposit(address token, address underlying, uint amount) internal {
        uint value = Oracle(link).getPriceUSD(underlying).mul(amount).div(uint256(10)**ERC20Detailed(token).decimals());
        require(value > 0, "!value");
        _mint(address(this), value); // Amount of aUSD to mint

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
                UniswapRouter(unirouter).redirectInterestStream(pair);
            }
        }
        
        SupplyToken(tokens[pair]).mint(msg.sender, liquidity);
        uint dust = IERC20(token).balanceOf(address(this));
        if (dust > 0){
            IERC20(token).safeTransfer(msg.sender, dust);
        }
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    function withdrawAave(address token, uint amount) external nonReentrant {
        rewardInterest(token);
        (uint amountA, uint amountB) = _withdraw(token, amount);
        address underlying = AaveToken(token).underlyingAssetAddress();
        _return(token, underlying, amountA, amountB);
        rewardInterest(token);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    function withdraw(address token, uint amount) external nonReentrant {
        (uint amountA, uint amountB) = _withdraw(token, amount);
        _return(token, token, amountA, amountB);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
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
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
    function _return(address token, address underlying, uint amountA, uint amountB) internal {
        uint valueA = Oracle(link).getPriceUSD(underlying).mul(amountA).div(uint256(10)**ERC20Detailed(token).decimals());
        require(valueA > 0, "!value");
        if (valueA > amountB) {
            amountA = amountA.mul(amountB).div(valueA);
            valueA = amountB;
        }
        _burn(address(this), valueA); // Amount of fUSD to burn (value of A leaving the system)
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
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
}