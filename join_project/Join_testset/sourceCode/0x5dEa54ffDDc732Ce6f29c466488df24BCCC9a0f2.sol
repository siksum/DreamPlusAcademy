pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract EMCo is CappedToken {
 
    string public name = "Emerald Coin";
    string public symbol = "EMCo";
    uint8 public decimals = 10;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




