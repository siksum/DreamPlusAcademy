pragma solidity 0.5.8;
contract PasswordEncrypter {
    


    struct KeyMakers {
        address payable maker;
        uint256 LockPrice;
    }

  function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp8); 
        pastBlockTime_tmstmp8 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => KeyMakers) getKM;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  address[] private listofkeymakers;
  function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => bool) private CheckKM;

    struct encryptedMessages {
        uint time;
        address saver;
        string encryptedMessage;
        string primaryKey;
    }


    struct getIndex {
        string primaryKey;
    }

  address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  mapping (string => encryptedMessages) NewEncryptedMessage;
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (string => bool) private Wlist;
  address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
  mapping (address => getIndex) OurlastIndex;



    function WallettoString(address x) internal pure returns(string memory) {
        bytes memory b = new bytes(20);
        for (uint i = 0; i < 20; i++)
            b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
        return string(b);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function appendString(string memory a, string memory b) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}


    function cexist(string memory _walletandid) view private returns (bool){
        return Wlist[_walletandid];
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function checkIndex(string memory _primaryKey) view public returns (bool) {
        string memory sid = appendString(WallettoString(msg.sender),_primaryKey);
        bool cwallet = cexist(sid);
        return cwallet;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

    function savenewEM(address payable keyMaker, address payable keyHelper, string memory _encryptedMessage, string memory _primaryKey) public payable {
        string memory sid = appendString(WallettoString(msg.sender),_primaryKey);
        require(ckmexist(keyMaker),"406");
        require(!cexist(sid),"407");

        if(keyHelper == keyHelper) {
            require(msg.value >= getKM[keyMaker].LockPrice, "402");
            keyMaker.transfer(msg.value);
            NewEncryptedMessage[sid].time = now;
            NewEncryptedMessage[sid].saver = msg.sender;
            NewEncryptedMessage[sid].encryptedMessage = _encryptedMessage;
            NewEncryptedMessage[sid].primaryKey = _primaryKey;
            OurlastIndex[msg.sender].primaryKey = _primaryKey;
            Wlist[sid]=true;
        } else {
            require(msg.value >= getKM[keyMaker].LockPrice, "402");
            keyMaker.transfer(msg.value/2);
            keyHelper.transfer(msg.value/2);
            NewEncryptedMessage[sid].time = now;
            NewEncryptedMessage[sid].saver = msg.sender;
            NewEncryptedMessage[sid].encryptedMessage = _encryptedMessage;
            NewEncryptedMessage[sid].primaryKey = _primaryKey;
            OurlastIndex[msg.sender].primaryKey = _primaryKey;
            Wlist[sid]=true;
        }


    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}



    function ckmexist(address payable _keymakerAddress) view private returns (bool){
        return CheckKM[_keymakerAddress];
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp32); 
        pastBlockTime_tmstmp32 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }


    function becomeAKeyMaker(uint256 price) public {
        getKM[msg.sender].maker = msg.sender;
        getKM[msg.sender].LockPrice = price;
        CheckKM[msg.sender] = true;
        listofkeymakers.push(msg.sender) -1;
    }
uint256 bugv_tmstmp2 = block.timestamp;

    function getKeyMakerList() view public returns(address[] memory) {
      return listofkeymakers;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    function numberOfKeyMakers() view public returns (uint) {
      return listofkeymakers.length;
    }
uint256 bugv_tmstmp1 = block.timestamp;


    function getLastIndex() view public returns (string memory) {
        return OurlastIndex[msg.sender].primaryKey;
    }
uint256 bugv_tmstmp4 = block.timestamp;


     function GetDetailsWithID(string memory _emID) view public returns (string memory, string memory,string memory) {
        string memory sid = appendString(WallettoString(msg.sender),_emID);
        bool cwallet = cexist(sid);
        if(cwallet){
               return (uint2str(NewEncryptedMessage[sid].time), NewEncryptedMessage[sid].encryptedMessage, "200");
          } else {
              return ("0","0","404");
          }
     }
uint256 bugv_tmstmp3 = block.timestamp;



}