// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "forge-std/console.sol";

/**
1. pool 비율 깨짐
-> 적은 양의 토큰으로 많은 양의 LP token을 발행해 remove에서 더 많이 받아갈 수 있음 
 */

contract Dex is ERC20 {
    uint256 public amountX;
    uint256 public amountY;

    ERC20 public X;
    ERC20 public Y;
    event Console(uint amount);
    constructor (address tokenX, address tokenY) ERC20("DREAM", "DRM") {
        X = ERC20(tokenX);
        Y = ERC20(tokenY);
    }
    
    function swap(uint256 tokenXAmount, uint256 tokenYAmount, uint256 tokenMinimumOutputAmount) external returns (uint256 outputAmount) {
        require((tokenXAmount==0 && tokenYAmount>0) || (tokenYAmount==0 && tokenXAmount>0));
        require(amountX >0 && amountY > 0);

        (uint256 reserveX, uint256 reserveY) = amount_update();
        uint256 k = reserveX * reserveY;

        if(tokenXAmount > 0){
            uint256 x_value = tokenXAmount / 1000 * 999;
            console.log("x_value", x_value);
            amountY = k / (amountX + x_value);
            outputAmount = reserveY - amountY;

            require(outputAmount < amountY, "amountY is less than outputAmount");
            require(tokenMinimumOutputAmount < outputAmount, "you claim too much token");
            X.transferFrom(msg.sender, address(this), tokenXAmount);
            Y.transfer(msg.sender, outputAmount);
        }
        else{
            uint256 y_value = tokenYAmount / 1000 * 999;
            console.log("y_value", y_value);
            amountX = k / (amountY + y_value);
            outputAmount = reserveX - amountX;

            require(outputAmount < amountX, "amountX is less than outputAmount");
            require(tokenMinimumOutputAmount < outputAmount, "you claim too much token");
            Y.transferFrom(msg.sender, address(this), tokenYAmount);
            X.transfer(msg.sender, outputAmount);
        }
    }

    function addLiquidity(uint256 tokenXAmount, uint256 tokenYAmount, uint256 minimumLPTokenAmount) external returns (uint LPTokenAmount){
        //pool 비율 깨짐
        require(tokenXAmount > 0 && tokenYAmount > 0);
        (uint256 reserveX, ) = amount_update();
        (, uint256 reserveY) = amount_update();

        if(totalSupply() == 0){ LPTokenAmount = tokenXAmount * tokenYAmount / 10**18;} //계산 확인해보기
        
        else{ LPTokenAmount = totalSupply() * tokenXAmount / reserveX;}
        //console.log("add total:", totalSupply());
        require(minimumLPTokenAmount <= LPTokenAmount);

        X.transferFrom(msg.sender, address(this), tokenXAmount);
        amountX = reserveX + tokenXAmount;
        Y.transferFrom(msg.sender, address(this), tokenYAmount);
        amountY = reserveY + tokenYAmount;

        _mint(msg.sender, LPTokenAmount);
    }

    function removeLiquidity(uint256 LPTokenAmount, uint256 minimumTokenXAmount, uint256 minimumTokenYAmount) external returns (uint _tx, uint _ty){
        amount_update();

        _tx = amountX * LPTokenAmount / totalSupply();
        _ty = amountY * LPTokenAmount / totalSupply();

        // console.log("reserveX:",_tx);
        // console.log("reserveY:", _ty);
        // console.log("current supply:", totalSupply());

        require(_tx>=minimumTokenXAmount);
        require(_ty>=minimumTokenYAmount);

        X.transfer(msg.sender, _tx);
        Y.transfer(msg.sender, _ty);
        _burn(msg.sender, LPTokenAmount);
    }
    
    function amount_update() internal returns (uint256, uint256) {
        amountX = X.balanceOf(address(this));
        amountY = Y.balanceOf(address(this));

        return (amountX, amountY);
    }
}

