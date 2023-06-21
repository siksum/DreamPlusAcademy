// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "forge-std/console.sol";

contract Calculator {
    event Input(string message, string function_name);
    event Output(string message, bytes4 function_signature);

    function run(string memory name) public {
        //string memory name1= "add(uint256 a, uint256 b)";
        
        bytes4 hash = bytes4(keccak256(bytes(name))); 
        console.log("[INPUT]\n%s", name);
        console.log("[OUTPUT]");
        console.logBytes4(hash);
    }
}
