/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/




pragma solidity >=0.5.0;

contract Migrations {
  address public owner;
  uint internal last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;	
  }
}