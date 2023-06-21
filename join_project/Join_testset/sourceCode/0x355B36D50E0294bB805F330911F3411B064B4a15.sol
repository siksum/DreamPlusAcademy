pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract MEC is CappedToken {

    string public name = "MegaTec";
    string public symbol = "MEC";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}

