                                                                 

pragma solidity 0.5.13;


                                                                 

                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK51();
  }

                                                           
  function _IMPLEMENTATION941() internal view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function _DELEGATE69(address implementation) internal {	//inject NONSTANDARD NAMING
    assembly {
      // Copy msg.data. We take full control of memory in this inline assembly
      // block because it will not return to Solidity code. We overwrite the
      // Solidity scratch pad at memory position 0.
      calldatacopy(0, 0, calldatasize)

      // Call the implementation.
      // out and outsize are 0 because we don't know the size yet.
      let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

      // Copy the returned data.
      returndatacopy(0, 0, returndatasize)

      switch result
      // delegatecall returns 0 on error.
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }

                                                                                                                                                                                                            
  function _WILLFALLBACK811() internal {	//inject NONSTANDARD NAMING
  }

                                                                                          
  function _FALLBACK51() internal {	//inject NONSTANDARD NAMING
    _WILLFALLBACK811();
    _DELEGATE69(_IMPLEMENTATION941());
  }
}

// File: zos-lib/contracts/utils/Address.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library ZOSLibAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT818(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: zos-lib/contracts/upgradeability/BaseUpgradeabilityProxy.sol

pragma solidity ^0.5.0;



                                                                                                                                                                                                                       
contract BaseUpgradeabilityProxy is Proxy {
                                                                                                                                
  event UPGRADED409(address indexed implementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                       
  bytes32 internal constant implementation_slot610 = 0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;	//inject NONSTANDARD NAMING

                                                                                                            
  function _IMPLEMENTATION941() internal view returns (address impl) {	//inject NONSTANDARD NAMING
    bytes32 slot = implementation_slot610;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO279(address newImplementation) internal {	//inject NONSTANDARD NAMING
    _SETIMPLEMENTATION823(newImplementation);
    emit UPGRADED409(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION823(address newImplementation) internal {	//inject NONSTANDARD NAMING
    require(ZOSLibAddress.ISCONTRACT818(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot610;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}

// File: zos-lib/contracts/upgradeability/UpgradeabilityProxy.sol

pragma solidity ^0.5.0;


                                                                                                                                                  
contract UpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  constructor(address _logic, bytes memory _data) public payable {
    assert(implementation_slot610 == keccak256("org.zeppelinos.proxy.implementation"));
    _SETIMPLEMENTATION823(_logic);
    if(_data.length > 0) {
      (bool success,) = _logic.delegatecall(_data);
      require(success);
    }
  }  
}

// File: zos-lib/contracts/upgradeability/BaseAdminUpgradeabilityProxy.sol

pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                                                                                                                                          
contract BaseAdminUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                   
  event ADMINCHANGED461(address previousAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                                                                                                                              
  bytes32 internal constant admin_slot50 = 0x10d6a54a4754c8869d6886b5f5d7fbfa5b4522237ea5c60d11bc4e7a1ff9390b;	//inject NONSTANDARD NAMING

                                                                                                                                                                                        
  modifier IFADMIN797() {	//inject NONSTANDARD NAMING
    if (msg.sender == _ADMIN390()) {
      _;
    } else {
      _FALLBACK51();
    }
  }

                                                        
  function ADMIN955() external IFADMIN797 returns (address) {	//inject NONSTANDARD NAMING
    return _ADMIN390();
  }

                                                           
  function IMPLEMENTATION971() external IFADMIN797 returns (address) {	//inject NONSTANDARD NAMING
    return _IMPLEMENTATION941();
  }

                                                                                                                                                                           
  function CHANGEADMIN429(address newAdmin) external IFADMIN797 {	//inject NONSTANDARD NAMING
    require(newAdmin != address(0), "Cannot change the admin of a proxy to the zero address");
    emit ADMINCHANGED461(_ADMIN390(), newAdmin);
    _SETADMIN939(newAdmin);
  }

                                                                                                                                                                                   
  function UPGRADETO270(address newImplementation) external IFADMIN797 {	//inject NONSTANDARD NAMING
    _UPGRADETO279(newImplementation);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function UPGRADETOANDCALL559(address newImplementation, bytes calldata data) payable external IFADMIN797 {	//inject NONSTANDARD NAMING
    _UPGRADETO279(newImplementation);
    (bool success,) = newImplementation.delegatecall(data);
    require(success);
  }

                                        
  function _ADMIN390() internal view returns (address adm) {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot50;
    assembly {
      adm := sload(slot)
    }
  }

                                                                                                               
  function _SETADMIN939(address newAdmin) internal {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot50;

    assembly {
      sstore(slot, newAdmin)
    }
  }

                                                                      
  function _WILLFALLBACK811() internal {	//inject NONSTANDARD NAMING
    require(msg.sender != _ADMIN390(), "Cannot call fallback function from the proxy admin");
    super._WILLFALLBACK811();
  }
}

// File: zos-lib/contracts/upgradeability/AdminUpgradeabilityProxy.sol

pragma solidity ^0.5.0;


                                                                                                                                                                              
contract AdminUpgradeabilityProxy is BaseAdminUpgradeabilityProxy, UpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  constructor(address _logic, address _admin, bytes memory _data) UpgradeabilityProxy(_logic, _data) public payable {
    assert(admin_slot50 == keccak256("org.zeppelinos.proxy.admin"));
    _SETADMIN939(_admin);
  }
}

contract GreenEnergy {

    address[] public allAddresses;
    
    event TRANSFER593(address indexed from, address indexed to, uint256 tokens);	//inject NONSTANDARD NAMING
	event APPROVAL806(address indexed owner, address indexed spender, uint256 tokens);	//inject NONSTANDARD NAMING
	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
   
	struct User {
	    bool whitelisted;
		uint256 balance;
		mapping(address => uint256) allowance;
	}
	
                                                                                                                                                                                                                                                                                                  
 
	struct Info {
		uint256 totalSupply;
		mapping(address => User) users;
		address admin;
		bool stopped;
	}
	
	Info private info;

	uint256 constant private initial_supply224 = 1e5;	//inject NONSTANDARD NAMING
	uint256 constant private new_address_supply700 = 1e5;	//inject NONSTANDARD NAMING
	uint256 constant private precision894 = 1e5; 	//inject NONSTANDARD NAMING
	uint8 constant public decimals997 = 3;	//inject NONSTANDARD NAMING
	
	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	
	
	        
	string constant public name62 = "GreenEnergy";	//inject NONSTANDARD NAMING
	
	       
	string constant public symbol119 = "GE";	//inject NONSTANDARD NAMING

	
	

	constructor() public {
	    info.stopped = false;
		info.admin = msg.sender;
		allAddresses.push(msg.sender);
		info.totalSupply = initial_supply224;
		info.users[msg.sender].balance = initial_supply224;
	}

	function TOTALSUPPLY22() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.totalSupply;
	}

	function BALANCEOF531(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].balance;
	}

	function ALLOWANCE876(address _user, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].allowance[_spender];
	}
	
	function APPROVE842(address _spender, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		info.users[msg.sender].allowance[_spender] = _tokens;
		emit APPROVAL806(msg.sender, _spender, _tokens);
		return true;
	}

                                                                                                                                                                                                                                                                                                                                                                                                                         

	function TRANSFER439(address _to, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		_TRANSFER877(msg.sender, _to, _tokens);
		return true;
	}

	function TRANSFERFROM832(address _from, address _to, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		require(info.users[_from].allowance[msg.sender] >= _tokens);
		info.users[_from].allowance[msg.sender] -= _tokens;
		_TRANSFER877(_from, _to, _tokens);
		return true;
	}

	function ISWHITELISTED422(address _user) public view returns (bool) {	//inject NONSTANDARD NAMING
		return info.users[_user].whitelisted;
	}
	
	function WHITELIST683(address _user, bool _status) public {	//inject NONSTANDARD NAMING
		require(msg.sender == info.admin);
		info.users[_user].whitelisted = _status;
	}

	function STOPPED834(bool _status) public {	//inject NONSTANDARD NAMING
		require(msg.sender == info.admin);
		info.stopped = _status;
	}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

	function _TRANSFER877(address _from, address _to, uint256 _tokens) internal returns (uint256) {	//inject NONSTANDARD NAMING
	    
	     if(info.stopped){
            require(ISWHITELISTED422(_from));
	    }
	    
		require(BALANCEOF531(_from) >= _tokens);
	
	    bool isNewUser = info.users[_to].balance == 0;
	    
		info.users[_from].balance -= _tokens;
		uint256 _transferred = _tokens;
		info.users[_to].balance += _transferred;
		
		if(isNewUser && _tokens > 0){
		   allAddresses.push(_to);
	
		    uint256 i = 0;
            while (i < allAddresses.length) {
                uint256 addressBalance = info.users[allAddresses[i]].balance;
                uint256 supplyNow = info.totalSupply;
                uint256 dividends = (addressBalance * precision894) / supplyNow;
                uint256 _toAdd = (dividends * new_address_supply700) / precision894;

                info.users[allAddresses[i]].balance += _toAdd;
                i += 1;
            }
            
            info.totalSupply = info.totalSupply + new_address_supply700;
		}

		
		emit TRANSFER593(_from, _to, _transferred);
				
		return _transferred;
	}
}