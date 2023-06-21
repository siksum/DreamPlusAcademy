pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract SunFarm is CappedToken {

    string public name = "SunFarm";
    string public symbol = "SunFm";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




