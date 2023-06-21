// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/console.sol";
contract Lottery{
    uint16 constant public  winningNumber = 1;
    mapping(address => bool) isBought;
    mapping(address => uint16) rottery;

    uint totalReward;
    uint time;
    bool isFinish;
    uint count;
    uint reward;
    constructor(){
        time = block.timestamp ;
    }
    
    function buy(uint16 rotteryNum) public payable{
       require(msg.value == 0.1 ether);
       require(!isBought[msg.sender]);
       require(block.timestamp < time + 24 hours);
       isBought[msg.sender] = true;
       rottery[msg.sender] = rotteryNum;
       if(rotteryNum == winningNumber){
            count++;
       }
       totalReward+= msg.value;
    }

    function draw() public {
        require(block.timestamp >= time + 24 hours);
        require(!isFinish);
        if(count > 0) {
            reward = totalReward / count;
            
        }
    }


    function claim() public {
        require(block.timestamp >= time + 24 hours);

        if (rottery[msg.sender] == winningNumber){
            payable(msg.sender).call{value: reward}("");
            totalReward-=reward;

        }
        if(totalReward == 0 || count == 0) {
            time = block.timestamp;
        }
        isFinish = false;
        isBought[msg.sender] = false;
    }

    receive() external payable{}
}
    