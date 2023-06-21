                                                                 

pragma solidity ^0.5.1;

library SafeMath {
  
    function MUL733(uint256 a, uint256 b) internal pure returns (uint256) {	
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }


    function DIV535(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function SUB647(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function ADD530(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MOD132(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0);
        return a % b;
    }
}

contract Ownable {
    
    address public owner = address(0);
    bool public stoped  = false;

    event OWNERSHIPTRANSFERRED26(address indexed previousOwner, address indexed newOwner);	
    event STOPED180(address setter ,bool newValue);	

    modifier ONLYOWNER823() {	
        require(msg.sender == owner);
        _;
    }

    modifier WHENNOTSTOPED242() {	
        require(!stoped);
        _;
    }

    function SETSTOPED986(bool _needStoped) public ONLYOWNER823 {	
        require(stoped != _needStoped);
        stoped = _needStoped;
        emit STOPED180(msg.sender,_needStoped);
    }


    function RENOUNCEOWNERSHIP511() public ONLYOWNER823 {	
        emit OWNERSHIPTRANSFERRED26(owner, address(0));
        owner = address(0);
    }

    function TRANSFEROWNERSHIP858(address newOwner) public ONLYOWNER823 {	
        _TRANSFEROWNERSHIP302(newOwner);
    }

    function _TRANSFEROWNERSHIP302(address newOwner) internal {	
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED26(owner, newOwner);
        owner = newOwner;
    }
}

contract Cmoable is Ownable {
    address public cmo = address(0);

    event CMOSHIPTRANSFERRED416(address indexed previousCmo, address indexed newCmo);	

    modifier ONLYCMO222() {	
        require(msg.sender == cmo);
        _;
    }

    function RENOUNCECMOSHIP549() public ONLYOWNER823 {	
        emit CMOSHIPTRANSFERRED416(cmo, address(0));
        owner = address(0);
    }

    function TRANSFERCMOSHIP193(address newCmo) public ONLYOWNER823 {	
        _TRANSFERCMOSHIP740(newCmo);
    }

    function _TRANSFERCMOSHIP740(address newCmo) internal {	
        require(newCmo != address(0));
        emit CMOSHIPTRANSFERRED416(cmo, newCmo);
        cmo = newCmo;
    }
}


contract BaseToken is Ownable, Cmoable {

    using SafeMath for uint256;

    string public name;
    string public symbol;
    uint8  public decimals;
    uint256 public totalSupply;
    uint256 public initedSupply = 0;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event TRANSFER985(address indexed from, address indexed to, uint256 value);	
    event APPROVAL50(address indexed owner, address indexed spender, uint256 value);	

    modifier ONLYOWNERORCMO308() {	
        require(msg.sender == cmo || msg.sender == owner);
        _;
    }

    function _TRANSFER969(address _from, address _to, uint256 _value) internal WHENNOTSTOPED242 {	
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint256 previousBalances = balanceOf[_from].ADD530(balanceOf[_to]);
        balanceOf[_from] = balanceOf[_from].SUB647(_value);
        balanceOf[_to] = balanceOf[_to].ADD530(_value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
        emit TRANSFER985(_from, _to, _value);
    }
    
    function _APPROVE648(address _spender, uint256 _value) internal WHENNOTSTOPED242 returns (bool success) {	
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL50(msg.sender, _spender, _value);
        return true;
    }

    function TRANSFER180(address _to, uint256 _value) public returns (bool success) {	
        _TRANSFER969(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM691(address _from, address _to, uint256 _value) public returns (bool success) {	
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] = allowance[_from][msg.sender].SUB647(_value);
        _TRANSFER969(_from, _to, _value);
        return true;
    }
    
    function APPROVE821(address _spender, uint256 _value) public returns (bool success) {	
        return _APPROVE648(_spender, _value);
    }
}


contract BurnToken is BaseToken {
    uint256 public burnSupply = 0;
    event BURN151(address indexed from, uint256 value);	

    function _BURN894(address _from, uint256 _value) internal WHENNOTSTOPED242 returns(bool success) {	
        require(balanceOf[_from] >= _value);
        balanceOf[_from] = balanceOf[_from].SUB647(_value);
        totalSupply = totalSupply.SUB647(_value);
        burnSupply  = burnSupply.ADD530(_value);
        emit BURN151(_from, _value);
        return true;        
    }

    function BURN80(uint256 _value) public returns (bool success) {	
        return _BURN894(msg.sender,_value);
    }

    function BURNFROM602(address _from, uint256 _value) public returns (bool success) {	
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] = allowance[_from][msg.sender].SUB647(_value);
        return _BURN894(_from,_value);
    }
}





 
contract LockToken is BaseToken {
    struct LockMeta {
        uint256 amount;
        uint256 endtime;
        bool    deleted;
    }

    
    event LOCKED960(uint32 indexed _type, address indexed _who, uint256 _amounts, uint256 _endtimes);	
    event RELEASED680(uint32 indexed _type, address indexed _who, uint256 _amounts);	
    
    mapping (address => mapping(uint32 => uint256)) public lockedAmount;
     
    mapping (address => mapping(uint32 => LockMeta[])) public lockedDetail;

    function _TRANSFER969(address _from, address _to, uint _value) internal {	
        require(balanceOf[_from] >= _value + lockedAmount[_from][2]);
        super._TRANSFER969(_from, _to, _value);
    }

    function LOCKRELEASE415() public WHENNOTSTOPED242 {	
        
        require(lockedAmount[msg.sender][3] != 0);

        uint256 fronzed_released = 0;
        uint256 dynamic_released = 0;

        if ( lockedAmount[msg.sender][0] != 0 )
        {
            for (uint256 i = 0; i < lockedDetail[msg.sender][0].length; i++) {

                LockMeta storage _meta = lockedDetail[msg.sender][0][i];
                if ( !_meta.deleted && _meta.endtime <= now)
                {
                    _meta.deleted = true;
                    fronzed_released = fronzed_released.ADD530(_meta.amount);
                    emit RELEASED680(1, msg.sender, _meta.amount);
                }
            }
        }

        if ( lockedAmount[msg.sender][1] != 0 )
        {
            for (uint256 i = 0; i < lockedDetail[msg.sender][1].length; i++) {

                LockMeta storage _meta = lockedDetail[msg.sender][0][i];
                if ( !_meta.deleted && _meta.endtime <= now)
                {
                    _meta.deleted = true;
                    dynamic_released = dynamic_released.ADD530(_meta.amount);
                    emit RELEASED680(2, msg.sender, _meta.amount);
                    
                }
            }
        }

        if ( fronzed_released > 0 || dynamic_released > 0 ) {
            lockedAmount[msg.sender][0] = lockedAmount[msg.sender][0].SUB647(fronzed_released);
            lockedAmount[msg.sender][1] = lockedAmount[msg.sender][1].SUB647(dynamic_released);
            lockedAmount[msg.sender][2] = lockedAmount[msg.sender][2].SUB647(dynamic_released).SUB647(fronzed_released);
        }
    }

    
    function LOCK646(uint32 _type, address _who, uint256[] memory _amounts, uint256[] memory _endtimes) public  ONLYOWNERORCMO308 {	
        require(_amounts.length == _endtimes.length);

        uint256 _total;

        if ( _type == 2 ) {
            if ( lockedDetail[_who][1].length > 0 )
            {
                emit LOCKED960(0, _who, lockedAmount[_who][1], 0);
                delete lockedDetail[_who][1];
            }

            for (uint256 i = 0; i < _amounts.length; i++) {
                _total = _total.ADD530(_amounts[i]);
                lockedDetail[_who][1].push(LockMeta({
                    amount: _amounts[i],
                    endtime: _endtimes[i],
                    deleted:false
                }));
                emit LOCKED960(2, _who, _amounts[i], _endtimes[i]);
            }
            lockedAmount[_who][1] = _total;
            lockedAmount[_who][2] = lockedAmount[_who][0].ADD530(_total);
            return;
        }


        if ( _type == 1 ) {
            if ( lockedDetail[_who][0].length > 0 )
            {
                revert();
            }

            for (uint256 i = 0; i < _amounts.length; i++) {
                _total = _total.ADD530(_amounts[i]);
                lockedDetail[_who][0].push(LockMeta({
                    amount: _amounts[i],
                    endtime: _endtimes[i],
                    deleted:false
                }));
                emit LOCKED960(1, _who, _amounts[i], _endtimes[i]);
            }
            lockedAmount[_who][0] = _total;
            lockedAmount[_who][2] = lockedAmount[_who][1].ADD530(_total);
            return;
        }

        if ( _type == 0 ) {
            lockedAmount[_who][2] = lockedAmount[_who][2].SUB647(lockedAmount[_who][1]);
            emit LOCKED960(0, _who, lockedAmount[_who][1], 0);
            delete lockedDetail[_who][1];
            
        }
    }
}

contract Proxyable is BaseToken,BurnToken{

    mapping (address => bool) public disabledProxyList;

    function ENABLEPROXY382() public WHENNOTSTOPED242 {	

        disabledProxyList[msg.sender] = false;
    }

    function DISABLEPROXY765() public WHENNOTSTOPED242{	
        disabledProxyList[msg.sender] = true;
    }

    function PROXYBURNFROM651(address _from, uint256 _value) public  ONLYOWNERORCMO308 returns (bool success) {	
        
        require(!disabledProxyList[_from]);
        super._BURN894(_from, _value);
        return true;
    }

    function PROXYTRANSFERFROM788(address _from, address _to, uint256 _value) public ONLYOWNERORCMO308 returns (bool success) {	
        
        require(!disabledProxyList[_from]);
        super._TRANSFER969(_from, _to, _value);
        return true;
    }

  
}

 

contract CSSToken is BaseToken,BurnToken,LockToken,Proxyable {

    constructor() public {
        
  
        totalSupply  = 2000000000000000000000000000;
        initedSupply = 2000000000000000000000000000;
        name = 'css';
        symbol = 'css';
        decimals = 18;
        balanceOf[0x108cF041aAb8A65Cdd0A78c1DC703B0dbb0a7659] = 2000000000000000000000000000;
        emit TRANSFER985(address(0), 0x108cF041aAb8A65Cdd0A78c1DC703B0dbb0a7659, 2000000000000000000000000000);

        
        owner = 0x108cF041aAb8A65Cdd0A78c1DC703B0dbb0a7659;
        cmo   = 0x108cF041aAb8A65Cdd0A78c1DC703B0dbb0a7659;
        




    }

}