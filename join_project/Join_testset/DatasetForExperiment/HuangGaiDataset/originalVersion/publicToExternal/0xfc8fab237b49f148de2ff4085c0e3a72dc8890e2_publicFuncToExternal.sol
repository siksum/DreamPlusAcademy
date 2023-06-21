/**
 *Submitted for verification at Etherscan.io on 2020-09-11
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface ULUStake {
    function totalAccumulatedReward() external view returns (uint);
    function stakingPower(address) external view returns (uint);
}

contract ULUVoterProxy {

    ULUStake public constant stakingPool = ULUStake(0xe2A1e9467B5D18F9cD7e7fEbd4D926DC519EcaEE);

    function decimals() public pure returns (uint8) {	//inject PUBLIC FUNC TO EXTERNAL
        return uint8(18);
    }

    function name() public pure returns (string memory) {	//inject PUBLIC FUNC TO EXTERNAL
        return "ULUPOWAH";
    }

    function symbol() public pure returns (string memory) {	//inject PUBLIC FUNC TO EXTERNAL
        return "ULU";
    }

    function totalSupply() public view returns (uint) {	//inject PUBLIC FUNC TO EXTERNAL
        return stakingPool.totalAccumulatedReward();
    }

    function balanceOf(address _voter) public view returns (uint) {	//inject PUBLIC FUNC TO EXTERNAL
        (uint _votes) = stakingPool.stakingPower(_voter);
        return _votes;
    }

    constructor() public {}
}