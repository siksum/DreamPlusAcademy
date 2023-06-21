pragma solidity ^0.5.7;

import "./ballot.sol";

contract NewToken is ERC20Standard {
	constructor() public {
		totalSupply = 10000000000000;
		name = "CREXSOFT";
		decimals = 8;
		symbol = "CREXSOFT";
		version = "1.0";
		balances[msg.sender] = totalSupply;
	}
}
