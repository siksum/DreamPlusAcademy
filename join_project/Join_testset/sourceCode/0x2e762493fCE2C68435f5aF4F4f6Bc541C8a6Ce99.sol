pragma solidity ^0.5.0; // solidity 0.5.2

import './LockableToken.sol';

contract MyToken is LockableToken {
  string public constant name = "FANZY EXCHANGE";
  string public constant symbol = "FX";
  uint public constant decimals = 18; // 111 1811
  uint public constant INITIAL_SUPPLY = 7000000000 * 10 ** decimals; // 11 111

  constructor() public {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}
