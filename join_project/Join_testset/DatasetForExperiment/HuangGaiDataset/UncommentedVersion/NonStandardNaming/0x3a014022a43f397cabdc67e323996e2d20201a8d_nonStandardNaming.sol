pragma solidity ^0.5.1;

contract CareerOnToken {
    event TRANSFER785(address indexed _from, address indexed _to, uint256 _value);	
    event APPROVAL52(address indexed a_owner, address indexed _spender, uint256 _value);	
    event OWNERCHANGE226(address indexed _old,address indexed _new,uint256 _coin_change);	
    
    uint256 public totalSupply;  
    string public name;                   
    uint8 public decimals;               
    string public symbol;               
    address public owner;
    
    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    
	
    bool isTransPaused=false;
    
    constructor(
        uint256 _initialAmount,
        uint8 _decimalUnits) public 
    {
        owner=msg.sender;
		if(_initialAmount<=0){
		    totalSupply = 100000000000000000;   
		    balances[owner]=totalSupply;
		}else{
		    totalSupply = _initialAmount;   
		    balances[owner]=_initialAmount;
		}
		if(_decimalUnits<=0){
		    decimals=8;
		}else{
		    decimals = _decimalUnits;
		}
        name = "CareerOn Chain Token"; 
        symbol = "COT";
    }
    
    
    function TRANSFER599(	
        address _to, 
        uint256 _value) public returns (bool success) 
    {
        assert(_to!=address(this) && 
                !isTransPaused &&
                balances[msg.sender] >= _value &&
                balances[_to] + _value > balances[_to]
        );
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
		if(msg.sender==owner){
			emit TRANSFER785(address(this), _to, _value);
		}else{
			emit TRANSFER785(msg.sender, _to, _value);
		}
        return true;
    }


    function TRANSFERFROM467(	
        address _from, 
        address _to, 
        uint256 _value) public returns (bool success) 
    {
        assert(_to!=address(this) && 
                !isTransPaused &&
                balances[_from] >= _value &&
                balances[_to] + _value > balances[_to] &&
                allowed[_from][msg.sender] >= _value
        );
        
        balances[_to] += _value;
        balances[_from] -= _value; 
        allowed[_from][msg.sender] -= _value;
        if(_from==owner){
			emit TRANSFER785(address(this), _to, _value);
		}else{
			emit TRANSFER785(_from, _to, _value);
		}
        return true;
    }

    function APPROVE809(address _spender, uint256 _value) public returns (bool success) 	
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL52(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE926(	
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];
    }
    
    function BALANCEOF511(address accountAddr) public view returns (uint256) {	
        return balances[accountAddr];
    }
	
	
	
	function CHANGEOWNER803(address newOwner) public{	
        assert(msg.sender==owner && msg.sender!=newOwner);
        balances[newOwner]=balances[owner];
        balances[owner]=0;
        owner=newOwner;
        emit OWNERCHANGE226(msg.sender,newOwner,balances[owner]);
    }
    
	
    function SETPAUSESTATUS594(bool isPaused)public{	
        assert(msg.sender==owner);
        isTransPaused=isPaused;
    }
    
	
    function CHANGECONTRACTNAME693(string memory _newName,string memory _newSymbol) public {	
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
    
    
    function () external payable {
        revert();
    }
}