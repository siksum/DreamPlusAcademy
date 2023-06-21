// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../src/3.sol";
import "forge-std/Test.sol";

contract CounterTest is Test{
    Level public level;
    LCSubstringSolver public lcs;

    function setUp() public{
        level = Level(0xc10C412E0E609d9F470d076Dab9a8198c67612de);
        lcs = new LCSubstringSolver();
    }

    function testPoc() public{
        level.submitAnswer(address(lcs));
    }
}