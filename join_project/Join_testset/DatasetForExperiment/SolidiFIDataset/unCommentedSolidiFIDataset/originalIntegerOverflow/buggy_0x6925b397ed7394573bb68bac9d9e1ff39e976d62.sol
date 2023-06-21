/**
 *Submitted for verification at Etherscan.io on 2020-09-20
*/

pragma solidity 0.5.8;
 

contract ERC20Basic {
    function totalSupply() public view returns (uint256);
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    function balanceOf(address who) public view returns (uint256);
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }
    function transfer(address to, uint256 value) public returns (bool);
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
  event Burn(address indexed burner, uint256 value);
}
 
library SafeMath {
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
     
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        uint256 c = a / b;
        
        return c;
    }
     
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
     
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
 
contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping(address => uint256) balances;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   
}
  uint256 totalSupply_;
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }
  uint256 burnedTotalNum_;

  
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
 
    function totalBurned() public view returns (uint256) {
        return burnedTotalNum_;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}

    function burn(uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender]);

        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        burnedTotalNum_ = burnedTotalNum_.add(_value);

        emit Burn(burner, _value);
        return true;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

  
    function transfer(address _to, uint256 _value) public returns (bool) {
        
        if (_to == address(0)) {
            return burn(_value);
        }

        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}
 
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }
}
 
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    function approve(address spender, uint256 value) public returns (bool);
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
 
contract StandardToken is ERC20, BasicToken {
    uint private constant MAX_UINT = 2**256 - 1;

  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }
  mapping (address => mapping (address => uint256)) internal allowed;

    function burnFrom(address _owner, uint256 _value) public returns (bool) {
        require(_owner != address(0));
        require(_value <= balances[_owner]);
        require(_value <= allowed[_owner][msg.sender]);

        balances[_owner] = balances[_owner].sub(_value);
        if (allowed[_owner][msg.sender] < MAX_UINT) {
            allowed[_owner][msg.sender] = allowed[_owner][msg.sender].sub(_value);
        }
        totalSupply_ = totalSupply_.sub(_value);
        burnedTotalNum_ = burnedTotalNum_.add(_value);

        emit Burn(_owner, _value);
        return true;
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

     
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        if (_to == address(0)) {
            return burnFrom(_from, _value);
        }

        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);

  
        if (allowed[_from][msg.sender] < MAX_UINT) {
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        }
        emit Transfer(_from, _to, _value);
        return true;
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
     
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
     
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
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
     
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }
     
    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
}

contract KugulaToken is StandardToken {
    using SafeMath for uint256;

  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }
  string     public name = "Kugula";
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  string     public symbol = "KGL";
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}
  uint8      public decimals = 18;
    
    constructor() public {
        totalSupply_ = 10000000000000000000000000;
        balances[msg.sender] = totalSupply_;
    }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }


}