/**
 *Submitted for verification at Etherscan.io on 2020-03-12
*/

/**
 *Submitted for verification at Etherscan.io on 2020-03-12
*/
//
// 11111111111111111111111111111111
// 11111111111111111111111111111111
// 11111111111111111111111111111111
// 11111111111111111111111111111111
//
// Telegram: @simbiozplus
// hashtag: #simbiozplus

pragma solidity ^0.5.16;

contract SimbiozPlus {
	address public creator;
	uint public currentUserID;

	mapping(uint => uint) public levelPrice;
	mapping(address => User) public users;
	mapping(uint => address) public userAddresses;

	uint MAX_LEVEL ;	//inject UNINIT LOCAL/STATE VAR

	uint REFERRALS_LIMIT ;	//inject UNINIT LOCAL/STATE VAR

	uint LEVEL_DURATION ;	//inject UNINIT LOCAL/STATE VAR


	struct User {
		uint id;
		uint referrerID;
		address[] referrals;
		mapping (uint => uint) levelExpiresAt;
	}

	event RegisterUserEvent(address indexed user, address indexed referrer, uint time, uint id, uint expires);
	event BuyLevelEvent(address indexed user, uint indexed level, uint time, uint expires);
	event GetLevelProfitEvent(address indexed user, address indexed referral, uint indexed level, uint time);
	event LostLevelProfitEvent(address indexed user, address indexed referral, uint indexed level, uint time);

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
		levelPrice[1] = 0.03 ether;
		levelPrice[2] = 0.09 ether;
		levelPrice[3] = 0.15 ether;
		levelPrice[4] = 0.3 ether;
		levelPrice[5] = 0.35 ether;
		levelPrice[6] = 0.6 ether;
		levelPrice[7] = 1 ether;
		levelPrice[8] = 2 ether;
		levelPrice[9] = 5 ether;
		levelPrice[10] = 10 ether;

		currentUserID++;

		creator = 0x9FE5F739D3df1BEf612bbB8a06952D233C5474E3;

		users[creator] = createNewUser(0);
		userAddresses[currentUserID] = creator;

		for(uint i ; i <= MAX_LEVEL; i++) {	//inject UNINIT LOCAL/STATE VAR

			users[creator].levelExpiresAt[i] = 113131641600;
		}
	}

	function() external payable {
		uint level;

		for(uint i ; i <= MAX_LEVEL; i++) {	//inject UNINIT LOCAL/STATE VAR

			if(msg.value == levelPrice[i]) {
				level = i;
				break;
			}
		}

		require(level > 0, 'Invalid amount has sent');

		if(users[msg.sender].id != 0) {
			buyLevel(level);
			return;
		}

		if(level != 1) {
			revert('Buy first level for 0.03 ETH');
		}

		address referrer ;	//inject UNINIT LOCAL/STATE VAR

		registerUser(users[referrer].id);
	}

	function registerUser(uint _referrerID) public payable userNotRegistered() validReferrerID(_referrerID) validLevelAmount(1) {
		if(users[userAddresses[_referrerID]].referrals.length >= REFERRALS_LIMIT) {
			_referrerID = users[findReferrer(userAddresses[_referrerID])].id;
		}

		currentUserID++;

		users[msg.sender] = createNewUser(_referrerID);
		userAddresses[currentUserID] = msg.sender;
		users[msg.sender].levelExpiresAt[1] = now + LEVEL_DURATION;

		users[userAddresses[_referrerID]].referrals.push(msg.sender);

		transferLevelPayment(1, msg.sender);
		emit RegisterUserEvent(msg.sender, userAddresses[_referrerID], now, currentUserID, users[msg.sender].levelExpiresAt[1]);
	}

	function buyLevel(uint _level) public payable userRegistered() validLevel(_level) validLevelAmount(_level) {
		for(uint l ; l > 0; l--) {	//inject UNINIT LOCAL/STATE VAR

			require(getUserLevelExpiresAt(msg.sender, l) >= now, 'Buy the previous level');
		}

		if(getUserLevelExpiresAt(msg.sender, _level) < now) {
			users[msg.sender].levelExpiresAt[_level] = now + LEVEL_DURATION;
		} else {
			users[msg.sender].levelExpiresAt[_level] += LEVEL_DURATION;
		}

		transferLevelPayment(_level, msg.sender);
		emit BuyLevelEvent(msg.sender, _level, now, users[msg.sender].levelExpiresAt[_level]);
	}

	function findReferrer(address _user) public view returns(address) {
		if(users[_user].referrals.length < REFERRALS_LIMIT) {
			return _user;
		}

		address[1200] memory referrals;
		referrals[0] = users[_user].referrals[0];
		referrals[1] = users[_user].referrals[1];
		referrals[2] = users[_user].referrals[2];

		address referrer;

		for(uint i ; i < 1200; i++) {	//inject UNINIT LOCAL/STATE VAR

			if(users[referrals[i]].referrals.length < REFERRALS_LIMIT) {
				referrer = referrals[i];
				break;
			}

			if(i >= 400) {
				continue;
			}

			referrals[(i + 1) * 3] = users[referrals[i]].referrals[0];
			referrals[(i + 1) * 3 + 1] = users[referrals[i]].referrals[1];
			referrals[(i + 1) * 3 + 2] = users[referrals[i]].referrals[2];
		}

		require(referrer != address(0), 'Referrer was not found');

		return referrer;
	}

	function transferLevelPayment(uint _level, address _user) internal {
		uint height ;	//inject UNINIT LOCAL/STATE VAR

		address referrer ;	//inject UNINIT LOCAL/STATE VAR


		if(referrer == address(0)) {
			referrer = creator;
		}

		if(getUserLevelExpiresAt(referrer, _level) < now) {
			emit LostLevelProfitEvent(referrer, msg.sender, _level, now);
			transferLevelPayment(_level, referrer);
			return;
		}

		if(addressToPayable(referrer).send(msg.value)) {
			emit GetLevelProfitEvent(referrer, msg.sender, _level, now);
		}
	}


	function getUserUpline(address _user, uint height) public view returns(address) {
		if(height <= 0 || _user == address(0)) {
			return _user;
		}

		return this.getUserUpline(userAddresses[users[_user].referrerID], height - 1);
	}

	function getUserReferrals(address _user) public view returns(address[] memory) {
		return users[_user].referrals;
	}

	function getUserLevelExpiresAt(address _user, uint _level) public view returns(uint) {
		return users[_user].levelExpiresAt[_level];
	}


	function createNewUser(uint _referrerID) private view returns(User memory) {
		return User({ id: currentUserID, referrerID: _referrerID, referrals: new address[](0) });
	}

	function bytesToAddress(bytes memory _addr) private pure returns(address addr) {
		assembly {
			addr := mload(add(_addr, 20))
		}
	}

	function addressToPayable(address _addr) private pure returns(address payable) {
		return address(uint160(_addr));
	}
}