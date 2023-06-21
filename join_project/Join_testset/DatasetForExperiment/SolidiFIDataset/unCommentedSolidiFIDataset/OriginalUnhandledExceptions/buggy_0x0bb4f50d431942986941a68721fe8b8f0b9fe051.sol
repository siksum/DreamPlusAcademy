/**
 *Submitted for verification at Etherscan.io on 2020-03-11
*/

pragma solidity 0.5.14;

contract DoubleHands  {

  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  event regLevelEvent(address indexed _user, address indexed _referrer, uint _time);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event buyLevelEvent(address indexed _user, uint _level, uint _time);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event prolongateLevelEvent(address indexed _user, uint _level, uint _time);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event getMoneyForLevelEvent(address indexed _user, address indexed _referral, uint _level, uint _time);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event lostMoneyForLevelEvent(address indexed _user, address indexed _referral, uint _level, uint _time);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event chUplineLogEvent(address indexed _chUpline, uint _idCh, uint _idDw);

  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  address ownerWallet = 0x81eaAb6234571b004aE91BD0b640214540b69964;

  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping (uint => uint) public LEVEL_PRICE;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}
  uint REFERRER_1_LEVEL_LIMIT = 2;
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}
  uint PERIOD_LENGTH = 64 days;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}
  uint RENEWAL_NOT_EARLIER = 64 days;


    struct UserStruct {
        bool isExist;
        uint id;
        uint referrerID;
        address[] referral;
        mapping (uint => uint) levelExpired;
    }
    
    
    mapping (address => UserStruct) public users;
    mapping (uint => address) public userList;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}
  uint public currUserID = 0;

    CryptoHands CRYPTO_HANDS = CryptoHands(0xA315bD2e3227C2ab71f1350644B01757EAFf9cb4);
    
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public START_TIME = 1576800000; 
    uint public END_OF_PERIOD_1 = START_TIME + 1 days;
    uint public END_OF_PERIOD_2 = START_TIME + 2 days;
    uint public END_OF_PERIOD_3 = START_TIME + 3 days;
    uint public END_OF_PERIOD_4 = START_TIME + 5 days;
    uint public END_OF_PERIOD_5 = START_TIME + 8 days;
    uint public END_OF_PERIOD_6 = START_TIME + 13 days;
    uint public END_OF_PERIOD_7 = START_TIME + 21 days;
    
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint public ID_OF_PERIOD_1 = 16;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public ID_OF_PERIOD_2 = 32;
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  uint public ID_OF_PERIOD_3 = 64;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint public ID_OF_PERIOD_4 = 128;
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  uint public ID_OF_PERIOD_5 = 256;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  uint public ID_OF_PERIOD_6 = 512;

    
    modifier priorityRegistration() {
        require(now >= START_TIME, 'The time has not come yet');
        
        if(now <= END_OF_PERIOD_7){
            (bool isExist, uint256 id, uint256 referrerID)  = viewCHUser(msg.sender);
            
            require(isExist, 'You must be registered in CryptoHands');
            
            if(now > END_OF_PERIOD_6){
               require( ( CRYPTO_HANDS.viewUserLevelExpired(msg.sender,1) > now ), 'You must be registered in CryptoHands'); 
            } else  if(now > END_OF_PERIOD_5){
               require( ( id<=ID_OF_PERIOD_6 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,2) > now ), 'You must have level 2 in CryptoHands, or id <= 512'); 
            } else  if(now > END_OF_PERIOD_4){
               require( ( id<=ID_OF_PERIOD_5 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,3) > now ), 'You must have level 3 in CryptoHands, or id <= 256'); 
            } else  if(now > END_OF_PERIOD_3){
               require( ( id<=ID_OF_PERIOD_4 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,4) > now ), 'You must have level 4 in CryptoHands, or id <= 128'); 
            } else  if(now > END_OF_PERIOD_2){
               require( ( id<=ID_OF_PERIOD_3 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,5) > now ), 'You must have level 5 in CryptoHands, or id <= 64'); 
            } else  if(now > END_OF_PERIOD_1){
               require( ( id<=ID_OF_PERIOD_2 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,6) > now ), 'You must have level 6 in CryptoHands, or id <= 32'); 
            } else{
               require( ( id<=ID_OF_PERIOD_1 || CRYPTO_HANDS.viewUserLevelExpired(msg.sender,7) > now ), 'You must have level 7 in CryptoHands, or id <= 16'); 
            } 
        }

        _;
    }

    constructor() public {

        LEVEL_PRICE[1] = 0.08 ether;
        LEVEL_PRICE[2] = 0.16 ether;
        LEVEL_PRICE[3] = 0.32 ether;
        LEVEL_PRICE[4] = 0.64 ether;
        LEVEL_PRICE[5] = 1.28 ether;
        LEVEL_PRICE[6] = 2.56 ether;
        LEVEL_PRICE[7] = 5.12 ether;
        LEVEL_PRICE[8] = 10.24 ether;

        UserStruct memory userStruct;
        currUserID++;

        userStruct = UserStruct({
            isExist : true,
            id : currUserID,
            referrerID : 0,
            referral : new address[](0)
        });
        users[ownerWallet] = userStruct;
        userList[currUserID] = ownerWallet;

        users[ownerWallet].levelExpired[1] = 77777777777;
        users[ownerWallet].levelExpired[2] = 77777777777;
        users[ownerWallet].levelExpired[3] = 77777777777;
        users[ownerWallet].levelExpired[4] = 77777777777;
        users[ownerWallet].levelExpired[5] = 77777777777;
        users[ownerWallet].levelExpired[6] = 77777777777;
        users[ownerWallet].levelExpired[7] = 77777777777;
        users[ownerWallet].levelExpired[8] = 77777777777;
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    function () external payable priorityRegistration(){

        uint level;

        if(msg.value == LEVEL_PRICE[1]){
            level = 1;
        }else if(msg.value == LEVEL_PRICE[2]){
            level = 2;
        }else if(msg.value == LEVEL_PRICE[3]){
            level = 3;
        }else if(msg.value == LEVEL_PRICE[4]){
            level = 4;
        }else if(msg.value == LEVEL_PRICE[5]){
            level = 5;
        }else if(msg.value == LEVEL_PRICE[6]){
            level = 6;
        }else if(msg.value == LEVEL_PRICE[7]){
            level = 7;
        }else if(msg.value == LEVEL_PRICE[8]){
            level = 8;
        }else {
            revert('Incorrect Value send');
        }

        if(users[msg.sender].isExist){
            buyLevel(level);
        } else if(level == 1) {
            uint refId = 0;
            address referrer = bytesToAddress(msg.data);

            if (users[referrer].isExist){
                refId = users[referrer].id;
            } else {
                (bool chIsExist, uint256 chId, uint256 chReferrerID)  = viewCHUser(msg.sender);
                
                if(chIsExist){
                    referrer =  findCHReferrer(chReferrerID);   
                    refId = users[referrer].id;
                }else {
                    revert('Incorrect referrer');
                }
            }

            regUser(refId);
        } else {
            revert("Please buy first level for 0.08 ETH");
        }
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function regUser(uint _referrerID) internal {

        if(users[userList[_referrerID]].referral.length >= REFERRER_1_LEVEL_LIMIT)
        {
            _referrerID = users[findFreeReferrer(userList[_referrerID])].id;
        }


        UserStruct memory userStruct;
        currUserID++;

        userStruct = UserStruct({
            isExist : true,
            id : currUserID,
            referrerID : _referrerID,
            referral : new address[](0)
        });

        users[msg.sender] = userStruct;
        userList[currUserID] = msg.sender;

        users[msg.sender].levelExpired[1] = now + PERIOD_LENGTH;

        users[userList[_referrerID]].referral.push(msg.sender);

        payForLevel(1, msg.sender);

        emit regLevelEvent(msg.sender, userList[_referrerID], now);
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}

    function buyLevel(uint _level) internal {
        
        require(users[msg.sender].levelExpired[_level] < now + RENEWAL_NOT_EARLIER, 'The level has already been extended for a long time. Try later');

        if(_level == 1){
            users[msg.sender].levelExpired[1] += PERIOD_LENGTH;
        } else {
            for(uint l =_level-1; l>0; l-- ){
                require(users[msg.sender].levelExpired[l] >= now, 'Buy the previous level');
            }

            if(users[msg.sender].levelExpired[_level] == 0){
                users[msg.sender].levelExpired[_level] = now + PERIOD_LENGTH;
            } else {
                users[msg.sender].levelExpired[_level] += PERIOD_LENGTH;
            }
        }
        payForLevel(_level, msg.sender);
        emit buyLevelEvent(msg.sender, _level, now);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function payForLevel(uint _level, address _user) internal {
        
        address referrer = getUserReferrer(_user, _level);

        if(!users[referrer].isExist){
            referrer = userList[1];
        }

        if(users[referrer].levelExpired[_level] >= now ){
            bool result;
            result = address(uint160(referrer)).send(LEVEL_PRICE[_level]);
            emit getMoneyForLevelEvent(referrer, msg.sender, _level, now);
        } else {
            emit lostMoneyForLevelEvent(referrer, msg.sender, _level, now);
            payForLevel(_level,referrer);
        }
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function findFreeReferrer(address _user) public view returns(address) {
        if(users[_user].referral.length < REFERRER_1_LEVEL_LIMIT){
            return _user;
        }

        address[] memory referrals = new address[](2046);
        referrals[0] = users[_user].referral[0]; 
        referrals[1] = users[_user].referral[1];

        address freeReferrer;
        bool noFreeReferrer = true;

        for(uint i =0; i<2046;i++){
            if(users[referrals[i]].referral.length == REFERRER_1_LEVEL_LIMIT){
                if(i<1022){
                    referrals[(i+1)*2] = users[referrals[i]].referral[0];
                    referrals[(i+1)*2+1] = users[referrals[i]].referral[1];
                }
            }else{
                noFreeReferrer = false;
                freeReferrer = referrals[i];
                break;
            }
        }
        require(!noFreeReferrer, 'No Free Referrer');
        return freeReferrer;

    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
    
    function getUserReferrer(address _user, uint _level) public view returns (address) {
      if (_level == 0 || _user == address(0)) {
        return _user;
      }

      return this.getUserReferrer(userList[users[_user].referrerID], _level - 1);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }    

    function viewUserReferral(address _user) public view returns(address[] memory) {
        return users[_user].referral;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function viewUserLevelExpired(address _user, uint _level) public view returns(uint) {
        return users[_user].levelExpired[_level];
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
        
    function bytesToAddress(bytes memory bys) private pure returns (address  addr ) {
        assembly {
            addr := mload(add(bys, 20))
        }
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function viewCHUser(address _user) public view returns (bool isExist, uint id,  uint referrerID) {
        return CRYPTO_HANDS.users(_user);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function viewCHLevelExpired(address _user, uint _level) public view returns (uint) {
        CRYPTO_HANDS.viewUserLevelExpired(_user,_level);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function findCHReferrer(uint _chUserId) internal returns(address) { 

        address chReferrerAddress = CRYPTO_HANDS.userList(_chUserId);
        
        if(users[chReferrerAddress].isExist){
            emit chUplineLogEvent(chReferrerAddress, _chUserId, users[chReferrerAddress].id);
            return chReferrerAddress;
        } else{
            emit chUplineLogEvent(chReferrerAddress, _chUserId, 0);
            (bool chIsExist, uint256 chId, uint256 chReferrerID)  = viewCHUser(chReferrerAddress); 
            return findCHReferrer(chReferrerID);
        }
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }     
}
contract CryptoHands  {
    struct UserStruct {
        bool isExist;
        uint id;
        uint referrerID;
        address[] referral;
        mapping (uint => uint) levelExpired;
    }    
    
    mapping (address => UserStruct) public users;
    mapping (uint => address) public userList;
    function viewUserLevelExpired(address _user, uint _level) public view returns(uint);
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
}