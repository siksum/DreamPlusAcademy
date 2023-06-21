pragma solidity 0.5.8;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);
    return c;
  }
}

contract ERC20 {
  function totalSupply()public view returns (uint256 total_Supply);
  function balanceOf(address who)public view returns (uint256);
  function allowance(address owner, address spender)public view returns (uint256);
  function transferFrom(address from, address to, uint256 value)public returns (bool ok);
  function approve(address spender, uint256 value)public returns (bool ok);
  function transfer(address to, uint256 value)public returns (bool ok);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract KOZJIN is ERC20 { 
    using SafeMath for uint256;
    //--- Token configurations ----// 
    string private constant _name = "KOZJIN Token";
    string private constant _symbol = "KOZ";
    uint8 private constant _decimals = 18;
    uint256 private constant _maxCap = 300000000 ether;
    uint256 private _icoStartDate = 1560744000;   // 17-06-2019 12:00 GMT+8
    uint256 private _icoEndDate = 1562558400;     // 08-07-2019 12:00 GMT+8
    
    //--- Token allocations -------//
    uint256 private _totalsupply;

    //--- Address -----------------//
    address private _owner;
    address payable private _ethFundMain;
   
    //--- Variables ---------------//
    bool private _lockToken = true;
    bool private _allowICO = true;
    
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;
    mapping(address => bool) private locked;
    
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  event Mint(address indexed from, address indexed to, uint256 amount);
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address indexed from, uint256 amount);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event ChangeReceiveWallet(address indexed newAddress);
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event ChangeOwnerShip(address indexed newOwner);
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event ChangeLockStatusFrom(address indexed investor, bool locked);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event ChangeTokenLockStatus(bool locked);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event ChangeAllowICOStatus(bool allow);
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner is allowed");
        _;
    }

    modifier onlyICO() {
        require(now >= _icoStartDate && now < _icoEndDate, "CrowdSale is not running");
        _;
    }

    modifier onlyFinishedICO() {
        require(now >= _icoEndDate, "CrowdSale is running");
        _;
    }
    
    modifier onlyAllowICO() {
        require(_allowICO, "ICO stopped");
        _;
    }
    
    modifier onlyUnlockToken() {
        require(!_lockToken, "Token locked");
        _;
    }

    constructor() public
    {
        _owner = msg.sender;
    }
    
    function name() public pure returns (string memory) {
        return _name;
    }
    
    function symbol() public pure returns (string memory) {
        return _symbol;
    }
    
    function decimals() public pure returns (uint8) {
        return _decimals;
    }
    
    function maxCap() public pure returns (uint256) {
        return _maxCap;
    }
    
    function owner() public view returns (address) {
        return _owner;
    }
    
    function ethFundMain() public view returns (address) {
        return _ethFundMain;
    }
    
    function icoStartDate() public view returns (uint256) {
        return _icoStartDate;
    }
    
    function icoEndDate() public view returns (uint256) {
        return _icoEndDate;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    function lockToken() public view returns (bool) {
        return _lockToken;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
    function allowICO() public view returns (bool) {
        return _allowICO;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    function lockStatusOf(address investor) public view returns (bool) {
        return locked[investor];
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function totalSupply() public view returns (uint256) {
        return _totalsupply;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
    
    function balanceOf(address investor) public view returns (uint256) {
        return balances[investor];
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    function approve(address _spender, uint256 _amount) public onlyFinishedICO onlyUnlockToken returns (bool)  {
        require( _spender != address(0), "Address can not be 0x0");
        require(balances[msg.sender] >= _amount, "Balance does not have enough tokens");
        require(!locked[msg.sender], "Sender address is locked");
        require(!locked[_spender], "Spender address is locked");
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  
    function allowance(address _from, address _spender) public view returns (uint256) {
        return allowed[_from][_spender];
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint256 _amount) public onlyFinishedICO onlyUnlockToken returns (bool) {
        require( _to != address(0), "Receiver can not be 0x0");
        require(!locked[msg.sender], "Sender address is locked");
        require(!locked[_to], "Receiver address is locked");
        balances[msg.sender] = (balances[msg.sender]).sub(_amount);
        balances[_to] = (balances[_to]).add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferFrom( address _from, address _to, uint256 _amount ) public onlyFinishedICO onlyUnlockToken returns (bool)  {
        require( _to != address(0), "Receiver can not be 0x0");
        require(!locked[_from], "From address is locked");
        require(!locked[_to], "Receiver address is locked");
        balances[_from] = (balances[_from]).sub(_amount);
        allowed[_from][msg.sender] = (allowed[_from][msg.sender]).sub(_amount);
        balances[_to] = (balances[_to]).add(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function burn(uint256 _value) public onlyOwner returns (bool) {
        balances[msg.sender] = (balances[msg.sender]).sub(_value);            
        _totalsupply = _totalsupply.sub(_value);                     
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function stopTransferToken() external onlyOwner {
        _lockToken = true;
        emit ChangeTokenLockStatus(true);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function startTransferToken() external onlyOwner {
        _lockToken = false;
        emit ChangeTokenLockStatus(false);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function () external payable onlyICO onlyAllowICO {
        
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function manualMint(address receiver, uint256 _value) public onlyOwner{
        uint256 value = _value.mul(10 ** 18);
        mint(_owner, receiver, value);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function mint(address from, address receiver, uint256 value) internal {
        require(receiver != address(0), "Address can not be 0x0");
        require(value > 0, "Value should larger than 0");
        balances[receiver] = balances[receiver].add(value);
        _totalsupply = _totalsupply.add(value);
        require(_totalsupply <= _maxCap, "CrowdSale hit max cap");
        emit Mint(from, receiver, value);
        emit Transfer(address(0), receiver, value);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    function haltCrowdSale() external onlyOwner {
        _allowICO = false;
        emit ChangeAllowICOStatus(false);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function resumeCrowdSale() external onlyOwner {
        _allowICO = true;
        emit ChangeAllowICOStatus(true);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function changeReceiveWallet(address payable newAddress) external onlyOwner {
        require(newAddress != address(0), "Address can not be 0x0");
        _ethFundMain = newAddress;
        emit ChangeReceiveWallet(newAddress);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

	function assignOwnership(address newOwner) external onlyOwner {
	    require(newOwner != address(0), "Address can not be 0x0");
	    _owner = newOwner;
	    emit ChangeOwnerShip(newOwner);
	}
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function forwardFunds() external onlyOwner {
        require(_ethFundMain != address(0));
        _ethFundMain.transfer(address(this).balance);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function haltTokenTransferFromAddress(address investor) external onlyOwner {
        locked[investor] = true;
        emit ChangeLockStatusFrom(investor, true);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function resumeTokenTransferFromAddress(address investor) external onlyOwner {
        locked[investor] = false;
        emit ChangeLockStatusFrom(investor, false);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}