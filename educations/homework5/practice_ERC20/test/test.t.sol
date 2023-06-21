// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../lib/forge-std/src/Test.sol";
import "../src/ERC20.sol";
import "../lib/forge-std/src/console.sol";
import "../lib/forge-std/src/console2.sol";

contract DreamTokenTest2 is Test {
    address internal alice;
    uint256 internal alicePK;


    ERC20 drm;

    function setUp() public {
        drm = new ERC20("Web3 Online Judge Token", "WEB3OJT");

        alicePK = 0x30d655a16c1b9122bf3650d897c3ec4099b16c0b4ae307387206509b473530b3;
        alice = 0x3fA68299Fe2AF4ac77260B806c4ffCF4A74Bd28A;
        //ins = 0x1Ce34209B7B2b90f32BA1606447a5186F9D47325;

        //emit log_address(alice);

        drm.transfer(alice, 20 ether);
    }
    
    function testPermit() public {
        bytes32 structHash = keccak256(abi.encode(
            keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
            alice, 
            0x1Ce34209B7B2b90f32BA1606447a5186F9D47325, 
            20 ether, 
            1, 
            1710851606
            ));
            //keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonce,deadline));
        bytes32 hash = drm._toTypedDataHash(structHash);
        //keccak256(abi.encodePacked("\x19\x01", _domainSeparator(), structHash));
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePK, hash);
        emit log_address(ecrecover(hash, v, r, s));
        emit log_bytes32(hash);
        emit log_uint(v);
        emit log_bytes32(r);
        emit log_bytes32(s);
    }
}
   