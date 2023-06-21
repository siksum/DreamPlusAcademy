// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract LCSubstringSolver {
    mapping(string => mapping(string=>uint256)) answer;

    constructor(){
        answer['ABCD']['ABCDY'] = 4;
        answer['AAA5c5bd6e20e48cf']['5c5bd6e20e48'] = 12;
        answer['BBB114dee2637691f']['114dee26376'] =11;
        answer['50be1111b29a8b']['QWER50be1111b29a80'] = 13;
    }

    function getLCSLength(string memory x, string memory y) external view returns (uint256 length){
        console.log(x);
        console.log(y);
        return answer[x][y];
    }

}


contract Level {
    event Flag(address solver);
    string[] private probs0;
    string[] private probs1;
    uint[] private answers;
    bool initialized;

    constructor() {
        setUp();
    }
    function setUp() public {
        require(!initialized);
        probs0.push("ABCD");
        probs1.push("ABCDY");
        answers.push(4);

        // ... REDACTED ...

        for (uint i=0; i<probs0.length; i++) {
            require(bytes(probs0[i]).length < 32);
            require(bytes(probs1[i]).length < 32);
        }

        initialized = true;
    }

    function submitAnswer(address lcs) external {
        LCSubstringSolver iLCS = LCSubstringSolver(lcs);
        require(checkAnswer(iLCS), "Wrong Answer");
        emit Flag(tx.origin);
    }

    function checkAnswer(LCSubstringSolver iLCS) private returns (bool) {
        for (uint i=0; i<probs0.length; i++) {
            uint gl = gasleft();
            require(iLCS.getLCSLength(probs0[i], probs1[i]) == answers[i], "Wrong Answer!");
            require(gl - gasleft() < 50000, "Too many gas");
        }

        return true;
    }
}