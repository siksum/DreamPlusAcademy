pragma solidity ^0.5.0;

import "./Context.sol";
import "./ERC20.sol";
import "./ERC20Detailed.sol";

contract AIB2020 is Context, ERC20, ERC20Detailed {
    //Zhang0PeterCoin1 11111
    //ZPC111111
    //3: 1111111111111111 311111111 0.00111111
    constructor () public ERC20Detailed("AIB on ERC20 V1", "AIB", 8) {
        //11111111111111111111ETH1111
        //2331111111
        _mint(_msgSender(), 21000000 * (10 ** uint256(decimals())));
    }
}
