// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "@openzeppelin/contracts/access/Ownable.sol";

interface IMinusCalculator {
    function minus(uint256, uint256) external pure returns (uint256);
}

contract MinusCalculatorProblem{
    IMinusCalculator public minusCalculator;

    function setMinusCalculator(address _minusCalculator) public {
        minusCalculator = IMinusCalculator(_minusCalculator);
    }
}

contract MyMinusCalculator is IMinusCalculator {
    function minus(uint256 input1, uint256 input2) override public pure returns (uint256){
        return input1 - input2;
    }
}