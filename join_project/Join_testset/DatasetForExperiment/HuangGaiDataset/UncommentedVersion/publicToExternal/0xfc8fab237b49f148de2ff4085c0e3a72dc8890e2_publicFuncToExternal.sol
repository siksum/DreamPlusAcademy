/**
 *Submitted for verification at Etherscan.io on 2020-09-11
*/



pragma solidity ^0.5.16;

interface ULUStake {
    function totalAccumulatedReward() external view returns (uint);
    function stakingPower(address) external view returns (uint);
}

contract ULUVoterProxy {

    ULUStake public constant stakingPool = ULUStake(0xe2A1e9467B5D18F9cD7e7fEbd4D926DC519EcaEE);

    function decimals() public pure returns (uint8) {	
        return uint8(18);
    }

    function name() public pure returns (string memory) {	
        return "ULUPOWAH";
    }

    function symbol() public pure returns (string memory) {	
        return "ULU";
    }

    function totalSupply() public view returns (uint) {	
        return stakingPool.totalAccumulatedReward();
    }

    function balanceOf(address _voter) public view returns (uint) {	
        (uint _votes) = stakingPool.stakingPower(_voter);
        return _votes;
    }

    constructor() public {}
}