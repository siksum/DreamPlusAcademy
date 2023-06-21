pragma solidity ^0.4.24;

 import "./StandardToken.sol";

 contract ZapaygoToken is StandardToken {

     string public constant name = 'ZAPS by Zapaygo';
     string public constant symbol = 'ZAPS';
     uint8 public constant decimals = 18;
     uint256 public constant INITIAL_SUPPLY = 1 * 10 ** (9 + uint256(decimals));


     constructor() public {
       totalSupply_ = INITIAL_SUPPLY;
       balances[msg.sender] = INITIAL_SUPPLY;
     }
 }
 
