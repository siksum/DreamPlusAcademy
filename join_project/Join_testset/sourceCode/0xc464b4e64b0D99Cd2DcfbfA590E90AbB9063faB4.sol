pragma solidity ^0.5.0;

import "./Context.sol";
import "./ERC20.sol";
import "./ERC20Detailed.sol";

contract StarToken is Context, ERC20, ERC20Detailed {

    /**
     * @dev Constructor that gives _msgSender() all of existing tokens.
     */
    constructor () public ERC20Detailed("Stargame Token", "STRG", 8) {
        _mint(_msgSender(), 2100000000 * (10 ** uint256(decimals())));
    }
}
