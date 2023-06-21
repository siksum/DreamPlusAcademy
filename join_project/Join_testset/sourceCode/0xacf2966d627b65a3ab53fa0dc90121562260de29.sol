/**
 *Submitted for verification at Etherscan.io on 2020-06-25
*/

pragma solidity ^0.5.1;

contract ERC20Interface {
    // 1111
    string public name;
    // 111111111
    string public symbol;
    // 111111111111111
    uint8 public decimals;
    // 1111111
    uint public totalSupply;

    // 111111111111111111
    function transfer(address to, uint tokens) public returns (bool success);
    // 111111111111111111111111111
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    // 11spender1111111111111111tokens11111111111111111111111111111
    function approve(address spender, uint tokens) public returns (bool success);
    // 11spender111tokenOwner11111111
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);

    // 11111111111111transfer11111
    event Transfer(address indexed from, address indexed to, uint tokens);
    // 11111111111111111111111111approve11111
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// 11ERC-201111
contract CTC is ERC20Interface {
    // 1111111111111public11111111balanceOf111
    mapping (address => uint256) public balanceOf;
    // 11111111111111111111
    mapping (address => mapping (address => uint256)) internal allowed;

    // 11111
    constructor() public {
        name = "Contacts Chain";
        symbol = "CTC"; 
        decimals = 8;
        totalSupply = 480000000 * 10**uint(decimals);
        // 11111111111111111
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        // 11111111111
        require(to != address(0));
        // 1111111111111
        require(balanceOf[msg.sender] >= tokens);
        // 111111111
        require(balanceOf[to] + tokens >= balanceOf[to]);

        // 111111111
        balanceOf[msg.sender] -= tokens;
        // 111111111
        balanceOf[to] += tokens;

        // 1111111
        emit Transfer(msg.sender, to, tokens);

                success = true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        // 11111111
        require(to != address(0) && from != address(0));
        // 1111111111111
        require(balanceOf[from] >= tokens);
        // 11111111111111
        require(allowed[from][msg.sender] <= tokens);
        // 111111111
        require(balanceOf[to] + tokens >= balanceOf[to]);

        // 111111111
        balanceOf[from] -= tokens;
        // 111111111
        balanceOf[to] += tokens;

        // 1111111
        emit Transfer(from, to, tokens);   

        success = true;
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        // 1111111
        emit Approval(msg.sender, spender, tokens);

        success = true;
    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}