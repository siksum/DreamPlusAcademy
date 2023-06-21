// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FlagToken {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    address private _owner;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
        _owner = msg.sender;
        _balances[_owner] = 1000 ether;
    }

    function decimals() public view returns (uint8) {
        return 18;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        address owner = msg.sender;
        _transfer(owner, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        address owner = msg.sender;
        _approve(owner, spender, amount);
        return true;
    }

    function buyFlagToken(uint amount) external payable returns (uint256) {
        if (msg.value == 3 ether && amount < 3 ether) {
            _transfer(_owner, msg.sender, amount);
        }
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        address spender = msg.sender;
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
    }


    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

}

contract Level {
    event Flag(address solver);

    FlagToken public ft;

    constructor() {
        ft = new FlagToken("Flag Token", "FT");
    }

    function getFTAddress() external view returns (address) {
        return address(ft);
    }

    function buyFlag() external {
        require(ft.transferFrom(msg.sender, address(this), 6 ether));
        emit Flag(tx.origin);
    }
}

contract Attacker{
    Level public level;
    FlagToken public Ft;


    constructor(){
        level = Level( 0xc10C412E0E609d9F470d076Dab9a8198c67612de);
        Ft = FlagToken(address(0x9e96D747FFA7595ac7325bdA8DE6c2EDeb0c0646));
    }
    
    function atk() public payable{
        
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.buyFlagToken{value:3 ether}(2 ether);
        Ft.approve(address(level), 6 ether);
        level.buyFlag();
    }
}