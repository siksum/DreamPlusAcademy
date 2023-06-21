//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20{
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) allowances;
    string public name;
    string public symbol;
    address private owner;
    uint8 public decimals;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply){
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only Owner");
        _;
    }

    function balanceOf() public returns(uint){
        //token도 컨트랙트
        //인스턴스 생성
        return balances[msg.sender];
    }

    function transfer(address to, uint256 amount) public {
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    function approve(address to, uint256 amount) private{
        allowances[msg.sender][to] += amount;
    }

    function transferFrom(address from, address to, uint256 amount) private{ 
        allowances[from][msg.sender] -= amount;
        balances[from] -= amount;
        balances[to] += amount;
    }

    function mint(uint256 amount) private onlyOwner{
        balances[msg.sender] += amount;
        totalSupply += amount;
    }

    function burn(uint256 amount) private onlyOwner{
        balances[msg.sender] -= amount;
        totalSupply -= amount;

    }

}