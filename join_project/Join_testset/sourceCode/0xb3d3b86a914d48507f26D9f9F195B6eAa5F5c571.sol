/**
 *Submitted for verification at Etherscan.io on 2020-11-13
*/

// Sources flattened with buidler v1.4.1 https://buidler.dev


// signature based "meta-multi-sig" wallet  -- austin griffith @austingriffith

// https://github.com/austintgriffith/scaffold-eth/tree/meta-multi-sig


// File @openzeppelin/contracts/cryptography/ECDSA.sol@v3.1.0

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

/**
 * @dev Elliptic Curve Digital Signature Algorithm (ECDSA) operations.
 *
 * These functions can be used to verify that a message was signed by the holder
 * of the private keys of a given address.
 */
library ECDSA {
    /**
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature`. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {toEthSignedMessageHash} on it.
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        // Check the signature length
        if (signature.length != 65) {
            revert("ECDSA: invalid signature length");
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (281): 0 < s < secp256k1n ÷ 2 + 1, and for v in (282): v ∈ {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            revert("ECDSA: invalid signature 's' value");
        }

        if (v != 27 && v != 28) {
            revert("ECDSA: invalid signature 'v' value");
        }

        // If the signature is valid (and not malleable), return the signer address
        address signer = ecrecover(hash, v, r, s);
        require(signer != address(0), "ECDSA: invalid signature");

        return signer;
    }

    /**
     * @dev Returns an Ethereum Signed Message, created from a `hash`. This
     * replicates the behavior of the
     * https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign[`eth_sign`]
     * JSON-RPC method.
     *
     * See {recover}.
     */
    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}


// File contracts/MetaMultiSigWallet.sol

// started from https://solidity-by-example.org/0.6/app/multi-sig-wallet/ and cleaned out a bunch of stuff
// grabbed recover stuff from bouncer-proxy: https://github.com/austintgriffith/bouncer-proxy/blob/master/BouncerProxy/BouncerProxy.sol
// after building this I found https://github.com/christianlundkvist/simple-multisig/blob/master/contracts/SimpleMultiSig.sol which is amazing and he even has the duplicate guard the same (Scott B schooled me on that!)
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;


contract MetaMultiSigWallet {
    using ECDSA for bytes32;

    event Deposit(address indexed sender, uint amount, uint balance);
    event ExecuteTransaction( address indexed owner, address payable to, uint256 value, bytes data, uint256 nonce, bytes32 hash, bytes result);
    event Owner( address indexed owner, bool added);

    mapping(address => bool) public isOwner;
    uint public signaturesRequired;
    uint public nonce;
    uint public chainId;

    constructor(uint256 _chainId, address[] memory _owners, uint _signaturesRequired) public {
        require(_signaturesRequired>0,"constructor: must be non-zero sigs required");
        signaturesRequired = _signaturesRequired;
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner!=address(0), "constructor: zero address");
            require(!isOwner[owner], "constructor: owner not unique");
            isOwner[owner] = true;
            emit Owner(owner,isOwner[owner]);
        }
        chainId=_chainId;
    }

    modifier onlySelf() {
        require(msg.sender == address(this), "Not Self");
        _;
    }

    function addSigner(address newSigner, uint256 newSignaturesRequired) public onlySelf {
        require(newSigner!=address(0), "addSigner: zero address");
        require(!isOwner[newSigner], "addSigner: owner not unique");
        require(newSignaturesRequired>0,"addSigner: must be non-zero sigs required");
        isOwner[newSigner] = true;
        signaturesRequired = newSignaturesRequired;
        emit Owner(newSigner,isOwner[newSigner]);
    }

    function removeSigner(address oldSigner, uint256 newSignaturesRequired) public onlySelf {
        require(isOwner[oldSigner], "removeSigner: not owner");
        require(newSignaturesRequired>0,"removeSigner: must be non-zero sigs required");
        isOwner[oldSigner] = false;
        signaturesRequired = newSignaturesRequired;
        emit Owner(oldSigner,isOwner[oldSigner]);
    }

    function updateSignaturesRequired(uint256 newSignaturesRequired) public onlySelf {
        require(newSignaturesRequired>0,"updateSignaturesRequired: must be non-zero sigs required");
        signaturesRequired = newSignaturesRequired;
    }

    function getTransactionHash( uint256 _nonce, address to, uint256 value, bytes memory data ) public view returns (bytes32) {
        return keccak256(abi.encodePacked(address(this),chainId,_nonce,to,value,data));
    }

    function executeTransaction( address payable to, uint256 value, bytes memory data, bytes[] memory signatures)
        public
        returns (bytes memory)
    {
        require(isOwner[msg.sender], "executeTransaction: only owners can execute");
        bytes32 _hash =  getTransactionHash(nonce, to, value, data);
        nonce++;
        uint256 validSignatures;
        address duplicateGuard;
        for (uint i = 0; i < signatures.length; i++) {
            address recovered = recover(_hash,signatures[i]);
            require(recovered>duplicateGuard, "executeTransaction: duplicate or unordered signatures");
            duplicateGuard = recovered;
            if(isOwner[recovered]){
              validSignatures++;
            }
        }

        require(validSignatures>=signaturesRequired, "executeTransaction: not enough valid signatures");

        (bool success, bytes memory result) = to.call{value: value}(data);
        require(success, "executeTransaction: tx failed");

        emit ExecuteTransaction(msg.sender, to, value, data, nonce-1, _hash, result);
        return result;
    }

    function recover(bytes32 _hash, bytes memory _signature) public pure returns (address) {
        return _hash.toEthSignedMessageHash().recover(_signature);
    }

    receive() payable external {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

}