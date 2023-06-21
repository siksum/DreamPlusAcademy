/**
 *Submitted for verification at Etherscan.io on 2020-09-15
*/

pragma solidity >=0.4.22 <0.7.0;

contract Storage {
    uint256 public counter = 1;

    function increment() public {
        require(counter < 3, "Expired counter contract");
        counter++;
    }
}