pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract DogadoCoin is CappedToken {

    string public name = "Dogado Coin";
    string public symbol = "DGDC";
    uint8 public decimals = 4;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




