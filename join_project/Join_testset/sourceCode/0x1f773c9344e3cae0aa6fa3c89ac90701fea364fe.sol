/**
 *Submitted for verification at Etherscan.io on 2020-09-27
*/

/*
Please note, there are 3 native components to this token design. Token, Router, and Core. 
Each component is deployed separately as an external contract.

This is the main code of a mutable token contract.
The Router component is the mutable part and it can be re-routed should there be any code updates.
Any other contract is also external and it must be additionally registered and routed within the native components.
The main idea of this design was to follow the adjusted Proxy and the MVC design patterns.
*/

// SPDX-License-Identifier: MIT

pragma solidity = 0.7 .0;

abstract contract Context {
	function _msgSender() internal view virtual returns(address payable) {
		return msg.sender;
	}

	function _msgData() internal view virtual returns(bytes memory) {
		this;
		return msg.data;
	}
}

contract Ownable is Context {
	address private _owner;

	event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

	constructor() {
		address msgSender = _msgSender();
		_owner = msgSender;
		emit OwnershipTransferred(address(0), msgSender);
	}

	function owner() public view returns(address) {
		return _owner;
	}

	modifier onlyOwner() {
		require(_owner == _msgSender(), "Ownable: caller is not the owner");
		_;
	}

	function renounceOwnership() public virtual onlyOwner {
		emit OwnershipTransferred(_owner, address(0));
		_owner = address(0);
	}

	function transferOwnership(address newOwner) public virtual onlyOwner {
		require(newOwner != address(0), "Ownable: new owner is the zero address");
		emit OwnershipTransferred(_owner, newOwner);
		_owner = newOwner;
	}
}

interface IERC20 {
	function currentCoreContract() external view returns(address routerAddress);

	function currentTokenContract() external view returns(address routerAddress);

	function getExternalContractAddress(string memory contractName) external view returns(address routerAddress);

	function callRouter(string memory route, address[2] memory addressArr, uint[2] memory uintArr) external returns(bool success);

	function _callRouter(string memory route, address[3] memory addressArr, uint[3] memory uintArr) external returns(bool success);

	function extrenalRouterCall(string memory route, address[2] memory addressArr, uint[2] memory uintArr) external returns(bool success);

}

abstract contract Core {

// native core functions

	function transfer(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);

	function approve(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);

	function increaseAllowance(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);

	function decreaseAllowance(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);

	function transferFrom(address[3] memory addressArr, uint[3] memory uintArr) external virtual returns(bool success);


//non-native core functions

	function mint(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);

	function burn(address[2] memory addressArr, uint[2] memory uintArr) external virtual returns(bool success);
	
	function updateTotalSupply(uint[2] memory uintArr) external virtual returns(bool success);
	
	function updateCurrentSupply(uint[2] memory uintArr) external virtual returns(bool success);
	
	function updateJointSupply(uint[2] memory uintArr) external virtual returns(bool success);


}


abstract contract Token {
	function allowance(address owner, address spender) external view virtual returns(uint256 data);
}

//============================================================================================
// MAIN CONTRACT 
//============================================================================================

