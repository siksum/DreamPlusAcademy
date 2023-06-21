// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../src/Dex.sol";

contract CustomERC20 is ERC20 {
    constructor(string memory tokenName) ERC20(tokenName, tokenName) {
        _mint(msg.sender, type(uint).max);
    }
}

/*
 * Contract에서 필요한 만큼(또는 요청한 만큼)의 자산을 가져가도록 구현되어있다는 것을 가정하였습니다.
 * (transferFrom을 통해)
 */
contract DexTest is Test {
    Dex public dex;
    ERC20 tokenX;
    ERC20 tokenY;

    function setUp() public {
        tokenX = new CustomERC20("XXX");
        tokenY = new CustomERC20("YYY");

        dex = new Dex(address(tokenX), address(tokenY));

        tokenX.approve(address(dex), type(uint).max);
        tokenY.approve(address(dex), type(uint).max);
    }
 
    
    function testAddLiquidity() external {
        uint firstLPReturn = dex.addLiquidity(3000 ether, 4000 ether, 0); //lp = 1000
        emit log_named_uint("firstLPReturn", firstLPReturn);

        uint secondLPReturn = dex.addLiquidity(5000 ether, 8000 ether, 0); //lp = 1000
        emit log_named_uint("secondLPReturn", secondLPReturn);

        (uint x, uint y) = dex.removeLiquidity(secondLPReturn,0, 0); //lp = 1000
        emit log_named_uint("x", x);
        emit log_named_uint("y", y);

        // (bool success, ) = address(dex).call(abi.encodeWithSelector(dex.addLiquidity.selector, 4000 ether, 100 ether, 0));
        // assertTrue(!success, "error");
    }
}