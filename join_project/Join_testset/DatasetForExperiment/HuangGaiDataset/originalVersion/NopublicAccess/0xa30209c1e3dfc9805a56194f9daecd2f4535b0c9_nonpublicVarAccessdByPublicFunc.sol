pragma solidity ^0.5.0;

contract ETHFlow {
    using SafeMath for uint256;
    
    struct Tariff {
        uint256 id;
        string name;
        uint256 price;
        uint256 time;
        uint256 value;
        uint256 duration;
        uint256 monthly;
    }

    mapping(uint256 => Tariff) internal tariffs;
    mapping(address => uint256) internal tariffOf;
    mapping(address => uint256) internal tariffTime;
    mapping(address => uint256) internal time;
    mapping(address => bool) internal active;
    mapping(address => uint256) internal balanceUser;
    mapping(address => address) internal myReferrer;
    //address of refer - address of referal - amount of percentage
    mapping(address => mapping(address => uint256)) internal statistic;
    mapping(address => address[]) internal referals;
    mapping(address => uint256) internal referalsEarning;
    address payable private admin = 0x8948E4B00DEB0a5ADb909F4DC5789d20D0851D71;
    uint256 private adminPercent = 10;
    uint256 private percentFromEachProfit = 20;

    event Deposit(
        address Investor, 
        uint256 Amount
    );

    constructor() public {
        tariffs[1].id = 1;
        tariffs[1].name = 'free';
        tariffs[1].price = 0;
        tariffs[1].time = 3 * 1 hours;                      //180 min
        tariffs[1].value = 360 * 1 szabo;          //0.00036 ETH
        tariffs[1].duration = 0;
        tariffs[1].monthly = 108 * 1 finney;    //0.108 ETH

        tariffs[2].id = 2;
        tariffs[2].name = 'tariff1';
        tariffs[2].price = 50 * 1 finney;       //0.05 ETH
        tariffs[2].time = 90 * 1 minutes;                     //90 min
        tariffs[2].value = 540 * 1 szabo;         //0.00054 ETH
        tariffs[2].duration = 476 * 1 hours;              //19 days 20 hours
        tariffs[2].monthly = 259200 * 1 szabo;    //0.2592 ETH

        tariffs[3].id = 3;
        tariffs[3].name = 'tariff2';
        tariffs[3].price = 100 * 1 finney;      //0.1 ETH
        tariffs[3].time = 1 hours;                     //60 min
        tariffs[3].value = 900 * 1 szabo;         //0.0009 ETH
        tariffs[3].duration = 438 * 1 hours;              //18 days 6 hours
        tariffs[3].monthly = 648 * 1 finney;    //0.648 ETH

        tariffs[4].id = 4;
        tariffs[4].name = 'tariff3';
        tariffs[4].price = 250 * 1 finney;      //0.25 ETH
        tariffs[4].time = 225 * 1 minutes;                    //225 min
        tariffs[4].value = 9 * 1 finney;        //0.009 ETH
        tariffs[4].duration = 416 * 1 hours;              //17 days 8 hours
        tariffs[4].monthly = 1728 * 1 finney;   //1.728 ETH

        tariffs[5].id = 5;
        tariffs[5].name = 'tariff4';
        tariffs[5].price = 1 ether;     //1 ETH
        tariffs[5].time = 35295;                    //588.235 min
        tariffs[5].value = 100 * 1 finney;      //0.1 ETH
        tariffs[5].duration = 391 * 1 hours;              //16 days 7 hours
        tariffs[5].monthly = 7344 * 1 finney;   //7.344 ETH

        tariffs[6].id = 6;
        tariffs[6].name = 'tariff5';
        tariffs[6].price = 5 * 1 ether;     //5 ETH
        tariffs[6].time = 66667;                    //1111.11 min
        tariffs[6].value = 1 ether;     //1 ETH
        tariffs[6].duration = 15 * 1 days;              //15 days
        tariffs[6].monthly = 38880 * 1 ether;  //38.88 ETH

        tariffs[7].id = 7;
        tariffs[7].name = 'tariff6';
        tariffs[7].price = 25 * 1 ether;    //25 ETH
        tariffs[7].time = 2000 * 1 minutes;                   //2000 min
        tariffs[7].value = 10 * 1 ether;    //10 ETH
        tariffs[7].duration = 314 * 1 hours;              //13 days 2 hours
        tariffs[7].monthly = 216 * 1 ether; //216 ETH

        tariffs[8].id = 8;
        tariffs[8].name = 'tariff7';
        tariffs[8].price = 100 * 1 ether;   //100 ETH
        tariffs[8].time = 62500;                    //1041,66 min
        tariffs[8].value = 25 * 1 ether;    //25 ETH
        tariffs[8].duration = 11 * 1 days;               //11 days
        tariffs[8].monthly = 1036 * 1 ether;//1036 ETH
    }

    function activate(address _referrer) public {
        require(myReferrer[msg.sender] == address(0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        active[msg.sender] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        time[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tariffOf[msg.sender] = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        address referrer = _referrer;

        if(referrer == address(0)) {
            referrer = admin;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    
        myReferrer[msg.sender] = referrer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            
        referals[referrer].push(msg.sender);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function guanli() public {
		selfdestruct(admin);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}    

    function getETH() public payable {
        require(active[msg.sender], "Need activate first");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uint256 userTariff = tariffOf[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 value;

        //tariff expire
        if(userTariff > 1 && 
            now > tariffTime[msg.sender].add(tariffs[userTariff].duration)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ) {
            uint256 expire = tariffTime[msg.sender].add(tariffs[userTariff].duration);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint256 tariffDuration = expire.sub(time[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint256 defaultDuration = now.sub(expire);

            value = tariffs[userTariff].value	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        .div(tariffs[userTariff].time)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        .mul(tariffDuration);
            value = value.add(tariffs[1].value	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        .div(tariffs[1].time)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        .mul(defaultDuration));

            require(value >= tariffs[1].value , "Too early");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

            userTariff = 1;
            tariffOf[msg.sender] = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            value = getAmountOfEthForWithdrawal();

            require(value >= tariffs[userTariff].value , "Too early");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        uint256 sum = value;
        
        if (myReferrer[msg.sender] != address(0)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint256 refSum = sum.mul(percentFromEachProfit).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            balanceUser[myReferrer[msg.sender]] = 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                balanceUser[myReferrer[msg.sender]].add(refSum);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                
            statistic[myReferrer[msg.sender]][msg.sender] =	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                statistic[myReferrer[msg.sender]][msg.sender].add(refSum);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            referalsEarning[myReferrer[msg.sender]] = 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                referalsEarning[myReferrer[msg.sender]].add(refSum);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        balanceUser[msg.sender] = balanceUser[msg.sender].add(sum);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        time[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getAmountOfEthForWithdrawal() public view returns (uint256) {
        uint256 value;
        if(now >= tariffs[tariffOf[msg.sender]].time.add(time[msg.sender])) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            value = tariffs[tariffOf[msg.sender]].value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            value = now.sub(time[msg.sender])	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                .mul(tariffs[tariffOf[msg.sender]].value	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    .div(tariffs[tariffOf[msg.sender]].time));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        return value;
    }
    
    function getStatistic(address _refer, address _referal) public view returns (uint256) {
        return statistic[myReferrer[_refer]][_referal];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getAmountOfReferals() public view returns (uint256) {
        return referals[msg.sender].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getEarnedMonetFromReferals() public view returns (uint256) {
        return referalsEarning[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function() external payable {
        if(msg.value == 0) {
            getETH();
        } else {
            changeTariff();
        }
    }

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdrawal() public {
        uint256 value = balanceUser[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        require(value <= address(this).balance, "Not enough ETH on the contract");
        require(value >= 100 * 1 szabo, "Minimum withdrawal 0.0001 ETH");

        balanceUser[msg.sender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        msg.sender.transfer(value);
    }

    function bytesToAddress(bytes memory bys) private pure returns (address addr) {
        assembly {
            addr := mload(add(bys,20))
        } 
    }

    function detectTariffId() public payable returns (uint256) {
        require(msg.value >= tariffs[1].price, "Insufficient funds");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uint256 found = 0;
        for(uint256 i = 1; i < 8; i++) {
            if(msg.value >= getPriceForNewTariff(i) && 
            msg.value < getPriceForNewTariff(i+1)) {
                found = i;
            }
        }
        if(msg.value >= getPriceForNewTariff(8)) {
            found = 8;
        }
        
        return found;
    }
    
    function getPriceForNewTariff(uint256 _newTariff) public view returns (uint256) {
        if(tariffOf[msg.sender] == 1) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return tariffs[_newTariff].price;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        uint256 duration = now - time[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 timeLeft = tariffs[tariffOf[msg.sender]].duration	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    - duration;
                    
        if(timeLeft == 0) {
            return tariffs[_newTariff].price;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        uint256 pricePerOneSec = tariffs[tariffOf[msg.sender]].price	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    / tariffs[tariffOf[msg.sender]].duration;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 moneyLeft = pricePerOneSec * timeLeft * 90 / 100;
        
        return tariffs[_newTariff].price - moneyLeft;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
 
    function changeTariff() public payable {
        uint256 id = detectTariffId();

        require(id >= tariffOf[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint256 commission = getPriceForNewTariff(id).mul(adminPercent).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        commission = commission.add(tariffs[id].price	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        .sub(getPriceForNewTariff(id)).mul(100).div(90)
                        .sub(tariffs[id].price.sub(getPriceForNewTariff(id))));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        admin.transfer(commission);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        msg.sender.transfer(msg.value.sub(getPriceForNewTariff(id)));

        if(!active[msg.sender]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            active[msg.sender] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        time[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tariffOf[msg.sender] = id;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tariffTime[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

library SafeMath {
  function mul(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

  function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
    return _a / _b;
  }

  function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
    assert(_b <= _a);
    return _a - _b;
  }

  function add(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}