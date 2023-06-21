// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/UniswapV2RouterDemo.sol";
import "../lib/forge-std/src/interfaces/IERC20.sol";

interface IWETH {
    function deposit() external payable;
    function withdraw(uint balance) external;
    function balanceOf(address to) external returns(uint);
    function approve(address to, uint256 amount)external;
}

interface IPair {

    function balanceOf(address to) external returns(uint);
}

contract TestUniswapV2RouterDemo is Test {
    address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant HOLDER = 0x0F5545a5393aB2cf0AB49E053E23175f59c8e968;
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    address private constant WETHTODAIPAIR = 0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11;
    UniswapV2RouterDemo router;
    function setUp() public {
        router = new UniswapV2RouterDemo();
    }

    function testAddLiquidity() public {
        vm.startPrank(HOLDER);
        IWETH(WETH).deposit{value:HOLDER.balance}();
        uint daiAmount = IERC20(DAI).balanceOf(HOLDER);
        uint wethAmount = IWETH(WETH).balanceOf(HOLDER);
        console.log("before Dai amount: %d", daiAmount);
        console.log("before WETH amount: %d", wethAmount);

        IERC20(DAI).approve(address(router), daiAmount);
        IWETH(WETH).approve(address(router),wethAmount);
        router.addLiquidity(
            DAI,
            WETH,
            daiAmount,
            wethAmount
        );

        console.log("after Dai amount: %d", IERC20(DAI).balanceOf(address(router)));
        console.log("after WETH amount: %d", IWETH(WETH).balanceOf(address(router)));
        console.log("liquidity token amount: %d",IPair(WETHTODAIPAIR).balanceOf(address(router)));
    } 
}
