pragma solidity ^0.4.24;

/**
* =====================================
* Created at https://www.tokenmaker.org
* =====================================
*/

import "./MintableToken.sol";
import "./CappedToken.sol";

contract AmayCoin is CappedToken {

    string public name = "AmayCoin";
    string public symbol = "amay";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




