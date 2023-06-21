/**
 * SPDX-License-Identifier: MIT
 */

pragma solidity >=0.7;

import "./Address.sol";
import "./RLPEncode.sol";

contract MultiSig {

  mapping (address => uint8) public signers; // The addresses that can co-sign transactions and the number of signatures needed

  uint16 public signerCount;

  // Observation: the nonce is not increase when the transaction fails.
  uint256 private sequenceNumber; // A sequence number that contains the address of this contract to make it globally unique
  bytes public contractId; // most likely unique id of this contract

  event SignerChange(
    address indexed signer,
    uint8 cosignaturesNeeded
  );

  event Transacted(
    address indexed toAddress,  // The address the transaction was sent to
    bytes4 selector, // selected operation
    address[] signers // Addresses of the signers used to initiate the transaction
  );

  constructor (address owner) {
    // We use the gas price to get a unique id into our transactions.
    // Note that 32 bits do not guarantee that no one can generate a contract with the
    // same id, but it practically rules out that someone accidentally creates two
    // two multisig contracts with the same id, and that's all we need to prevent
    // replay-attacks.
    contractId = toBytes(uint32(address(this)));
    _setSigner(owner, 1); // start with the contract creator as owner
  }

  /**
   * It should be possible to store ether on this address.
   */
  receive() external payable {
  }

  /**
   * Checks if the provided signatures suffice to sign the transaction and if the nonce is correct.
   */
  function checkSignatures(address to, uint value, bytes calldata data,
    uint8[] calldata v, bytes32[] calldata r, bytes32[] calldata s) public view returns (address[] memory) {
    bytes32 transactionHash = calculateTransactionHash(nextSequenceNumber(), contractId, to, value, data);
    return verifySignatures(transactionHash, v, r, s);
  }

  /**
   * Checks if the execution of a transaction would succeed if it was properly signed.
   */
  function checkExecution(address to, uint value, bytes calldata data) public {
    Address.functionCallWithValue(to, data, value);
    require(false, "Test passed. Reverting.");
  }

  function execute(address to, uint value, bytes calldata data,
  uint8[] calldata v, bytes32[] calldata r, bytes32[] calldata s) public returns (bytes memory) {
    // ok to increment here already, will be rolled back in case of failure and saves us one local variable
    sequenceNumber = nextSequenceNumber();
    bytes32 transactionHash = calculateTransactionHash(sequenceNumber, contractId, to, value, data);
    address[] memory found = verifySignatures(transactionHash, v, r, s);
    bytes memory returndata = Address.functionCallWithValue(to, data, value);
    emit Transacted(to, extractSelector(data), found);
    return returndata;
  }

  function extractSelector(bytes calldata data) private pure returns (bytes4){
    if (data.length < 4){
      return bytes4(0);
    } else {
      return bytes4(data[0]) | (bytes4(data[1]) >> 8) | (bytes4(data[2]) >> 16) | (bytes4(data[3]) >> 24);
    }
  }

  function nextSequenceNumber() public view returns (uint256){
    return sequenceNumber + 1;
  }

  function toBytes(uint number) internal pure returns (bytes memory){
    uint len = 0;
    uint temp = 1;
    while (number >= temp){
      temp = temp << 8;
      len++;
    }
    temp = number;
    bytes memory data = new bytes(len);
    for (uint i = len; i>0; i--) {
      data[i-1] = bytes1(uint8(temp));
      temp = temp >> 8;
    }
    return data;
  }

  // Note: does not work with contract creation
  function calculateTransactionHash(uint sequence, bytes storage id, address to, uint value, bytes calldata data)
    private pure returns (bytes32){
    bytes[] memory all = new bytes[](6);
    all[0] = toBytes(sequence); // sequence number instead of nonce
    all[1] = id; // contract id instead of gas price
    all[2] = toBytes(21000); // gas limit
    all[3] = abi.encodePacked(to);
    all[4] = toBytes(value);
    all[5] = data;
    for (uint i = 0; i<6; i++){
      all[i] = RLPEncode.encodeBytes(all[i]);
    }
    return keccak256(RLPEncode.encodeList(all));
  }

  function verifySignatures(bytes32 transactionHash, uint8[] calldata v, bytes32[] calldata r, bytes32[] calldata s)
    private view returns (address[] memory) {
    address[] memory found = new address[](r.length);
    for (uint i = 0; i < r.length; i++) {
      address signer = ecrecover(transactionHash, v[i], r[i], s[i]);
      uint8 cosignaturesNeeded = signers[signer];
      require(cosignaturesNeeded > 0 && cosignaturesNeeded <= r.length, "cosigner error");
      found[i] = signer;
    }
    requireNoDuplicates(found);
    return found;
  }

  function requireNoDuplicates(address[] memory found) private pure {
    for (uint i = 0; i < found.length; i++) {
      for (uint j = i+1; j < found.length; j++) {
        require(found[i] != found[j], "duplicate signature");
      }
    }
  }

  /**
   * Call this method through execute
   */
  function setSigner(address signer, uint8 cosignaturesNeeded) public {
    require(address(this) == msg.sender || signers[msg.sender] == 1, "not authorized");
    _setSigner(signer, cosignaturesNeeded);
    require(signerCount > 0);
  }

  function migrate(address destination) public {
    uint8 power = signers[msg.sender];
    // calling the setters in this order ensures that you don't set your power to zero
    // when destination == msg.sender :)
    _setSigner(msg.sender, 0);
    _setSigner(destination, power);
  }

  function _setSigner(address signer, uint8 cosignaturesNeeded) internal {
    require(!Address.isContract(signer), "signer cannot be a contract");
    uint8 prevValue = signers[signer];
    signers[signer] = cosignaturesNeeded;
    if (prevValue > 0 && cosignaturesNeeded == 0){
      signerCount--;
    } else if (prevValue == 0 && cosignaturesNeeded > 0){
      signerCount++;
    }
    emit SignerChange(signer, cosignaturesNeeded);
  }

}