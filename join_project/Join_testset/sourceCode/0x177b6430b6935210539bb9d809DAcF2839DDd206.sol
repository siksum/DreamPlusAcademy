pragma solidity ^0.4.24;

import "./MintableToken.sol";
import "./CappedToken.sol";

contract VelcomExCoin is CappedToken {

    string public name = "VelcomEx Coin";
    string public symbol = "VEL";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}

