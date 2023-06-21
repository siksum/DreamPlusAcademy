//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20{
    mapping(address => uint256) private _balances; //사용자 잔액정보 관리
    mapping(address => mapping(address => uint256)) private _allowances;//사용자가 내 돈을 다른 사용자에게 얼만큼 이동시킬 수 있는지 권한 주는 변수
    //approve, transferFrom 함수에 의해 설정됨
    
    //변수 설정
    uint private _totalSupply; //모든 토큰은 발행량이 정해져있음(max 값을 정해놓고 시작함)
    string private _name; //토큰 명칭(ex. ETHEREUM)
    string private _symbol; //토큰의 심볼 값(ex. ETH)
    uint8 private _decimals; //토큰이 몇 진수를 사용할 것인가(이더리움은 18진수를 사용하지만 토큰은 꼭 그렇지 않음, tether는 6진수 -> 1000000 = 1tether)
    address public owner;
    mapping(address => bool) private _blackList; //해킹 관련 문제로 블랙리스트 만들어줄 수 있음

    //이벤트 기록
    modifier checkBalance(uint amount){
        require(_balances[msg.sender] > amount, "NOT sufficient Balance"); //사용자의 잔액은 보내려는 돈보다 많아야 함
        //approve, transfer 함수에서 반복해서 사용하는 조건문 modifier로 구현
        _;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner");
        _;
    }
    modifier checkBlackList(){ //transfer, approve, transferFrom에 필요
        require(!_blackList[msg.sender], "Ban User");
        _;
    }


    event Transfer(address indexed from, address indexed to, uint amount); //누가 누구에게 얼만큼 보냈는지를 이벤트로 기록. 로그 상으로 찾기 쉽게 indexed 붙여줌
    event Approval(address indexed from, address indexed to, uint amount); //사용자 권한 확인


    //선언해준 변수들 값 setting
    constructor(string memory _name_, string memory _symbol_, uint _totalSupply_){
        _name = _name_;
        _symbol = _symbol_;
        //_decimals = _decimals_;
        _totalSupply = _totalSupply_;
        owner = msg.sender;
    }

    //설정된 값들 확인
    function name() public view returns(string memory){
        //token name 조회
        return _name;
    } 

    function symbol() public view returns(string memory){
        //token symbol 조회
        return _symbol;
    }

    function decimals() public view returns (uint8){
        //token decimal 조회
        return _decimals;
    }

    function totalSupply() public view returns (uint256){
        //설정된 totalSupply 값 확인
        return _totalSupply;
    }

    //실제 사용자와 관련된 기능들
    function balanceOf(address account) public view returns(uint256){
        //사용자 잔액 확인 -> mapping() _balances에 저장해두었음
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public checkBalance(amount) checkBlackList returns(bool){ //내가 누구한테 돈 보낼게
        //실제 돈 전송 기능 (transfer, send를 쓰는게 아니라 사용자가 갖고 있는 balance를 update 해주면 됨)
        //[+]주의: address from쓰면 from을 바꿔버릴 수 있기 때문에 다른 사람의 주소 넣고, to에 내 주소 넣으면 다른 사람 잔고 뺄 수 있음. 취약점 방지를 위해 현재 호출자인 msg.sender로 써야함
        
        //ERC20에서는 잔액 관리를 CA에서 해주기 때문에 잔액 정보를 update 하는 식으로 해주면 됨
        _balances[msg.sender] -= amount; //요청한 사람의 잔고에서 amount를 빼주면 됨 
        _balances[to] += amount; //뺀 만큼을 받는 사람 주소의 잔고에 채워주면 됨
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(address _owner, address spender) public view returns(uint256){
        //data를 얼마나 설정했는지. 권한 설정된 금액
        return _allowances[_owner][spender];
    }

    function approve(address spender, uint256 amount) public checkBalance(amount) checkBlackList returns(bool){
        //내 돈을 다른 사람이 옮길 수 있게 권한 설정
        _allowances[msg.sender][spender] = amount; //msg.sender가 spender에게 amount만큼 approve 권한 줌
        emit Approval(msg.sender, spender, amount); //
        return true;
    }

    function mint(address to, uint amount) public onlyOwner{ //ERC20에 새롭게 추가하는 함수
        //기본 ERC20에는 사용자의 잔액 정보를 update하는 부분들이 없음 -> totalSupply를 가지는 부분이 없음 -> mint 함수가 들어가야함
        //아무나 mint하면 안됨 only owner만  
        _balances[to]+=amount;
        _totalSupply += amount;

    }

    //burn -> token 발행했다가 ICO에서 token이 너무 많아서 가격이 안오르면 burn할 수 있음
    //2가지 방법이 있음
    //1. 사용자의 잔액을 balance에서 아예 없애버리는 것
    //2. 사용자의 잔액을 쓸 수 없는 주소로 보내는 것

    //1. 사용자가 직접 burn
    //2. 관리자가 burn

    //[1] 관리자가 burn
    // function burn(address to, uint amount) public onlyOwner{ 
    //     _balances[to] -= amount;
    //     _totalSupply -= amount;

    // }
    //[2] 사용자가 직접 burn
    function burnByUser(uint amount) public{
        //zero address에 보냄
        transfer(address(0), amount);
        _totalSupply -= amount;
    }

    function setBlackList(address to) public onlyOwner{ //관리자만 블랙리스트 설정해야됨
        _blackList[to] = true; //거래를 할 수 없는 주소가 됨
    }

    function transferFrom(address from, address to, uint256 amount) public checkBlackList returns(bool){
        // 이사람이 저사람한테 돈 보내줄 수 있다는 것을 설정해주는 함수(받는 사람이 호출)
        // 권한 설정된 금액을 이동시켜줌 -> 사용자의 잔액을 updata 시켜주면 됨
        // 단순히 돈을 옮기는 것이 아니라 권한 설정된 돈만큼만 옮기는지 확인해야 함
        require(_balances[from] > amount, "Not sufficient Balance");
        require(_allowances[from][to] > amount, "Not Allowed Amount"); //권한이 있는 금액이 전송하려는 금액 양보다 많은지
        require(to == msg.sender, "Not Allowed User"); //실제 권한을 가진 사람이 요청하는지
        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

}
