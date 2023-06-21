/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/

/**
 *Submitted for verification at Etherscan.io on 2020-04-14
*/



pragma solidity 0.5.8;

/**
 * LiteSig is a lighter weight multisig based on https:
 * Owners aggregate signatures offline and then broadcast a transaction with the required number of signatures.
 * Unlike other multisigs, this is meant to have minimal administration functions and other features in order
 * to reduce the footprint and attack surface.
 */
contract LiteSig {

    
    event Deposit(address indexed source, uint value);
    event Execution(uint indexed transactionId, address indexed destination, uint value, bytes data);
    event ExecutionFailure(uint indexed transactionId, address indexed destination, uint value, bytes data);

    
    address[] public owners;

    
    mapping(address => bool) ownersMap;

    
    uint public nonce = 0;

    
    uint public requiredSignatures = 0;

    
    
    bytes32 constant EIP712DOMAINTYPE_HASH = 0xd87cd6ef79d4e2b95e15ce8abf732db51ec771f1ca2edccf22a46c729ac56472;

    
    bytes32 constant NAME_HASH = 0x3308695f49e3f28122810c848e1569a04488ca4f6a11835568450d7a38a86120;

    
    bytes32 constant VERSION_HASH = 0xc89efdaa54c0f20c7adf612882df0950f5a951637e0307cdcb4c672f298b8bc6;

    
    bytes32 constant TXTYPE_HASH = 0x81336c6b66e18c614f29c0c96edcbcbc5f8e9221f35377412f0ea5d6f428918e;

    
    bytes32 constant SALT = 0x9c360831104e550f13ec032699c5f1d7f17190a31cdaf5c83945a04dfd319eea;

    
    
    bytes32 public DOMAIN_SEPARATOR;

    
    bool initialized = false;

    
    
    
    
    
    
    function init(address[] memory _owners, uint _requiredSignatures, uint chainId) public {
        
        require(!initialized, "Init function can only be run once");
        initialized = true;

        
        require(_owners.length > 0 && _owners.length <= 10, "Owners List min is 1 and max is 10");
        require(
            _requiredSignatures > 0 && _requiredSignatures <= _owners.length,
            "Required signatures must be in the proper range"
        );

        
        
        address lastAdd = address(0);
        for (uint i = 0; i < _owners.length; i++) {
            require(_owners[i] > lastAdd, "Owner addresses must be unique and in order");
            ownersMap[_owners[i]] = true;
            lastAdd = _owners[i];
        }

        
        owners = _owners;
        requiredSignatures = _requiredSignatures;

        DOMAIN_SEPARATOR = keccak256(
            abi.encode(EIP712DOMAINTYPE_HASH,
            NAME_HASH,
            VERSION_HASH,
            chainId,
            address(this),
            SALT)
        );
    }

    /**
     * This function is adapted from the OpenZeppelin libarary but instead of passing in bytes
     * array, it already has the sig fields broken down.
     *
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature`. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * (.note) This call _does not revert_ if the signature is invalid, or
     * if the signer is otherwise unable to be retrieved. In those scenarios,
     * the zero address is returned.
     *
     * (.warning) `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise)
     * be too long), and then calling `toEthSignedMessageHash` on it.
     */
    function safeRecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {

        
        
        
        
        
        
        
        
        
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        
        return ecrecover(hash, v, r, s);
    }

    /**
     * Once the owners of the multisig have signed across the payload, they can submit it to this function.
     * This will verify enough signatures were aggregated and then broadcast the transaction.
     * It can be used to send ETH or trigger a function call against another address (or both).
     *
     * Signatures must be in the correct ascending order (according to associated addresses)
     */
    function submit(
        uint8[] memory sigV,
        bytes32[] memory sigR,
        bytes32[] memory sigS,
        address destination,
        uint value,
        bytes memory data
    ) public returns (bool)
    {
        
        require(initialized, "Initialization must be complete");

        
        require(sigR.length == sigS.length && sigR.length == sigV.length, "Sig arrays not the same lengths");
        require(sigR.length == requiredSignatures, "Signatures list is not the expected length");

        
        
        
        bytes32 txInputHash = keccak256(abi.encodePacked(sigV, sigR, sigS));	
        bytes32 totalHash = keccak256(abi.encodePacked(sigV, sigR, sigS));	

        
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(sigV, sigR, sigS));	

        
        address lastAdd = address(0); 
        for (uint i = 0; i < requiredSignatures; i++) {

            
            address recovered = safeRecover(prefixedHash, sigV[i], sigR[i], sigS[i]);

            
            
            require(ownersMap[recovered], "Signature must be from an owner");
            require(recovered > lastAdd, "Signature must be unique");
            lastAdd = recovered;
        }

        
        nonce = nonce + 1;
        (bool success, ) = address(destination).call.value(value)(data);
        if(success) {
            emit Execution(nonce, destination, value, data);
        } else {
            emit ExecutionFailure(nonce, destination, value, data);
        }

        return success;
    }

    
    function () external payable {
        emit Deposit(msg.sender, msg.value);
    }

}



