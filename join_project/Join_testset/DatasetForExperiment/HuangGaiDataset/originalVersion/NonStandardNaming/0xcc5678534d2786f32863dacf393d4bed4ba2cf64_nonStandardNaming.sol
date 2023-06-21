pragma solidity ^0.5.3;

contract Operator {
    uint256 public ONE_DAY = 86400;
    uint256 public MIN_DEP = 1 ether;
    uint256 public MAX_DEP = 100 ether;
    address public admin;
    address public admin2;
    address public querierAddress;
    uint256 public depositedAmountGross = 0;
    uint256 public paySystemCommissionTimes = 1;
    uint256 public payDailyIncomeTimes = 1;
    uint256 public lastPaySystemCommission = now;
    uint256 public lastPayDailyIncome = now;
    uint256 public contractStartAt = now;
    uint256 public lastReset = now;
    address payable public operationFund = 0x4357DE4549a18731fA8bF3c7b69439E87FAff8F6;
    address[] public investorAddresses;
    bytes32[] public investmentIds;
    bytes32[] public withdrawalIds;
    bytes32[] public maxOutIds;
    mapping (address => Investor) investors;
    mapping (bytes32 => Investment) public investments;
    mapping (bytes32 => Withdrawal) public withdrawals;
    mapping (bytes32 => MaxOut) public maxOuts;
    uint256 additionNow = 0;

    uint256 public maxLevelsAddSale = 200;
    uint256 public maximumMaxOutInWeek = 2;
    bool public importing = true;

    Vote public currentVote;

    struct Vote {
        uint256 startTime;
        string reason;
        mapping (address => uint8) votes;
        address payable emergencyAddress;
        uint256 yesPoint;
        uint256 noPoint;
        uint256 totalPoint;
    }

    struct Investment {
        bytes32 id;
        uint256 at;
        uint256 amount;
        address investor;
        address nextInvestor;
        bool nextBranch;
    }

    struct Withdrawal {
        bytes32 id;
        uint256 at;
        uint256 amount;
        address investor;
        address presentee;
        uint256 reason;
        uint256 times;
    }

    struct Investor {
        address parent;
        address leftChild;
        address rightChild;
        address presenter;
        uint256 generation;
        uint256 depositedAmount;
        uint256 withdrewAmount;
        bool isDisabled;
        uint256 lastMaxOut;
        uint256 maxOutTimes;
        uint256 maxOutTimesInWeek;
        uint256 totalSell;
        uint256 sellThisMonth;
        uint256 rightSell;
        uint256 leftSell;
        uint256 reserveCommission;
        uint256 dailyIncomeWithrewAmount;
        uint256 registerTime;
        uint256 minDeposit;
        bytes32[] investments;
        bytes32[] withdrawals;
    }

    struct MaxOut {
        bytes32 id;
        address investor;
        uint256 times;
        uint256 at;
    }

    constructor () public { admin = msg.sender; }
    
    modifier MUSTBEADMIN498() {	//inject NONSTANDARD NAMING
        require(msg.sender == admin || msg.sender == querierAddress || msg.sender == admin2);
        _;
    }

    modifier MUSTBEIMPORTING140() { require(importing); require(msg.sender == querierAddress || msg.sender == admin); _; }	//inject NONSTANDARD NAMING
    
    function () payable external { DEPOSIT831(); }

    function GETNOW557() internal view returns(uint256) {	//inject NONSTANDARD NAMING
        return additionNow + now;
    }

    function DEPOSITPROCESS608(address sender) internal {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[sender];
        require(investor.generation != 0);
        if (investor.depositedAmount == 0) require(msg.value >= investor.minDeposit);
        require(investor.maxOutTimesInWeek < maximumMaxOutInWeek);
        require(investor.maxOutTimes < 50);
        require(investor.maxOutTimes == 0 || GETNOW557() - investor.lastMaxOut < ONE_DAY * 7 || investor.depositedAmount != 0);
        depositedAmountGross += msg.value;
        bytes32 id = keccak256(abi.encodePacked(block.number, GETNOW557(), sender, msg.value));
        uint256 investmentValue = investor.depositedAmount + msg.value <= MAX_DEP ? msg.value : MAX_DEP - investor.depositedAmount;
        if (investmentValue == 0) return;
        bool nextBranch = investors[investor.parent].leftChild == sender; 
        Investment memory investment = Investment({ id: id, at: GETNOW557(), amount: investmentValue, investor: sender, nextInvestor: investor.parent, nextBranch: nextBranch  });
        investments[id] = investment;
        PROCESSINVESTMENTS110(id);
        investmentIds.push(id);
    }

    function PUSHNEWMAXOUT686(address investorAddress, uint256 times, uint256 depositedAmount) internal {	//inject NONSTANDARD NAMING
        bytes32 id = keccak256(abi.encodePacked(block.number, GETNOW557(), investorAddress, times));
        MaxOut memory maxOut = MaxOut({ id: id, at: GETNOW557(), investor: investorAddress, times: times });
        maxOutIds.push(id);
        maxOuts[id] = maxOut;
        investors[investorAddress].minDeposit = depositedAmount;
    }
    
    function DEPOSIT831() payable public { DEPOSITPROCESS608(msg.sender); }	//inject NONSTANDARD NAMING
    
    function PROCESSINVESTMENTS110(bytes32 investmentId) internal {	//inject NONSTANDARD NAMING
        Investment storage investment = investments[investmentId];
        uint256 amount = investment.amount;
        Investor storage investor = investors[investment.investor];
        investor.investments.push(investmentId);
        investor.depositedAmount += amount;
        address payable presenterAddress = address(uint160(investor.presenter));
        Investor storage presenter = investors[presenterAddress];
        if (presenterAddress != address(0)) {
            presenter.totalSell += amount;
            presenter.sellThisMonth += amount;
        }
        if (presenter.depositedAmount >= MIN_DEP && !presenter.isDisabled) {
            SENDETHERFORINVESTOR291(presenterAddress, amount / 10, 1, investment.investor, 0);
        }
    }

    function ADDSELLFORPARENTS603(bytes32 investmentId) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        Investment storage investment = investments[investmentId];
        require(investment.nextInvestor != address(0));
        uint256 amount = investment.amount;
        uint256 loopCount = 0;
        while (investment.nextInvestor != address(0) && loopCount < maxLevelsAddSale) {
            Investor storage investor = investors[investment.nextInvestor];
            if (investment.nextBranch) investor.leftSell += amount;
            else investor.rightSell += amount;
            investment.nextBranch = investors[investor.parent].leftChild == investment.nextInvestor;
            investment.nextInvestor = investor.parent;
            loopCount++;
        }
    }

    function SENDETHERFORINVESTOR291(address payable investorAddress, uint256 value, uint256 reason, address presentee, uint256 times) internal {	//inject NONSTANDARD NAMING
        if (value == 0 && reason != 100) return; // value only equal zero when pay to reach max out
        if (investorAddress == address(0)) return;
        Investor storage investor = investors[investorAddress];
        uint256 unpaidSystemCommission = GETUNPAIDSYSTEMCOMMISSION138(investorAddress);
        uint256 totalPaidAfterThisTime = investor.reserveCommission + GETDAILYINCOMEFORUSER9(investorAddress) + unpaidSystemCommission;
        if (reason == 1) totalPaidAfterThisTime += value; // gioi thieu truc tiep
        if (totalPaidAfterThisTime + investor.withdrewAmount >= 3 * investor.depositedAmount) { // max out
            PAYWITHMAXOUT212(totalPaidAfterThisTime, investorAddress, unpaidSystemCommission);
            return;
        }
        if (investor.reserveCommission > 0) PAYWITHNOMAXOUT38(investor.reserveCommission, investorAddress, 4, address(0), 0);
        PAYWITHNOMAXOUT38(value, investorAddress, reason, presentee, times);
    }
    
    function PAYWITHNOMAXOUT38(uint256 amountToPay, address payable investorAddress, uint256 reason, address presentee, uint256 times) internal {	//inject NONSTANDARD NAMING
        investors[investorAddress].withdrewAmount += amountToPay;
        if (reason == 4) investors[investorAddress].reserveCommission = 0;
        if (reason == 3) RESETSYSTEMCOMMISION616(investorAddress, times);
        if (reason == 2) investors[investorAddress].dailyIncomeWithrewAmount += amountToPay;
        PAY694(amountToPay, investorAddress, reason, presentee, times);
    }
    
    function PAYWITHMAXOUT212(uint256 totalPaidAfterThisTime, address payable investorAddress, uint256 unpaidSystemCommission) internal {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[investorAddress];
        uint256 amountToPay = investor.depositedAmount * 3 - investor.withdrewAmount;
        uint256 amountToReserve = totalPaidAfterThisTime - amountToPay;
        if (unpaidSystemCommission > 0) RESETSYSTEMCOMMISION616(investorAddress, 0);
        investor.maxOutTimes++;
        investor.maxOutTimesInWeek++;
        uint256 oldDepositedAmount = investor.depositedAmount;
        investor.depositedAmount = 0;
        investor.withdrewAmount = 0;
        investor.lastMaxOut = GETNOW557();
        investor.dailyIncomeWithrewAmount = 0;
        investor.reserveCommission = amountToReserve;
        PUSHNEWMAXOUT686(investorAddress, investor.maxOutTimes, oldDepositedAmount);
        PAY694(amountToPay, investorAddress, 0, address(0), 0);
    }

    function PAY694(uint256 amountToPay, address payable investorAddress, uint256 reason, address presentee, uint256 times) internal {	//inject NONSTANDARD NAMING
        if (amountToPay == 0) return;
        investorAddress.transfer(amountToPay / 100 * 90);
        operationFund.transfer(amountToPay / 100 * 10);
        bytes32 id = keccak256(abi.encodePacked(block.difficulty, GETNOW557(), investorAddress, amountToPay, reason));
        Withdrawal memory withdrawal = Withdrawal({ id: id, at: GETNOW557(), amount: amountToPay, investor: investorAddress, presentee: presentee, times: times, reason: reason });
        withdrawals[id] = withdrawal;
        investors[investorAddress].withdrawals.push(id);
        withdrawalIds.push(id);
    }

    function GETALLINCOMETILNOW205(address investorAddress) internal view returns(uint256 allIncome) {	//inject NONSTANDARD NAMING
        Investor memory investor = investors[investorAddress];
        uint256 unpaidDailyIncome = GETDAILYINCOMEFORUSER9(investorAddress);
        uint256 withdrewAmount = investor.withdrewAmount;
        uint256 unpaidSystemCommission = GETUNPAIDSYSTEMCOMMISSION138(investorAddress);
        uint256 allIncomeNow = unpaidDailyIncome + withdrewAmount + unpaidSystemCommission;
        return allIncomeNow;
    }

    function PUTPRESENTEE92(address presenterAddress, address presenteeAddress, address parentAddress, bool isLeft) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        Investor storage presenter = investors[presenterAddress];
        Investor storage parent = investors[parentAddress];
        if (investorAddresses.length != 0) {
            require(presenter.generation != 0);
            require(parent.generation != 0);
            if (isLeft) {
                require(parent.leftChild == address(0)); 
            } else {
                require(parent.rightChild == address(0)); 
            }
        }
        Investor memory investor = Investor({
            parent: parentAddress,
            leftChild: address(0),
            rightChild: address(0),
            presenter: presenterAddress,
            generation: parent.generation + 1,
            depositedAmount: 0,
            withdrewAmount: 0,
            isDisabled: false,
            lastMaxOut: GETNOW557(),
            maxOutTimes: 0,
            maxOutTimesInWeek: 0,
            totalSell: 0,
            sellThisMonth: 0,
            registerTime: GETNOW557(),
            investments: new bytes32[](0),
            withdrawals: new bytes32[](0),
            minDeposit: MIN_DEP,
            rightSell: 0,
            leftSell: 0,
            reserveCommission: 0,
            dailyIncomeWithrewAmount: 0
        });
        investors[presenteeAddress] = investor;
       
        investorAddresses.push(presenteeAddress);
        if (parent.generation == 0) return;
        if (isLeft) {
            parent.leftChild = presenteeAddress;
        } else {
            parent.rightChild = presenteeAddress;
        }
    }

    function GETDAILYINCOMEFORUSER9(address investorAddress) internal view returns(uint256 amount) {	//inject NONSTANDARD NAMING
        Investor memory investor = investors[investorAddress];
        uint256 investmentLength = investor.investments.length;
        uint256 dailyIncome = 0;
        for (uint256 i = 0; i < investmentLength; i++) {
            Investment memory investment = investments[investor.investments[i]];
            if (investment.at < investor.lastMaxOut) continue; 
            if (GETNOW557() - investment.at >= ONE_DAY) {
                uint256 numberOfDay = (GETNOW557() - investment.at) / ONE_DAY;
                uint256 totalDailyIncome = numberOfDay * investment.amount / 100;
                dailyIncome = totalDailyIncome + dailyIncome;
            }
        }
        return dailyIncome - investor.dailyIncomeWithrewAmount;
    }
    
    function PAYDAILYINCOMEFORINVESTOR539(address payable investorAddress, uint256 times) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        uint256 dailyIncome = GETDAILYINCOMEFORUSER9(investorAddress);
        Investor storage investor = investors[investorAddress];
        if (times > ONE_DAY) {
            uint256 investmentLength = investor.investments.length;
            bytes32 lastInvestmentId = investor.investments[investmentLength - 1];
            investments[lastInvestmentId].at -= times;
            investors[investorAddress].lastMaxOut = investments[lastInvestmentId].at;
            return;
        }
        if (investor.isDisabled) return;
        SENDETHERFORINVESTOR291(investorAddress, dailyIncome, 2, address(0), times);
    }
    
    function PAYDAILYINCOMEBYINDEX219(uint256 from, uint256 to) public MUSTBEADMIN498{	//inject NONSTANDARD NAMING
        require(from >= 0 && to < investorAddresses.length);
        for(uint256 i = from; i <= to; i++) {
            PAYDAILYINCOMEFORINVESTOR539(address(uint160(investorAddresses[i])), payDailyIncomeTimes);
        }
    }

    function GETUNPAIDSYSTEMCOMMISSION138(address investorAddress) public view returns(uint256 unpaid) {	//inject NONSTANDARD NAMING
        Investor memory investor = investors[investorAddress];
        uint256 depositedAmount = investor.depositedAmount;
        uint256 totalSell = investor.totalSell;
        uint256 leftSell = investor.leftSell;
        uint256 rightSell = investor.rightSell;
        uint256 sellThisMonth = investor.sellThisMonth;
        uint256 sellToPaySystemCommission = rightSell < leftSell ? rightSell : leftSell;
        uint256 commission = sellToPaySystemCommission * GETPERCENTAGE156(depositedAmount, totalSell, sellThisMonth) / 100;
        return commission;
    }
    
    function PAYSYSTEMCOMMISSIONINVESTOR941(address payable investorAddress, uint256 times) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[investorAddress];
        if (investor.isDisabled) return;
        uint256 systemCommission = GETUNPAIDSYSTEMCOMMISSION138(investorAddress);
        SENDETHERFORINVESTOR291(investorAddress, systemCommission, 3, address(0), times);
    }

    function RESETSYSTEMCOMMISION616(address investorAddress, uint256 times) internal {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[investorAddress];
        if (paySystemCommissionTimes > 3 && times != 0) {
            investor.rightSell = 0;
            investor.leftSell = 0;
        } else if (investor.rightSell >= investor.leftSell) {
            investor.rightSell = investor.rightSell - investor.leftSell;
            investor.leftSell = 0;
        } else {
            investor.leftSell = investor.leftSell - investor.rightSell;
            investor.rightSell = 0;
        }
        if (times != 0) investor.sellThisMonth = 0;
    }

    function PAYSYSTEMCOMMISSIONBYINDEX324(uint256 from, uint256 to) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
         require(from >= 0 && to < investorAddresses.length);
        // change 1 to 30
        if (GETNOW557() <= 30 * ONE_DAY + contractStartAt) return;
        for(uint256 i = from; i <= to; i++) {
            PAYSYSTEMCOMMISSIONINVESTOR941(address(uint160(investorAddresses[i])), paySystemCommissionTimes);
        }
    }
    
    function FINISHPAYDAILYINCOME416() public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        lastPayDailyIncome = GETNOW557();
        payDailyIncomeTimes++;
    }
    
    function FINISHPAYSYSTEMCOMMISSION741() public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        lastPaySystemCommission = GETNOW557();
        paySystemCommissionTimes++;
    }
    
    function RESETGAME547(uint256 from, uint256 to) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        require(from >= 0 && to < investorAddresses.length);
        require(currentVote.startTime != 0);
        require(GETNOW557() - currentVote.startTime > 3 * ONE_DAY);
        require(currentVote.yesPoint > currentVote.totalPoint / 2);
        require(currentVote.emergencyAddress == address(0));
        lastReset = GETNOW557();
        for (uint256 i = from; i < to; i++) {
            address investorAddress = investorAddresses[i];
            Investor storage investor = investors[investorAddress];
            uint256 currentVoteValue = currentVote.votes[investorAddress] != 0 ? currentVote.votes[investorAddress] : 2;
            if (currentVoteValue == 2) {
                if (investor.maxOutTimes > 0 || (investor.withdrewAmount >= investor.depositedAmount && investor.withdrewAmount != 0)) {
                    investor.lastMaxOut = GETNOW557();
                    investor.depositedAmount = 0;
                    investor.withdrewAmount = 0;
                    investor.dailyIncomeWithrewAmount = 0;
                }
                investor.reserveCommission = 0;
                investor.rightSell = 0;
                investor.leftSell = 0;
                investor.totalSell = 0;
                investor.sellThisMonth = 0;
            } else {
                if (investor.maxOutTimes > 0 || (investor.withdrewAmount >= investor.depositedAmount && investor.withdrewAmount != 0)) {
                    investor.isDisabled = true;
                    investor.reserveCommission = 0;
                    investor.lastMaxOut = GETNOW557();
                    investor.depositedAmount = 0;
                    investor.withdrewAmount = 0;
                    investor.dailyIncomeWithrewAmount = 0;
                }
                investor.reserveCommission = 0;
                investor.rightSell = 0;
                investor.leftSell = 0;
                investor.totalSell = 0;
                investor.sellThisMonth = 0;
            }
            
        }
    }

    function STOPGAME372(uint256 percent, uint256 from, uint256 to) MUSTBEADMIN498 public {	//inject NONSTANDARD NAMING
        require(currentVote.startTime != 0);
        require(GETNOW557() - currentVote.startTime > 3 * ONE_DAY);
        require(currentVote.noPoint > currentVote.totalPoint / 2);
        require(currentVote.emergencyAddress == address(0));
        require(percent <= 50);
        require(from >= 0 && to < investorAddresses.length);
        for (uint256 i = from; i <= to; i++) {
            address payable investorAddress = address(uint160(investorAddresses[i]));
            Investor storage investor = investors[investorAddress];
            if (investor.maxOutTimes > 0) continue;
            if (investor.isDisabled) continue;
            uint256 depositedAmount = investor.depositedAmount;
            uint256 withdrewAmount = investor.withdrewAmount;
            if (withdrewAmount >= depositedAmount / 2) continue;
            SENDETHERFORINVESTOR291(investorAddress, depositedAmount * percent / 100 - withdrewAmount, 6, address(0), 0);
        }
    }
    
    function REVIVALINVESTOR544(address investor) public MUSTBEADMIN498 { investors[investor].lastMaxOut = GETNOW557(); }	//inject NONSTANDARD NAMING

    function PAYTOREACHMAXOUT359(address payable investorAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        uint256 unpaidSystemCommissions = GETUNPAIDSYSTEMCOMMISSION138(investorAddress);
        uint256 unpaidDailyIncomes = GETDAILYINCOMEFORUSER9(investorAddress);
        uint256 withdrewAmount = investors[investorAddress].withdrewAmount;
        uint256 depositedAmount = investors[investorAddress].depositedAmount;
        uint256 reserveCommission = investors[investorAddress].reserveCommission;
        require(depositedAmount > 0  && withdrewAmount + unpaidSystemCommissions + unpaidDailyIncomes + reserveCommission >= 3 * depositedAmount);
        SENDETHERFORINVESTOR291(investorAddress, 0, 100, address(0), 0);
    }

    function RESETMAXOUTINWEEK502(uint256 from, uint256 to) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        require(from >= 0 && to < investorAddresses.length);
        for (uint256 i = from; i < to; i++) {
            address investorAddress = investorAddresses[i];
            if (investors[investorAddress].maxOutTimesInWeek == 0) continue;
            investors[investorAddress].maxOutTimesInWeek = 0;
        }
    }

    function SETMAXIMUMMAXOUTTIMES950(address investorAddress, uint256 times) public MUSTBEADMIN498{ investors[investorAddress].maxOutTimes = times; }	//inject NONSTANDARD NAMING

    function DISABLEINVESTOR766(address investorAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[investorAddress];
        investor.isDisabled = true;
    }
    
    function ENABLEINVESTOR378(address investorAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        Investor storage investor = investors[investorAddress];
        investor.isDisabled = false;
    }
    
    function DONATE609() payable public { depositedAmountGross += msg.value; }	//inject NONSTANDARD NAMING

    // Utils helpers
    
    function GETTOTALSELLLEVEL515(uint256 totalSell) internal pure returns (uint256 level){	//inject NONSTANDARD NAMING
        if (totalSell < 30 ether) return 0;
        if (totalSell < 60 ether) return 1;
        if (totalSell < 90 ether) return 2;
        if (totalSell < 120 ether) return 3;
        if (totalSell < 150 ether) return 4;
        return 5;
    }

    function GETSELLTHISMONTHLEVEL746(uint256 sellThisMonth) internal pure returns (uint256 level){	//inject NONSTANDARD NAMING
        if (sellThisMonth < 2 ether) return 0;
        if (sellThisMonth < 4 ether) return 1;
        if (sellThisMonth < 6 ether) return 2;
        if (sellThisMonth < 8 ether) return 3;
        if (sellThisMonth < 10 ether) return 4;
        return 5;
    }
    
    function GETDEPOSITLEVEL217(uint256 depositedAmount) internal pure returns (uint256 level){	//inject NONSTANDARD NAMING
        if (depositedAmount < 2 ether) return 0;
        if (depositedAmount < 4 ether) return 1;
        if (depositedAmount < 6 ether) return 2;
        if (depositedAmount < 8 ether) return 3;
        if (depositedAmount < 10 ether) return 4;
        return 5;
    }
    
    function GETPERCENTAGE156(uint256 depositedAmount, uint256 totalSell, uint256 sellThisMonth) internal pure returns(uint256 level) {	//inject NONSTANDARD NAMING
        uint256 totalSellLevel = GETTOTALSELLLEVEL515(totalSell);
        uint256 depLevel = GETDEPOSITLEVEL217(depositedAmount);
        uint256 sellThisMonthLevel = GETSELLTHISMONTHLEVEL746(sellThisMonth);
        uint256 min12 = totalSellLevel < depLevel ? totalSellLevel : depLevel;
        uint256 minLevel = sellThisMonthLevel < min12 ? sellThisMonthLevel : min12;
        return minLevel * 2;
    }
    
    function STRINGTOBYTES32159(string memory source) internal pure returns (bytes32 result) {	//inject NONSTANDARD NAMING
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) return 0x0;
        assembly { result := mload(add(source, 32)) }
    }
    
    // query investor helpers

    function GETINVESTOR47(address investorAddress) view public returns (address[] memory addresses, bool isDisabled, uint256[] memory numbers) {	//inject NONSTANDARD NAMING
        addresses = new address[](4);
        numbers = new uint256[](16);
        Investor memory investor = investors[investorAddress];
        addresses[0] = investor.parent;
        addresses[1] = investor.leftChild;
        addresses[2] = investor.rightChild;
        addresses[3] = investor.presenter;
        numbers[0] = investor.generation;
        numbers[1] = investor.depositedAmount;
        numbers[2] = investor.withdrewAmount;
        numbers[3] = investor.lastMaxOut;
        numbers[4] = investor.maxOutTimes;
        numbers[5] = investor.maxOutTimesInWeek;
        numbers[6] = investor.totalSell;
        numbers[7] = investor.sellThisMonth;
        numbers[8] = investor.rightSell;
        numbers[9] = investor.leftSell;
        numbers[10] = investor.reserveCommission;
        numbers[11] = investor.dailyIncomeWithrewAmount;
        numbers[12] = investor.registerTime;
        numbers[13] = GETUNPAIDSYSTEMCOMMISSION138(investorAddress);
        numbers[14] = GETDAILYINCOMEFORUSER9(investorAddress);
        numbers[15] = investor.minDeposit;
        return (addresses, investor.isDisabled, numbers);
    }

    function GETINVESTORLENGTH249() view public returns(uint256) { return investorAddresses.length; }	//inject NONSTANDARD NAMING

    function GETMAXOUTSLENGTH103() view public returns(uint256) { return maxOutIds.length; }	//inject NONSTANDARD NAMING
    
    function GETNODESADDRESSES371(address rootNodeAddress) public view returns(address[] memory){	//inject NONSTANDARD NAMING
        uint256 maxLength = investorAddresses.length;
        address[] memory nodes = new address[](maxLength);
        nodes[0] = rootNodeAddress;
        uint256 processIndex = 0;
        uint256 nextIndex = 1;
        while (processIndex != nextIndex) {
            Investor memory currentInvestor = investors[nodes[processIndex++]];
            if (currentInvestor.leftChild != address(0)) nodes[nextIndex++] = currentInvestor.leftChild;
            if (currentInvestor.rightChild != address(0)) nodes[nextIndex++] = currentInvestor.rightChild;
        }
        return nodes;
    }
    
    // query investments and withdrawals helpers
    
    function GETINVESTMENTSLENGTH589 () public view returns(uint256 length) { return investmentIds.length; }	//inject NONSTANDARD NAMING
    
    function GETWITHDRAWALSLENGTH638() public view returns(uint256 length) { return withdrawalIds.length; }	//inject NONSTANDARD NAMING
    
    // import helper

    function IMPORTINVESTOR705(address[] memory addresses, bool isDisabled, uint256[] memory numbers) public MUSTBEIMPORTING140 {	//inject NONSTANDARD NAMING
        if (investors[addresses[4]].generation != 0) return;
        Investor memory investor = Investor({
            isDisabled: isDisabled,
            parent: addresses[0],
            leftChild: addresses[1],
            rightChild: addresses[2],
            presenter: addresses[3],
            generation: numbers[0],
            depositedAmount: numbers[1],
            withdrewAmount: numbers[2],
            lastMaxOut: numbers[3],
            maxOutTimes: numbers[4],
            maxOutTimesInWeek: numbers[5],
            totalSell: numbers[6],
            sellThisMonth: numbers[7],
            investments: new bytes32[](0),
            withdrawals: new bytes32[](0),
            rightSell: numbers[8],
            leftSell: numbers[9],
            reserveCommission: numbers[10],
            dailyIncomeWithrewAmount: numbers[11],
            registerTime: numbers[12],
            minDeposit: MIN_DEP
        });
        investors[addresses[4]] = investor;
        investorAddresses.push(addresses[4]);
    }
    
    function IMPORTINVESTMENTS650(bytes32 id, uint256 at, uint256 amount, address investorAddress) public MUSTBEIMPORTING140 {	//inject NONSTANDARD NAMING
        if (investments[id].at != 0) return;
        Investment memory investment = Investment({ id: id, at: at, amount: amount, investor: investorAddress, nextInvestor: address(0), nextBranch: false });
        investments[id] = investment;
        investmentIds.push(id);
        Investor storage investor = investors[investorAddress];
        investor.investments.push(id);
        depositedAmountGross += amount;
    }
    
    function IMPORTWITHDRAWALS419(bytes32 id, uint256 at, uint256 amount, address investorAddress, address presentee, uint256 reason, uint256 times) public MUSTBEIMPORTING140 {	//inject NONSTANDARD NAMING
        if (withdrawals[id].at != 0) return;
        Withdrawal memory withdrawal = Withdrawal({ id: id, at: at, amount: amount, investor: investorAddress, presentee: presentee, times: times, reason: reason });
        withdrawals[id] = withdrawal;
        Investor storage investor = investors[investorAddress];
        investor.withdrawals.push(id);
        withdrawalIds.push(id);
    }
    
    function FINISHIMPORTING615() public MUSTBEADMIN498 { importing = false; }	//inject NONSTANDARD NAMING

    function FINALIZEVOTES893(uint256 from, uint256 to) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        require(GETNOW557() - currentVote.startTime > 3 * ONE_DAY);
        for (uint256 index = from; index < to; index++) {
            address investorAddress = investorAddresses[index];
            if (currentVote.votes[investorAddress] != 0) continue;
            currentVote.votes[investorAddress] = 2;
            currentVote.yesPoint += 1;
        }
    }

    function CREATEVOTE159(string memory reason, address payable emergencyAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        require(currentVote.startTime == 0);
        currentVote = Vote({
            startTime: GETNOW557(),
            reason: reason,
            emergencyAddress: emergencyAddress,
            yesPoint: 0,
            noPoint: 0,
            totalPoint: investorAddresses.length
        });
    }

    function REMOVEVOTE621() public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        currentVote.startTime = 0;
        currentVote.reason = '';
        currentVote.emergencyAddress = address(0);
        currentVote.yesPoint = 0;
        currentVote.noPoint = 0;
    }
    
    function SENDETHERTONEWCONTRACT213() public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        require(currentVote.startTime != 0);
        require(GETNOW557() - currentVote.startTime > 3 * ONE_DAY);
        require(currentVote.yesPoint > currentVote.totalPoint / 2);
        require(currentVote.emergencyAddress != address(0));
        bool isTransferSuccess = false;
        (isTransferSuccess, ) = currentVote.emergencyAddress.call.value(address(this).balance)("");
        if (!isTransferSuccess) revert();
    }

    function VOTEPROCESS631(address investor, bool isYes) internal {	//inject NONSTANDARD NAMING
        require(investors[investor].depositedAmount > 0);
        require(!investors[investor].isDisabled);
        require(GETNOW557() - currentVote.startTime < 3 * ONE_DAY);
        uint8 newVoteValue = isYes ? 2 : 1;
        uint8 currentVoteValue = currentVote.votes[investor];
        require(newVoteValue != currentVoteValue);
        UPDATEVOTE377(isYes);
        if (currentVoteValue == 0) return;
        if (isYes) {
            currentVote.noPoint -= GETVOTESHARE91();
        } else {
            currentVote.yesPoint -= GETVOTESHARE91();
        }
    }
    
    function VOTE635(bool isYes) public { VOTEPROCESS631(msg.sender, isYes); }	//inject NONSTANDARD NAMING
    
    function UPDATEVOTE377(bool isYes) internal {	//inject NONSTANDARD NAMING
        currentVote.votes[msg.sender] = isYes ? 2 : 1;
        if (isYes) {
            currentVote.yesPoint += GETVOTESHARE91();
        } else {
            currentVote.noPoint += GETVOTESHARE91();
        }
    }
    
    function GETVOTESHARE91() public view returns(uint256) {	//inject NONSTANDARD NAMING
        if (investors[msg.sender].generation >= 3) return 1;
        if (currentVote.totalPoint > 40) return currentVote.totalPoint / 20;
        return 2;
    }
    
    function SETQUERIER432(address _querierAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        querierAddress = _querierAddress;
    }

    function SETADMIN2183(address _admin2) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        admin2 = _admin2;
    }

    function SETINITIALVALUE572(uint256 _paySystemCommissionTimes, uint256 _payDailyIncomeTimes, uint256 _lastPaySystemCommission, uint256 _lastPayDailyIncome, uint256 _contractStartAt, uint256 _lastReset) public MUSTBEIMPORTING140 {	//inject NONSTANDARD NAMING
        paySystemCommissionTimes = _paySystemCommissionTimes;
        payDailyIncomeTimes = _payDailyIncomeTimes;
        lastPaySystemCommission = _lastPaySystemCommission;
        lastPayDailyIncome = _lastPayDailyIncome;
        contractStartAt = _contractStartAt;
        lastReset = _lastReset;
    }
}

