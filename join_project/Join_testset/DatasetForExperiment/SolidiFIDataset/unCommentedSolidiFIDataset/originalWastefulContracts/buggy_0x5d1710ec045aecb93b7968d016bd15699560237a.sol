pragma solidity ^0.5.3;

interface Token {
  function transfer( address to, uint amount ) external;
  function transferFrom( address from, address to, uint quantity ) external;
}

contract Owned
{
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address payable public owner;
  constructor() public { owner = msg.sender; }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function changeOwner( address payable newOwner ) isOwner public {
    owner = newOwner;
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  modifier isOwner {
    require( msg.sender == owner );
    _;
  }
}

contract Membership is Owned
{
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Approval( address indexed member, bool status );
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Receipt( address indexed member, uint256 amount );
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event ReceiptTokens( address indexed member, uint256 amount );

function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping( address => bool ) public approvals;

function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  address payable public treasury;
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public fee;
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  Token   public token;
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public tokenFee;
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint256 dao;

  constructor() public {
    dao = uint256(100);
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

  function setFee( uint256 _fee ) isOwner public {
    fee = _fee;
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  function setDao( uint256 _dao ) isOwner public {
    dao = _dao;
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

  function setTreasury( address payable _treasury ) isOwner public {
    treasury = _treasury;
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  function setToken( address _token ) isOwner public {
    token = Token(_token);
  }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  function setTokenFee( uint _tfee ) isOwner public {
    tokenFee = _tfee;
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

  function setApproval( address _member, bool _status ) isOwner public {
    approvals[_member] = _status;
    emit Approval( _member, _status );
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

  function isMember( address _addr ) view public returns (bool) {
    return approvals[_addr];
  }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

  function() payable external {
    require( msg.value >= fee, "Insufficient value." );

    if (treasury != address(0))
      treasury.transfer( msg.value - msg.value / dao );

    emit Receipt( msg.sender, msg.value );
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  function payWithTokens() public {
    require( token != Token(0) && tokenFee > 0, "Token not set up." );

    token.transferFrom( msg.sender, address(this), tokenFee );

    if (treasury != address(0))
      token.transfer( treasury, tokenFee - tokenFee / dao );

    emit ReceiptTokens( msg.sender, tokenFee );
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  function withdraw( uint256 amount ) isOwner public {
    owner.transfer( amount );
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

  function sendTok( address _tok, address _to, uint256 _qty ) isOwner public {
    Token(_tok).transfer( _to, _qty );
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}