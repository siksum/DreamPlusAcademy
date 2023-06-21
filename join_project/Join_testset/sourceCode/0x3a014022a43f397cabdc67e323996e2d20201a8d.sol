pragma solidity ^0.5.1;

contract CareerOnToken {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed a_owner, address indexed _spender, uint256 _value);
    event OwnerChange(address indexed _old,address indexed _new,uint256 _coin_change);
    
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
    
    
    function transfer(
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
			emit Transfer(address(this), _to, _value);//11111111
		}else{
			emit Transfer(msg.sender, _to, _value);//11111111
		}
        return true;
    }


    function transferFrom(
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
			emit Transfer(address(this), _to, _value);//11111111
		}else{
			emit Transfer(_from, _to, _value);//11111111
		}
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) 
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];//11_spender1_owner1111token1
    }
    
    function balanceOf(address accountAddr) public view returns (uint256) {
        return balances[accountAddr];
    }
	
	//1111111111111
	//11111111111111111111
	function changeOwner(address newOwner) public{
        assert(msg.sender==owner && msg.sender!=newOwner);
        balances[newOwner]=balances[owner];
        balances[owner]=0;
        owner=newOwner;
        emit OwnerChange(msg.sender,newOwner,balances[owner]);//111111111111
    }
    
	//isPaused1true111111111
    function setPauseStatus(bool isPaused)public{
        assert(msg.sender==owner);
        isTransPaused=isPaused;
    }
    
	//111111
    function changeContractName(string memory _newName,string memory _newSymbol) public {
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
    
    
    function () external payable {
        revert();
    }
}