/**
 *Submitted for verification at Etherscan.io on 2019-12-09
*/

pragma solidity ^0.5.11;	


/**
 * @title DharmaAccountRecoveryOperatorMultisig (staging version)
 * @author 0age (derived from Christian Lundkvist's Simple Multisig)
 * @notice This contract is a multisig that will control account recovery on the
 * Dharma Smart Wallet, based on Christian Lundkvist's Simple Multisig (found at
 * https:
 * Manager is hard-coded as the only allowable call destination, and any changes
 * in ownership or signature threshold will require deploying a new multisig and
 * transferring ownership of the account recovery manager.
 */
contract DharmaAccountRecoveryOperatorMultisigStaging {
  
  uint256 private _nonce;

  
  mapping(address => bool) private _isOwner;
  address[] private _owners;

  
  address private constant _DESTINATION = address(
    0x2a7E7718b755F9868E6B64DD18C6886707DD9c10
  );

  
  uint256 private constant _THRESHOLD = 2;

  
  constructor(address[] memory owners) public {
    require(owners.length <= 10, "Cannot have more than 10 owners.");
    require(_THRESHOLD <= owners.length, "Threshold cannot exceed total owners.");

    address lastAddress = address(0);
    for (uint256 i = 0; i < owners.length; i++) {
      require(
        owners[i] > lastAddress, "Owner addresses must be strictly increasing."
      );
      _isOwner[owners[i]] = true;
      lastAddress = owners[i];
    }
    _owners = owners;
  }

  function getNextHash(
    bytes calldata data,
    address executor,
    uint256 gasLimit
  ) external view returns (bytes32 hash) {
    hash = _getHash(data, executor, gasLimit, _nonce);
  }

  function getHash(
    bytes calldata data,
    address executor,
    uint256 gasLimit,
    uint256 nonce
  ) external view returns (bytes32 hash) {
    hash = _getHash(data, executor, gasLimit, nonce);
  }

  function getNonce() external view returns (uint256 nonce) {
    nonce = _nonce;
  }

  function getOwners() external view returns (address[] memory owners) {
    owners = _owners;
  }

  function isOwner(address account) external view returns (bool owner) {
    owner = _isOwner[account];
  }

  function getThreshold() external pure returns (uint256 threshold) {
    threshold = _THRESHOLD;
  }

  function getDestination() external pure returns (address destination) {
    destination = _DESTINATION;
  }

  
  function execute(
    bytes calldata data,
    address executor,
    uint256 gasLimit,
    bytes calldata signatures
  ) external returns (bool success, bytes memory returnData) {
    require(
      executor == msg.sender || executor == address(0),
      "Must call from the executor account if one is specified."
    );

    
    bytes32 hash = _toEthSignedMessageHash(
      _getHash(data, executor, gasLimit, _nonce)
    );

    
    address[] memory signers = _recoverGroup(hash, signatures);

    require(signers.length == _THRESHOLD, "Total signers must equal threshold.");

    
    address lastAddress = address(0); 
    for (uint256 i = 0; i < signers.length; i++) {
      require(
        _isOwner[signers[i]], "Signature does not correspond to an owner."
      );
      require(
        signers[i] > lastAddress, "Signer addresses must be strictly increasing."
      );
      lastAddress = signers[i];
    }

    
    _nonce++;
    (success, returnData) = _DESTINATION.call.gas(gasLimit)(data);
  }

  function _getHash(
    bytes memory data,
    address executor,
    uint256 gasLimit,
    uint256 nonce
  ) internal view returns (bytes32 hash) {
    
    hash = keccak256(
      abi.encodePacked(address(this), nonce, executor, gasLimit, data)
    );
  }

  /**
   * @dev Returns each address that signed a hashed message (`hash`) from a
   * collection of `signatures`.
   *
   * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
   * this function rejects them by requiring the `s` value to be in the lower
   * half order, and the `v` value to be either 27 or 28.
   *
   * NOTE: This call _does not revert_ if a signature is invalid, or if the
   * signer is otherwise unable to be retrieved. In those scenarios, the zero
   * address is returned for that signature.
   *
   * IMPORTANT: `hash` _must_ be the result of a hash operation for the
   * verification to be secure: it is possible to craft signatures that recover
   * to arbitrary addresses for non-hashed data.
   */
  function _recoverGroup(
    bytes32 hash,
    bytes memory signatures
  ) internal pure returns (address[] memory signers) {
    
    if (signatures.length % 65 != 0) {
      return new address[](0);
    }

    
    signers = new address[](signatures.length / 65);

    
    bytes32 signatureLocation;
    bytes32 r;
    bytes32 s;
    uint8 v;

    for (uint256 i = 0; i < signers.length; i++) {
      assembly {
        signatureLocation := add(signatures, mul(i, 65))
        r := mload(add(signatureLocation, 32))
        s := mload(add(signatureLocation, 64))
        v := byte(0, mload(add(signatureLocation, 96)))
      }

      
      
      if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
        continue;
      }

      if (v != 27 && v != 28) {
        continue;
      }

      
      signers[i] = ecrecover(hash, v, r, s);
    }
  }

  function _toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
  }
}