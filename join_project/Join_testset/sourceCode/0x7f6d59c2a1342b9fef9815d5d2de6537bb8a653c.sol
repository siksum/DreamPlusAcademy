/**
 *Submitted for verification at Etherscan.io on 2020-09-29
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IAdmin {
    function admin() external view returns (address);
}

contract Admin {
    address public admin;

    constructor () public {
        admin = msg.sender;
    }

    function changeAdmin(address addr) public {
        require(msg.sender == admin, "Not admin");
        admin = addr;
    }
}