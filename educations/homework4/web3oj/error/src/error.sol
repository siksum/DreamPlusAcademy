// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandleProblem {
    string public errorMessage;

    function throwError() public{
        error = "Error!";
        revert(error);
        setErrorMessage(error);
    }

    function setErrorMessage(string memory _errorMessage) public {
        errorMessage = _errorMessage;
    }
}