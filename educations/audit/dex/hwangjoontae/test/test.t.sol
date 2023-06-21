// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../src/Dex.sol";

contract CustomERC20 is ERC20 {
    constructor(string memory tokenName) ERC20(tokenName, tokenName) {
        _mint(msg.sender, 1000 ether);
    }

    function mint(address to ,uint amount) external {
        _mint(to,amount);
    }
}



/*
 * Contract에서 필요한 만큼(또는 요청한 만큼)의 자산을 가져가도록 구현되어있다는 것을 가정하였습니다.
 * (transferFrom을 통해)
 */
contract DexTest is Test {
    Dex public dex;
    CustomERC20 tokenX;
    CustomERC20 tokenY;
    
    address player1 = address(0x1);
    address player2 = address(0x2);
    address player3 = address(0x3);
    address player4 = address(0x4);
    function setUp() public {
        tokenX = new CustomERC20("XXX");
        tokenY = new CustomERC20("YYY");

        dex = new Dex(address(tokenX), address(tokenY));

        tokenX.approve(address(dex), type(uint).max);
        tokenY.approve(address(dex), type(uint).max);
        
        tokenX.mint(player1, 5000 ether);
        tokenX.mint(player2, 5000 ether);
        tokenX.mint(player3, 5000 ether);
        tokenX.mint(player4, 5000 ether);

        tokenY.mint(player1, 5000 ether);
        tokenY.mint(player2, 5000 ether);
        tokenY.mint(player3, 5000 ether);
        tokenY.mint(player4, 5000 ether);
    }
 
    
    function testAddLiquidity() external {
        uint firstLPReturn = dex.addLiquidity(1000 ether, 1000 ether, 0); //lp = 1000
        emit log_named_uint("firstLPReturn", firstLPReturn);

        uint secondLPReturn = dex.addLiquidity(1000 ether, 2000 ether, 0); //lp = 1000
        emit log_named_uint("secondLPReturn", secondLPReturn);

        (uint x, uint y) = dex.removeLiquidity(secondLPReturn,0, 0); 
        emit log_named_uint("x", x);
        emit log_named_uint("y", y);

        assertEq(x, 1000 ether);
        assertEq(y, 2000 ether);


        // vm.startPrank(player2);
        // tokenX.approve(address(dex), type(uint).max);
        // tokenY.approve(address(dex), type(uint).max);
        // uint secondLPReturn = dex.addLiquidity(1000 ether, 2000 ether, 0); //lp = 1000
        // emit log_named_uint("secondLPReturn", secondLPReturn);
    
        // dex.removeLiquidity(secondLPReturn,0, 0);
        // emit log_named_uint("test",tokenX.balanceOf(player2));
        // emit log_named_uint("test",tokenY.balanceOf(player2));
        // vm.stopPrank();

        // vm.startPrank(player3);
        // emit log_named_uint("reserveX",tokenX.balanceOf(address(dex)));
        // emit log_named_uint("reserveY",tokenY.balanceOf(address(dex)));
        // tokenX.approve(address(dex), type(uint).max);
        // tokenY.approve(address(dex), type(uint).max);
        // uint swap1 = dex.swap(1000 ether, 0, 0); //lp = 1000
        // emit log_named_uint("swap", swap1);

        // emit log_named_uint("test",tokenX.balanceOf(player3));
        // emit log_named_uint("test",tokenY.balanceOf(player3));
        // vm.stopPrank();

    }
    // function testSwap4() external {
    //     uint result = dex.swap(0, 6000 ether, 0);
    //     (bool success, ) = address(dex).call(abi.encodeWithSelector(dex.swap.selector, 0, 6000 ether, 0));
    //     assertTrue(!success, "Swap test fail 4; minimum ouput amount check failed");
    //     // dex.addLiquidity(3000 ether, 4000 ether, 0);
    //     // dex.addLiquidity(30000 ether * 2, 40000 ether * 2, 0);

    //     // // x -> y
    //     // uint poolAmountX = 60000 ether + 3000 ether;
    //     // uint poolAmountY = 80000 ether + 4000 ether;
    //     // int expectedOutput = (int(poolAmountY * 10000000000 ether * 999 /1000) / int(poolAmountX + 10000000000 ether * 999 /1000));
    //     // emit log_named_int("expected output", expectedOutput);

    //     // (bool success, ) = address(dex).call(abi.encodeWithSelector(dex.swap.selector, 10000000000 ether, 0, expectedOutput * 1005 /1000));
    //     // assertTrue(!success, "Swap test fail 4; minimum ouput amount check failed");
    // }
}