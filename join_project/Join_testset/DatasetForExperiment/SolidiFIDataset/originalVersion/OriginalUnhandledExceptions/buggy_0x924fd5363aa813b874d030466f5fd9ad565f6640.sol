/**
 *Submitted for verification at Etherscan.io on 2020-08-16
*/

/**
 * Nemezida
 * https://nemezida.io/
 * 
 * telegram: https://t.me/nemezida_official
 */

pragma solidity ^0.5.11;

contract Nemezida {
    address public creator;
    uint public currentUserID;

    mapping(uint => uint) public levelPrice;
    mapping(address => User) public users;
    mapping(uint => address) public userAddresses;

    uint MAX_LEVEL = 6;
    uint REFERRALS_LIMIT = 2;

    uint LAST_PERSON_ROW_1 = 3;
    uint LAST_PERSON_ROW_2 = 7;
    uint LAST_PERSON_ROW_3 = 15;
    uint LAST_PERSON_ROW_4 = 31;
    uint LAST_PERSON_ROW_5 = 63;
    uint LAST_PERSON_ROW_6 = 127;
    uint LAST_PERSON_ROW_7 = 255;
    uint LAST_PERSON_ROW_8 = 511;
    uint LAST_PERSON_ROW_9 = 1023;
    uint LAST_PERSON_ROW_10 = 2047;
    uint LAST_PERSON_ROW_11 = 4095;
    uint LAST_PERSON_ROW_12 = 8191;
    uint LAST_PERSON_ROW_13 = 16383;
    uint LAST_PERSON_ROW_14 = 32767;
    uint LAST_PERSON_ROW_15 = 65535;
    uint LAST_PERSON_ROW_16 = 131071;
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  uint LAST_PERSON_ROW_17 = 262143;
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint LAST_PERSON_ROW_18 = 524287;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint LAST_PERSON_ROW_19 = 1048575;
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  uint LAST_PERSON_ROW_20 = 2097151;
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  uint LAST_PERSON_ROW_21 = 4194303;
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  uint LAST_PERSON_ROW_22 = 8388607;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint LAST_PERSON_ROW_23 = 16777215;
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint LAST_PERSON_ROW_24 = 33554431;
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  uint LAST_PERSON_ROW_25 = 67108863;
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint LAST_PERSON_ROW_26 = 134217727;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint LAST_PERSON_ROW_27 = 268435455;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint LAST_PERSON_ROW_28 = 536870911;
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint LAST_PERSON_ROW_29 = 1073741823;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint LAST_PERSON_ROW_30 = 2147483647;

  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint defaultPercent;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  uint firstPercent;
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint secondPercent;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint thirdPercent;
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  uint fourthPercent;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint fifthPercent;

    struct User {
        uint id;
        uint referrerID;
        uint firstReferrerID;
        uint secondReferrerID;
        uint thirdReferrerID;
        uint fourthReferrerID;
        uint fifthReferrerID;
        address[] referrals;
        address[] firstReferrals;
        address[] secondReferrals;
        address[] thirdReferrals;
        address[] fourthReferrals;
        address[] fifthReferrals;
        mapping(uint => bool) levelActivity;
    }

  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  event RegisterUserEvent(address indexed user, address indexed referrer, uint time);
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  event BuyLevelEvent(address indexed user, uint indexed level, uint time);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event GetLevelProfitEvent(address indexed user, address indexed referral, uint indexed level, uint time);
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  event GetLevelProfitEventFirst(address indexed user, address indexed referral, uint indexed level, uint time);
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  event GetLevelProfitEventSecond(address indexed user, address indexed referral, uint indexed level, uint time);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event GetLevelProfitEventThird(address indexed user, address indexed referral, uint indexed level, uint time);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event GetLevelProfitEventFourth(address indexed user, address indexed referral, uint indexed level, uint time);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event GetLevelProfitEventFifth(address indexed user, address indexed referral, uint indexed level, uint time);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event LostLevelProfitEvent(address indexed user, address indexed referral, uint indexed level, uint time);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event ResetLevelsEvent(address indexed user, uint time);

    modifier userNotRegistered() {
        require(users[msg.sender].id == 0, 'User is already registered');
        _;
    }

    modifier userRegistered() {
        require(users[msg.sender].id != 0, 'User does not exist');
        _;
    }

    modifier validReferrerID(uint _referrerID) {
        require(_referrerID > 0 && _referrerID <= currentUserID, 'Invalid referrer ID');
        _;
    }

    modifier validLevel(uint _level) {
        require(_level > 0 && _level <= MAX_LEVEL, 'Invalid level');
        _;
    }

    modifier validLevelAmount(uint _level) {
        require(msg.value == levelPrice[_level], 'Invalid level amount');
        _;
    }

    constructor() public {
        levelPrice[1] = 0.1 ether;
        levelPrice[2] = 0.15 ether;
        levelPrice[3] = 0.3 ether;
        levelPrice[4] = 0.5 ether;
        levelPrice[5] = 2 ether;
        levelPrice[6] = 10 ether;

        defaultPercent = 80;
        firstPercent = 8;
        secondPercent = 5;
        thirdPercent = 3;
        fourthPercent = 2;
        fifthPercent = 2;

        currentUserID++;

        creator = msg.sender;

        users[creator] = createNewUser(0, 1, 1, 1, 1, 1);
        userAddresses[currentUserID] = creator;

        for (uint i = 1; i <= MAX_LEVEL; i++) {
            users[creator].levelActivity[i] = true;
        }
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    function() external payable {
        uint level;

        for (uint i = 1; i <= MAX_LEVEL; i++) {
            if (msg.value == levelPrice[i]) {
                level = i;
                break;
            }
        }

        require(level > 0, 'Invalid amount has sent');

        if (users[msg.sender].id != 0) {
            buyLevel(level);
            return;
        }

        if (level != 1) {
            revert('Buy first level for 0.1 ETH');
        }

        address referrer = bytesToAddress(msg.data);
        if (referrer == address(0)) {
            registerUser(1);
        } else {
            registerUser(users[referrer].id);
        }
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function registerUser(uint _referrerID) public payable userNotRegistered() validReferrerID(_referrerID) validLevelAmount(1) {
        uint firstReferrerID = _referrerID;
        uint secondReferrerID = users[userAddresses[firstReferrerID]].firstReferrerID;
        uint thirdReferrerID = users[userAddresses[firstReferrerID]].secondReferrerID;
        uint fourthReferrerID = users[userAddresses[firstReferrerID]].thirdReferrerID;
        uint fifthReferrerID = users[userAddresses[firstReferrerID]].fourthReferrerID;

        _referrerID = users[findReferrer(creator)].id;

        currentUserID++;

        users[msg.sender] = createNewUser(_referrerID, firstReferrerID, secondReferrerID, thirdReferrerID, fourthReferrerID, fifthReferrerID);

        userAddresses[currentUserID] = msg.sender;
        users[msg.sender].levelActivity[1] = true;

        users[userAddresses[_referrerID]].referrals.push(msg.sender);

        users[userAddresses[firstReferrerID]].firstReferrals.push(msg.sender);
        users[userAddresses[secondReferrerID]].secondReferrals.push(msg.sender);
        users[userAddresses[thirdReferrerID]].thirdReferrals.push(msg.sender);

        transferLevelPayment(1, msg.sender, 1);
        transferLevelPaymentFirst(1, msg.sender);
        transferLevelPaymentSecond(1, msg.sender);
        transferLevelPaymentThird(1, msg.sender);
        transferLevelPaymentFourth(1, msg.sender);
        transferLevelPaymentFifth(1, msg.sender);

        emit RegisterUserEvent(msg.sender, userAddresses[_referrerID], now);

        if (currentUserID == LAST_PERSON_ROW_5) {
            resetLevels(2, LAST_PERSON_ROW_1);
        } else if (currentUserID == LAST_PERSON_ROW_6) {
            resetLevels(2, LAST_PERSON_ROW_2);
        } else if (currentUserID == LAST_PERSON_ROW_7) {
            resetLevels(2, LAST_PERSON_ROW_3);
        } else if (currentUserID == LAST_PERSON_ROW_8) {
            resetLevels(2, LAST_PERSON_ROW_4);
        } else if (currentUserID == LAST_PERSON_ROW_9) {
            resetLevels(2, LAST_PERSON_ROW_5);
        } else if (currentUserID == LAST_PERSON_ROW_10) {
            resetLevels(2, LAST_PERSON_ROW_6);
        } else if (currentUserID == LAST_PERSON_ROW_11) {
            resetLevels(2, LAST_PERSON_ROW_7);
        } else if (currentUserID == LAST_PERSON_ROW_12) {
            resetLevels(2, LAST_PERSON_ROW_8);
        } else if (currentUserID == LAST_PERSON_ROW_13) {
            resetLevels(2, LAST_PERSON_ROW_9);
        } else if (currentUserID == LAST_PERSON_ROW_14) {
            resetLevels(2, LAST_PERSON_ROW_10);
        } else if (currentUserID == LAST_PERSON_ROW_15) {
            resetLevels(2, LAST_PERSON_ROW_11);
        } else if (currentUserID == LAST_PERSON_ROW_16) {
            resetLevels(2, LAST_PERSON_ROW_12);
        } else if (currentUserID == LAST_PERSON_ROW_17) {
            resetLevels(2, LAST_PERSON_ROW_13);
        } else if (currentUserID == LAST_PERSON_ROW_18) {
            resetLevels(2, LAST_PERSON_ROW_14);
        } else if (currentUserID == LAST_PERSON_ROW_19) {
            resetLevels(2, LAST_PERSON_ROW_15);
        } else if (currentUserID == LAST_PERSON_ROW_20) {
            resetLevels(2, LAST_PERSON_ROW_16);
        } else if (currentUserID == LAST_PERSON_ROW_21) {
            resetLevels(2, LAST_PERSON_ROW_17);
        } else if (currentUserID == LAST_PERSON_ROW_22) {
            resetLevels(2, LAST_PERSON_ROW_18);
        } else if (currentUserID == LAST_PERSON_ROW_23) {
            resetLevels(2, LAST_PERSON_ROW_19);
        } else if (currentUserID == LAST_PERSON_ROW_24) {
            resetLevels(2, LAST_PERSON_ROW_20);
        } else if (currentUserID == LAST_PERSON_ROW_25) {
            resetLevels(2, LAST_PERSON_ROW_21);
        } else if (currentUserID == LAST_PERSON_ROW_26) {
            resetLevels(2, LAST_PERSON_ROW_22);
        } else if (currentUserID == LAST_PERSON_ROW_27) {
            resetLevels(2, LAST_PERSON_ROW_23);
        } else if (currentUserID == LAST_PERSON_ROW_28) {
            resetLevels(2, LAST_PERSON_ROW_24);
        } else if (currentUserID == LAST_PERSON_ROW_29) {
            resetLevels(2, LAST_PERSON_ROW_25);
        } else if (currentUserID == LAST_PERSON_ROW_30) {
            resetLevels(2, LAST_PERSON_ROW_26);
        }
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    function buyLevel(uint _level) public payable userRegistered() validLevel(_level) validLevelAmount(_level) {
        for (uint l = _level - 1; l > 0; l--) {
            require(getUserLevelActivity(msg.sender, l), 'Buy the previous level');
        }

        require(!getUserLevelActivity(msg.sender, _level), 'User has already activated level');

        users[msg.sender].levelActivity[_level] = true;

        transferLevelPayment(_level, msg.sender, _level);
        transferLevelPaymentFirst(_level, msg.sender);
        transferLevelPaymentSecond(_level, msg.sender);
        transferLevelPaymentThird(_level, msg.sender);
        transferLevelPaymentFourth(_level, msg.sender);
        transferLevelPaymentFifth(_level, msg.sender);

        emit BuyLevelEvent(msg.sender, _level, now);
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function resetLevels(uint startId, uint endId) internal {
        for (uint i = startId; i <= endId; i++) {
            for (uint level = 1; level <= MAX_LEVEL; level++) {
                users[userAddresses[i]].levelActivity[level] = false;
                emit ResetLevelsEvent(userAddresses[i], now);
            }
        }
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function findReferrer(address _user) public view returns (address) {
        if (users[_user].referrals.length < REFERRALS_LIMIT) {
            return _user;
        }

        address[33554432] memory referrals;
        referrals[0] = users[_user].referrals[0];
        referrals[1] = users[_user].referrals[1];

        address referrer;

        for (uint i = 0; i < 33554432; i++) {
            if (users[referrals[i]].referrals.length < REFERRALS_LIMIT) {
                referrer = referrals[i];
                break;
            }

            if (i >= 512) {
                continue;
            }

            referrals[(i + 1) * 2] = users[referrals[i]].referrals[0];
            referrals[(i + 1) * 2 + 1] = users[referrals[i]].referrals[1];
        }

        require(referrer != address(0), 'Referrer was not found');

        return referrer;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function transferLevelPayment(uint _level, address _user, uint height) internal {
        address referrer = getUserUpline(_user, height);

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPayment(_level, referrer, 1);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * defaultPercent)) {
            emit GetLevelProfitEvent(referrer, msg.sender, _level, now);
        }
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    function transferLevelPaymentFirst(uint _level, address _user) internal {
        address referrer = userAddresses[users[_user].firstReferrerID];

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPaymentFirst(_level, referrer);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * firstPercent)) {
            emit GetLevelProfitEventFirst(referrer, msg.sender, _level, now);
        }
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function transferLevelPaymentSecond(uint _level, address _user) internal {
        address referrer = userAddresses[users[_user].secondReferrerID];

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPaymentSecond(_level, referrer);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * secondPercent)) {
            emit GetLevelProfitEventSecond(referrer, msg.sender, _level, now);
        }
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    function transferLevelPaymentThird(uint _level, address _user) internal {
        address referrer = userAddresses[users[_user].thirdReferrerID];

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPaymentThird(_level, referrer);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * thirdPercent)) {
            emit GetLevelProfitEventThird(referrer, msg.sender, _level, now);
        }
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function transferLevelPaymentFourth(uint _level, address _user) internal {
        address referrer = userAddresses[users[_user].thirdReferrerID];

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPaymentFourth(_level, referrer);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * fourthPercent)) {
            emit GetLevelProfitEventFourth(referrer, msg.sender, _level, now);
        }
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function transferLevelPaymentFifth(uint _level, address _user) internal {
        address referrer = userAddresses[users[_user].thirdReferrerID];

        if (referrer == address(0)) {
            referrer = creator;
        }

        if (!getUserLevelActivity(referrer, _level)) {
            emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
            transferLevelPaymentFifth(_level, referrer);
            return;
        }

        if (addressToPayable(referrer).send(msg.value / 100 * fifthPercent)) {
            emit GetLevelProfitEventFifth(referrer, msg.sender, _level, now);
        }
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }


    function getUserUpline(address _user, uint height) public view returns (address) {
        if (height <= 0 || _user == address(0)) {
            return _user;
        }

        return this.getUserUpline(userAddresses[users[_user].referrerID], height - 1);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function getUserReferrals(address _user) public view returns (address[] memory) {
        return users[_user].referrals;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    function getUserLevelActivity(address _user, uint _level) public view returns (bool) {
        return users[_user].levelActivity[_level];
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function createNewUser(uint _referrerID, uint _firstReferrerID, uint _secondReferrerID, uint _thirdReferrerID, uint _fourthReferrerID, uint _fifthReferrerID) private view returns (User memory) {
        return User({
            id : currentUserID,
            referrerID : _referrerID,
            firstReferrerID : _firstReferrerID,
            secondReferrerID : _secondReferrerID,
            thirdReferrerID : _thirdReferrerID,
            fourthReferrerID : _fourthReferrerID,
            fifthReferrerID : _fifthReferrerID,
            referrals: new address[](0),
            firstReferrals: new address[](0),
            secondReferrals: new address[](0),
            thirdReferrals: new address[](0),
            fourthReferrals: new address[](0),
            fifthReferrals: new address[](0)
            });
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function bytesToAddress(bytes memory _addr) private pure returns (address addr) {
        assembly {
            addr := mload(add(_addr, 20))
        }
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function addressToPayable(address _addr) private pure returns (address payable) {
        return address(uint160(_addr));
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
}