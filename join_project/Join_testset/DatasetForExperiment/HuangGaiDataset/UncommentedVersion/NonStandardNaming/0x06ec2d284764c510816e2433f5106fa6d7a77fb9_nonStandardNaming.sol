                                                                 

pragma solidity 0.5.13;


                                                                 

                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK51();
  }

                                                           
  function _IMPLEMENTATION941() internal view returns (address);	

                                                                                                                                                                                                                                                                                         
  function _DELEGATE69(address implementation) internal {	
    assembly {
      
      
      
      calldatacopy(0, 0, calldatasize)

      
      
      let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

      
      returndatacopy(0, 0, returndatasize)

      switch result
      
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }

                                                                                                                                                                                                            
  function _WILLFALLBACK811() internal {	
  }

                                                                                          
  function _FALLBACK51() internal {	
    _WILLFALLBACK811();
    _DELEGATE69(_IMPLEMENTATION941());
  }
}



pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library ZOSLibAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT818(address account) internal view returns (bool) {	
        uint256 size;
        
        
        
        
        
        
        
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}



pragma solidity ^0.5.0;



                                                                                                                                                                                                                       
contract BaseUpgradeabilityProxy is Proxy {
                                                                                                                                
  event UPGRADED409(address indexed implementation);	

                                                                                                                                                                                                       
  bytes32 internal constant implementation_slot610 = 0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;	

                                                                                                            
  function _IMPLEMENTATION941() internal view returns (address impl) {	
    bytes32 slot = implementation_slot610;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO279(address newImplementation) internal {	
    _SETIMPLEMENTATION823(newImplementation);
    emit UPGRADED409(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION823(address newImplementation) internal {	
    require(ZOSLibAddress.ISCONTRACT818(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot610;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}



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



pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                                                                                                                                          
contract BaseAdminUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                   
  event ADMINCHANGED461(address previousAdmin, address newAdmin);	

                                                                                                                                                                              
  bytes32 internal constant admin_slot50 = 0x10d6a54a4754c8869d6886b5f5d7fbfa5b4522237ea5c60d11bc4e7a1ff9390b;	

                                                                                                                                                                                        
  modifier IFADMIN797() {	
    if (msg.sender == _ADMIN390()) {
      _;
    } else {
      _FALLBACK51();
    }
  }

                                                        
  function ADMIN955() external IFADMIN797 returns (address) {	
    return _ADMIN390();
  }

                                                           
  function IMPLEMENTATION971() external IFADMIN797 returns (address) {	
    return _IMPLEMENTATION941();
  }

                                                                                                                                                                           
  function CHANGEADMIN429(address newAdmin) external IFADMIN797 {	
    require(newAdmin != address(0), "Cannot change the admin of a proxy to the zero address");
    emit ADMINCHANGED461(_ADMIN390(), newAdmin);
    _SETADMIN939(newAdmin);
  }

                                                                                                                                                                                   
  function UPGRADETO270(address newImplementation) external IFADMIN797 {	
    _UPGRADETO279(newImplementation);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function UPGRADETOANDCALL559(address newImplementation, bytes calldata data) payable external IFADMIN797 {	
    _UPGRADETO279(newImplementation);
    (bool success,) = newImplementation.delegatecall(data);
    require(success);
  }

                                        
  function _ADMIN390() internal view returns (address adm) {	
    bytes32 slot = admin_slot50;
    assembly {
      adm := sload(slot)
    }
  }

                                                                                                               
  function _SETADMIN939(address newAdmin) internal {	
    bytes32 slot = admin_slot50;

    assembly {
      sstore(slot, newAdmin)
    }
  }

                                                                      
  function _WILLFALLBACK811() internal {	
    require(msg.sender != _ADMIN390(), "Cannot call fallback function from the proxy admin");
    super._WILLFALLBACK811();
  }
}



pragma solidity ^0.5.0;


                                                                                                                                                                              
contract AdminUpgradeabilityProxy is BaseAdminUpgradeabilityProxy, UpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  constructor(address _logic, address _admin, bytes memory _data) UpgradeabilityProxy(_logic, _data) public payable {
    assert(admin_slot50 == keccak256("org.zeppelinos.proxy.admin"));
    _SETADMIN939(_admin);
  }
}

contract GreenEnergy {

    address[] public allAddresses;
    
    event TRANSFER593(address indexed from, address indexed to, uint256 tokens);	
	event APPROVAL806(address indexed owner, address indexed spender, uint256 tokens);	
	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
   
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

	uint256 constant private initial_supply224 = 1e5;	
	uint256 constant private new_address_supply700 = 1e5;	
	uint256 constant private precision894 = 1e5; 	
	uint8 constant public decimals997 = 3;	
	
	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	
	
	        
	string constant public name62 = "GreenEnergy";	
	
	       
	string constant public symbol119 = "GE";	

	
	

	constructor() public {
	    info.stopped = false;
		info.admin = msg.sender;
		allAddresses.push(msg.sender);
		info.totalSupply = initial_supply224;
		info.users[msg.sender].balance = initial_supply224;
	}

	function TOTALSUPPLY22() public view returns (uint256) {	
		return info.totalSupply;
	}

	function BALANCEOF531(address _user) public view returns (uint256) {	
		return info.users[_user].balance;
	}

	function ALLOWANCE876(address _user, address _spender) public view returns (uint256) {	
		return info.users[_user].allowance[_spender];
	}
	
	function APPROVE842(address _spender, uint256 _tokens) external returns (bool) {	
		info.users[msg.sender].allowance[_spender] = _tokens;
		emit APPROVAL806(msg.sender, _spender, _tokens);
		return true;
	}

                                                                                                                                                                                                                                                                                                                                                                                                                         

	function TRANSFER439(address _to, uint256 _tokens) external returns (bool) {	
		_TRANSFER877(msg.sender, _to, _tokens);
		return true;
	}

	function TRANSFERFROM832(address _from, address _to, uint256 _tokens) external returns (bool) {	
		require(info.users[_from].allowance[msg.sender] >= _tokens);
		info.users[_from].allowance[msg.sender] -= _tokens;
		_TRANSFER877(_from, _to, _tokens);
		return true;
	}

	function ISWHITELISTED422(address _user) public view returns (bool) {	
		return info.users[_user].whitelisted;
	}
	
	function WHITELIST683(address _user, bool _status) public {	
		require(msg.sender == info.admin);
		info.users[_user].whitelisted = _status;
	}

	function STOPPED834(bool _status) public {	
		require(msg.sender == info.admin);
		info.stopped = _status;
	}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

	function _TRANSFER877(address _from, address _to, uint256 _tokens) internal returns (uint256) {	
	    
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