// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Quiz{
    struct Quiz_item {
      uint id; // item 번호
      string question; //질문
      string answer; //답
      uint min_bet; //베팅할 최소 금액
      uint max_bet; //베팅할 최대 금액
   }
    mapping(address => uint256)[] public bets; //사람들이 베팅한 금액 [{0xaaaaa~:20}]
    mapping(address=>uint256) public bet;
    uint public vault_balance; //잔액?
    address owner=msg.sender; //주인
    mapping(uint => Quiz_item) public quizs; 
    string[] answers;
    bool isWinner = false;
    constructor () {
        Quiz_item memory q;
        q.id = 1;
        q.question = "1+1=?";
        q.answer = "2";
        q.min_bet = 1 ether;
        q.max_bet = 2 ether;
        addQuiz(q);
    }

    function addQuiz(Quiz_item memory q) public {
        require(msg.sender == owner, "fail");
        answers.push(q.answer);
        q.answer = "";
        quizs[q.id] = q;
    }

    function getAnswer(uint quizId) public view returns (string memory){
        return answers[quizId-1];
    }

    function getQuiz(uint quizId) public view returns (Quiz_item memory) {
        return quizs[quizId];
    }   
    function getQuizNum() public view returns (uint){
        return answers.length; //quizs[answers.length].id
    }
   
    function betToPlay(uint quizId) public payable {
        require(quizs[quizId].min_bet<=msg.value);
        require(quizs[quizId].max_bet>=msg.value);
        bets.push();
        bets[quizId-1][msg.sender] += msg.value;
    }

    function solveQuiz(uint quizId, string memory ans) public returns (bool) {
        // answers[quizId-1] == ans 
        bool result = keccak256(abi.encodePacked(answers[quizId-1]))==keccak256(abi.encodePacked(ans)) ? true:false;
        vault_balance = bets[quizId-1][msg.sender];
        bets[quizId-1][msg.sender] = 0;
        isWinner=result;
        return result;
    }

    function claim() public {
        if(isWinner) {
            payable(msg.sender).transfer(vault_balance*2);
        }
        vault_balance=0;
    }

    receive() external payable {}
}