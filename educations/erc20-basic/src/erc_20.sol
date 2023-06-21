// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ERC20{
    mapping(address => uint256) private balances;
    mapping(address => mapping(address =>uint256)) private allowances;

    uint256 private _totalSupply;
    uint8 private _decimals;

    string private _name;
    string private _symbol;

    event Transfer(address indexed from, address indexed to, uint256 value);//어디서 얼마만큼 보낼지
    event Approval(address indexed owner, address indexed spender, uint256 value);//어디서 누구에게 얼마만큼 허용할 것인지

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

    function transfer(address _to, uint256 _value) external returns(bool success){
        require(_to != address(0), "transfer to the zero address");
        require(balances[msg.sender] >= _value, "value exceeds balance");

        unchecked {
            balances[msg.sender] -= _value; // 취약점 -> value에 얼마나 큰 값이 들어올지 모름 -> -를 이용해서 integer undeflow 발생 -> 8버전 이후에는 revert되는데 그 이전 버전에서는 그냥 실행시켜버림 -> check할지 안할지 해주는 키워드 -> checked/unchecked / unchecked 사용 -> 이미 require로 검사를 한 번 했기 때문에 require하고 unchecked를 해서 gas fee를 줄임
            balances[_to] += _value;
        }

        balances[msg.sender] -= _value; //value가 내 잔고보다 크게 들어오면 integer underflow가 발생함. 0.8 이상에서는 underflow발생하면 revert남. 이전에는 그대로 실행됐음. 자유자재로 확인하는 keyword가 checked/unchecked. unchecked쓰면 underflow 발생함. 이를 쓰려고 하는 경우가 있는데, require 붙이고 unchecked쓰면 gas fee를 줄일 수 있음. _to가 zero address인지 확인하는 과정이 필요함
        //revert가 나도 false가 반환되는데, 전송이 무조건 실패하게 됨. evm은 초기화 하지 않아도 변수에 0이 들어가니까 default 값을 알 수 있음. 저장한 적 없는데도 0이 나옴
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value); //internal transaction을 하나씩 tracing하기에는 load가 높기 때문에 event찍음
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        require(_spender != address(0), "approve to the zero address");
        allowances[msg.sender][_spender];
        emit Approval(msg.sender, _spender, _value);
    }

    function allowance(address _owner, address _spender) public view returns(uint256 remaining){
        return allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public{
        require(balances[msg.sender] >= _value, "value exceeds balance");
        require(balances[_to] + _value > balances[_to]);
        require(_from != address(0), "not zero address");
        require(_to != address(0), "transfer to the zero address");
        require(allowances[_from][_to] >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        
        emit Transfer(_from, _to, _value);
        allowances[_from][_to] = allowances[_from][_to] - _value;
    }
    //토큰 수량을 마음대로 조절할 수 있어서 internal 
    //내 함수 내에서만 실행할 수 있음 mint는 오너만 minting할 수 있어야 함
    //
    function _mint(address _owner, uint256 _value) internal{//token을 얼마나 발행할 지 value를 통해서 나타냄
        require(_owner != address(0), "mint to the zero address");
        _totalSupply += _value;
        unchecked{
            balances[_owner] += _value;
        }
        emit Transfer(address(0), _owner, _value);
    }
    function _burn(address _owner, uint256 _value) internal{ //토큰을 아무도 갖지 않고 totalSupply에서 지워버리겠다
        require(_owner != address(0), "burn from the zero address");
        require(balances[_owner] >= _value, "burn amount exceeds balance");
        unchecked{
            balances[_owner] -= _value;
            _totalSupply -= _value;
        }
        emit Transfer(_owner, address(0), _value);
    }
}