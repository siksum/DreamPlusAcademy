                                                                 

pragma solidity ^0.5.8;

contract IBNEST {
    function TOTALSUPPLY751() public view returns (uint supply);	//inject NONSTANDARD NAMING
    function BALANCEOF271( address who ) public view returns (uint value);	//inject NONSTANDARD NAMING
    function ALLOWANCE547( address owner, address spender ) public view returns (uint _allowance);	//inject NONSTANDARD NAMING

    function TRANSFER663( address to, uint256 value) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM761( address from, address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function APPROVE620( address spender, uint value ) public returns (bool ok);	//inject NONSTANDARD NAMING

    event TRANSFER820( address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL758( address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
    
    function BALANCESSTART354() public view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCESGETBOOL675(uint256 num) public view returns(bool);	//inject NONSTANDARD NAMING
    function BALANCESGETNEXT434(uint256 num) public view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCESGETVALUE547(uint256 num) public view returns(address, uint256);	//inject NONSTANDARD NAMING
}

library SafeMath {

                                                               
  function MUL873(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

                                                                             
  function DIV202(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(_b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = _a / _b;
    assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold
    return _a / _b;
  }

                                                                                                           
  function SUB917(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(_b <= _a);
    return _a - _b;
  }

                                                         
  function ADD753(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}

contract IBMapping {
    function CHECKADDRESS180(string memory name) public view returns (address contractAddress);	//inject NONSTANDARD NAMING
    function CHECKOWNERS66(address man) public view returns (bool);	//inject NONSTANDARD NAMING
}

library address_make_payable {
   function MAKE_PAYABLE172(address x) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
      return address(uint160(x));
   }
}

                                       
contract NESTSave {
    using SafeMath for uint256;
    mapping (address => uint256) baseMapping;                   //  General ledger
    IBNEST nestContract;                                        //  Nest contract
    IBMapping mappingContract;                                  //  Mapping contract 
    
                                                                                         
    constructor(address map) public {
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS180("nest")));
    }
    
                                                                                           
    function CHANGEMAPPING767(address map) public ONLYOWNER586{	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS180("nest")));
    }
    
                                                                           
    function TAKEOUT682(uint256 num) public ONLYCONTRACT578 {	//inject NONSTANDARD NAMING
        require(ISCONTRACT904(address(tx.origin)) == false);          
        require(num <= baseMapping[tx.origin]);
        baseMapping[address(tx.origin)] = baseMapping[address(tx.origin)].SUB917(num);
        nestContract.TRANSFER663(address(tx.origin), num);
    }
    
                                                                           
    function DEPOSITIN863(uint256 num) public ONLYCONTRACT578 {	//inject NONSTANDARD NAMING
        require(ISCONTRACT904(address(tx.origin)) == false);                               
        require(nestContract.BALANCEOF271(address(tx.origin)) >= num);                     
        require(nestContract.ALLOWANCE547(address(tx.origin), address(this)) >= num);      
        require(nestContract.TRANSFERFROM761(address(tx.origin),address(this),num));       
        baseMapping[address(tx.origin)] = baseMapping[address(tx.origin)].ADD753(num);
    }
    
                                      
    function TAKEOUTPRIVATE677() public {	//inject NONSTANDARD NAMING
        require(ISCONTRACT904(address(msg.sender)) == false);          
        require(baseMapping[msg.sender] > 0);
        nestContract.TRANSFER663(address(msg.sender), baseMapping[msg.sender]);
        baseMapping[address(msg.sender)] = 0;
    }
    
    function CHECKAMOUNT391(address sender) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return baseMapping[address(sender)];
    }
    
    modifier ONLYOWNER586(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS66(msg.sender) == true);
        _;
    }
    
    modifier ONLYCONTRACT578(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKADDRESS180("nestAbonus") == msg.sender);
        _;
    }

    function ISCONTRACT904(address addr) public view returns (bool) {	//inject NONSTANDARD NAMING
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
}

                                        
contract Abonus {
    using address_make_payable for address;
    IBMapping mappingContract;                                  //  Mapping contract
    
                                                                                         
    constructor(address map) public {
        mappingContract = IBMapping(map);
    }
    
                                                                                           
    function CHANGEMAPPING767(address map) public ONLYOWNER586{	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map);
    }
    
                                                                                                   
    function GETETH258(uint256 num, address target) public ONLYCONTRACT578 {	//inject NONSTANDARD NAMING
        require(num <= GETETHNUM406());
        address payable addr = target.MAKE_PAYABLE172();
        addr.transfer(num);                                                                              
    }
    
    function GETETHNUM406() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return address(this).balance;
    }
    
    modifier ONLYCONTRACT578(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKADDRESS180("nestAbonus") == msg.sender);
        _;
    }

    modifier ONLYOWNER586(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS66(msg.sender) == true);
        _;
    }

    function () external payable {
        
    }
}

                                   
contract NESTLeveling {
    using address_make_payable for address;
    IBMapping mappingContract;                              //  Mapping contract

                                                                                         
    constructor (address map) public {
        mappingContract = IBMapping(map); 
    }
    
                                                                                           
    function CHANGEMAPPING767(address map) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map); 
    }
    
                                                                                                                
    function TRANETH211(uint256 amount, address target) public {	//inject NONSTANDARD NAMING
        require(address(msg.sender) == address(mappingContract.CHECKADDRESS180("nestAbonus")));
        uint256 tranAmount = amount;
        if (amount > address(this).balance) {
            tranAmount = address(this).balance;
        }
        address payable addr = target.MAKE_PAYABLE172();
        addr.transfer(tranAmount);
    }
    
    function () external payable {
        
    }
    
    modifier ONLYOWNER586(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS66(msg.sender) == true);
        _;
    }
}

                                           
contract NESTAbonus {
    using address_make_payable for address;
    using SafeMath for uint256;
    IBNEST nestContract;
    IBMapping mappingContract;                  
    NESTSave baseMapping;
    Abonus abonusContract;
    NESTLeveling nestLeveling;
    uint256 timeLimit = 168 hours;                                  //  Dividend period
    uint256 nextTime = 1587700800;                                  //  Next dividend time
    uint256 getAbonusTimeLimit = 60 hours;                          //  Trigger calculation settlement time
    uint256 ethNum = 0;                                             //  ETH amount
    uint256 nestAllValue = 0;                                       //  Nest circulation
    uint256 times = 0;                                              //  Dividend book
    uint256 expectedIncrement = 3;                                  //  Expected dividend increment proportion
    uint256 expectedMinimum = 100 ether;                            //  Expected minimum dividend
    uint256 levelingProportion = 10;                                //  Proportion of dividends deducted
    mapping(uint256 => mapping(address => bool)) getMapping;        //  Dividend collection record

                                                                                         
    constructor (address map) public {
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS180("nest")));
        baseMapping = NESTSave(address(mappingContract.CHECKADDRESS180("nestSave")));
        address payable addr = address(mappingContract.CHECKADDRESS180("abonus")).MAKE_PAYABLE172();
        abonusContract = Abonus(addr);
        address payable levelingAddr = address(mappingContract.CHECKADDRESS180("nestLeveling")).MAKE_PAYABLE172();
        nestLeveling = NESTLeveling(levelingAddr);
    }
    
                                                                                           
    function CHANGEMAPPING767(address map) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS180("nest")));
        baseMapping = NESTSave(address(mappingContract.CHECKADDRESS180("nestSave")));
        address payable addr = address(mappingContract.CHECKADDRESS180("abonus")).MAKE_PAYABLE172();
        abonusContract = Abonus(addr);
        address payable levelingAddr = address(mappingContract.CHECKADDRESS180("nestLeveling")).MAKE_PAYABLE172();
        nestLeveling = NESTLeveling(levelingAddr);
    }
    
                                                                              
    function DEPOSITIN863(uint256 amount) public {	//inject NONSTANDARD NAMING
        require(address(tx.origin) == address(msg.sender));         
        uint256 nowTime = now;
        if (nowTime < nextTime) {
            require(!(nowTime >= nextTime.SUB917(timeLimit) && nowTime <= nextTime.SUB917(timeLimit).ADD753(getAbonusTimeLimit)));
        } else {
            require(!(nowTime >= nextTime && nowTime <= nextTime.ADD753(getAbonusTimeLimit)));
            uint256 time = (nowTime.SUB917(nextTime)).DIV202(timeLimit);
            uint256 startTime = nextTime.ADD753((time).MUL873(timeLimit));        
            uint256 endTime = startTime.ADD753(getAbonusTimeLimit);        
            require(!(nowTime >= startTime && nowTime <= endTime));
        }
        baseMapping.DEPOSITIN863(amount);                           
    }
    
                                                                              
    function TAKEOUT682(uint256 amount) public {	//inject NONSTANDARD NAMING
        require(address(tx.origin) == address(msg.sender));          
        require(amount != 0);                                      
        require(amount <= baseMapping.CHECKAMOUNT391(address(msg.sender)));
        baseMapping.TAKEOUT682(amount);                           
    }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    
                                          
    function GETETH258() public {	//inject NONSTANDARD NAMING
        require(address(tx.origin) == address(msg.sender));        
        RELOADTIMEANDMAPPING754 ();            
        uint256 nowTime = now;
        require(nowTime >= nextTime.SUB917(timeLimit) && nowTime <= nextTime.SUB917(timeLimit).ADD753(getAbonusTimeLimit));
        require(getMapping[times.SUB917(1)][address(msg.sender)] != true);       
        uint256 nestAmount = baseMapping.CHECKAMOUNT391(address(msg.sender));
        require(nestAmount > 0);
        require(nestAllValue > 0);
        uint256 selfEth = nestAmount.MUL873(ethNum).DIV202(nestAllValue);
        require(selfEth > 0);
        getMapping[times.SUB917(1)][address(msg.sender)] = true;
        abonusContract.GETETH258(selfEth, address(msg.sender));                        
    }
    
    function LEVELINGRESULT821() private {	//inject NONSTANDARD NAMING
        abonusContract.GETETH258(abonusContract.GETETHNUM406().MUL873(levelingProportion).DIV202(100), address(nestLeveling));
        uint256 miningAmount = ALLVALUE608().DIV202(100000000 ether);
        uint256 minimumAbonus = expectedMinimum;
        for (uint256 i = 0; i < miningAmount; i++) {
            minimumAbonus = minimumAbonus.ADD753(minimumAbonus.MUL873(expectedIncrement).DIV202(100));
        }
        uint256 nowEth = abonusContract.GETETHNUM406();
        if (nowEth < minimumAbonus) {
            nestLeveling.TRANETH211(minimumAbonus.SUB917(nowEth), address(abonusContract));
        }
    }
    
    function RELOADTIMEANDMAPPING754() private {	//inject NONSTANDARD NAMING
        uint256 nowTime = now;
        if (nowTime >= nextTime) {                                          
            LEVELINGRESULT821();
            uint256 time = (nowTime.SUB917(nextTime)).DIV202(timeLimit);
            uint256 startTime = nextTime.ADD753((time).MUL873(timeLimit));      
            uint256 endTime = startTime.ADD753(getAbonusTimeLimit);           
            if (nowTime >= startTime && nowTime <= endTime) {
                nextTime = GETNEXTTIME419();                                   
                times = times.ADD753(1);                                   
                ethNum = abonusContract.GETETHNUM406();                    
                nestAllValue = ALLVALUE608();                              
            }
        }
    }
    
    function GETINFO489() public view returns (uint256 _nextTime, uint256 _getAbonusTime, uint256 _ethNum, uint256 _nestValue, uint256 _myJoinNest, uint256 _getEth, uint256 _allowNum, uint256 _leftNum, bool allowAbonus)  {	//inject NONSTANDARD NAMING
        uint256 nowTime = now;
        if (nowTime >= nextTime.SUB917(timeLimit) && nowTime <= nextTime.SUB917(timeLimit).ADD753(getAbonusTimeLimit)) {
            allowAbonus = getMapping[times.SUB917(1)][address(msg.sender)];
            _ethNum = ethNum;
            _nestValue = nestAllValue;
        } else {
            _ethNum = abonusContract.GETETHNUM406();
            _nestValue = ALLVALUE608();
            allowAbonus = getMapping[times][address(msg.sender)];
        }
        _myJoinNest = baseMapping.CHECKAMOUNT391(address(msg.sender));
        if (allowAbonus == true) {
            _getEth = 0; 
        } else {
            _getEth = _myJoinNest.MUL873(_ethNum).DIV202(_nestValue);
        }
        _nextTime = GETNEXTTIME419();
        _getAbonusTime = _nextTime.SUB917(timeLimit).ADD753(getAbonusTimeLimit);
        _allowNum = nestContract.ALLOWANCE547(address(msg.sender), address(baseMapping));
        _leftNum = nestContract.BALANCEOF271(address(msg.sender));
    }
    
    function GETNEXTTIME419() public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 nowTime = now;
        if (nextTime > nowTime) { 
            return nextTime; 
        } else {
            uint256 time = (nowTime.SUB917(nextTime)).DIV202(timeLimit);
            return nextTime.ADD753(timeLimit.MUL873(time.ADD753(1)));
        }
    }
    
    function ALLVALUE608() public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 all = 10000000000 ether;
        uint256 leftNum = all.SUB917(nestContract.BALANCEOF271(address(mappingContract.CHECKADDRESS180("miningSave"))));
        return leftNum;
    }

    function CHECKTIMELIMIT572() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return timeLimit;
    }

    function CHECKGETABONUSTIMELIMIT761() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return getAbonusTimeLimit;
    }

    function CHECKMINIMUMABONUS370() public view returns(uint256) {	//inject NONSTANDARD NAMING
        uint256 miningAmount = ALLVALUE608().DIV202(100000000 ether);
        uint256 minimumAbonus = expectedMinimum;
        for (uint256 i = 0; i < miningAmount; i++) {
            minimumAbonus = minimumAbonus.ADD753(minimumAbonus.MUL873(expectedIncrement).DIV202(100));
        }
        return minimumAbonus;
    }

    function CHANGETIMELIMIT421(uint256 hour) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        require(hour > 0);
        timeLimit = hour.MUL873(1 hours);
    }

    function CHANGEGETABONUSTIMELIMIT274(uint256 hour) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        require(hour > 0);
        getAbonusTimeLimit = hour;
    }

    function CHANGEEXPECTEDINCREMENT443(uint256 num) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        require(num > 0);
        expectedIncrement = num;
    }

    function CHANGEEXPECTEDMINIMUM767(uint256 num) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        require(num > 0);
        expectedMinimum = num;
    }

    function CHANGELEVELINGPROPORTION579(uint256 num) public ONLYOWNER586 {	//inject NONSTANDARD NAMING
        require(num > 0);
        levelingProportion = num;
    }

    modifier ONLYOWNER586(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS66(msg.sender) == true);
        _;
    }

}