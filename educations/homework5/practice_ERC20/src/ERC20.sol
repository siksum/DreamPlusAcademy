// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./EIP712.sol";

contract ERC20 is EIP712{
    mapping(address => uint256) private balances;
    mapping(address => mapping(address =>uint256)) private allowances;

    uint256 private _totalSupply;
    uint8 private _decimals;
    string private _name;
    string private _symbol;
    bool private paused;
    address private owner;
    mapping(address => uint256) private _nonces;
   
    constructor (string memory _name_, string memory _symbol_) EIP712(_name, "1"){
        _decimals = 18;
        _name = _name_;
        _symbol = _symbol_;
        _mint(msg.sender, 100 ether);
        paused = false;
        owner = msg.sender;
        
    }

    modifier whenNotPaused(){
        require(!paused, "Pausable: paused");
        _;
    }

    modifier onlyOwner(){
        require(owner==msg.sender, "Only Owner");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);//어디서 얼마만큼 보낼지
    event Approval(address indexed owner, address indexed spender, uint256 value);//어디서 누구에게 얼마만큼 허용할 것인지
    event Paused(address account);
    event Unpaused(address account);

    function name() public view returns(string memory){
        return _name;
    }

    function symbol() public view returns(string memory){
        return _symbol;
    }

    function decimals() public view returns(uint8){
        return _decimals;
    }

    function totalSupply() public view returns(uint256){

        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint256){
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) external whenNotPaused{
        require(_to != address(0), "transfer to the zero address");
        require(balances[msg.sender] >= _value, "value exceeds balance");

        unchecked {
            balances[msg.sender] -= _value; 
            balances[_to] += _value;
        }

        emit Transfer(msg.sender, _to, _value); 
    }

    function approve(address _spender, uint256 _value) public{
        require(_spender != address(0), "approve to the zero address");
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }

    function _approve(address _owner, address _spender, uint256 _value) public{
        require(_spender != address(0), "approve to the zero address");
        allowances[_owner][_spender] = _value;
        emit Approval(_owner, _spender, _value);
    }
    function allowance(address _owner, address _spender) public view returns(uint256 remaining){
        return allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public{
        require(_from != address(0), "not zero address");
        require(_to != address(0), "transfer to the zero address");

        uint256 currentAllowance = allowance(_from, msg.sender);
        if(currentAllowance != type(uint256).max){
            require(currentAllowance >= _value, "insufficient allowance");
            unchecked{
                allowances[_from][msg.sender] -= _value;
            }
        }

        require(balances[_from] >= _value, "value exceeds balance");
        
        unchecked{
            balances[_to] += _value;
            balances[_from] -= _value;
        }
        
        emit Transfer(_from, _to, _value);
    }
    
    function _mint(address _owner, uint256 _value) internal{
        require(_owner != address(0), "mint to the zero address");
        _totalSupply += _value;
        unchecked{
            balances[_owner] += _value;
        }
        emit Transfer(address(0), _owner, _value);
    }
    
    function _burn(address _owner, uint256 _value) internal{ 
        require(_owner != address(0), "burn from the zero address");
        require(balances[_owner] >= _value, "burn amount exceeds balance");
        unchecked{
            balances[_owner] -= _value;
            _totalSupply -= _value;
        }
        emit Transfer(_owner, address(0), _value);
    }

    function pause() public onlyOwner{
        paused = true;
        emit Paused(msg.sender);
    }

    function unpause() public onlyOwner{
        paused = false;
        emit Unpaused(msg.sender);
    }

      function permit(
        address _owner,
        address _spender,
        uint256 _value,
        uint256 _deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public  {
        require(block.timestamp <= _deadline, "ERC20Permit: expired deadline");
        
        bytes32 structHash = _hashTypedData(_owner, _spender, _value, _nonces[_owner], _deadline);
        require(ecrecover(_toTypedDataHash(structHash), v, r, s) == _owner, "INVALID_SIGNER");
        _nonces[_owner]++;

        _approve(_owner, _spender, _value);
    }
    
    function nonces(address _owner) public returns (uint256) {
        return _nonces[_owner];
    }
}