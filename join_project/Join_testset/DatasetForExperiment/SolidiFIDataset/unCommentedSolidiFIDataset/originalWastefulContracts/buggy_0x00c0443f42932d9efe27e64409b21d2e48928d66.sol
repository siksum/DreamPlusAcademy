/**
 *Submitted for verification at Etherscan.io on 2020-02-26
*/

/**
 *Submitted for verification at Etherscan.io on 2019-05-27
*/

pragma solidity ^0.5.8;

/**
 * Math operations with safety checks
 */
library SafeMath {
  function mul(uint a, uint b) internal pure returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint a, uint b) internal pure returns (uint) {
    
    uint c = a / b;
    
    return c;
  }

  function sub(uint a, uint b) internal pure returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function add(uint a, uint b) internal pure returns (uint) {
    uint c = a + b;
    assert(c >= a);
    return c;
  }

  function max64(uint64 a, uint64 b) internal pure returns (uint64) {
    return a >= b ? a : b;
  }

  function min64(uint64 a, uint64 b) internal pure returns (uint64) {
    return a < b ? a : b;
  }

  function max256(uint256 a, uint256 b) internal pure returns (uint256) {
    return a >= b ? a : b;
  }

  function min256(uint256 a, uint256 b) internal pure returns (uint256) {
    return a < b ? a : b;
  }
}


contract EIP20Interface {
    
    /
    uint256 public totalSupply;

    /
    /
    function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    /
    /
    /
    /
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /
    /
    /
    /
    /
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    /
    /
    /
    /
    function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /
    /
    /
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}


contract EIP20 is EIP20Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balances;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowed;
    interfaces might not even bother to look at this information.
    */
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  string public name;                   
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;                
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;                 

    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) public {
        balances[msg.sender] = _initialAmount;               
        totalSupply = _initialAmount;                        
        name = _tokenName;                                   
        decimals = _decimalUnits;                            
        symbol = _tokenSymbol;                               
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); 
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); 
        return true;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}


contract JarvisExchange {
    using SafeMath for uint256;

    constructor(address _escrow) public {
        require(_escrow != address(0));
        escrow = _escrow;
        
        
        
        TokenAddress[1] = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    
    
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  address public escrow;
    uint public minWithdraw = 1 * 10**16;
    uint public maxWithdraw = 1000000 * 10**18;
    
    
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping(uint256 => address) public TokenAddress;


    /**
    * list setting function
    */
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bool) public isController;

    /**
     * List event
     */
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Withdraw(address indexed user, uint amount, uint timeWithdraw, uint tokenIndex);

    modifier onlyEscrow() {
        require(msg.sender == escrow);
        _;
    }

    modifier onlyController {
        require(isController[msg.sender] == true);
        _;
    }

    
    /**
     * Admin function
     */
    function() external payable {}
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function changeEscrow(address _escrow) public
    onlyEscrow
    {
        require(_escrow != address(0));
        escrow = _escrow;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function changeMinWithdraw(uint _minWithdraw) public
    onlyEscrow
    {
        require(_minWithdraw != 0);
        minWithdraw = _minWithdraw;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function changeMaxWithdraw(uint _maxNac) public
    onlyEscrow
    {
        require(_maxNac != 0);
        maxWithdraw = _maxNac;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /
    /
    function withdrawEther(uint _amount, address payable _to) public
    onlyEscrow
    {
        require(_to != address(0x0));
        
        if (address(this).balance > 0) {
            _to.transfer(_amount);
        }
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * make new controller
     * require input address is not a controller
     * execute any time in sc state
     */
    function setController(address _controller)
    public
    onlyEscrow
    {
        require(!isController[_controller]);
        isController[_controller] = true;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * remove controller
     * require input address is a controller
     * execute any time in sc state
     */
    function removeController(address _controller)
    public
    onlyEscrow
    {
        require(isController[_controller]);
        isController[_controller] = false;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * update token address
     */
    function updateTokenAddress(address payable _tokenAddress, uint _tokenIndex) public
    onlyEscrow
    {
        require(_tokenAddress != address(0));
        TokenAddress[_tokenIndex] = _tokenAddress;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}


    function withdrawToken(address _account, uint _amount, uint _tokenIndex) public
    onlyController
    {
        require(_account != address(0x0) && _amount != 0);
        require(_amount >= minWithdraw && _amount <= maxWithdraw);
        
        
        require(TokenAddress[_tokenIndex] != address(0));
        EIP20 ERC20Token = EIP20(TokenAddress[_tokenIndex]);
        if (ERC20Token.balanceOf(address(this)) >= _amount) {
            ERC20Token.transfer(_account, _amount);
        } else {
            revert();
        }
        
        emit Withdraw(_account, _amount, now, _tokenIndex);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}