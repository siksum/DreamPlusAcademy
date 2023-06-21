// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/UniswapV2RouterDemo.sol";
import "../lib/forge-std/src/interfaces/IERC20.sol";
contract TestUniswapV2RouterDemo is Test {
    UniswapV2RouterDemo public router;
    address DAI_HOLDER;
    address DAI;
    address WBTC;
    address receiver = address(0x1);
    function setUp() public {
        DAI_HOLDER = 0x0F5545a5393aB2cf0AB49E053E23175f59c8e968;//그 시점에 dai 갖고 있는 사람
        DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599; 
        router = new UniswapV2RouterDemo();
        //다이에서 이벤트 찍힐 때 from 주소
    }

    function testSwap() public {
        IERC20 tokenIn = IERC20(DAI);
        IERC20 tokenOut = IERC20(WBTC);
        uint amountIn = tokenIn.balanceOf(DAI_HOLDER);
        uint amountOutMin = 1;
        address to = receiver; 

        vm.startPrank(DAI_HOLDER); //이사람 시점에서 시작할 수 있음
        tokenIn.approve(address(router),amountIn);
        router.swap(
            address(tokenIn),
            address(tokenOut),
            amountIn,
            amountOutMin,
            to
        );
        vm.stopPrank();
        console.log(tokenOut.balanceOf(to));
        
    }
}
