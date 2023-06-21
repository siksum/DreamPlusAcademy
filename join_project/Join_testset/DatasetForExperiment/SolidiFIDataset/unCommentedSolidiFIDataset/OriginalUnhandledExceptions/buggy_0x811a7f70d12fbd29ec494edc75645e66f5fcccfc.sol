/**
 *Submitted for verification at Etherscan.io on 2020-05-31
*/

pragma solidity ^0.5.4;

/**
 * @title BaseWallet
 * @dev Simple modular wallet that authorises modules to call its invoke() method.
 * Based on https:
 * @author Julien Niset - <julien@argent.im>
 */
contract BaseWallet {

    
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  address public implementation;
    
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  address public owner;
    
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  mapping (address => bool) public authorised;
    
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping (bytes4 => address) public enabled;
    
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint public modules;
    
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event AuthorisedModule(address indexed module, bool value);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event EnabledStaticCall(address indexed module, bytes4 indexed method);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event Invoked(address indexed module, address indexed target, uint indexed value, bytes data);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Received(uint indexed value, address indexed sender, bytes data);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event OwnerChanged(address owner);
    
    /**
     * @dev Throws if the sender is not an authorised module.
     */
    modifier moduleOnly {
        require(authorised[msg.sender], "BW: msg.sender not an authorized module");
        _;
    }

    /**
     * @dev Inits the wallet by setting the owner and authorising a list of modules.
     * @param _owner The owner.
     * @param _modules The modules to authorise.
     */
    function init(address _owner, address[] calldata _modules) external {
        require(owner == address(0) && modules == 0, "BW: wallet already initialised");
        require(_modules.length > 0, "BW: construction requires at least 1 module");
        owner = _owner;
        modules = _modules.length;
        for(uint256 i = 0; i < _modules.length; i++) {
            require(authorised[_modules[i]] == false, "BW: module is already added");
            authorised[_modules[i]] = true;
            Module(_modules[i]).init(this);
            emit AuthorisedModule(_modules[i], true);
        }
        if (address(this).balance > 0) {
            emit Received(address(this).balance, address(0), "");
        }
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /**
     * @dev Enables/Disables a module.
     * @param _module The target module.
     * @param _value Set to true to authorise the module.
     */
    function authoriseModule(address _module, bool _value) external moduleOnly {
        if (authorised[_module] != _value) {
            emit AuthorisedModule(_module, _value);
            if(_value == true) {
                modules += 1;
                authorised[_module] = true;
                Module(_module).init(this);
            }
            else {
                modules -= 1;
                require(modules > 0, "BW: wallet must have at least one module");
                delete authorised[_module];
            }
        }
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    /**
    * @dev Enables a static method by specifying the target module to which the call
    * must be delegated.
    * @param _module The target module.
    * @param _method The static method signature.
    */
    function enableStaticCall(address _module, bytes4 _method) external moduleOnly {
        require(authorised[_module], "BW: must be an authorised module for static call");
        enabled[_method] = _module;
        emit EnabledStaticCall(_module, _method);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * @dev Sets a new owner for the wallet.
     * @param _newOwner The new owner.
     */
    function setOwner(address _newOwner) external moduleOnly {
        require(_newOwner != address(0), "BW: address cannot be null");
        owner = _newOwner;
        emit OwnerChanged(_newOwner);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    /**
     * @dev Performs a generic transaction.
     * @param _target The address for the transaction.
     * @param _value The value of the transaction.
     * @param _data The data of the transaction.
     */
    function invoke(address _target, uint _value, bytes calldata _data) external moduleOnly returns (bytes memory _result) {
        bool success;
        
        (success, _result) = _target.call.value(_value)(_data);
        if(!success) {
            
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }
        emit Invoked(msg.sender, _target, _value, _data);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    /**
     * @dev This method makes it possible for the wallet to comply to interfaces expecting the wallet to
     * implement specific static methods. It delegates the static call to a target contract if the data corresponds
     * to an enabled method, or logs the call otherwise.
     */
    function() external payable {
        if(msg.data.length > 0) { 
            address module = enabled[msg.sig];
            if(module == address(0)) {
                emit Received(msg.value, msg.sender, msg.data);
            } 
            else {
                require(authorised[module], "BW: must be an authorised module for static call");
                
                assembly {
                    calldatacopy(0, 0, calldatasize())
                    let result := staticcall(gas, module, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch result 
                    case 0 {revert(0, returndatasize())} 
                    default {return (0, returndatasize())}
                }
            }
        }
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
}

/**
 * @title Module
 * @dev Interface for a module.
 * A module MUST implement the addModule() method to ensure that a wallet with at least one module
 * can never end up in a "frozen" state.
 * @author Julien Niset - <julien@argent.xyz>
 */
interface Module {

    /**
     * @dev Inits a module for a wallet by e.g. setting some wallet specific parameters in storage.
     * @param _wallet The wallet.
     */
    function init(BaseWallet _wallet) external;

    /**
     * @dev Adds a module to a wallet.
     * @param _wallet The target wallet.
     * @param _module The modules to authorise.
     */
    function addModule(BaseWallet _wallet, Module _module) external;

    /**
    * @dev Utility method to recover any ERC20 token that was sent to the
    * module by mistake.
    * @param _token The token to recover.
    */
    function recoverToken(address _token) external;
}