/**
 *Submitted for verification at Etherscan.io on 2020-08-27
*/

pragma solidity >=0.4.0 <0.8.0;

interface COMP {
    function getCurrentVotes(address account) external view returns (uint96);
}

contract DAOSignal {
    
    COMP public _token;
    
    constructor(COMP compAddress)public {
        _token = compAddress;
    }
    
    function vote(bool support) external {
        require(_token.getCurrentVotes(msg.sender) > 0, "You are not a voter");
    }
    
    function mockVote(bool support, address user) external {
        require(_token.getCurrentVotes(user) > 0, "You are not a voter");
    }
    
}