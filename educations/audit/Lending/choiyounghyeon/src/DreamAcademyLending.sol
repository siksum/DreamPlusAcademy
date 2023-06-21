// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./interface/IPriceOracle.sol";
import "./interface/IDreamAcademyLending.sol";

contract DreamAcademyLending {
    uint256 public number;
    ERC20 usdc;
    uint256 usdc_amount;

    mapping (address => uint256) loan_ledger;
    mapping (address => mapping (address => uint256)) deposit_ledger;

    constructor(IPriceOracle _oracle, address _usdc) {
        usdc = ERC20(_usdc);
    }
    function initializeLendingProtocol(address _usdc_) public payable {
        usdc.transferFrom(msg.sender, address(this), msg.value);
        usdc_update();

        require(usdc_amount == msg.value, "Invalid Initialization");
        
    }
    function deposit(address tokenAddress, uint256 amount) external payable{
        require(tokenAddress != address(0));
        if(tokenAddress == address(usdc)){
            usdc.transferFrom(msg.sender, address(this), amount);
            deposit_ledger[msg.sender][tokenAddress] += amount;
        }
        else{
            ERC20(tokenAddress).transferFrom(msg.sender, address(this), amount);
            deposit_ledger[msg.sender][tokenAddress] += amount;

        }

    }
    function borrow(address tokenAddress, uint256 amount) external {
        require(tokenAddress == address(usdc));
        require(usdc.balanceOf(address(this)) >= amount);
        ERC20(tokenAddress).transfer(msg.sender, amount);
        loan_ledger[msg.sender] += amount;

    }
    function repay(address tokenAddress, uint256 amount) external {
        require(loan_ledger[msg.sender] <= amount);
        ERC20(tokenAddress).transferFrom(msg.sender, address(this), amount);
        loan_ledger[msg.sender] -= amount;
    }
    function liquidate(address user, address tokenAddress, uint256 amount) external {

    }
    function withdraw(address tokenAddress, uint256 amount) external {
        require(deposit_ledger[msg.sender][tokenAddress] >= amount);
        ERC20(tokenAddress).transfer(msg.sender, amount);
        deposit_ledger[msg.sender][tokenAddress] -= amount;
    }

    function usdc_update() public {
        usdc_amount = usdc.balanceOf(address(this));
    }

    function getAccruedSupplyAmount(address) public returns (uint256){}
}
