/**
 *Submitted for verification at Etherscan.io on 2020-08-13
*/

pragma solidity ^0.5.7;

/views.farm/
-----------------------------------------------------
  Financial freedom for streamers and their viewers
-----------------------------------------------------
                                                  
                                                  
        vvvvvvv                                   
      vvvvvvvvvvvvvvvv        vvvvvvvvv           
     vvvvvvvvvvvvvvvvvv     vvvvvvvvvvvvvvvvv     
      vvvvvvvvvvvvvvvvv     vvvvvvvvvvvvvvvvvv    
       vvvvvvvvvvvvvvv      vvvvvvvvvvvvvvvvvv    
          vvvvvvvvv            vvvvvvvvvvvvv      
           vvvvvvvv            vvvvvvvvvv         
           vvvvvvvvv          vvvvvvvvvv          
            vvvvvvvvv        vvvvvvvvvv           
            vvvvvvvvv       vvvvvvvvv             
             vvvvvvvvv     vvvvvvvvv              
              vvvvvvvvv   vvvvvvvvv               
              vvvvvvvvvvvvvvvvvvvv                
               vvvvvvvvvvvvvvvvvv                 
                vvvvvvvvvvvvvvvv                  
                vvvvvvvvvvvvvvv                   
                 vvvvvvvvvvvvv                    
                  vvvvvvvvvvv                     
                  vvvvvvvvvv                      
                     vvvvvv                       
                                                  
----------------------------------------------------
----------------------------------------------------

*/

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IERC223 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint);

    function transfer(address to, uint value) external returns (bool);
    function transfer(address to, uint value, bytes calldata data) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
}

contract ContractReceiver {
    function tokenFallback(address _from, uint _value, bytes memory _data) public {
        
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}
}

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {
    /**
      * @dev Multiplies two unsigned integers, reverts on overflow.
      */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
      * @dev Integer division of two unsigned integers truncating the quotient,
      * reverts on division by zero.
      */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
      * @dev Subtracts two unsigned integers, reverts on overflow
      * (i.e. if subtrahend is greater than minuend).
      */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
      * @dev Adds two unsigned integers, reverts on overflow.
      */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
      * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
      * reverts when dividing by zero.
      */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


contract StandardToken is IERC20, IERC223 {
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }
  uint256 public totalSupply;

    using SafeMath for uint;

  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping (address => uint256) internal balances;
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  mapping (address => mapping (address => uint256)) internal allowed;

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
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

    function approve(address _spender, uint256 _value) public returns (bool) {
        
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
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

    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
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
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

    
    function transfer(address _to, uint _value, bytes memory _data) public returns (bool success) {
        if (isContract(_to)) {
            return transferToContract(_to, _value, _data);
        } else {
            return transferToAddress(_to, _value, _data);
        }
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }

    
    
    function transfer(address _to, uint _value) public returns (bool success) {
        bytes memory empty;
        if (isContract(_to)) {
            return transferToContract(_to, _value, empty);
        } else {
            return transferToAddress(_to, _value, empty);
        }
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    
    function isContract(address _addr) private view returns (bool is_contract) {
        uint length;
        require(_addr != address(0));
        assembly {
            
            length := extcodesize(_addr)
        }
        return (length > 0);
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

    
    function transferToAddress(address _to, uint _value, bytes memory _data) private returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        emit Transfer(msg.sender, _to, _value, _data);
        return true;
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }

    
    function transferToContract(address _to, uint _value, bytes memory _data) private returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        ContractReceiver receiver = ContractReceiver(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
        emit Transfer(msg.sender, _to, _value);
        emit Transfer(msg.sender, _to, _value, _data);
        return true;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
}

contract Views is StandardToken {
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}
  string public constant name = "Views";
  function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  string public constant symbol = "VIEWS";
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}
  uint8 public constant decimals = 18;
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }
  uint256 public constant initialSupply = 10000e18;

    constructor () public {
        totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
}