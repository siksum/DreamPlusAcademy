pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract UCROWDME is CappedToken {
 
    string public name = "UCROWDME";
    string public symbol = "UCM";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