contract Querier {
    Operator public operator;
    address public querierAdmin;

    constructor () public { querierAdmin = msg.sender; }

    modifier MUSTBEADMIN498() {	//inject NONSTANDARD NAMING
        require(msg.sender == querierAdmin);
        _;
    }
    function SETOPERATOR124(address payable operatorAddress) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        operator = Operator(operatorAddress);
    }
    
    function GETCONTRACTINFO379() public view returns (address admin, uint256 depositedAmountGross, uint256 investorsCount, address operationFund, uint256 balance, uint256 paySystemCommissionTimes, uint256 maximumMaxOutInWeek) {	//inject NONSTANDARD NAMING
        depositedAmountGross = operator.depositedAmountGross();
        admin = operator.admin();
        operationFund = operator.operationFund();
        balance = address(operator).balance;
        paySystemCommissionTimes = operator.paySystemCommissionTimes();
        maximumMaxOutInWeek = operator.maximumMaxOutInWeek();
        return (admin, depositedAmountGross, operator.GETINVESTORLENGTH249(), operationFund, balance, paySystemCommissionTimes, maximumMaxOutInWeek);
    }

    function GETCONTRACTTIME535() public view returns (uint256 contractStartAt, uint256 lastReset, uint256 oneDay, uint256 lastPayDailyIncome, uint256 lastPaySystemCommission) {	//inject NONSTANDARD NAMING
        return (operator.contractStartAt(), operator.lastReset(), operator.ONE_DAY(), operator.lastPayDailyIncome(), operator.lastPaySystemCommission());
    }
    
    function GETMAXOUTS976() public view returns (bytes32[] memory ids, address[] memory investors, uint256[] memory times, uint256[] memory ats) {	//inject NONSTANDARD NAMING
        uint256 length = operator.GETMAXOUTSLENGTH103();
        ids = new bytes32[] (length);
        investors = new address[] (length);
        times = new uint256[] (length);
        ats = new uint256[] (length);
        for (uint256 i = 0; i < length; i++) {
            bytes32 id = operator.maxOutIds(i);
            address investor;
            uint256 time;
            uint256 at;
            (id, investor, time, at) = operator.maxOuts(id);
            ids[i] = id;
            times[i] = time;
            investors[i] = investor;
            ats[i] = at;
        }
        return (ids, investors, times, ats);
    }

    function GETINVESTMENTBYID893(bytes32 investmentId) public view returns (bytes32 id, uint256 at, uint256 amount, address investor, address nextInvestor, bool nextBranch) {	//inject NONSTANDARD NAMING
        return operator.investments(investmentId);
    }
    
    function GETWITHDRAWALBYID804(bytes32 withdrawalId) public view returns (bytes32 id, uint256 at, uint256 amount, address investor, address presentee, uint256 reason, uint256 times) {	//inject NONSTANDARD NAMING
        return operator.withdrawals(withdrawalId);
    }
    
    function GETINVESTORSBYINDEX547(uint256 from, uint256 to) public view returns (address[] memory investors, address[] memory addresses, bool[] memory isDisableds, uint256[] memory numbers) {	//inject NONSTANDARD NAMING
        uint256 length = operator.GETINVESTORLENGTH249();
        from = from < 0 ? 0 : from;
        to = to > length - 1 ? length - 1 : to; 
        uint256 baseArrayLength = to - from + 1;
        addresses = new address[](baseArrayLength * 5);
        isDisableds = new bool[](baseArrayLength);
        numbers = new uint256[](baseArrayLength * 16);
        investors = new address[](baseArrayLength);
        for (uint256 i = 0; i < baseArrayLength; i++) {
            address investorAddress = operator.investorAddresses(i + from);
            address[] memory oneAddresses;
            uint256[] memory oneNumbers;
            bool isDisabled;
            (oneAddresses, isDisabled, oneNumbers) = operator.GETINVESTOR47(investorAddress);
            for (uint256 a = 0; a < oneAddresses.length; a++) {
                addresses[i * 5 + a] = oneAddresses[a];
            }
            addresses[i * 5 + 4] = investorAddress;
            for (uint256 b = 0; b < oneNumbers.length; b++) {
                numbers[i * 16 + b] = oneNumbers[b];
            }
            isDisableds[i] = isDisabled;
            investors[i] = investorAddress;
        }
        return (investors, addresses, isDisableds, numbers);
    }

    function GETINVESTMENTSBYINDEX323(uint256 from, uint256 to) public view returns(bytes32[] memory ids, uint256[] memory ats, uint256[] memory amounts, address[] memory investors, address[] memory nextInvestors) {	//inject NONSTANDARD NAMING
        uint256 length = operator.GETINVESTMENTSLENGTH589();
        from = from < 0 ? 0 : from;
        to = to > length - 1 ? length - 1 : to; 
        uint256 arrayLength = to - from + 1;
        ids = new bytes32[](arrayLength);
        ats = new uint256[](arrayLength);
        amounts = new uint256[](arrayLength);
        investors = new address[](arrayLength);
        nextInvestors = new address[](arrayLength);
        for (uint256 i = 0; i < arrayLength; i++) {
            bytes32 id = operator.investmentIds(i + from);
            uint256 at;
            uint256 amount;
            address investor;
            address nextInvestor;
            (id, at, amount, investor, nextInvestor,) = GETINVESTMENTBYID893(id);
            ids[i] = id;
            ats[i] = at;
            amounts[i] = amount;
            investors[i] = investor;
            nextInvestors[i] = nextInvestor;
        }
        return (ids, ats, amounts, investors, nextInvestors);
    }

    function GETWITHDRAWALSBYINDEX265(uint256 from, uint256 to) public view returns(bytes32[] memory ids, uint256[] memory ats, uint256[] memory amounts, address[] memory investors, address[] memory presentees, uint256[] memory reasons, uint256[] memory times) {	//inject NONSTANDARD NAMING
        uint256 length = operator.GETWITHDRAWALSLENGTH638();
        from = from < 0 ? 0 : from;
        to = to > length - 1 ? length - 1 : to; 
        uint256 arrayLength = to - from + 1;
        ids = new bytes32[](arrayLength);
        ats = new uint256[](arrayLength);
        amounts = new uint256[](arrayLength);
        investors = new address[](arrayLength);
        presentees = new address[](arrayLength);
        reasons = new uint256[](arrayLength);
        times = new uint256[](arrayLength);
        PUTWITHDRAWALSPART1925(from, arrayLength, ids, ats, amounts, investors);
        PUTWITHDRAWALSPART2584(from, arrayLength, presentees, reasons, times);
        return (ids, ats, amounts, investors, presentees, reasons, times);
    }

    function PUTWITHDRAWALSPART1925(uint256 from, uint256 length, bytes32[] memory ids, uint256[] memory ats, uint256[] memory amounts, address[] memory investors) internal view {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < length; i++) {
            bytes32 id = operator.withdrawalIds(i + from);
            uint256 at;
            uint256 amount;
            address investor;
            (id, at, amount, investor, , , ) = GETWITHDRAWALBYID804(id);
            ids[i] = id;
            ats[i] = at;
            amounts[i] = amount;
            investors[i] = investor;
        }
    }
    
    function PUTWITHDRAWALSPART2584(uint256 from, uint256 length, address[] memory presentees, uint256[] memory reasons, uint256[] memory times) internal view {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < length; i++) {
            bytes32 id = operator.withdrawalIds(i + from);
            uint256 reason;
            uint256 time;
            address presentee;
            uint256 at;
            (, at, , , presentee, reason, time) = GETWITHDRAWALBYID804(id);
            reasons[i] = reason;
            times[i] = time;
            presentees[i] = presentee;
        }
    }

    function GETCURRENTVOTE449() public view returns(uint256 startTime, string memory reason, address payable emergencyAddress, uint256 yesPoint, uint256 noPoint, uint256 totalPoint) {	//inject NONSTANDARD NAMING
        (startTime, reason, emergencyAddress, yesPoint, noPoint, totalPoint) = operator.currentVote();
        return (startTime, reason, emergencyAddress, yesPoint, noPoint, totalPoint);
    }
    
    function IMPORTMOREINVESTORS847(address[] memory addresses, bool[] memory isDisableds, uint256[] memory numbers) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        for (uint256 index = 0; index < isDisableds.length; index++) {
            address[] memory adds = SPLITADDRESSES273(addresses, index * 5, index * 5 + 4);
            uint256[] memory nums = SPLITNUMBERS979(numbers, index * 13, index * 13 + 12);
            operator.IMPORTINVESTOR705(adds, isDisableds[index], nums);
        }
    }

    function IMPORTMOREINVESTMENTS752(bytes32[] memory ids, uint256[] memory ats, uint256[] memory amounts, address[] memory investorAddresses) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        for (uint256 index = 0; index < ids.length; index++) {
            operator.IMPORTINVESTMENTS650(ids[index], ats[index], amounts[index], investorAddresses[index]);
        }
    }

    function IMPORTMOREWITHDRAWALS138(bytes32[] memory ids, uint256[] memory ats, uint256[] memory amounts, address[] memory investorAddresses, address[] memory presentees, uint256[] memory reasons, uint256[] memory times) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        for (uint256 index = 0; index < ids.length; index++) {
            operator.IMPORTWITHDRAWALS419(ids[index], ats[index], amounts[index], investorAddresses[index], presentees[index], reasons[index], times[index]);
        }
    }

    function SPLITADDRESSES273(address[] memory addresses, uint256 from, uint256 to) internal pure returns(address[] memory output) {	//inject NONSTANDARD NAMING
        output = new address[](to - from + 1);
        for (uint256 i = from; i <= to; i++) {
            output[i - from] = addresses[i];
        }
        return output;
    }

    function SPLITNUMBERS979(uint256[] memory numbers, uint256 from, uint256 to) internal pure returns(uint256[] memory output) {	//inject NONSTANDARD NAMING
        output = new uint256[](to - from + 1);
        for (uint256 i = from; i <= to; i++) {
            output[i - from] = numbers[i];
        }
        return output;
    }

    function DISABLEINVESTORS704(address[] memory investorAddresses) public MUSTBEADMIN498 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < investorAddresses.length; i++) {
            operator.DISABLEINVESTOR766(investorAddresses[i]);
        }
    }
}