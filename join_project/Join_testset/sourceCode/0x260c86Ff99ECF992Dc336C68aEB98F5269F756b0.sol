pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract AGT is CappedToken {
 
    string public name = "AgriTrackingTOKEN";
    string public symbol = "AGT";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




