/**
 *Submitted for verification at Etherscan.io on 2020-06-15
*/

pragma solidity ^ 0.5.0;
//11111111111111111111111111111111111111111111111111111111
//11111111111111111111111111111
//1111111111111111111111111
//11111111111111111111111
//1111111111111111111
//11111111111111111111111111111111111111111111111111111111
//11111111111111
library SafeMath {
  function add(uint a, uint b) internal pure returns(uint c) {
    c = a + b;
    require(c >= a);
  }
  function sub(uint a, uint b) internal pure returns(uint c) {
    require(b <= a);
    c = a - b;
  }
  function mul(uint a, uint b) internal pure returns(uint c) {
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function div(uint a, uint b) internal pure returns(uint c) {
    require(b > 0);
    c = a / b;
  }
}
//11ERC2011111
contract ERC20Interface {
  function totalSupply() public view returns(uint);
  function balanceOf(address tokenOwner) public view returns(uint balance);
  function allowance(address tokenOwner, address spender) public view returns(uint remaining);
  function transfer(address to, uint tokens) public returns(bool success);
  function approve(address spender, uint tokens) public returns(bool success);
  function transferFrom(address from, address to, uint tokens) public returns(bool success);
  event Transfer(address indexed from, address indexed to, uint tokens);
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract ApproveAndCallFallBack {
  function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
}
//11owner111111111newowner
contract Owned {
  address public owner;
  event OwnershipTransferred(address indexed _from, address indexed _to);
  constructor() public {
    owner = msg.sender;
  }
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }
  function transferOwnership(address newOwner) public onlyOwner {
    owner = newOwner;
    emit OwnershipTransferred(owner, newOwner);
  }
}
//1111ODM1111
contract Tokenlock is Owned {
  uint8 isLocked = 0;
  event Freezed();
  event UnFreezed();
  modifier validLock {
    require(isLocked == 0);
    _;
  }
  function freeze() public onlyOwner {
    isLocked = 1;
    emit Freezed();
  }
  function unfreeze() public onlyOwner {
    isLocked = 0;
    emit UnFreezed();
  }
}
//1111111
contract UserLock is Owned {
  mapping(address => bool) blacklist;
  event LockUser(address indexed who);
  event UnlockUser(address indexed who);
  modifier permissionCheck {
    require(!blacklist[msg.sender]);
    _;
  }
  function lockUser(address who) public onlyOwner {
    blacklist[who] = true;
    emit LockUser(who);
  }
  function unlockUser(address who) public onlyOwner {
    blacklist[who] = false;
    emit UnlockUser(who);
  }
}
//1111111111111111111function1
contract ODMToken is ERC20Interface, Tokenlock, UserLock {
  using SafeMath for uint;
    string public symbol;
  string public name;
  uint8 public decimals;
  uint _totalSupply;
  mapping(address => uint) balances;
  mapping(address => mapping(address => uint256)) public allowed;
  constructor() public {
    symbol = "ODM";
    name = "ODM";//111
    decimals = 8;//1111
    _totalSupply = 100000000;//1111
    balances[owner] = _totalSupply;
    emit Transfer(address(0), owner, _totalSupply);
  }
  //1111ODM11111111
  function totalSupply() public view returns(uint) {
    return _totalSupply.sub(balances[address(0)]);
  }
  //111111111
  function balanceOf(address tokenOwner) public view returns(uint balance) {
    return balances[tokenOwner];
  }
  //11111111111111
  function transfer(address to, uint tokens) public validLock permissionCheck returns(bool success) {
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
  }
  //111111111111111111111
  //11111111111111111111111
  //1111111to https://blog.csdn.net/weixin_43343144/article/details/89017364
  function approve(address spender, uint tokens) public validLock permissionCheck returns(bool success) 
{
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
  }
  //1111111111111111111111111111111
  //111111
  function transferFrom(address _from, address to, uint tokens) public validLock permissionCheck 
returns(bool success) {
    balances[_from] = balances[_from].sub(tokens);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(_from, to, tokens);
    return true;
  }
  //1111111111111111111111
  function allowance(address tokenOwner, address spender) public view returns(uint remaining) {
    return allowed[tokenOwner][spender];
  }
  //1111111111111ODM1ODM111111
  function burn(uint256 value) public validLock permissionCheck returns(bool success) {
    require(msg.sender != address(0));
    _totalSupply = _totalSupply.sub(value);
    balances[msg.sender] = balances[msg.sender].sub(value);
    emit Transfer(msg.sender, address(0), value);
    return true;
  }
  //1111
  //111111to https://blog.csdn.net/weixin_38746124/article/details/81511227
  function approveAndCall(address spender, uint tokens, bytes memory data) public validLock 
permissionCheck returns(bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
    return true;
  }
  //111111
  function () external payable {
    revert();
  }
  //owner11111111ERC2011
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns(bool 
success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }
}