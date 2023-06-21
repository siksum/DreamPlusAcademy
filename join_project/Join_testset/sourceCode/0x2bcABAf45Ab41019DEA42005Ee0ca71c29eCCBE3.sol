pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract RicByte is CappedToken {
 
    string public name = "RicByte";
    string public symbol = "RBYTE";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




