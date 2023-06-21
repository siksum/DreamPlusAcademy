// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/utils/math/Math.sol";
//import "forge-std/console.log";

contract Dex{
    using Math for uint256;
    ERC20 tokenX;
    ERC20 tokenY;
    uint256 public totalLiquidity; //visibility?
    mapping(address => uint256) public LPToken_balances;
    mapping(address => uint256) public balances;
    event Console(uint amount);
    constructor(address _tokenX,address _tokenY) {
        tokenX = ERC20(_tokenX);
        tokenY = ERC20(_tokenY);
        
    }
    function swap(uint256 tokenXAmount, uint256 tokenYAmount, uint256 tokenMinimumOutputAmount) public returns (uint256 outputAmount){
        require(tokenXAmount >= 0 || tokenYAmount >= 0);
        require(tokenXAmount == 0 || tokenYAmount == 0);
        //reserve unchecked
        uint256 xBalance = tokenX.balanceOf(address(this));
        uint256 yBalance = tokenY.balanceOf(address(this)); 
        
        if(tokenXAmount != 0){
            outputAmount = yBalance * (tokenXAmount * 999 / 1000) / (xBalance + (tokenXAmount * 999 / 1000));

            require(outputAmount >= tokenMinimumOutputAmount);
            yBalance -= outputAmount ;
            xBalance += tokenXAmount;
            emit Console(xBalance);
            emit Console(yBalance);
            tokenX.transferFrom(msg.sender, address(this), tokenXAmount);
            tokenY.transfer(msg.sender, outputAmount );
        }
        else{
            outputAmount = xBalance * (tokenYAmount * 999 / 1000) / (yBalance + (tokenYAmount * 999 / 1000));

            require(outputAmount >= tokenMinimumOutputAmount);
            xBalance -= outputAmount;
            yBalance += tokenYAmount;
            emit Console(xBalance);
            emit Console(yBalance);
            tokenY.transferFrom(msg.sender, address(this), tokenYAmount);
            tokenX.transfer(msg.sender, outputAmount);
        }
        return outputAmount;
        //yBalance, xBalance -> balances에 업데이트 미수행
}
  
    

function addLiquidity(uint256 tokenXAmount, uint256 tokenYAmount, uint256 minimumLPTokenAmount) external returns (uint256 LPTokenAmount){
    require(tokenXAmount > 0 && tokenYAmount > 0,"please check tokenXAmount and tokenYAmount");
    uint256 xBalance = balances[address(tokenX)];
    uint256 yBalance = balances[address(tokenY)];
    uint256 liquidityX;
    uint256 liquidityY;
    if(totalLiquidity == 0) {
        LPTokenAmount = Math.sqrt(tokenXAmount * tokenYAmount);
        require(LPTokenAmount >= minimumLPTokenAmount);
        totalLiquidity = LPTokenAmount;
        
    } 
    else {
        //pool 비율 깨짐
        liquidityX = (totalLiquidity*tokenXAmount) / xBalance;
        liquidityY = (totalLiquidity*tokenYAmount) / yBalance;
        LPTokenAmount = (liquidityX < liquidityY) ? liquidityX : liquidityY;
        require(LPTokenAmount >= minimumLPTokenAmount);
        totalLiquidity += LPTokenAmount;
    }
    tokenX.transferFrom(msg.sender, address(this), tokenXAmount);
    tokenY.transferFrom(msg.sender, address(this), tokenYAmount);
    balances[address(tokenX)] += tokenXAmount;
    balances[address(tokenY)] += tokenYAmount;
    //mint안된 것 같은디요
    LPToken_balances[msg.sender] += LPTokenAmount;
    return LPTokenAmount;
}    
    function removeLiquidity(uint256 LPTokenAmount, uint256 minimumTokenXAmount, uint256 minimumTokenYAmount) external returns (uint,uint){
        require(LPTokenAmount <= LPToken_balances[msg.sender], "Insufficient LP token balance");
        require(LPTokenAmount > 0,"Invalid LP token amount"); 
        uint xBalance = (LPTokenAmount*tokenX.balanceOf(address(this)))/totalLiquidity;
        uint yBalance = (LPTokenAmount*tokenY.balanceOf(address(this)))/totalLiquidity;

        require(xBalance >= minimumTokenXAmount && yBalance >= minimumTokenYAmount, "Insufficient liquidity");
        emit Console(xBalance);
        emit Console(yBalance);
        balances[address(tokenX)] -= xBalance;
        balances[address(tokenY)] -= yBalance;
        
        LPToken_balances[msg.sender] -= LPTokenAmount;
        totalLiquidity -= LPTokenAmount;
        return (xBalance,yBalance);
    }

    function transfer(address to, uint256 lpAmount) external returns (bool){   
    }


}