pragma solidity ^0.5.2;















library SafeMath {
    function ADD149(uint a, uint b) internal pure returns (uint c) {	
        c = a + b;
        require(c >= a);
    }
    function SUB183(uint a, uint b) internal pure returns (uint c) {	
        require(b <= a);
        c = a - b;
    }
    function MUL273(uint a, uint b) internal pure returns (uint c) {	
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV180(uint a, uint b) internal pure returns (uint c) {	
        require(b > 0);
        c = a / b;
    }
}






contract ERC20Interface {
    function TOTALSUPPLY686() public view returns (uint);	
    function BALANCEOF696(address tokenOwner) public view returns (uint balance);	
    function ALLOWANCE613(address tokenOwner, address spender) public view returns (uint remaining);	
    function TRANSFER534(address to, uint tokens) public returns (bool success);	
    function APPROVE76(address spender, uint tokens) public returns (bool success);	
    function TRANSFERFROM578(address from, address to, uint tokens) public returns (bool success);	

    event TRANSFER82(address indexed from, address indexed to, uint tokens);	
    event APPROVAL142(address indexed tokenOwner, address indexed spender, uint tokens);	
}





contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL423(address from, uint256 tokens, address token, bytes memory data) public;	
}





contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED40(address indexed _from, address indexed _to);	

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER79 {	
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP713(address _newOwner) public ONLYOWNER79 {	
        newOwner = _newOwner;
    }
    function ACCEPTOWNERSHIP836() public {	
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED40(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}






contract TurnGreen is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;


    
    
    
    constructor() public {
        symbol = "TGC";
        name = "TurnGreen";
        decimals = 8;
        _totalSupply = 210000000 * 10**uint(decimals);
        balances[0xcaDe3a45735Db7e4982B3DD8cd26114A5a755f68] = _totalSupply;
        emit TRANSFER82(address(0), 0xcaDe3a45735Db7e4982B3DD8cd26114A5a755f68, _totalSupply);
    }


    
    
    
    function TOTALSUPPLY686() public view returns (uint) {	
        return _totalSupply.SUB183(balances[address(0)]);
    }


    
    
    
    function BALANCEOF696(address tokenOwner) public view returns (uint balance) {	
        return balances[tokenOwner];
    }


    
    
    
    
    
    function TRANSFER534(address to, uint tokens) public returns (bool success) {	
        balances[msg.sender] = balances[msg.sender].SUB183(tokens);
        balances[to] = balances[to].ADD149(tokens);
        emit TRANSFER82(msg.sender, to, tokens);
        return true;
    }


    
    
    
    
    
    
    
    
    function APPROVE76(address spender, uint tokens) public returns (bool success) {	
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL142(msg.sender, spender, tokens);
        return true;
    }


    
    
    
    
    
    
    
    
    
    function TRANSFERFROM578(address from, address to, uint tokens) public returns (bool success) {	
        balances[from] = balances[from].SUB183(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].SUB183(tokens);
        balances[to] = balances[to].ADD149(tokens);
        emit TRANSFER82(from, to, tokens);
        return true;
    }


    
    
    
    
    function ALLOWANCE613(address tokenOwner, address spender) public view returns (uint remaining) {	
        return allowed[tokenOwner][spender];
    }


    
    
    
    
    
    function APPROVEANDCALL534(address spender, uint tokens, bytes memory data) public returns (bool success) {	
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL142(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL423(msg.sender, tokens, address(this), data);
        return true;
    }


    
    
    
    function () external payable {
        revert();
    }


    
    
    
    function TRANSFERANYERC20TOKEN420(address tokenAddress, uint tokens) public ONLYOWNER79 returns (bool success) {	
        return ERC20Interface(tokenAddress).TRANSFER534(owner, tokens);
    }
}