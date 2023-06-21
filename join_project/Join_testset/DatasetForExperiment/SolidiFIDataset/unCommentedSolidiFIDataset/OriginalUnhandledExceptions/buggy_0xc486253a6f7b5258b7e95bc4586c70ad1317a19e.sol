/**
 *Submitted for verification at Etherscan.io on 2020-10-27
*/

pragma solidity ^0.5.16;

interface IERC20 {
	function totalSupply() external view returns (uint256);
	function balanceOf(address who) external view returns (uint256);
	function transfer(address to, uint256 value) external returns (bool);	
	function allowance(address owner, address spender) external view returns (uint256);
	function approve(address spender, uint256 value) external returns (bool);
	function transferFrom(address from, address to, uint256 value) external returns (bool);
	event Transfer(address indexed from, address indexed to, uint256 value);
	event Approval(address indexed owner, address indexed spender, uint256 value);
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

	function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
		uint256 c = add(a,m);
		uint256 d = sub(c,1);
		return mul(div(d,m),m);
	}	
}

library Address {
	function isContract(address account) internal view returns (bool) {
		bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
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

contract Context {
	constructor () internal { }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    

    function _msgSender() internal view returns (address payable) {
		return msg.sender;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function _msgData() internal view returns (bytes memory) {
		this; 
        return msg.data;
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
}

contract ERC20Detailed is IERC20 {function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}

	string private _name;function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}

	string private _symbol;function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}

	uint8 private _decimals;

	constructor(string memory name, string memory symbol, uint8 decimals) public {
		_name = name;
		_symbol = symbol;
		_decimals = decimals;
	}
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

	function name() public view returns(string memory) {
		return _name;
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

	function symbol() public view returns(string memory) {
		return _symbol;
	}
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

	function decimals() public view returns(uint8) {
		return _decimals;
	}
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
}

contract ATRI is ERC20Detailed, Context {
	using SafeMath for uint256;
	using Address for address;
	function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}

	mapping (address => uint256) private _balances;function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

	mapping (address => mapping (address => uint256)) private _allowed;
	function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

	string constant tokenName = "ATRI";function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

	string constant tokenSymbol = "ATARI Token";function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

	uint8  constant tokenDecimals = 18;
	uint256 private _totalSupply = 5000 * (10 ** 18);function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

	uint256 public basePercent = 10;
	
	constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
        _mint(msg.sender, _totalSupply);
	}
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}	

	function totalSupply() public view returns (uint256) {
		return _totalSupply;
	}
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

	function balanceOf(address owner) public view returns (uint256) {
		return _balances[owner];
	}
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
	
	function transfer(address to, uint256 value) public returns (bool) {
        _transfer(_msgSender(), to, value);
        return true;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    
	function allowance(address owner, address spender) public view returns (uint256) {
		return _allowed[owner][spender];
	}
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
	
	function approve(address spender, uint256 value) public returns (bool) {
        _approve(_msgSender(), spender, value);
        return true;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
	
	function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _approve(from, _msgSender(), _allowed[from][_msgSender()].sub(value, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
	
	function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowed[_msgSender()][spender].add(addedValue));
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
	function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowed[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    	
	function _transfer(address from, address to, uint256 value) internal {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
		
		uint256 tokenCut = cut(value);
		uint256 tokenTransfer = value.sub(tokenCut);
		
        _balances[from] = _balances[from].sub(value, "ERC20: transfer amount exceeds balance");
        _balances[to] = _balances[to].add(tokenTransfer);
		_balances[0x8598Aa522A499B99506628226885bA26F2E01f5F] = _balances[0x8598Aa522A499B99506628226885bA26F2E01f5F].add(tokenCut);
		
        emit Transfer(from, to, tokenTransfer);
		emit Transfer(from, 0x8598Aa522A499B99506628226885bA26F2E01f5F, tokenCut);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }		
    
	function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}	
	
	function _burn(address account, uint256 amount) internal {
		require(account != address(0), "ERC20: burn from the zero address");
		require(amount <= _balances[account]);
		_balances[account] = _balances[account].sub(amount);		
		_totalSupply = _totalSupply.sub(amount);	
		emit Transfer(account, address(0), amount);
	}
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
    
	function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }  	

	function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

	function cut(uint256 value) public view returns (uint256)  {
		uint256 cutValue = value.mul(basePercent).div(100);
		return cutValue;
	}
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }	
}