/**
 *Submitted for verification at Etherscan.io on 2020-10-16
*/


pragma solidity 0.5.3;

contract TestContract {
    
    string private greeting;
    
    
    constructor() public {
        greeting = "Hello!!";        
    }
    
    /** @dev Function to set a new greeting.
      * @param newGreeting The new greeting message. 
      */
    function setGreeting(string memory newGreeting) public {
        greeting = newGreeting;	
    }
    
    /** @dev Function to greet. 
      * @return The greeting string. 
      */
    function greet() public view returns (string memory) {
        return greeting;	
    }
}