pragma solidity ^0.5.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be aplied to your functions to restrict their use to
 * the owner.
 */
contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * > Note: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}



pragma solidity 0.5.8;


/**
This contract allows a list of administrators to be tracked.  This list can then be enforced
on functions with administrative permissions.  Only the owner of the contract should be allowed
to modify the administrator list.
 */
contract Administratable is Ownable {

    
    mapping (address => bool) public administrators;

    
    event AdminAdded(address indexed addedAdmin, address indexed addedBy);
    event AdminRemoved(address indexed removedAdmin, address indexed removedBy);

    /**
    Function modifier to enforce administrative permissions.
     */
    modifier onlyAdministrator() {
        require(isAdministrator(msg.sender), "Calling account is not an administrator.");
        _;
    }

    /**
    Determine if the message sender is in the administrators list.
     */
    function isAdministrator(address addressToTest) public view returns (bool) {
        return administrators[addressToTest];
    }

    /**
    Add an admin to the list.  This should only be callable by the owner of the contract.
     */
    function addAdmin(address adminToAdd) public onlyOwner {
        
        require(administrators[adminToAdd] == false, "Account to be added to admin list is already an admin");

        
        administrators[adminToAdd] = true;

        
        emit AdminAdded(adminToAdd, msg.sender);
    }

    /**
    Remove an admin from the list.  This should only be callable by the owner of the contract.
     */
    function removeAdmin(address adminToRemove) public onlyOwner {
        
        require(administrators[adminToRemove] == true, "Account to be removed from admin list is not already an admin");

        
        administrators[adminToRemove] = false;

        
        emit AdminRemoved(adminToRemove, msg.sender);
    }
}



pragma solidity 0.5.8;



/**
 * LiteSig Factory creates new instances of the multisig contract and triggers an event
 * for listeners to see the new contract.
 */
contract LiteSigFactory is Administratable {

  
  event Deployed(address indexed deployedAddress);

  
  constructor() public {
    
    Administratable.addAdmin(msg.sender);
  }

  /**
   * Function called by external addresses to create a new multisig contract
   * Caller must be whitelisted as an admin - this is to prevent someone from sniping the address
   * (the standard approach to locking in the sender addr into the salt was not chosen in case a long time
   * passes before the contract is created and a new deployment account is required for some unknown reason)
   */
  function createLiteSig(bytes32 salt, address[] memory _owners, uint _requiredSignatures, uint chainId)
    public onlyAdministrator returns (address) {
    
    address payable deployedAddress;

    
    bytes memory code = type(LiteSig).creationCode;

    
    assembly {
      deployedAddress := create2(0, add(code, 0x20), mload(code), salt)
      if iszero(extcodesize(deployedAddress)) { revert(0, 0) }
    }

    
    LiteSig(deployedAddress).init(_owners, _requiredSignatures, chainId);

    
    emit Deployed(deployedAddress);

    
    return deployedAddress;
  }
}