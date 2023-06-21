pragma solidity ^0.5.7;



library SafeMath {
    
    function mul(uint256 a, uint256 b) internal pure returns(uint256 c) {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns(uint256) {
        return a / b;
    }

    function sub(uint256 a, uint256 b) internal pure returns(uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns(uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}

contract owned {
    
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address payable internal owner;
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   
}
  address payable internal newOwner;
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  address payable internal found;
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  address payable internal feedr;
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address payable _owner) onlyOwner public {
        require(_owner != address(0));
        newOwner = _owner;
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

    function confirmOwner() public {
        require(newOwner == msg.sender);
        owner = newOwner;
        delete newOwner;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }
}

contract ERC20Basic {
    modifier onlyPayloadSize(uint size) {
        require(msg.data.length >= size + 4);
        _;
    }
    function totalSupply() public view returns(uint256);
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    function balanceOf(address who) public view returns(uint256);
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    function transfer(address payable to, uint256 value) public returns(bool);
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns(uint256);
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
    function transferFrom(address payable from, address payable to, uint256 value) public returns(bool);
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}
    function approve(address spender, uint256 value) public returns(bool);
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TokenBasic is ERC20Basic, owned {
    using SafeMath for uint256;
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping(address => uint256) internal balances;
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  
    balances_intou6[msg.sender] -= _value;  
    balances_intou6[_to] += _value;  
    return true;
  }
  uint256 internal totalSupply_;
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  
    balances_intou2[msg.sender] -= _value;  
    balances_intou2[_to] += _value;  
    return true;
  }
  uint256 internal activeSupply_;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   
}
  mapping(uint256 => uint256) public sum_;
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping(address => uint256) public pdat_;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   
}
  uint256 public pnr_;

    function totalSupply() public view returns(uint256) {
        return totalSupply_;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}

    function activeSupply() public view returns(uint256) {
        return activeSupply_;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    function transfer(address payable _to, uint256 _value) public onlyPayloadSize(2 * 32) returns(bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(_to != found);
        uint256 div1 = 0;
        uint256 div2 = 0;
        if (msg.sender != found) {
            if (pdat_[msg.sender] < pnr_) {
                for (uint256 i = pnr_; i >= pdat_[msg.sender]; i = i.sub(1)) {
                    div1 = div1.add(sum_[i].mul(balances[msg.sender]));
                }
            }
        }
        if (pdat_[_to] < pnr_ && balances[_to] > 0) {
            for (uint256 i = pnr_; i >= pdat_[_to]; i = i.sub(1)) {
                div2 = div2.add(sum_[i].mul(balances[_to]));
            }
        }
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        
        pdat_[_to] = pnr_;
        
        emit Transfer(msg.sender, _to, _value);
        
        if (msg.sender == found) {
            activeSupply_ = activeSupply_.add(_value);
        } else {
            pdat_[msg.sender] = pnr_;
            if (div1 > 0) {
                msg.sender.transfer(div1);
            }
        }
        if (div2 > 0) {
            _to.transfer(div2);
        }
        return true;
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

    function balanceOf(address _owner) public view returns(uint256) {
        return balances[_owner];
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
}

contract TokenStandard is ERC20, TokenBasic {
    
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }
  mapping(address => mapping(address => uint256)) internal allowed;

    function transferFrom(address payable _from, address payable _to, uint256 _value) public onlyPayloadSize(3 * 32) returns(bool) {
        require(_to != address(0));
        require(_to != found);
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        uint256 div1 = 0;
        uint256 div2 = 0;
        if (_from != found) {
            if (pdat_[_from] < pnr_) {
                for (uint256 i = pnr_; i >= pdat_[_from]; i = i.sub(1)) {
                    div1 = div1.add(sum_[i].mul(balances[_from]));
                }
            }
        }
        if (pdat_[_to] < pnr_ && balances[_to] > 0) {
            for (uint256 i = pnr_; i >= pdat_[_to]; i = i.sub(1)) {
                div2 = div2.add(sum_[i].mul(balances[_to]));
            }
        }
        
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        
        pdat_[_to] = pnr_;
        
        emit Transfer(_from, _to, _value);
        if (_from == found) {
            activeSupply_ = activeSupply_.add(_value);
        } else {
            pdat_[_from] = pnr_;
            if (div1 > 0) {
                _from.transfer(div1);
            }
        }
        if (div2 > 0) {
            _to.transfer(div2);
        }
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

    function approve(address _spender, uint256 _value) public returns(bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    function allowance(address _owner, address _spender) public view returns(uint256) {
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

    function increaseApproval(address _spender, uint _addrdedValue) public returns(bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addrdedValue);
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

    function decreaseApproval(address _spender, uint _subtractedValue) public returns(bool) {
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

contract ANASH is TokenStandard {
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }
  string public constant name = "NASH TOKEN";
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }
  string public constant symbol = "NASH";
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  uint8 public constant decimals = 2;
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}
  uint256 internal constant premined = 20000000000;

    function() payable external {
        if (feedr == msg.sender) {
            require(msg.value >= 1);
            sum_[pnr_] = msg.value.div(activeSupply_);
            pnr_ = pnr_.add(1);
        } else {
            require(balances[msg.sender] > 0);
            uint256 div1 = 0;
            if (pdat_[msg.sender] < pnr_) {
                for (uint256 i = pnr_; i >= pdat_[msg.sender]; i = i.sub(1)) {
                    div1 = div1.add(sum_[i].mul(balances[msg.sender]));
                }
            }
            pdat_[msg.sender] = pnr_;
            div1 = div1.add(msg.value);
            if (div1 > 0) {
                msg.sender.transfer(div1);
            }
        }
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
    constructor() public {
        pnr_ = 1;
        owner = msg.sender;
        found = 0xfB538A7365d47183692E1866fC0b32308F15BAFD;
        feedr = 0xCebaa747868135CC4a0d9A4f982849161f3a4CE7;
        totalSupply_ = premined;
        activeSupply_ = 0;
        balances[found] = balances[found].add(premined);
        emit Transfer(address(0), found, premined);
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
}