pragma solidity ^0.5.4;

// ----------------------------------------------------------------------------
// 'ZEENUS' 'Zeenus 1' token contract with a faucet minting for testing
//
// Send an 0 value transaction with no data to mint 1,000 new tokens
//
// Symbol      : ZEENUS
// Name        : Zeenus 1
// Total supply: 1,000,000.000000000000000000 + faucet minting
// Decimals    : 0
// Deployed to : Mainnet 0x0693c3a780A0a757E803a4BD76bCf43d438f8806
//
//
// Enjoy.
//
// (c) BokkyPooBah / Bok Consulting Pty Ltd 2019. The MIT Licence.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and a
// fixed supply
// ----------------------------------------------------------------------------
contract ZeenusToken is ERC20Interface, Owned {
    using SafeMath for uint;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  string public  name;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint _totalSupply;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  uint _drop;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) balances;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint)) allowed;

    constructor() public {
        symbol = "ZEENUS";
        name = "Zeenus 1";
        decimals = 0;
        _totalSupply = 1000000 * 10**uint(decimals);
        _drop = 1000 * 10**uint(decimals);
        balances[owner] = _totalSupply;
        emit Transfer(address(0), owner, _totalSupply);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function totalSupply() public view returns (uint) {
        return _totalSupply.sub(balances[address(0)]);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function mint(address tokenOwner, uint tokens) internal returns (bool success) {
        balances[tokenOwner] = balances[tokenOwner].add(tokens);
        _totalSupply = _totalSupply.add(tokens);
        emit Transfer(address(0), tokenOwner, tokens);
        return true;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function drip() public {
        mint(msg.sender, _drop);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function () external payable {
        mint(msg.sender, _drop);
        if (msg.value > 0) {
            msg.sender.transfer(msg.value);
        }
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}