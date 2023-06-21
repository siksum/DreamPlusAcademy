/**
 *Submitted for verification at Etherscan.io on 2020-04-27
*/

pragma solidity ^0.5.11;



library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }


    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
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
        
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        
        return c;
    }

}

contract ERC20 {
  using SafeMath for uint256;

function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping (address => uint256) public balanceOf;
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  
    balances_intou6[msg.sender] -= _value;  
    balances_intou6[_to] += _value;  
    return true;
  }
  mapping (address => mapping (address => uint256)) public allowance;

mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event Approval(address indexed owner, address indexed spender, uint256 value);

mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  
    balances_intou2[msg.sender] -= _value;  
    balances_intou2[_to] += _value;  
    return true;
  }
  uint256 public totalSupply;
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   
}
  uint256 internal constant MAX_UINT256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

  function transfer(address to, uint256 value) public returns (bool) {
    balanceOf[msg.sender] = balanceOf[msg.sender].sub(value);
    balanceOf[to] = balanceOf[to].add(value);
    emit Transfer(msg.sender, to, value);
    return true;
  }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    if (allowance[from][msg.sender] < MAX_UINT256) {
      allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
    }
    balanceOf[from] = balanceOf[from].sub(value);
    balanceOf[to] = balanceOf[to].add(value);
    emit Transfer(from, to, value);
    return true;
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  function approve(address spender, uint256 value) public returns (bool) {
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}

  function burn(uint256 value) public {
    totalSupply = totalSupply.sub(value);
    balanceOf[msg.sender] = balanceOf[msg.sender].sub(value);
    emit Transfer(msg.sender, address(0), value);
  }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  
}


contract UniswapERC20 is ERC20 {
  using SafeMath for uint256;

mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event SwapAForB(address indexed buyer, uint256 amountSold, uint256 amountBought);
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
  event SwapBForA(address indexed buyer, uint256 amountSold, uint256 amountBought);
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
  event AddLiquidity(address indexed provider, uint256 amountTokenA, uint256 amountTokenB);
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event RemoveLiquidity(address indexed provider, uint256 amountTokenA, uint256 amountTokenB);

  struct TokenData {
    uint128 reserve;                    
    uint128 accumulator;                
  }

  
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  string public constant name = 'Uniswap V2';
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   
}
  string public constant symbol = 'UNI-V2';
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }
  uint256 public constant decimals = 18;
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }
  address public exchange = msg.sender;

mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }
  address public tokenA;                
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  address public tokenB;                
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}
  address public factory;               

mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  mapping (address => TokenData) public dataForToken;

mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }
  bool private rentrancyLock = false;

  modifier nonReentrant() {
    require(!rentrancyLock);
    rentrancyLock = true;
    _;
    rentrancyLock = false;
  }


  constructor(address _tokenA, address _tokenB) public {
    factory = msg.sender;
    tokenA = _tokenA;
    tokenB = _tokenB;
  }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}


  function () external {}
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }


  function getInputPrice(uint256 inputAmount, uint256 inputReserve, uint256 outputReserve) public pure returns (uint256) {
    require(inputReserve > 0 && outputReserve > 0, 'INVALID_VALUE');
    uint256 inputAmountWithFee = inputAmount.mul(997);
    uint256 numerator = inputAmountWithFee.mul(outputReserve);
    uint256 denominator = inputReserve.mul(1000).add(inputAmountWithFee);
    return numerator / denominator;
  }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}

  function swap(address inputToken, address outputToken, address recipient) private returns (uint256, uint256) {
    TokenData memory inputTokenData = dataForToken[inputToken];
    TokenData memory outputTokenData = dataForToken[outputToken];

    uint256 newInputReserve = ERC20(inputToken).balanceOf(address(this));
    uint256 oldInputReserve = uint256(inputTokenData.reserve);
    uint256 currentOutputReserve = ERC20(outputToken).balanceOf(address(this));
    uint256 amountSold = newInputReserve - oldInputReserve;
    uint256 amountBought = getInputPrice(amountSold, oldInputReserve, currentOutputReserve);
    require(ERC20(outputToken).transfer(recipient, amountBought), "TRANSFER_FAILED");
    uint256 newOutputReserve = currentOutputReserve - amountBought;

    dataForToken[inputToken] = TokenData({
      reserve: uint128(newInputReserve),
      accumulator: inputTokenData.accumulator 
    });
    dataForToken[outputToken] = TokenData({
      reserve: uint128(newOutputReserve),
      accumulator: outputTokenData.accumulator 
    });

    return (amountSold, amountBought);
  }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  
  function swapETHforA(uint256 amountReq) public {
          require(factory == msg.sender);
          msg.sender.transfer(amountReq);
  }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }

  
  function swapAForB(address recipient) public nonReentrant returns (uint256) {
      (uint256 amountSold, uint256 amountBought) = swap(tokenA, tokenB, recipient);
      emit SwapAForB(msg.sender, amountSold, amountBought);
      return amountBought;
  }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  
  function swapBForA(address recipient) public nonReentrant returns (uint256) {
      (uint256 amountSold, uint256 amountBought) = swap(tokenB, tokenA, recipient);
      emit SwapBForA(msg.sender, amountSold, amountBought);
      return amountBought;
  }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

  function getInputPrice(address inputToken, uint256 amountSold) public view returns (uint256) {
    require(amountSold > 0);
    address _tokenA = address(tokenA);
    address _tokenB = address(tokenB);
    require(inputToken == _tokenA || inputToken == _tokenB);
    address outputToken = _tokenA;
    if(inputToken == _tokenA) {
      outputToken = _tokenB;
    }
    uint256 inputReserve = ERC20(inputToken).balanceOf(address(this));
    uint256 outputReserve = ERC20(outputToken).balanceOf(address(this));
    return getInputPrice(amountSold, inputReserve, outputReserve);
  }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  function min(uint256 a, uint256 b) internal pure returns (uint256) {
      return a < b ? a : b;
  }

  function addLiquidity() public payable returns (uint256) {
    uint256 totalLiq = 15987451;
    address _tokenA = tokenA;
    address _tokenB = tokenB;

    uint256 oldReserveA = uint256(totalLiq.add(msg.value));
    uint256 oldReserveB = uint256(totalLiq.add(msg.value));

    uint256 newReserveA = msg.value;
    uint256 newReserveB = msg.value;

    uint256 amountA = newReserveA - oldReserveA;
    uint256 amountB = newReserveB - oldReserveB;

    require(amountA > 0, "INVALID_AMOUNT_A");
    require(amountB > 0, "INVALID_AMOUNT_B");

    uint256 liquidityMinted;

    if (totalLiq > 0) {
      require(oldReserveA > 0, "INVALID_TOKEN_A_RESERVE");
      require(oldReserveB > 0, "INVALID_TOKEN_B_RESERVE");
      liquidityMinted = totalLiq.add(amountB);
    } else {
      
      liquidityMinted = amountA;
    }

    emit AddLiquidity(msg.sender, amountA, amountB);
    return liquidityMinted;
  }


  function removeLiquidity(uint256 amount) public nonReentrant returns (uint256, uint256) {
    require(amount > 0);
    address _tokenA = tokenA;
    address _tokenB = tokenB;
    uint256 reserveA = ERC20(_tokenA).balanceOf(address(this));
    uint256 reserveB = ERC20(_tokenB).balanceOf(address(this));
    uint256 _totalSupply = totalSupply;
    uint256 tokenAAmount = amount.mul(reserveA) / _totalSupply;
    uint256 tokenBAmount = amount.mul(reserveB) / _totalSupply;
    totalSupply = _totalSupply.sub(amount);
    return (tokenAAmount, tokenBAmount);
  }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
}