pragma solidity ^0.5.2;

// ----------------------------------------------------------------------------
// 'TGC' 'TurnGreen' token contract
//
// Symbol      : TGC
// Name        : TurnGreen
// Total supply: 210000000
// Decimals    : 8
//
// (c) by TurnGreen. All Rights Reserved.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function ADD149(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SUB183(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function MUL273(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV180(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function TOTALSUPPLY686() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF696(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE613(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER534(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE76(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM578(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER82(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL142(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}


// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL423(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED40(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER79 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP713(address _newOwner) public ONLYOWNER79 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }
    function ACCEPTOWNERSHIP836() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED40(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and a
// fixed supply
// ----------------------------------------------------------------------------
contract TurnGreen is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "TGC";
        name = "TurnGreen";
        decimals = 8;
        _totalSupply = 210000000 * 10**uint(decimals);
        balances[0xcaDe3a45735Db7e4982B3DD8cd26114A5a755f68] = _totalSupply;
        emit TRANSFER82(address(0), 0xcaDe3a45735Db7e4982B3DD8cd26114A5a755f68, _totalSupply);
    }


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function TOTALSUPPLY686() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply.SUB183(balances[address(0)]);
    }


    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function BALANCEOF696(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }


    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFER534(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB183(tokens);
        balances[to] = balances[to].ADD149(tokens);
        emit TRANSFER82(msg.sender, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces
    // ------------------------------------------------------------------------
    function APPROVE76(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL142(msg.sender, spender, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFERFROM578(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[from] = balances[from].SUB183(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].SUB183(tokens);
        balances[to] = balances[to].ADD149(tokens);
        emit TRANSFER82(from, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function ALLOWANCE613(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }


    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account. The `spender` contract function
    // `receiveApproval(...)` is then executed
    // ------------------------------------------------------------------------
    function APPROVEANDCALL534(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL142(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL423(msg.sender, tokens, address(this), data);
        return true;
    }


    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () external payable {
        revert();
    }


    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function TRANSFERANYERC20TOKEN420(address tokenAddress, uint tokens) public ONLYOWNER79 returns (bool success) {	//inject NONSTANDARD NAMING
        return ERC20Interface(tokenAddress).TRANSFER534(owner, tokens);
    }
}