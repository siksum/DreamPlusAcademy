                                                                 

pragma solidity 0.5.11;

contract ITokenRecipient {
  function TOKENFALLBACK170(address from, uint value) public;	//inject NONSTANDARD NAMING
}

contract SafeMath {
	uint256 constant public max_uint256983 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;	//inject NONSTANDARD NAMING

	function SAFEADD110(uint256 x, uint256 y) pure internal returns (uint256 z) {	//inject NONSTANDARD NAMING
        if (x > max_uint256983 - y) revert();
		return x + y;
	}

	function SAFESUB769(uint256 x, uint256 y) pure internal returns (uint256 z) {	//inject NONSTANDARD NAMING
        if (x < y) revert();
        return x - y;
	}
}

contract InternationalFinancialAsset is SafeMath {
    mapping(address => uint) public balances;
    mapping (address => mapping (address => uint256)) public allowance;
    
    string public name = "International Financial Asset";
    string public symbol = "IFA";
    uint8 public decimals = 18;
    uint256 public totalSupply = 500000000000000000000000000;
    
    event TRANSFER720(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event BURN374(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
    
    constructor() public { balances[msg.sender] = totalSupply; }

    function ISCONTRACT541(address ethAddress) private view returns (bool) {	//inject NONSTANDARD NAMING
        uint length;
        assembly { length := extcodesize(ethAddress) }
        return (length > 0);
    }
    
    function TRANSFER125(address to, uint value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(value > 0);
        balances[msg.sender] = SAFESUB769(balances[msg.sender], value);
        balances[to] = SAFEADD110(balances[to], value);
        if(ISCONTRACT541(to)) {
            ITokenRecipient receiver = ITokenRecipient(to);
            receiver.TOKENFALLBACK170(msg.sender, value);
        }
        emit TRANSFER720(msg.sender, to, value);
        return true;
    }
    
    function APPROVE16(address spender, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(value > 0);
        allowance[msg.sender][spender] = value;
        return true;
    }
    
    function TRANSFERFROM171(address fromAddress, address toAddress, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(uint256(toAddress) != 0 && value > 0);
        balances[fromAddress] = SAFESUB769(balances[fromAddress], value);
        balances[toAddress] = SAFEADD110(balances[toAddress], value);
        allowance[fromAddress][msg.sender] = SAFESUB769(allowance[fromAddress][msg.sender], value);
        emit TRANSFER720(fromAddress, toAddress, value);
        return true;
    }
    
    function BURN571(uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(value > 0);
        balances[msg.sender] = SAFESUB769(balances[msg.sender], value);
        totalSupply = SAFESUB769(totalSupply,value); 
        emit BURN374(msg.sender, value);
        return true;
    }
    
    function BALANCEOF170(address ethAddress) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[ethAddress];
    }
}