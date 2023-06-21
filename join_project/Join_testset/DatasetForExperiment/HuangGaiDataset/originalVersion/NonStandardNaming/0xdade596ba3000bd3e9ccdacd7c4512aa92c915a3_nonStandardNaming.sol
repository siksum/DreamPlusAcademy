                                                                 

pragma solidity ^0.5.2;
contract ERC20Interface {
  string public name;
  string public symbol;
  uint8 public decimals;
  uint public totalSupply;

  function TRANSFER356(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM301(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE683(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function ALLOWANCE313(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING

  event TRANSFER309(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
  event APPROVAL860(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}

contract ONTS_contract is ERC20Interface {
  mapping (address => uint256) public balanceOf;
  mapping (address => mapping (address => uint256) ) internal allowed;

  constructor() public {
    name = "Ontology Star";
    symbol = "ONTS";
    decimals = 18;
    totalSupply = 990000000000000000000000000;
    balanceOf[msg.sender] = totalSupply;
  }

  function TRANSFER356(address _to, uint256 _value) public returns (bool success){	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(balanceOf[msg.sender] >= _value);
    require(balanceOf[_to] + _value >= balanceOf[_to]);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit TRANSFER309(msg.sender, _to, _value);
    success = true;
  }

  function TRANSFERFROM301(address _from, address _to, uint256 _value) public returns (bool success){	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(balanceOf[_from] >= _value);
    require(allowed[_from][msg.sender]  >= _value);
    require(balanceOf[_to] + _value >= balanceOf[_to]);

    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    allowed[_from][msg.sender] -= _value;
    emit TRANSFER309(_from, _to, _value);
    success = true;
  }

  function APPROVE683(address _spender, uint256 _value) public returns (bool success){	//inject NONSTANDARD NAMING
      require((_value == 0)||(allowed[msg.sender][_spender] == 0));
      allowed[msg.sender][_spender] = _value;
      emit APPROVAL860(msg.sender, _spender, _value);
      success = true;
  }

  function ALLOWANCE313(address _owner, address _spender) public view returns (uint256 remaining){	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }
}