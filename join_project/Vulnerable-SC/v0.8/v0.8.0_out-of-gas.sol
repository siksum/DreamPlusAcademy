// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract outOfGas {

    address payable public owner;
    address payable public dest;

	uint counter = 0;
    
     constructor() public {
        owner = payable(msg.sender);
    }
    
    function setDest() public {
        dest = payable(msg.sender);
    }
    
    
    // Out of gas vulnerability due to infinite loop
    
    function run() public payable {
        for(uint i = 0; i >= 0; i++) {
            dest.send(msg.value);
            counter++;
        }
    }
    
}