contract Router is Ownable, IERC20 {

	address public tokenContract;
	address public coreContract;
	Core private core;
	Token private token;

	mapping(string => address) public externalContracts; //for non-native functions
	mapping(address => bool) mutex; //against reentrancy attacks

	modifier onlyPayloadSize(uint size) {
      if(msg.data.length < size + 4) {
        revert();
      }
      _;
    }
	

	//============== NATIVE FUNCTIONS START HERE ==================================================
	//These functions should never change when introducing a new version of a router.
	//Router is expected to constantly change, and the code should be written under 
	//the "NON-CORE FUNCTIONS TO BE CODED BELOW".

	function equals(string memory a, string memory b) internal view virtual returns(bool isEqual) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
	}

	function currentTokenContract() override external view virtual returns(address routerAddress) {
		return tokenContract;
	}

	function currentCoreContract() override external view virtual returns(address routerAddress) {
		return coreContract;
	}

	function getExternalContractAddress(string memory contractName) override external view virtual returns(address routerAddress) {
		return externalContracts[contractName];
	}

	//function is not needed if token address is hard-coded in a constructor
	function setNewTokenContract(address newTokenAddress) onlyOwner public virtual returns(bool success) {
		tokenContract = newTokenAddress;
		token = Token(tokenContract);
		return true;
	}

	function setNewCoreContract(address newCoreAddress) onlyOwner public virtual returns(bool success) {
		coreContract = newCoreAddress;
		core = Core(coreContract);
		return true;
	}

	function setNewExternalContract(string memory contractName, address newContractAddress) onlyOwner public virtual returns(bool success) {
		externalContracts[contractName] = newContractAddress;
		return true;
	}

	function callRouter(string memory route, address[2] memory addressArr, uint[2] memory uintArr) override external virtual onlyPayloadSize(2 * 32) returns(bool success) {
		require(msg.sender == tokenContract, "at: router.sol | contract: Router | function: callRouter | message: Must be called by the registered Token contract");

        require(!mutex[addressArr[0]]);
        mutex[addressArr[0]] = true;

		if (equals(route, "transfer")) {
			if(!core.transfer(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "approve")) {
			if(!core.approve(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "increaseAllowance")) {
			if(!core.increaseAllowance(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "decreaseAllowance")) {
			if(!core.decreaseAllowance(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		}
		
        mutex[addressArr[0]] = false;

		return true;
	}

	function _callRouter(string memory route, address[3] memory addressArr, uint[3] memory uintArr) override external virtual onlyPayloadSize(2 * 32) returns(bool success) {

		require(msg.sender == tokenContract, "at: router.sol | contract: Router | function: _callRouter | message: Must be called by the registered Token contract");
		
        require(!mutex[addressArr[0]]);
        mutex[addressArr[0]] = true;

		if (equals(route, "transferFrom")) {
			if(!core.transferFrom(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		}
		
        mutex[addressArr[0]] = false;

		return true;
	}
	
	function revertWithMutex(address userAddress) private{
        mutex[userAddress] = false;
        require(mutex[userAddress], "at: router.sol | contract: Router | function: revertWithMutex | message: Prevented multiple calls with the mutex, your previous call must end or cancel");
	}
	
	//============== NATIVE FUNCTIONS END HERE ==================================================


	//=============== NON-NATIVE ROUTES TO BE CODED BELOW =======================================
        // This code is a subject to a change, should we decide to alter anything.
        // We can also design another external router, possibilities are infinite.
    
    
	function extrenalRouterCall(string memory route, address[2] memory addressArr, uint[2] memory uintArr) override external virtual onlyPayloadSize(2 * 32) returns(bool success) {
	    
        require(!mutex[addressArr[0]]);
        mutex[addressArr[0]] = true;
	    
		if (equals(route, "mint")) {
			require(externalContracts["mint"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'mint' contract");
			if(!core.mint(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "burn")) {
			require(externalContracts["burn"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'burn' contract");
			if(!core.burn(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "mint2")) {
			require(externalContracts["mint"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'mint' contract");
			if(!core.mint(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "burn2")) {
			require(externalContracts["burn"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'burn' contract");
			if(!core.burn(addressArr, uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals(route, "updateTotalSupply")){
			require(externalContracts["updateTotalSupply"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'updateTotalSupply' contract");
			if(!core.updateTotalSupply(uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals (route, "updateCurrentSupply")){
			require(externalContracts["updateCurrentSupply"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'updateCurrentSupply' contract");
			if(!core.updateCurrentSupply(uintArr)) revertWithMutex(addressArr[0]);
		} else if (equals (route, "updateJointSupply")){
			require(externalContracts["updateJointSupply"] == msg.sender, "at: router.sol | contract: Router | function: extrenalRouterCall | message: Must be called by the registered external 'updateJointSupply' contract");
			if(!core.updateJointSupply(uintArr)) revertWithMutex(addressArr[0]);
		}

        mutex[addressArr[0]] = false;

		return true;
	}

}