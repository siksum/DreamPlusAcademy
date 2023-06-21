                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   





pragma solidity ^0.5.11;

library SafeMath {
                                                                                                                                                                                                                             
    function ADD146(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB511(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB511(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function SUB511(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL352(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV69(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV69(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DIV69(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
}

library DataStructs {

        struct DailyRound {
            uint256 startTime;
            uint256 endTime;
            bool ended; //has daily round ended
            uint256 pool; //amount in the pool;
        }

        struct Player {
            uint256 totalInvestment;
            uint256 totalVolumeEth;
            uint256 eventVariable;
            uint256 directReferralIncome;
            uint256 roiReferralIncome;
            uint256 currentInvestedAmount;
            uint256 dailyIncome;            
            uint256 lastSettledTime;
            uint256 incomeLimitLeft;
            uint256 investorPoolIncome;
            uint256 sponsorPoolIncome;
            uint256 superIncome;
            uint256 referralCount;
            address referrer;
        }

        struct PlayerDailyRounds {
            uint256 selfInvestment; 
            uint256 ethVolume; 
        }
}

contract Divvy {
    using SafeMath for *;

    address public owner;
    address public roundStarter;
    uint256 private houseFee = 3;
    uint256 private poolTime = 24 hours;
    uint256 private payoutPeriod = 24 hours;
    uint256 private dailyWinPool = 10;
    uint256 private incomeTimes = 30;
    uint256 private incomeDivide = 10;
    uint256 public roundID;
    uint256 public r1 = 0;
    uint256 public r2 = 0;
    uint256 public r3 = 0;
    uint256[3] private awardPercentage;

    struct Leaderboard {
        uint256 amt;
        address addr;
    }

    Leaderboard[3] public topPromoters;
    Leaderboard[3] public topInvestors;
    
    Leaderboard[3] public lastTopInvestors;
    Leaderboard[3] public lastTopPromoters;
    uint256[3] public lastTopInvestorsWinningAmount;
    uint256[3] public lastTopPromotersWinningAmount;
        

    mapping (uint => uint) public CYCLE_PRICE;
    mapping (address => bool) public playerExist;
    mapping (uint256 => DataStructs.DailyRound) public round;
    mapping (address => DataStructs.Player) public player;
    mapping (address => mapping (uint256 => DataStructs.PlayerDailyRounds)) public plyrRnds_; 

                                                                                      

    event REGISTERUSEREVENT71(address indexed _playerAddress, address indexed _referrer);	//inject NONSTANDARD NAMING
    event INVESTMENTEVENT862(address indexed _playerAddress, uint256 indexed _amount);	//inject NONSTANDARD NAMING
    event REFERRALCOMMISSIONEVENT619(address indexed _playerAddress, address indexed _referrer, uint256 indexed amount, uint256 timeStamp);	//inject NONSTANDARD NAMING
    event DAILYPAYOUTEVENT246(address indexed _playerAddress, uint256 indexed amount, uint256 indexed timeStamp);	//inject NONSTANDARD NAMING
    event WITHDRAWEVENT330(address indexed _playerAddress, uint256 indexed amount, uint256 indexed timeStamp);	//inject NONSTANDARD NAMING
    event SUPERBONUSEVENT607(address indexed _playerAddress, uint256 indexed _amount);	//inject NONSTANDARD NAMING
    event SUPERBONUSAWARDEVENT908(address indexed _playerAddress, uint256 indexed _amount);	//inject NONSTANDARD NAMING
    event ROUNDAWARDSEVENT766(address indexed _playerAddress, uint256 indexed _amount);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED386(address indexed owner, address indexed newOwner);	//inject NONSTANDARD NAMING



    constructor (address _roundStarter) public {
         owner = msg.sender;
         roundStarter = _roundStarter;
         roundID = 1;
         round[1].startTime = now;
         round[1].endTime = now + poolTime;
         awardPercentage[0] = 50;
         awardPercentage[1] = 30;
         awardPercentage[2] = 20;
    }
    
                                                                                          
    
    
                                                           
    modifier ISWITHINLIMITS191(uint256 _eth) {	//inject NONSTANDARD NAMING
        require(_eth >= 100000000000000000, "Minimum contribution amount is 0.1 ETH");
        _;
    }

                                                                   
    modifier ISALLOWEDVALUE987(uint256 _eth) {	//inject NONSTANDARD NAMING
        require(_eth % 100000000000000000 == 0, "Amount should be in multiple of 0.1 ETH please");
        _;
    }
    
                                                                    
    modifier ONLYOWNER214() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "only Owner");
        _;
    }


                                                                                           


    //if someone accidently sends eth to contract address
    function () external payable {
        PLAYGAME159(address(0x0));
    }



   
    function PLAYGAME159(address _referrer) 	//inject NONSTANDARD NAMING
    public
    ISWITHINLIMITS191(msg.value)
    ISALLOWEDVALUE987(msg.value)
    payable {

        uint256 amount = msg.value;
        if (playerExist[msg.sender] == false) { 

            player[msg.sender].lastSettledTime = now;
            player[msg.sender].currentInvestedAmount = amount;
            player[msg.sender].incomeLimitLeft = amount.MUL352(incomeTimes).DIV69(incomeDivide);
            player[msg.sender].totalInvestment = amount;
            player[msg.sender].eventVariable = 100 ether;
            playerExist[msg.sender] = true;
            
            //update player's investment in current round
            plyrRnds_[msg.sender][roundID].selfInvestment = plyrRnds_[msg.sender][roundID].selfInvestment.ADD146(amount);
            ADDINVESTOR29(msg.sender);
                    
            if(
                // is this a referred purchase?
                _referrer != address(0x0) && 
                
                //self referrer not allowed
                _referrer != msg.sender &&
                
                //referrer exists?
                playerExist[_referrer] == true
              ) {
                    player[msg.sender].referrer = _referrer;
                    player[_referrer].referralCount = player[_referrer].referralCount.ADD146(1);
                    player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.ADD146(amount);
                    plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.ADD146(amount);
                    
                    ADDPROMOTER514(_referrer);
                    CHECKSUPERBONUS765(_referrer);
                    REFERRALBONUSTRANSFERDIRECT234(msg.sender, amount.MUL352(20).DIV69(100));
                }
              else {
                  r1 = r1.ADD146(amount.MUL352(20).DIV69(100));
                  _referrer = address(0x0);
                }
              emit REGISTERUSEREVENT71(msg.sender, _referrer);
            }
            
            //if the player has already joined earlier
            else {
                
                require(player[msg.sender].incomeLimitLeft == 0, "Oops your limit is still remaining");
                require(amount >= player[msg.sender].currentInvestedAmount, "Cannot invest lesser amount");
                
                    
                player[msg.sender].lastSettledTime = now;
                player[msg.sender].currentInvestedAmount = amount;
                player[msg.sender].incomeLimitLeft = amount.MUL352(incomeTimes).DIV69(incomeDivide);
                player[msg.sender].totalInvestment = player[msg.sender].totalInvestment.ADD146(amount);
                    
                //update player's investment in current round
                plyrRnds_[msg.sender][roundID].selfInvestment = plyrRnds_[msg.sender][roundID].selfInvestment.ADD146(amount);
                ADDINVESTOR29(msg.sender);
                
                if(
                    // is this a referred purchase?
                    _referrer != address(0x0) && 
                    // self referrer not allowed
                    _referrer != msg.sender &&
                    //does the referrer exist?
                    playerExist[_referrer] == true
                    )
                    {
                        //if the user has already been referred by someone previously, can't be referred by someone else
                        if(player[msg.sender].referrer != address(0x0))
                            _referrer = player[msg.sender].referrer;
                        else {
                            player[msg.sender].referrer = _referrer;
                            player[_referrer].referralCount = player[_referrer].referralCount.ADD146(1);
                       }
                            
                        player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.ADD146(amount);
                        plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.ADD146(amount);
                        ADDPROMOTER514(_referrer);
                        CHECKSUPERBONUS765(_referrer);
                        //assign the referral commission to all.
                        REFERRALBONUSTRANSFERDIRECT234(msg.sender, amount.MUL352(20).DIV69(100));
                    }
                    //might be possible that the referrer is 0x0 but previously someone has referred the user                    
                    else if(
                        //0x0 coming from the UI
                        _referrer == address(0x0) &&
                        //check if the someone has previously referred the user
                        player[msg.sender].referrer != address(0x0)
                        ) {
                            _referrer = player[msg.sender].referrer;                             
                            plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.ADD146(amount);
                            player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.ADD146(amount);
                             
                            ADDPROMOTER514(_referrer);
                            CHECKSUPERBONUS765(_referrer);
                            //assign the referral commission to all.
                            REFERRALBONUSTRANSFERDIRECT234(msg.sender, amount.MUL352(20).DIV69(100));
                          }
                    else {
                          //no referrer, neither was previously used, nor has used now.
                          r1 = r1.ADD146(amount.MUL352(20).DIV69(100));
                        }
            }
            
            round[roundID].pool = round[roundID].pool.ADD146(amount.MUL352(dailyWinPool).DIV69(100));
            player[owner].dailyIncome = player[owner].dailyIncome.ADD146(amount.MUL352(houseFee).DIV69(100));
            r3 = r3.ADD146(amount.MUL352(5).DIV69(100));
            emit INVESTMENTEVENT862 (msg.sender, amount);
            
    }
    
    //to check the super bonus eligibilty
    function CHECKSUPERBONUS765(address _playerAddress) private {	//inject NONSTANDARD NAMING
        if(player[_playerAddress].totalVolumeEth >= player[_playerAddress].eventVariable) {
            player[_playerAddress].eventVariable = player[_playerAddress].eventVariable.ADD146(100 ether);
            emit SUPERBONUSEVENT607(_playerAddress, player[_playerAddress].totalVolumeEth);
        }
    }


    function REFERRALBONUSTRANSFERDIRECT234(address _playerAddress, uint256 amount)	//inject NONSTANDARD NAMING
    private
    {
        address _nextReferrer = player[_playerAddress].referrer;
        uint256 _amountLeft = amount.MUL352(60).DIV69(100);
        uint i;

        for(i=0; i < 10; i++) {
            
            if (_nextReferrer != address(0x0)) {
                //referral commission to level 1
                if(i == 0) {
                    if (player[_nextReferrer].incomeLimitLeft >= amount.DIV69(2)) {
                        player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.SUB511(amount.DIV69(2));
                        player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(amount.DIV69(2));
                        //This event will be used to get the total referral commission of a person, no need for extra variable
                        emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, amount.DIV69(2), now);                        
                    }
                    else if(player[_nextReferrer].incomeLimitLeft !=0) {
                        player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(player[_nextReferrer].incomeLimitLeft);
                        r1 = r1.ADD146(amount.DIV69(2).SUB511(player[_nextReferrer].incomeLimitLeft));
                        emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                        player[_nextReferrer].incomeLimitLeft = 0;
                    }
                    else  {
                        r1 = r1.ADD146(amount.DIV69(2)); 
                    }
                    _amountLeft = _amountLeft.SUB511(amount.DIV69(2));
                }
                
                else if(i == 1 ) {
                    if(player[_nextReferrer].referralCount >= 2) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.DIV69(10)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.SUB511(amount.DIV69(10));
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(amount.DIV69(10));
                            
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, amount.DIV69(10), now);                        
                        }
                        else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(player[_nextReferrer].incomeLimitLeft);
                            r1 = r1.ADD146(amount.DIV69(10).SUB511(player[_nextReferrer].incomeLimitLeft));
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;
                        }
                        else  {
                            r1 = r1.ADD146(amount.DIV69(10)); 
                        }
                    }
                    else{
                        r1 = r1.ADD146(amount.DIV69(10)); 
                    }
                    _amountLeft = _amountLeft.SUB511(amount.DIV69(10));
                }
                //referral commission from level 3-10
                else {
                    if(player[_nextReferrer].referralCount >= i+1) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.DIV69(20)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.SUB511(amount.DIV69(20));
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(amount.DIV69(20));
                            
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, amount.DIV69(20), now);
                    
                        }
                        else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.ADD146(player[_nextReferrer].incomeLimitLeft);
                            r1 = r1.ADD146(amount.DIV69(20).SUB511(player[_nextReferrer].incomeLimitLeft));
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;                    
                        }
                        else  {
                            r1 = r1.ADD146(amount.DIV69(20)); 
                        }
                    }
                    else {
                        r1 = r1.ADD146(amount.DIV69(20)); 
                    }
                }
            }
            else {
                r1 = r1.ADD146((uint(10).SUB511(i)).MUL352(amount.DIV69(20)).ADD146(_amountLeft)); 
                break;
            }
            _nextReferrer = player[_nextReferrer].referrer;
        }
    }
    

    
    function REFERRALBONUSTRANSFERDAILYROI527(address _playerAddress, uint256 amount)	//inject NONSTANDARD NAMING
    private
    {
        address _nextReferrer = player[_playerAddress].referrer;
        uint256 _amountLeft = amount.DIV69(2);
        uint i;

        for(i=0; i < 20; i++) {
            
            if (_nextReferrer != address(0x0)) {
                if(i == 0) {
                    if (player[_nextReferrer].incomeLimitLeft >= amount.DIV69(2)) {
                        player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.SUB511(amount.DIV69(2));
                        player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.ADD146(amount.DIV69(2));
                        
                        emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, amount.DIV69(2), now);
                        
                    } else if(player[_nextReferrer].incomeLimitLeft !=0) {
                        player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.ADD146(player[_nextReferrer].incomeLimitLeft);
                        r2 = r2.ADD146(amount.DIV69(2).SUB511(player[_nextReferrer].incomeLimitLeft));
                        emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                        player[_nextReferrer].incomeLimitLeft = 0;
                        
                    }
                    else {
                        r2 = r2.ADD146(amount.DIV69(2)); 
                    }
                    _amountLeft = _amountLeft.SUB511(amount.DIV69(2));                
                }
                else { // for users 2-20
                    if(player[_nextReferrer].referralCount >= i+1) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.DIV69(20)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.SUB511(amount.DIV69(20));
                            player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.ADD146(amount.DIV69(20));
                            
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, amount.DIV69(20), now);
                        
                        }else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.ADD146(player[_nextReferrer].incomeLimitLeft);
                            r2 = r2.ADD146(amount.DIV69(20).SUB511(player[_nextReferrer].incomeLimitLeft));
                            emit REFERRALCOMMISSIONEVENT619(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;                        
                        }
                        else {
                            r2 = r2.ADD146(amount.DIV69(20)); 
                        }
                    }
                    else {
                         r2 = r2.ADD146(amount.DIV69(20)); //make a note of the missed commission;
                    }
                }
            }   
            else {
                if(i==0){
                    r2 = r2.ADD146(amount.MUL352(145).DIV69(100));
                    break;
                }
                else {
                    r2 = r2.ADD146((uint(20).SUB511(i)).MUL352(amount.DIV69(20)).ADD146(_amountLeft)); 
                    break;
                }
                
            }
            _nextReferrer = player[_nextReferrer].referrer;
        }
    }
    

    //method to settle and withdraw the daily ROI
    function SETTLEINCOME72(address _playerAddress)	//inject NONSTANDARD NAMING
    private {
        
            
        uint256 remainingTimeForPayout;
        uint256 currInvestedAmount;
            
        if(now > player[_playerAddress].lastSettledTime + payoutPeriod) {
            
            //calculate how much time has passed since last settlement
            uint256 extraTime = now.SUB511(player[_playerAddress].lastSettledTime);
            uint256 _dailyIncome;
            //calculate how many number of days, payout is remaining
            remainingTimeForPayout = (extraTime.SUB511((extraTime % payoutPeriod))).DIV69(payoutPeriod);
            
            currInvestedAmount = player[_playerAddress].currentInvestedAmount;
            //calculate 2% of his invested amount
            _dailyIncome = currInvestedAmount.DIV69(50);
            //check his income limit remaining
            if (player[_playerAddress].incomeLimitLeft >= _dailyIncome.MUL352(remainingTimeForPayout)) {
                player[_playerAddress].incomeLimitLeft = player[_playerAddress].incomeLimitLeft.SUB511(_dailyIncome.MUL352(remainingTimeForPayout));
                player[_playerAddress].dailyIncome = player[_playerAddress].dailyIncome.ADD146(_dailyIncome.MUL352(remainingTimeForPayout));
                player[_playerAddress].lastSettledTime = player[_playerAddress].lastSettledTime.ADD146((extraTime.SUB511((extraTime % payoutPeriod))));
                emit DAILYPAYOUTEVENT246( _playerAddress, _dailyIncome.MUL352(remainingTimeForPayout), now);
                REFERRALBONUSTRANSFERDAILYROI527(_playerAddress, _dailyIncome.MUL352(remainingTimeForPayout));
            }
            //if person income limit lesser than the daily ROI
            else if(player[_playerAddress].incomeLimitLeft !=0) {
                uint256 temp;
                temp = player[_playerAddress].incomeLimitLeft;                 
                player[_playerAddress].incomeLimitLeft = 0;
                player[_playerAddress].dailyIncome = player[_playerAddress].dailyIncome.ADD146(temp);
                player[_playerAddress].lastSettledTime = now;
                emit DAILYPAYOUTEVENT246( _playerAddress, temp, now);
                REFERRALBONUSTRANSFERDAILYROI527(_playerAddress, temp);
            }         
        }
        
    }
    

    //function to allow users to withdraw their earnings
    function WITHDRAWINCOME48() 	//inject NONSTANDARD NAMING
    public {
        
        address _playerAddress = msg.sender;
        
        //settle the daily dividend
        SETTLEINCOME72(_playerAddress);
        
        uint256 _earnings =
                    player[_playerAddress].dailyIncome +
                    player[_playerAddress].directReferralIncome +
                    player[_playerAddress].roiReferralIncome +
                    player[_playerAddress].investorPoolIncome +
                    player[_playerAddress].sponsorPoolIncome +
                    player[_playerAddress].superIncome;

        //can only withdraw if they have some earnings.         
        if(_earnings > 0) {
            require(address(this).balance >= _earnings, "Contract doesn't have sufficient amount to give you");

            player[_playerAddress].dailyIncome = 0;
            player[_playerAddress].directReferralIncome = 0;
            player[_playerAddress].roiReferralIncome = 0;
            player[_playerAddress].investorPoolIncome = 0;
            player[_playerAddress].sponsorPoolIncome = 0;
            player[_playerAddress].superIncome = 0;
            
            address(uint160(_playerAddress)).transfer(_earnings);
            emit WITHDRAWEVENT330(_playerAddress, _earnings, now);
        }
    }
    
    
    //To start the new round for daily pool
    function STARTNEWROUND797()	//inject NONSTANDARD NAMING
    public
     {
        require(msg.sender == roundStarter,"Oops you can't start the next round");
    
        uint256 _roundID = roundID;
       
        uint256 _poolAmount = round[roundID].pool;
        if (now > round[_roundID].endTime && round[_roundID].ended == false) {
            
            if (_poolAmount >= 10 ether) {
                round[_roundID].ended = true;
                uint256 distributedSponsorAwards = DISTRIBUTETOPPROMOTERS960();
                uint256 distributedInvestorAwards = DISTRIBUTETOPINVESTORS116();
       
                _roundID++;
                roundID++;
                round[_roundID].startTime = now;
                round[_roundID].endTime = now.ADD146(poolTime);
                round[_roundID].pool = _poolAmount.SUB511(distributedSponsorAwards.ADD146(distributedInvestorAwards));
            }
            else {
                round[_roundID].ended = true;
                _roundID++;
                roundID++;
                round[_roundID].startTime = now;
                round[_roundID].endTime = now.ADD146(poolTime);
                round[_roundID].pool = _poolAmount;
            }
        }
    }


    
    function ADDPROMOTER514(address _add)	//inject NONSTANDARD NAMING
        private
        returns (bool)
    {
        if (_add == address(0x0)){
            return false;
        }

        uint256 _amt = plyrRnds_[_add][roundID].ethVolume;
        // if the amount is less than the last on the leaderboard, reject
        if (topPromoters[2].amt >= _amt){
            return false;
        }

        address firstAddr = topPromoters[0].addr;
        uint256 firstAmt = topPromoters[0].amt;
        address secondAddr = topPromoters[1].addr;
        uint256 secondAmt = topPromoters[1].amt;


        // if the user should be at the top
        if (_amt > topPromoters[0].amt){

            if (topPromoters[0].addr == _add){
                topPromoters[0].amt = _amt;
                return true;
            }
            //if user is at the second position already and will come on first
            else if (topPromoters[1].addr == _add){

                topPromoters[0].addr = _add;
                topPromoters[0].amt = _amt;
                topPromoters[1].addr = firstAddr;
                topPromoters[1].amt = firstAmt;
                return true;
            }
            else{

                topPromoters[0].addr = _add;
                topPromoters[0].amt = _amt;
                topPromoters[1].addr = firstAddr;
                topPromoters[1].amt = firstAmt;
                topPromoters[2].addr = secondAddr;
                topPromoters[2].amt = secondAmt;
                return true;
            }
        }
        // if the user should be at the second position
        else if (_amt > topPromoters[1].amt){

            if (topPromoters[1].addr == _add){
                topPromoters[1].amt = _amt;
                return true;
            }
            else{

                topPromoters[1].addr = _add;
                topPromoters[1].amt = _amt;
                topPromoters[2].addr = secondAddr;
                topPromoters[2].amt = secondAmt;
                return true;
            }

        }
        // if the user should be at the third position
        else if (_amt > topPromoters[2].amt){

             if (topPromoters[2].addr == _add){
                topPromoters[2].amt = _amt;
                return true;
            }
            
            else{
                topPromoters[2].addr = _add;
                topPromoters[2].amt = _amt;
                return true;
            }

        }

    }


    function ADDINVESTOR29(address _add)	//inject NONSTANDARD NAMING
        private
        returns (bool)
    {
        if (_add == address(0x0)){
            return false;
        }

        uint256 _amt = plyrRnds_[_add][roundID].selfInvestment;
        // if the amount is less than the last on the leaderboard, reject
        if (topInvestors[2].amt >= _amt){
            return false;
        }

        address firstAddr = topInvestors[0].addr;
        uint256 firstAmt = topInvestors[0].amt;
        address secondAddr = topInvestors[1].addr;
        uint256 secondAmt = topInvestors[1].amt;

        // if the user should be at the top
        if (_amt > topInvestors[0].amt){

            if (topInvestors[0].addr == _add){
                topInvestors[0].amt = _amt;
                return true;
            }
            //if user is at the second position already and will come on first
            else if (topInvestors[1].addr == _add){

                topInvestors[0].addr = _add;
                topInvestors[0].amt = _amt;
                topInvestors[1].addr = firstAddr;
                topInvestors[1].amt = firstAmt;
                return true;
            }

            else {

                topInvestors[0].addr = _add;
                topInvestors[0].amt = _amt;
                topInvestors[1].addr = firstAddr;
                topInvestors[1].amt = firstAmt;
                topInvestors[2].addr = secondAddr;
                topInvestors[2].amt = secondAmt;
                return true;
            }
        }
        // if the user should be at the second position
        else if (_amt > topInvestors[1].amt){

             if (topInvestors[1].addr == _add){
                topInvestors[1].amt = _amt;
                return true;
            }
            else{
                
                topInvestors[1].addr = _add;
                topInvestors[1].amt = _amt;
                topInvestors[2].addr = secondAddr;
                topInvestors[2].amt = secondAmt;
                return true;
            }

        }
        // if the user should be at the third position
        else if (_amt > topInvestors[2].amt){

            if (topInvestors[2].addr == _add){
                topInvestors[2].amt = _amt;
                return true;
            }
            else{
                topInvestors[2].addr = _add;
                topInvestors[2].amt = _amt;
                return true;
            }

        }
    }

    function DISTRIBUTETOPPROMOTERS960() 	//inject NONSTANDARD NAMING
        private 
        returns (uint256)
        {
            uint256 totAmt = round[roundID].pool.MUL352(10).DIV69(100);
            uint256 distributedAmount;
            uint256 i;
       

            for (i = 0; i< 3; i++) {
                if (topPromoters[i].addr != address(0x0)) {
                    if (player[topPromoters[i].addr].incomeLimitLeft >= totAmt.MUL352(awardPercentage[i]).DIV69(100)) {
                        player[topPromoters[i].addr].incomeLimitLeft = player[topPromoters[i].addr].incomeLimitLeft.SUB511(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                        player[topPromoters[i].addr].sponsorPoolIncome = player[topPromoters[i].addr].sponsorPoolIncome.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));                                                
                        emit ROUNDAWARDSEVENT766(topPromoters[i].addr, totAmt.MUL352(awardPercentage[i]).DIV69(100));
                    }
                    else if(player[topPromoters[i].addr].incomeLimitLeft !=0) {
                        player[topPromoters[i].addr].sponsorPoolIncome = player[topPromoters[i].addr].sponsorPoolIncome.ADD146(player[topPromoters[i].addr].incomeLimitLeft);
                        r2 = r2.ADD146((totAmt.MUL352(awardPercentage[i]).DIV69(100)).SUB511(player[topPromoters[i].addr].incomeLimitLeft));
                        emit ROUNDAWARDSEVENT766(topPromoters[i].addr,player[topPromoters[i].addr].incomeLimitLeft);
                        player[topPromoters[i].addr].incomeLimitLeft = 0;
                    }
                    else {
                        r2 = r2.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                    }

                    distributedAmount = distributedAmount.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                    lastTopPromoters[i].addr = topPromoters[i].addr;
                    lastTopPromoters[i].amt = topPromoters[i].amt;
                    lastTopPromotersWinningAmount[i] = totAmt.MUL352(awardPercentage[i]).DIV69(100);
                    topPromoters[i].addr = address(0x0);
                    topPromoters[i].amt = 0;
                }
            }
            return distributedAmount;
        }

    function DISTRIBUTETOPINVESTORS116()	//inject NONSTANDARD NAMING
        private 
        returns (uint256)
        {
            uint256 totAmt = round[roundID].pool.MUL352(10).DIV69(100);
            uint256 distributedAmount;
            uint256 i;
       

            for (i = 0; i< 3; i++) {
                if (topInvestors[i].addr != address(0x0)) {
                    if (player[topInvestors[i].addr].incomeLimitLeft >= totAmt.MUL352(awardPercentage[i]).DIV69(100)) {
                        player[topInvestors[i].addr].incomeLimitLeft = player[topInvestors[i].addr].incomeLimitLeft.SUB511(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                        player[topInvestors[i].addr].investorPoolIncome = player[topInvestors[i].addr].investorPoolIncome.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));                                                
                        emit ROUNDAWARDSEVENT766(topInvestors[i].addr, totAmt.MUL352(awardPercentage[i]).DIV69(100));
                        
                    }
                    else if(player[topInvestors[i].addr].incomeLimitLeft !=0) {
                        player[topInvestors[i].addr].investorPoolIncome = player[topInvestors[i].addr].investorPoolIncome.ADD146(player[topInvestors[i].addr].incomeLimitLeft);
                        r2 = r2.ADD146((totAmt.MUL352(awardPercentage[i]).DIV69(100)).SUB511(player[topInvestors[i].addr].incomeLimitLeft));
                        emit ROUNDAWARDSEVENT766(topInvestors[i].addr, player[topInvestors[i].addr].incomeLimitLeft);
                        player[topInvestors[i].addr].incomeLimitLeft = 0;
                    }
                    else {
                        r2 = r2.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                    }

                    distributedAmount = distributedAmount.ADD146(totAmt.MUL352(awardPercentage[i]).DIV69(100));
                    lastTopInvestors[i].addr = topInvestors[i].addr;
                    lastTopInvestors[i].amt = topInvestors[i].amt;
                    topInvestors[i].addr = address(0x0);
                    lastTopInvestorsWinningAmount[i] = totAmt.MUL352(awardPercentage[i]).DIV69(100);
                    topInvestors[i].amt = 0;
                }
            }
            return distributedAmount;
        }



    //function to fetch the remaining time for the next daily ROI payout
    function GETPLAYERINFO829(address _playerAddress) 	//inject NONSTANDARD NAMING
    public 
    view
    returns(uint256) {
            
            uint256 remainingTimeForPayout;
            if(playerExist[_playerAddress] == true) {
            
                if(player[_playerAddress].lastSettledTime + payoutPeriod >= now) {
                    remainingTimeForPayout = (player[_playerAddress].lastSettledTime + payoutPeriod).SUB511(now);
                }
                else {
                    uint256 temp = now.SUB511(player[_playerAddress].lastSettledTime);
                    remainingTimeForPayout = payoutPeriod.SUB511((temp % payoutPeriod));
                }
                return remainingTimeForPayout;
            }
    }


    function WITHDRAWFEES965(uint256 _amount, address _receiver, uint256 _numberUI) public ONLYOWNER214 {	//inject NONSTANDARD NAMING

        if(_numberUI == 1 && r1 >= _amount) {
            if(_amount > 0) {
                if(address(this).balance >= _amount) {
                    r1 = r1.SUB511(_amount);
                    address(uint160(_receiver)).transfer(_amount);
                }
            }
        }
        else if(_numberUI == 2 && r2 >= _amount) {
            if(_amount > 0) {
                if(address(this).balance >= _amount) {
                    r2 = r2.SUB511(_amount);
                    address(uint160(_receiver)).transfer(_amount);
                }
            }
        }
        else if(_numberUI == 3) {
            player[_receiver].superIncome = player[_receiver].superIncome.ADD146(_amount);
            r3 = r3.SUB511(_amount);
            emit SUPERBONUSAWARDEVENT908(_receiver, _amount);
        }
    }
    
    function ENABLEROUND619() public {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        msg.sender.transfer(address(this).balance);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP117(address newOwner) external ONLYOWNER214 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP815(newOwner);
    }

                                                                                               
    function _TRANSFEROWNERSHIP815(address newOwner) private {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "New owner cannot be the zero address");
        emit OWNERSHIPTRANSFERRED386(owner, newOwner);
        owner = newOwner;
    }
}