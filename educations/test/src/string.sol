// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface LCSubstringSolver {
    function getLCSLength(string memory, string memory) external view returns (uint256 length);
}

contract Level {
    event Flag(address solver);
    string[] private probs0;
    string[] private probs1;
    uint[] private answers;

    constructor() {
        probs0.push("ABCD");
        probs1.push("ABCDY");
        answers.push(4);
	// ... hidden ...
        probs0.push("DAHUN");
        probs1.push("JAHUN");
        answers.push(4);
    }

    function submitAnswer(address lcs) external {
        LCSubstringSolver iLCS = LCSubstringSolver(lcs);
        require(checkAnswer(iLCS), "Wrong Answer");
        emit Flag(tx.origin);
    }

    function checkAnswer(LCSubstringSolver iLCS) private returns (bool) {
        for (uint i=0; i<probs0.length; i++) {
            require(bytes(probs0[i]).length < 20);
            require(bytes(probs1[i]).length < 20);

            uint gl = gasleft();
            require(iLCS.getLCSLength(probs0[i], probs1[i]) == answers[i], "Wrong Answer!");
            require(gl - gasleft() < 600000, "Too many gas");
        }

        return true;
    }
}