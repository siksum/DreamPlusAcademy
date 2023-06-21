pragma solidity ^0.5.1;

contract CareerOnToken {
    event TRANSFER785(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL52(address indexed a_owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
    event OWNERCHANGE226(address indexed _old,address indexed _new,uint256 _coin_change);	//inject NONSTANDARD NAMING
    
    uint256 public totalSupply;  
    string public name;                   //11111"My test token"
    uint8 public decimals;               //11token111111111111111113111110.00111.
    string public symbol;               //token11,like MTT
    address public owner;
    
    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    
	//111111setPauseStatus1111111TRUE111111111111
    bool isTransPaused=false;
    
    constructor(
        uint256 _initialAmount,
        uint8 _decimalUnits) public 
    {
        owner=msg.sender;//11111owner
		if(_initialAmount<=0){
		    totalSupply = 100000000000000000;   // 111111
		    balances[owner]=totalSupply;
		}else{
		    totalSupply = _initialAmount;   // 111111
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
    
    
    function TRANSFER599(	//inject NONSTANDARD NAMING
        address _to, 
        uint256 _value) public returns (bool success) 
    {
        assert(_to!=address(this) && 
                !isTransPaused &&
                balances[msg.sender] >= _value &&
                balances[_to] + _value > balances[_to]
        );
        
        balances[msg.sender] -= _value;//11111111111token11_value
        balances[_to] += _value;//1111111token11_value
		if(msg.sender==owner){
			emit TRANSFER785(address(this), _to, _value);//11111111
		}else{
			emit TRANSFER785(msg.sender, _to, _value);//11111111
		}
        return true;
    }


    function TRANSFERFROM467(	//inject NONSTANDARD NAMING
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
        
        balances[_to] += _value;//111111token11_value
        balances[_from] -= _value; //1111_from11token11_value
        allowed[_from][msg.sender] -= _value;//1111111111_from11111111_value
        if(_from==owner){
			emit TRANSFER785(address(this), _to, _value);//11111111
		}else{
			emit TRANSFER785(_from, _to, _value);//11111111
		}
        return true;
    }

    function APPROVE809(address _spender, uint256 _value) public returns (bool success) 	//inject NONSTANDARD NAMING
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL52(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE926(	//inject NONSTANDARD NAMING
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];//11_spender1_owner1111token1
    }
    
    function BALANCEOF511(address accountAddr) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[accountAddr];
    }
	
	//1111111111111
	//11111111111111111111
	function CHANGEOWNER803(address newOwner) public{	//inject NONSTANDARD NAMING
        assert(msg.sender==owner && msg.sender!=newOwner);
        balances[newOwner]=balances[owner];
        balances[owner]=0;
        owner=newOwner;
        emit OWNERCHANGE226(msg.sender,newOwner,balances[owner]);//111111111111
    }
    
	//isPaused1true111111111
    function SETPAUSESTATUS594(bool isPaused)public{	//inject NONSTANDARD NAMING
        assert(msg.sender==owner);
        isTransPaused=isPaused;
    }
    
	//111111
    function CHANGECONTRACTNAME693(string memory _newName,string memory _newSymbol) public {	//inject NONSTANDARD NAMING
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
    
    
    function () external payable {
        revert();
    }
}