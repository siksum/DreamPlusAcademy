pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract RisingSun is CappedToken {
 
    string public name = "RisingSun";
    string public symbol = "Rising";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




