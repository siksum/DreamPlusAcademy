/**
 *Submitted for verification at Etherscan.io on 2020-11-01
*/

// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;    
                                                                                 
interface IERC20 {
  function totalSupply()                                         external view returns (uint256);
  function balanceOf(address who)                                external view returns (uint256);
  function allowance(address owner, address spender)             external view returns (uint256);
  function transfer(address to, uint256 value)                   external      returns (bool);
  function approve(address spender, uint256 value)               external      returns (bool);
  function transferFrom(address from, address to, uint256 value) external      returns (bool);
 
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
 
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);
 
        return c;
    }
 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;
 
        return c;
    }
 
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }
 
 
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
 
    function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
        uint256 c = add(a,m);
        uint256 d = sub(c,1);
        return mul(div(d,m),m);
    }
}
 
abstract contract ERC20Detailed is IERC20 {
 
  string private _name;
  string private _symbol;
  uint8  private _decimals;
 
  constructor(string memory name, string memory symbol, uint8 decimals) {
    _name     = name;
    _symbol   = symbol;
    _decimals = decimals;
  }
 
  function name() public view returns(string memory) {
    return _name;
  }
 
  function symbol() public view returns(string memory) {
    return _symbol;
  }
 
  function decimals() public view returns(uint8) {
    return _decimals;
  }
}
 
 
 contract KP3R is ERC20Detailed {
 
  using SafeMath for uint256;
 
  mapping (address => uint256)                      private _balances;
  mapping (address => mapping (address => uint256)) private _allowed;
 
  string   constant tokenName     = "Keep3rV2";
  string   constant tokenSymbol   = "KP3Rv2";
  uint8    constant tokenDecimals = 2;
  uint256  public   burnRate      = 9;
  uint256           _totalSupply   = 20000000;
 
  constructor() ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
      _balances[msg.sender] = _totalSupply;
  }
 
  function totalSupply() external view override returns (uint256) {
    return _totalSupply;
  }
 
  function balanceOf(address owner) external view override returns (uint256) {
    return _balances[owner];
  }
 
  function allowance(address owner, address spender) external view override returns (uint256) {
    return _allowed[owner][spender];
  }
 
  function findBurnAmount(uint256 rate, uint256 value) public pure returns (uint256) {
      return value.ceil(100).mul(rate).div(100).mul(10);
  }
 
 
  function transfer(address to, uint256 value) external override returns (bool) {
    require(value <= _balances[msg.sender]);
    require(to != address(0));
 
    _balances[msg.sender] = _balances[msg.sender].sub(value);
    _balances[to] = _balances[to].add(value);
 
    emit Transfer(msg.sender, to, value);
    return true;
  }
 
  function approve(address spender, uint256 value) external override returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
 
    emit Approval(msg.sender, spender, value);
    return true;
  }
 
  function transferFrom(address from, address to, uint256 value) external override returns (bool) {
    require(value <= _balances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));
 
    _balances[from] = _balances[from].sub(value);
 
    uint256 tokensToBurn     = findBurnAmount(burnRate, value);
    uint256 tokensToTransfer = value.sub(tokensToBurn);
 
    _balances[to] = _balances[to].add(tokensToTransfer);
    _totalSupply  = _totalSupply.sub(tokensToBurn);
 
    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
 
    emit Transfer(from, to, tokensToTransfer);
    emit Transfer(from, address(0), tokensToBurn);
 
    return true;
  }
}