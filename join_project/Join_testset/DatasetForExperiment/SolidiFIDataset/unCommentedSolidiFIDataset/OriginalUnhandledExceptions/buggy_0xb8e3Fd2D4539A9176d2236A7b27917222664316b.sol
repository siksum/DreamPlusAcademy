/**
 *Submitted for verification at Etherscan.io on 2020-09-22
*/

pragma solidity 0.5.16;

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
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}
    

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (address => uint) private _balances;

  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (address => mapping (address => uint)) private _allowances;

  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function balanceOf(address account) external view returns (uint) {
        return _balances[account];
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
    function transfer(address recipient, uint amount) external returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function allowance(address owner, address spender) external view returns (uint) {
        return _allowances[owner][spender];
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function approve(address spender, uint amount) external returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function transferFrom(address sender, address recipient, uint amount) external returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    function increaseAllowance(address spender, uint addedValue) external returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    function decreaseAllowance(address spender, uint subtractedValue) external returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
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
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
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
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal { }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
}

contract ERC20Detailed is IERC20 {
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  string private _name;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  string private _symbol;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}
  uint8 private _decimals;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  uint256 private _cap;

    constructor (string memory name, string memory symbol, uint8 decimals, uint256 cap) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _cap = cap;
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    function name() external view returns (string memory) {
        return _name;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    function symbol() external view returns (string memory) {
        return _symbol;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function decimals() external view returns (uint8) {
        return _decimals;
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    /**
     * @dev Returns the cap on the token's total supply.
     */
    function cap() public view returns (uint256) {
        return _cap;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
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

/**
 * AVO Token
 */
pragma solidity 0.5.16;

contract AVO is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public governance;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}
  address public pendingGov;

  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}
  mapping (address => bool) public minters;

  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event NewPendingGov(address oldPendingGov, address newPendingGov);

  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event NewGov(address oldGov, address newGov);

    
    modifier onlyGov() {
        require(msg.sender == governance, "AVO-Token: You are not the governance");
        _;
    }

    constructor () public ERC20Detailed("avocadoswap.com", "AVO", 18, 100000 * 10 ** 18) {
        governance = tx.origin;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /** 
     * Minte Token for Account
     * @param _account minter
     * @param _amount amount
     */
    function mint(address _account, uint256 _amount) external {
        require(minters[msg.sender], "AVO-Token: You are not the minter");
        _mint(_account, _amount);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    /** 
     * Add minter
     * @param _minter minter
     */
    function addMinter(address _minter) external onlyGov {
        minters[_minter] = true;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    /** 
     * Remove minter
     * @param _minter minter
     */
    function removeMinter(address _minter) external onlyGov {
        minters[_minter] = false;
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    /** 
     * Set new governance
     * @param _pendingGov the new governance
     */
    function setPendingGov(address _pendingGov)
        external
        onlyGov
    {
        address oldPendingGov = pendingGov;
        pendingGov = _pendingGov;
        emit NewPendingGov(oldPendingGov, _pendingGov);
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

    /** 
     * lets msg.sender accept governance
     */
    function acceptGov()
        external {
        require(msg.sender == pendingGov, "AVO-Token: You are not the pending governance");
        address oldGov = governance;
        governance = pendingGov;
        pendingGov = address(0);
        emit NewGov(oldGov, governance);
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }

    /**
     * @dev See {ERC20-_beforeTokenTransfer}.
     *
     * Requirements:
     *
     * - minted tokens must not cause the total supply to go over the cap.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal {
        super._beforeTokenTransfer(from, to, amount);

        if (from == address(0)) { 
            require(totalSupply().add(amount) <= cap(), "AVO-Token: Capacity exceeded");
        }
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
}