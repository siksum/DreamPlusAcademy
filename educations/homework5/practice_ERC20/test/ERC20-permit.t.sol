// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.0;

// import "../lib/forge-std/src/Test.sol";
// import "../src/ERC20.sol";
// import "../lib/forge-std/src/console.sol";
// import "../lib/forge-std/src/console2.sol";

// contract DreamTokenTest2 is Test {
//     address internal alice;
//     address internal bob;

//     uint256 internal alicePK;
//     uint256 internal bobPK;

//     ERC20 drm;

//     function setUp() public {
//         drm = new ERC20("Web3 Online Judge Token", "WEB3OJT");

//         alicePK = 0x30d655a16c1b9122bf3650d897c3ec4099b16c0b4ae307387206509b473530b3;
//         alice = 0x3fA68299Fe2AF4ac77260B806c4ffCF4A74Bd28A;

//         bobPK = 0xb0b;
//         bob = vm.addr(bobPK);
//         emit log_address(alice);
//         emit log_address(bob);

//         drm.transfer(alice, 20 ether);
//         drm.transfer(bob, 50 ether);
//     }
    
//     function testPermit() public {
//         bytes32 structHash = keccak256(abi.encode(
//             keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
//             alice, 
//             address(this), 
//             10 ether, 
//             0, 
//             1 days
//             ));
//         bytes32 hash = drm._toTypedDataHash(structHash);
//         (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePK, hash);
//         console.log(v);
//         console.log(r);
//         console.log(s);

//         assertEq(drm.nonces(alice), 0);
//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);

//         assertEq(drm.allowance(alice, address(this)), 10 ether);
//         assertEq(drm.nonces(alice), 1);
//     }

//     function testFailExpiredPermit() public {
//         bytes32 hash = keccak256(abi.encode(
//             keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
//             alice, 
//             address(this), 
//             10 ether, 
//             0, 
//             1 days
//             ));
//         bytes32 digest = drm._toTypedDataHash(hash);
//         (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePK, digest);

//         vm.warp(1 days + 1 seconds);

//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);
//     }

//     function testFailInvalidSigner() public {
//         bytes32 hash = keccak256(abi.encode(
//             keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
//             alice, 
//             address(this), 
//             10 ether, 
//             0, 
//             1 days
//             ));
//         bytes32 digest = drm._toTypedDataHash(hash);
//         (uint8 v, bytes32 r, bytes32 s) = vm.sign(bobPK, digest);

//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);
//     }

//     function testFailInvalidNonce() public {
//         bytes32 hash = keccak256(abi.encode(
//             keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
//             alice, 
//             address(this), 
//             10 ether, 
//             1, 
//             1 days
//             ));
//         bytes32 digest = drm._toTypedDataHash(hash);
//         (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePK, digest);

//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);
//     }

//     function testReplay() public {
//         bytes32 hash = keccak256(abi.encode(
//             keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"), 
//             alice, 
//             address(this), 
//             10 ether, 
//             0, 
//             1 days
//             ));
//         bytes32 digest = drm._toTypedDataHash(hash);
//         (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePK, digest);

//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);
//         vm.expectRevert("INVALID_SIGNER");
//         drm.permit(alice, address(this), 10 ether, 1 days, v, r, s);
//     }


// }