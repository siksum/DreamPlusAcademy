// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/interfaces/IERC20.sol";

interface IUniswapV2Router{
    function swapExactTokensForTokens(//token 바꾸는 것
        uint amountIn,//바꿀 토큰량
        uint amountOutMin,//뺄 최소량, x * y = k y를 미리 정해주면 계산 빨리할 수 있음. 안해두면 MEV가 다먹음
        address[] calldata path, //pair 경로 custom 가능
        address to,
        uint deadline //트랜잭션 스왑하는데 pending 많이되면 바꾸고 싶은 양보다 적어지니까 deadline 정함. 
    ) external returns (uint[] memory amounts);

    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
}

interface IUniswapV2Factory{
    function getPair(address token0,address token1) external returns(address);
}

interface IUniswapV2Pair  {
    function token0() external view returns(address);
    function token1() external view returns(address);
    function swap(
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    )external;

}

contract UniswapV2RouterDemo {
    address private constant UNISWAP_V2_ROUTER=0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH=0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;


    event Amount(uint amount);
    /**
     * 
     * @param _tokenIn 지불할 토큰 
     * @param _tokenOut 스왑할 대상 토큰
     * @param _amountIn 지불할 토큰의 금액
     * @param _amountOutMin 스왑할 대상 토큰의 최소로 바꿔져야할  금액
     * @param _to 토큰 받을 사람
     */
    function swap(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn,
        uint256 _amountOutMin,
        address _to
    )external {
        IERC20(_tokenIn).transferFrom(msg.sender,address(this),_amountIn);//스왑으로 토큰 먼저 전달, approve 해줘야 함(eoa -> a(approve) -> router swap)
        IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER,_amountIn);

                /**
         * DAI -> WETH로 스왑
         * WETH -> WEBC로 스왑
         */
        address[] memory path = new address[](3);
        path[0] = _tokenIn; // DAI
        path[1] = WETH; // WETH
        path[2] = _tokenOut; // WBTC

        IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
            _amountIn,
            _amountOutMin,
            path,
            _to,
            block.timestamp
        );
    } 

    /**
     * 
     * @param _tokenA 토큰 1 주소
     * @param _tokenB 토큰 2 주소
     * @param _amountA 토큰 1에 예치할 양
     * @param _amountB 토큰 2에 예치할 양
     */
    function addLiquidity(
        address _tokenA,
        address _tokenB,
        uint256 _amountA,
        uint256 _amountB
    ) external {
        IERC20(_tokenA).transferFrom(msg.sender,address(this),_amountA);
        IERC20(_tokenB).transferFrom(msg.sender,address(this),_amountB);

        IERC20(_tokenA).approve(UNISWAP_V2_ROUTER,_amountA);
        IERC20(_tokenB).approve(UNISWAP_V2_ROUTER,_amountB);

        (uint256 amountA,uint256 amountB,uint256 liquidity)= IUniswapV2Router(UNISWAP_V2_ROUTER).addLiquidity(
            _tokenA,
            _tokenB,
            _amountA,
            _amountB,
            1, // 유동성을 제공할 때 _amountA 양 범위 안에서 올라갈 수 있는 양을 정함
            1,
            address(this),
            block.timestamp // deadline은 트랜잭션의 팬딩 시간이 길어지거나 블록에 올라가지 않을 경우를 대비해 시간 제한을 두어 일정 시간이 지나면 유효하지 않은 트랜잭션으로 변경
        );
        emit Amount(amountA);
        emit Amount(amountB);
        emit Amount(liquidity);
    }

    function removeLiquidity(
        address _tokenA,
        address _tokenB
    ) external {
        // 각 토큰 페어마다 컨트랙트를 가지고 있음
        address pair = IUniswapV2Factory(FACTORY).getPair(_tokenA,_tokenB); // pair 주소를 가져와야함
        uint256 liquidity = IERC20(pair).balanceOf(address(this));

        IERC20(pair).approve(UNISWAP_V2_ROUTER,liquidity);
        (uint256 amountA,uint256 amountB) = IUniswapV2Router(UNISWAP_V2_ROUTER).removeLiquidity(
            _tokenA,
            _tokenB,
            liquidity,
            1,
            1,
            address(this),
            block.timestamp
        );

    }

}
