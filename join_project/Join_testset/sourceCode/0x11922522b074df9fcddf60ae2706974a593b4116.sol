/**
 *Submitted for verification at Etherscan.io on 2020-09-25
*/

pragma solidity 0.5.17;

contract Test
{
  function getBalance() public view returns (uint){
    return msg.sender.balance;
  }
}