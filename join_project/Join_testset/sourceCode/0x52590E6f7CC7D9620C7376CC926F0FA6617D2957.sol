pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract FEE is CappedToken {

    string public name = "funds Community";
    string public symbol = "FEE";
    uint8 public decimals = 11;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}

