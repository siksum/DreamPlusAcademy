pragma solidity ^0.5.6;	


/**
 * @title Metamorphic Contract Factory
 * @author 0age
 * @notice This contract creates metamorphic contracts, or contracts that can be
 * redeployed with new code to the same address. It does so by deploying a
 * contract with fixed, non-deterministic initialization code via the CREATE2
 * opcode. This contract clones the implementation contract in its constructor.
 * Once a contract undergoes metamorphosis, all existing storage will be deleted
 * and any existing contract code will be replaced with the deployed contract
 * code of the new implementation contract.
 * @dev CREATE2 will not be available on mainnet until (at least) block
 * 7,280,000. This contract has not yet been fully tested or audited - proceed
 * with caution and please share any exploits or optimizations you discover.
 */
contract MetamorphicContractFactory {
  
  event Metamorphosed(address metamorphicContract, address newImplementation);
  
  
  event MetamorphosedWithConstructor(
    address metamorphicContract,
    address transientContract
  );

  
  bytes private _metamorphicContractInitializationCode;

  
  bytes32 private _metamorphicContractInitializationCodeHash;

  
  bytes private _transientContractInitializationCode;

  
  bytes32 private _transientContractInitializationCodeHash;

  
  mapping(address => address) private _implementations;

  
  mapping(address => bytes) private _initCodes;

  /**
   * @dev In the constructor, set up the initialization code for metamorphic
   * contracts as well as the keccak256 hash of the given initialization code.
   * @param transientContractInitializationCode bytes The initialization code
   * that will be used to deploy any transient contracts, which will deploy any
   * metamorphic contracts that require the use of a constructor.
   * 
   * Metamorphic contract initialization code (29 bytes): 
   *
   *       0x5860208158601c335a63aaf10f428752fa158151803b80938091923cf3
   *
   * Description:
   *
   * pc|op|name         | [stack]                                | <memory>
   *
   * ** set the first stack item to zero - used later **
   * 00 58 getpc          [0]                                       <>
   *
   * ** set second stack item to 32, length of word returned from staticcall **
   * 01 60 push1
   * 02 20 outsize        [0, 32]                                   <>
   *
   * ** set third stack item to 0, position of word returned from staticcall **
   * 03 81 dup2           [0, 32, 0]                                <>
   *
   * ** set fourth stack item to 4, length of selector given to staticcall **
   * 04 58 getpc          [0, 32, 0, 4]                             <>
   *
   * ** set fifth stack item to 28, position of selector given to staticcall **
   * 05 60 push1
   * 06 1c inpos          [0, 32, 0, 4, 28]                         <>
   *
   * ** set the sixth stack item to msg.sender, target address for staticcall **
   * 07 33 caller         [0, 32, 0, 4, 28, caller]                 <>
   *
   * ** set the seventh stack item to msg.gas, gas to forward for staticcall **
   * 08 5a gas            [0, 32, 0, 4, 28, caller, gas]            <>
   *
   * ** set the eighth stack item to selector, "what" to store via mstore **
   * 09 63 push4
   * 10 aaf10f42 selector [0, 32, 0, 4, 28, caller, gas, 0xaaf10f42]    <>
   *
   * ** set the ninth stack item to 0, "where" to store via mstore ***
   * 11 87 dup8           [0, 32, 0, 4, 28, caller, gas, 0xaaf10f42, 0] <>
   *
   * ** call mstore, consume 8 and 9 from the stack, place selector in memory **
   * 12 52 mstore         [0, 32, 0, 4, 0, caller, gas]             <0xaaf10f42>
   *
   * ** call staticcall, consume items 2 through 7, place address in memory **
   * 13 fa staticcall     [0, 1 (if successful)]                    <address>
   *
   * ** flip success bit in second stack item to set to 0 **
   * 14 15 iszero         [0, 0]                                    <address>
   *
   * ** push a third 0 to the stack, position of address in memory **
   * 15 81 dup2           [0, 0, 0]                                 <address>
   *
   * ** place address from position in memory onto third stack item **
   * 16 51 mload          [0, 0, address]                           <>
   *
   * ** place address to fourth stack item for extcodesize to consume **
   * 17 80 dup1           [0, 0, address, address]                  <>
   *
   * ** get extcodesize on fourth stack item for extcodecopy **
   * 18 3b extcodesize    [0, 0, address, size]                     <>
   *
   * ** dup and swap size for use by return at end of init code **
   * 19 80 dup1           [0, 0, address, size, size]               <> 
   * 20 93 swap4          [size, 0, address, size, 0]               <>
   *
   * ** push code position 0 to stack and reorder stack items for extcodecopy **
   * 21 80 dup1           [size, 0, address, size, 0, 0]            <>
   * 22 91 swap2          [size, 0, address, 0, 0, size]            <>
   * 23 92 swap3          [size, 0, size, 0, 0, address]            <>
   *
   * ** call extcodecopy, consume four items, clone runtime code to memory **
   * 24 3c extcodecopy    [size, 0]                                 <code>
   *
   * ** return to deploy final code in memory **
   * 25 f3 return         []                                        *deployed!*
   *
   *
   * Transient contract initialization code derived from TransientContract.sol.
   */
  constructor(bytes memory transientContractInitializationCode) public {
    
    _metamorphicContractInitializationCode = (
      hex"5860208158601c335a63aaf10f428752fa158151803b80938091923cf3"
    );

    
    _metamorphicContractInitializationCodeHash = keccak256(
      abi.encodePacked(
        _metamorphicContractInitializationCode
      )
    );

    
    _transientContractInitializationCode = transientContractInitializationCode;

    
    _transientContractInitializationCodeHash = keccak256(
      abi.encodePacked(
        _transientContractInitializationCode
      )
    );
  }

  /* solhint-disable function-max-lines */
  /**
   * @dev Deploy a metamorphic contract by submitting a given salt or nonce
   * along with the initialization code for the metamorphic contract, and
   * optionally provide calldata for initializing the new metamorphic contract.
   * To replace the contract, first selfdestruct the current contract, then call
   * with the same salt value and new initialization code (be aware that all
   * existing state will be wiped from the existing contract). Also note that
   * the first 20 bytes of the salt must match the calling address, which
   * prevents contracts from being created by unintended parties.
   * @param salt bytes32 The nonce that will be passed into the CREATE2 call and
   * thus will determine the resulant address of the metamorphic contract.
   * @param implementationContractInitializationCode bytes The initialization
   * code for the implementation contract for the metamorphic contract. It will
   * be used to deploy a new contract that the metamorphic contract will then
   * clone in its constructor.
   * @param metamorphicContractInitializationCalldata bytes An optional data
   * parameter that can be used to atomically initialize the metamorphic
   * contract.
   * @return Address of the metamorphic contract that will be created.
   */
  function deployMetamorphicContract(
    bytes32 salt,
    bytes calldata implementationContractInitializationCode,
    bytes calldata metamorphicContractInitializationCalldata
  ) external payable containsCaller(salt) returns (
    address metamorphicContractAddress
  ) {
    
    bytes memory implInitCode = implementationContractInitializationCode;
    bytes memory data = metamorphicContractInitializationCalldata;

    
    bytes memory initCode = _metamorphicContractInitializationCode;

    
    address deployedMetamorphicContract;

    
    metamorphicContractAddress = _getMetamorphicContractAddress(salt);

    
    address implementationContract;

    
    /* solhint-disable no-inline-assembly */
    assembly {
      let encoded_data := add(0x20, implInitCode) 
      let encoded_size := mload(implInitCode)     
      implementationContract := create(       
        0,                                    
        encoded_data,                         
        encoded_size                          
      )
    } /* solhint-enable no-inline-assembly */

    require(
      implementationContract != address(0),
      "Could not deploy implementation."
    );

    
    _implementations[metamorphicContractAddress] = implementationContract;

    
    /* solhint-disable no-inline-assembly */
    assembly {
      let encoded_data := add(0x20, initCode) 
      let encoded_size := mload(initCode)     
      deployedMetamorphicContract := create2( 
        0,                                    
        encoded_data,                         
        encoded_size,                         
        salt                                  
      )
    } /* solhint-enable no-inline-assembly */

    
    require(
      deployedMetamorphicContract == metamorphicContractAddress,
      "Failed to deploy the new metamorphic contract."
    );

    
    if (data.length > 0 || msg.value > 0) {
      /* solhint-disable avoid-call-value */
      (bool success,) = deployedMetamorphicContract.call.value(msg.value)(data);
      /* solhint-enable avoid-call-value */

      require(success, "Failed to initialize the new metamorphic contract.");
    }

    emit Metamorphosed(deployedMetamorphicContract, implementationContract);
  } /* solhint-enable function-max-lines */

  /**
   * @dev Deploy a metamorphic contract by submitting a given salt or nonce
   * along with the address of an existing implementation contract to clone, and
   * optionally provide calldata for initializing the new metamorphic contract.
   * To replace the contract, first selfdestruct the current contract, then call
   * with the same salt value and a new implementation address (be aware that
   * all existing state will be wiped from the existing contract). Also note
   * that the first 20 bytes of the salt must match the calling address, which
   * prevents contracts from being created by unintended parties.
   * @param salt bytes32 The nonce that will be passed into the CREATE2 call and
   * thus will determine the resulant address of the metamorphic contract.
   * @param implementationContract address The address of the existing
   * implementation contract to clone.
   * @param metamorphicContractInitializationCalldata bytes An optional data
   * parameter that can be used to atomically initialize the metamorphic
   * contract.
   * @return Address of the metamorphic contract that will be created.
   */
  function deployMetamorphicContractFromExistingImplementation(
    bytes32 salt,
    address implementationContract,
    bytes calldata metamorphicContractInitializationCalldata
  ) external payable containsCaller(salt) returns (
    address metamorphicContractAddress
  ) {
    
    bytes memory data = metamorphicContractInitializationCalldata;

    
    bytes memory initCode = _metamorphicContractInitializationCode;

    
    address deployedMetamorphicContract;

    
    metamorphicContractAddress = _getMetamorphicContractAddress(salt);

    
    _implementations[metamorphicContractAddress] = implementationContract;

    
    /* solhint-disable no-inline-assembly */
    assembly {
      let encoded_data := add(0x20, initCode) 
      let encoded_size := mload(initCode)     
      deployedMetamorphicContract := create2( 
        0,                                    
        encoded_data,                         
        encoded_size,                         
        salt                                  
      )
    } /* solhint-enable no-inline-assembly */

    
    require(
      deployedMetamorphicContract == metamorphicContractAddress,
      "Failed to deploy the new metamorphic contract."
    );

    
    if (data.length > 0 || msg.value > 0) {
      /* solhint-disable avoid-call-value */
      (bool success,) = metamorphicContractAddress.call.value(msg.value)(data);
      /* solhint-enable avoid-call-value */

      require(success, "Failed to initialize the new metamorphic contract.");
    }

    emit Metamorphosed(deployedMetamorphicContract, implementationContract);
  }

  /* solhint-disable function-max-lines */
  /**
   * @dev Deploy a metamorphic contract by submitting a given salt or nonce
   * along with the initialization code to a transient contract which will then
   * deploy the metamorphic contract before immediately selfdestructing. To
   * replace the metamorphic contract, first selfdestruct the current contract,
   * then call with the same salt value and new initialization code (be aware
   * that all existing state will be wiped from the existing contract). Also
   * note that the first 20 bytes of the salt must match the calling address,
   * which prevents contracts from being created by unintended parties.
   * @param salt bytes32 The nonce that will be passed into the CREATE2 call and
   * thus will determine the resulant address of the metamorphic contract.
   * @param initializationCode bytes The initialization code for the metamorphic
   * contract that will be deployed by the transient contract.
   * @return Address of the metamorphic contract that will be created.
   */
  function deployMetamorphicContractWithConstructor(
    bytes32 salt,
    bytes calldata initializationCode
  ) external payable containsCaller(salt) returns (
    address metamorphicContractAddress
  ) {
    
    bytes memory initCode = _transientContractInitializationCode;

    
    address deployedTransientContract;

    
    address transientContractAddress = _getTransientContractAddress(salt);

    
    _initCodes[transientContractAddress] = initializationCode;

    
    /* solhint-disable no-inline-assembly */
    assembly {
      let encoded_data := add(0x20, initCode) 
      let encoded_size := mload(initCode)     
      deployedTransientContract := create2(   
        callvalue,                            
        encoded_data,                         
        encoded_size,                         
        salt                                  
      )
    } /* solhint-enable no-inline-assembly */

    
    require(
      deployedTransientContract == transientContractAddress,
      "Failed to deploy metamorphic contract using given salt and init code."
    );

    metamorphicContractAddress = _getMetamorphicContractAddressWithConstructor(
      transientContractAddress
    );

    emit MetamorphosedWithConstructor(
      metamorphicContractAddress,
      transientContractAddress
    );
  } /* solhint-enable function-max-lines */

  /**
   * @dev View function for retrieving the address of the implementation
   * contract to clone. Called by the constructor of each metamorphic contract.
   */
  function getImplementation() external view returns (address implementation) {
    return _implementations[msg.sender];
  }

  /**
   * @dev View function for retrieving the initialization code for a given
   * metamorphic contract to deploy via a transient contract. Called by the
   * constructor of each transient contract.
   * @return The initialization code to use to deploy the metamorphic contract.
   */
  function getInitializationCode() external view returns (
    bytes memory initializationCode
  ) {
    return _initCodes[msg.sender];
  }

  /**
   * @dev View function for retrieving the address of the current implementation
   * contract of a given metamorphic contract, where the address of the contract
   * is supplied as an argument. Be aware that the implementation contract has
   * an independent state and may have been altered or selfdestructed from when
   * it was last cloned by the metamorphic contract.
   * @param metamorphicContractAddress address The address of the metamorphic
   * contract.
   * @return Address of the corresponding implementation contract.
   */
  function getImplementationContractAddress(
    address metamorphicContractAddress
  ) external view returns (address implementationContractAddress) {
    return _implementations[metamorphicContractAddress];
  }

  /**
   * @dev View function for retrieving the initialization code for a given
   * metamorphic contract instance deployed via a transient contract, where the address
   * of the transient contract is supplied as an argument.
   * @param transientContractAddress address The address of the transient
   * contract that deployed the metamorphic contract.
   * @return The initialization code used to deploy the metamorphic contract.
   */
  function getMetamorphicContractInstanceInitializationCode(
    address transientContractAddress
  ) external view returns (bytes memory initializationCode) {
    return _initCodes[transientContractAddress];
  }

  /**
   * @dev Compute the address of the metamorphic contract that will be created
   * upon submitting a given salt to the contract.
   * @param salt bytes32 The nonce passed into CREATE2 by metamorphic contract.
   * @return Address of the corresponding metamorphic contract.
   */
  function findMetamorphicContractAddress(
    bytes32 salt
  ) external view returns (address metamorphicContractAddress) {
    
    metamorphicContractAddress = _getMetamorphicContractAddress(salt);
  }

  /**
   * @dev Compute the address of the transient contract that will be created
   * upon submitting a given salt to the contract.
   * @param salt bytes32 The nonce passed into CREATE2 when deploying the
   * transient contract.
   * @return Address of the corresponding transient contract.
   */
  function findTransientContractAddress(
    bytes32 salt
  ) external view returns (address transientContractAddress) {
    
    transientContractAddress = _getTransientContractAddress(salt);
  }

  /**
   * @dev Compute the address of the metamorphic contract that will be created
   * by the transient contract upon submitting a given salt to the contract.
   * @param salt bytes32 The nonce passed into CREATE2 when deploying the
   * transient contract.
   * @return Address of the corresponding metamorphic contract.
   */
  function findMetamorphicContractAddressWithConstructor(
    bytes32 salt
  ) external view returns (address metamorphicContractAddress) {
    
    metamorphicContractAddress = _getMetamorphicContractAddressWithConstructor(
      _getTransientContractAddress(salt)
    );
  }

  /**
   * @dev View function for retrieving the initialization code of metamorphic
   * contracts for purposes of verification.
   */
  function getMetamorphicContractInitializationCode() external view returns (
    bytes memory metamorphicContractInitializationCode
  ) {
    return _metamorphicContractInitializationCode;
  }

  /**
   * @dev View function for retrieving the keccak256 hash of the initialization
   * code of metamorphic contracts for purposes of verification.
   */
  function getMetamorphicContractInitializationCodeHash() external view returns (
    bytes32 metamorphicContractInitializationCodeHash
  ) {
    return _metamorphicContractInitializationCodeHash;
  }

  /**
   * @dev View function for retrieving the initialization code of transient
   * contracts for purposes of verification.
   */
  function getTransientContractInitializationCode() external view returns (
    bytes memory transientContractInitializationCode
  ) {
    return _transientContractInitializationCode;
  }

  /**
   * @dev View function for retrieving the keccak256 hash of the initialization
   * code of transient contracts for purposes of verification.
   */
  function getTransientContractInitializationCodeHash() external view returns (
    bytes32 transientContractInitializationCodeHash
  ) {
    return _transientContractInitializationCodeHash;
  }

  /**
   * @dev Internal view function for calculating a metamorphic contract address
   * given a particular salt.
   */
  function _getMetamorphicContractAddress(
    bytes32 salt
  ) internal view returns (address) {
    
    return address(
      uint160(                      
        uint256(                    
          keccak256(                
            abi.encodePacked(       
              hex"ff",              
              address(this),        
              salt,                 
              _metamorphicContractInitializationCodeHash 
            )
          )
        )
      )
    );
  }

  /**
   * @dev Internal view function for calculating a transient contract address
   * given a particular salt.
   */
  function _getTransientContractAddress(
    bytes32 salt
  ) internal view returns (address) {
    
    return address(
      uint160(                      
        uint256(                    
          keccak256(                
            abi.encodePacked(       
              hex"ff",              
              address(this),        
              salt,                 
              _transientContractInitializationCodeHash 
            )
          )
        )
      )
    );
  }

  /**
   * @dev Internal view function for calculating a metamorphic contract address
   * that has been deployed via a transient contract given the address of the
   * transient contract.
   */
  function _getMetamorphicContractAddressWithConstructor(
    address transientContractAddress
  ) internal pure returns (address) { 
    
    return address(
      uint160(                          
        uint256(                        
          keccak256(                    
            abi.encodePacked(           
              byte(0xd6),               
              byte(0x94),               
              transientContractAddress, 
              byte(0x01)                
            )
          )
        )
      )
    );
  }

  /**
   * @dev Modifier to ensure that the first 20 bytes of a submitted salt match
   * those of the calling account. This provides protection against the salt
   * being stolen by frontrunners or other attackers.
   * @param salt bytes32 The salt value to check against the calling address.
   */
  modifier containsCaller(bytes32 salt) {
    
    
    require(
      address(bytes20(salt)) == msg.sender,
      "Invalid salt - first 20 bytes of the salt must match calling address."
    );
    _;
  }
}