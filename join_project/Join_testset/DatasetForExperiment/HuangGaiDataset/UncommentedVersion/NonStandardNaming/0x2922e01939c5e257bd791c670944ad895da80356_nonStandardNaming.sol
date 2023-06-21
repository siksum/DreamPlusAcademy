pragma solidity ^0.5.7;

interface tokenRecipient { 
    function RECEIVEAPPROVAL69(address _from, uint256 _value, address _token, bytes calldata _extraData) external; 	
}

contract TokenERC20 {
    
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    
    uint256 public totalSupply;

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event TRANSFER525(address indexed from, address indexed to, uint256 value);	
    
    
    event APPROVAL660(address indexed _owner, address indexed _spender, uint256 _value);	

    
    event BURN257(address indexed from, uint256 value);	

                                                                                                                                        
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  
        balanceOf[msg.sender] = totalSupply;                
        name = tokenName;                                   
        symbol = tokenSymbol;                               
    }

                                                                             
    function _TRANSFER824(address _from, address _to, uint _value) internal {	
        
        require(_to != address(0x0));
        
        require(balanceOf[_from] >= _value);
        
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        
        balanceOf[_from] -= _value;
        
        balanceOf[_to] += _value;
        emit TRANSFER525(_from, _to, _value);
        
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

                                                                                                                                                                                                  

    function TRANSFER548(address _to, uint256 _value) public returns (bool success) {	
    if (balanceOf[msg.sender] >= _value && _value > 0) {
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        _TRANSFER824(msg.sender, _to, _value);
        return true;
    }   else { return false; }
}
                                                                                                                                                                                                                                                                      
    function TRANSFERFROM506(address _from, address _to, uint256 _value) public returns (bool success) {	
        require(_value <= allowance[_from][msg.sender]);     
        allowance[_from][msg.sender] -= _value;
        _TRANSFER824(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                            
    function APPROVE875(address _spender, uint256 _value) public	
        returns (bool success) {
        require((_value == 0) || (allowance[msg.sender][_spender] == 0));    
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL660(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVEANDCALL100(address _spender, uint256 _value, bytes memory _extraData)	
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE875(_spender, _value)) {
            spender.RECEIVEAPPROVAL69(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }

                                                                                                                                                               
    function BURN560(uint256 _value) public returns (bool success) {	
        require(balanceOf[msg.sender] >= _value);   
        balanceOf[msg.sender] -= _value;            
        totalSupply -= _value;                      
        emit BURN257(msg.sender, _value);
        return true;
    }

                                                                                                                                                                                                                                                      
    function BURNFROM667(address _from, uint256 _value) public returns (bool success) {	
        require(balanceOf[_from] >= _value);                
        require(_value <= allowance[_from][msg.sender]);    
        balanceOf[_from] -= _value;                         
        allowance[_from][msg.sender] -= _value;             
        totalSupply -= _value;                              
        emit BURN257(_from, _value);
        return true;
    }
}