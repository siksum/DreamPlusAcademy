pragma solidity ^0.4.24;

/**
*
* TokenMaker.org (TMO)
*
*/

import "./MintableToken.sol";
import "./CappedToken.sol";

contract TokenMakerOrg is CappedToken {
 
    string public name = "TokenMakerOrg";
    string public symbol = "TMO";
    uint8 public decimals = 18;

    constructor(
        uint256 _cap
        )
        public
        CappedToken( _cap ) {
    }
}




