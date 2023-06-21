pragma solidity >=0.5.4 <0.6.0;

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

	/**
	 * @dev Multiplies two numbers, throws on overflow.
	 */
	function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
		
		
		
		if (a == 0) {
			return 0;
		}

		c = a * b;
		assert(c / a == b);
		return c;
	}

	/**
	 * @dev Integer division of two numbers, truncating the quotient.
	 */
	function div(uint256 a, uint256 b) internal pure returns (uint256) {
		
		
		
		return a / b;
	}

	/**
	 * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
	 */
	function sub(uint256 a, uint256 b) internal pure returns (uint256) {
		assert(b <= a);
		return a - b;
	}

	/**
	 * @dev Adds two numbers, throws on overflow.
	 */
	function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
		c = a + b;
		assert(c >= a);
		return c;
	}
}


interface INameTAOPosition {
	function senderIsAdvocate(address _sender, address _id) external view returns (bool);
	function senderIsListener(address _sender, address _id) external view returns (bool);
	function senderIsSpeaker(address _sender, address _id) external view returns (bool);
	function senderIsPosition(address _sender, address _id) external view returns (bool);
	function getAdvocate(address _id) external view returns (address);
	function nameIsAdvocate(address _nameId, address _id) external view returns (bool);
	function nameIsPosition(address _nameId, address _id) external view returns (bool);
	function initialize(address _id, address _advocateId, address _listenerId, address _speakerId) external returns (bool);
	function determinePosition(address _sender, address _id) external view returns (uint256);
}















contract TokenERC20 {
	
	string public name;
	string public symbol;
	uint8 public decimals = 18;
	
	uint256 public totalSupply;

	
	mapping (address => uint256) public balanceOf;
	mapping (address => mapping (address => uint256)) public allowance;

	
	event Transfer(address indexed from, address indexed to, uint256 value);

	
	event Approval(address indexed _owner, address indexed _spender, uint256 _value);

	
	event Burn(address indexed from, uint256 value);

	/**
	 * Constructor function
	 *
	 * Initializes contract with initial supply tokens to the creator of the contract
	 */
	constructor (uint256 initialSupply, string memory tokenName, string memory tokenSymbol) public {
		totalSupply = initialSupply * 10 ** uint256(decimals);  
		balanceOf[msg.sender] = totalSupply;                
		name = tokenName;                                   
		symbol = tokenSymbol;                               
	}

	/**
	 * Internal transfer, only can be called by this contract
	 */
	function _transfer(address _from, address _to, uint _value) internal {
		
		require(_to != address(0));
		
		require(balanceOf[_from] >= _value);
		
		require(balanceOf[_to] + _value > balanceOf[_to]);
		
		uint previousBalances = balanceOf[_from] + balanceOf[_to];
		
		balanceOf[_from] -= _value;
		
		balanceOf[_to] += _value;
		emit Transfer(_from, _to, _value);
		
		assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
	}

	/**
	 * Transfer tokens
	 *
	 * Send `_value` tokens to `_to` from your account
	 *
	 * @param _to The address of the recipient
	 * @param _value the amount to send
	 */
	function transfer(address _to, uint256 _value) public returns (bool success) {
		_transfer(msg.sender, _to, _value);
		return true;
	}

	/**
	 * Transfer tokens from other address
	 *
	 * Send `_value` tokens to `_to` in behalf of `_from`
	 *
	 * @param _from The address of the sender
	 * @param _to The address of the recipient
	 * @param _value the amount to send
	 */
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
		require(_value <= allowance[_from][msg.sender]);     
		allowance[_from][msg.sender] -= _value;
		_transfer(_from, _to, _value);
		return true;
	}

	/**
	 * Set allowance for other address
	 *
	 * Allows `_spender` to spend no more than `_value` tokens in your behalf
	 *
	 * @param _spender The address authorized to spend
	 * @param _value the max amount they can spend
	 */
	function approve(address _spender, uint256 _value) public returns (bool success) {
		allowance[msg.sender][_spender] = _value;
		emit Approval(msg.sender, _spender, _value);
		return true;
	}

	/**
	 * Set allowance for other address and notify
	 *
	 * Allows `_spender` to spend no more than `_value` tokens in your behalf, and then ping the contract about it
	 *
	 * @param _spender The address authorized to spend
	 * @param _value the max amount they can spend
	 * @param _extraData some extra information to send to the approved contract
	 */
	function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
		tokenRecipient spender = tokenRecipient(_spender);
		if (approve(_spender, _value)) {
			spender.receiveApproval(msg.sender, _value, address(this), _extraData);
			return true;
		}
	}

	/**
	 * Destroy tokens
	 *
	 * Remove `_value` tokens from the system irreversibly
	 *
	 * @param _value the amount of money to burn
	 */
	function burn(uint256 _value) public returns (bool success) {
		require(balanceOf[msg.sender] >= _value);   
		balanceOf[msg.sender] -= _value;            
		totalSupply -= _value;                      
		emit Burn(msg.sender, _value);
		return true;
	}

	/**
	 * Destroy tokens from other account
	 *
	 * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
	 *
	 * @param _from the address of the sender
	 * @param _value the amount of money to burn
	 */
	function burnFrom(address _from, uint256 _value) public returns (bool success) {
		require(balanceOf[_from] >= _value);                
		require(_value <= allowance[_from][msg.sender]);    
		balanceOf[_from] -= _value;                         
		allowance[_from][msg.sender] -= _value;             
		totalSupply -= _value;                              
		emit Burn(_from, _value);
		return true;
	}
}


/**
 * @title TAO
 */
contract TAO {
	using SafeMath for uint256;

	address public vaultAddress;
	string public name;				
	address public originId;		

	
	string public datHash;
	string public database;
	string public keyValue;
	bytes32 public contentId;

	/**
	 * 0 = TAO
	 * 1 = Name
	 */
	uint8 public typeId;

	/**
	 * @dev Constructor function
	 */
	constructor (string memory _name,
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _vaultAddress
	) public {
		name = _name;
		originId = _originId;
		datHash = _datHash;
		database = _database;
		keyValue = _keyValue;
		contentId = _contentId;

		
		typeId = 0;

		vaultAddress = _vaultAddress;
	}

	/**
	 * @dev Checks if calling address is Vault contract
	 */
	modifier onlyVault {
		require (msg.sender == vaultAddress);
		_;
	}

	/**
	 * Will receive any ETH sent
	 */
	function () external payable {
	}

	/**
	 * @dev Allows Vault to transfer `_amount` of ETH from this TAO to `_recipient`
	 * @param _recipient The recipient address
	 * @param _amount The amount to transfer
	 * @return true on success
	 */
	function transferEth(address payable _recipient, uint256 _amount) public onlyVault returns (bool) {
		_recipient.transfer(_amount);	

		return true;
	}

	/**
	 * @dev Allows Vault to transfer `_amount` of ERC20 Token from this TAO to `_recipient`
	 * @param _erc20TokenAddress The address of ERC20 Token
	 * @param _recipient The recipient address
	 * @param _amount The amount to transfer
	 * @return true on success
	 */
	function transferERC20(address _erc20TokenAddress, address _recipient, uint256 _amount) public onlyVault returns (bool) {
		TokenERC20 _erc20 = TokenERC20(_erc20TokenAddress);
		_erc20.transfer(_recipient, _amount);
		return true;
	}
}




/**
 * @title Name
 */
contract Name is TAO {
	/**
	 * @dev Constructor function
	 */
	constructor (string memory _name, address _originId, string memory _datHash, string memory _database, string memory _keyValue, bytes32 _contentId, address _vaultAddress)
		TAO (_name, _originId, _datHash, _database, _keyValue, _contentId, _vaultAddress) public {
		
		typeId = 1;
	}
}




/**
 * @title AOLibrary
 */
library AOLibrary {
	using SafeMath for uint256;

	uint256 constant private _MULTIPLIER_DIVISOR = 10 ** 6; 
	uint256 constant private _PERCENTAGE_DIVISOR = 10 ** 6; 

	/**
	 * @dev Check whether or not the given TAO ID is a TAO
	 * @param _taoId The ID of the TAO
	 * @return true if yes. false otherwise
	 */
	function isTAO(address _taoId) public view returns (bool) {
		return (_taoId != address(0) && bytes(TAO(address(uint160(_taoId))).name()).length > 0 && TAO(address(uint160(_taoId))).originId() != address(0) && TAO(address(uint160(_taoId))).typeId() == 0);
	}

	/**
	 * @dev Check whether or not the given Name ID is a Name
	 * @param _nameId The ID of the Name
	 * @return true if yes. false otherwise
	 */
	function isName(address _nameId) public view returns (bool) {
		return (_nameId != address(0) && bytes(TAO(address(uint160(_nameId))).name()).length > 0 && Name(address(uint160(_nameId))).originId() != address(0) && Name(address(uint160(_nameId))).typeId() == 1);
	}

	/**
	 * @dev Check if `_tokenAddress` is a valid ERC20 Token address
	 * @param _tokenAddress The ERC20 Token address to check
	 */
	function isValidERC20TokenAddress(address _tokenAddress) public view returns (bool) {
		if (_tokenAddress == address(0)) {
			return false;
		}
		TokenERC20 _erc20 = TokenERC20(_tokenAddress);
		return (_erc20.totalSupply() >= 0 && bytes(_erc20.name()).length > 0 && bytes(_erc20.symbol()).length > 0);
	}

	/**
	 * @dev Checks if the calling contract address is The AO
	 *		OR
	 *		If The AO is set to a Name/TAO, then check if calling address is the Advocate
	 * @param _sender The address to check
	 * @param _theAO The AO address
	 * @param _nameTAOPositionAddress The address of NameTAOPosition
	 * @return true if yes, false otherwise
	 */
	function isTheAO(address _sender, address _theAO, address _nameTAOPositionAddress) public view returns (bool) {
		return (_sender == _theAO ||
			(
				(isTAO(_theAO) || isName(_theAO)) &&
				_nameTAOPositionAddress != address(0) &&
				INameTAOPosition(_nameTAOPositionAddress).senderIsAdvocate(_sender, _theAO)
			)
		);
	}

	/**
	 * @dev Return the divisor used to correctly calculate percentage.
	 *		Percentage stored throughout AO contracts covers 4 decimals,
	 *		so 1% is 10000, 1.25% is 12500, etc
	 */
	function PERCENTAGE_DIVISOR() public pure returns (uint256) {
		return _PERCENTAGE_DIVISOR;
	}

	/**
	 * @dev Return the divisor used to correctly calculate multiplier.
	 *		Multiplier stored throughout AO contracts covers 6 decimals,
	 *		so 1 is 1000000, 0.023 is 23000, etc
	 */
	function MULTIPLIER_DIVISOR() public pure returns (uint256) {
		return _MULTIPLIER_DIVISOR;
	}

	/**
	 * @dev deploy a TAO
	 * @param _name The name of the TAO
	 * @param _originId The Name ID the creates the TAO
	 * @param _datHash The datHash of this TAO
	 * @param _database The database for this TAO
	 * @param _keyValue The key/value pair to be checked on the database
	 * @param _contentId The contentId related to this TAO
	 * @param _nameTAOVaultAddress The address of NameTAOVault
	 */
	function deployTAO(string memory _name,
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (TAO _tao) {
		_tao = new TAO(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	/**
	 * @dev deploy a Name
	 * @param _name The name of the Name
	 * @param _originId The eth address the creates the Name
	 * @param _datHash The datHash of this Name
	 * @param _database The database for this Name
	 * @param _keyValue The key/value pair to be checked on the database
	 * @param _contentId The contentId related to this Name
	 * @param _nameTAOVaultAddress The address of NameTAOVault
	 */
	function deployName(string memory _name,
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (Name _myName) {
		_myName = new Name(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	/**
	 * @dev Calculate the new weighted multiplier when adding `_additionalPrimordialAmount` at `_additionalWeightedMultiplier` to the current `_currentPrimordialBalance` at `_currentWeightedMultiplier`
	 * @param _currentWeightedMultiplier Account's current weighted multiplier
	 * @param _currentPrimordialBalance Account's current primordial ion balance
	 * @param _additionalWeightedMultiplier The weighted multiplier to be added
	 * @param _additionalPrimordialAmount The primordial ion amount to be added
	 * @return the new primordial weighted multiplier
	 */
	function calculateWeightedMultiplier(uint256 _currentWeightedMultiplier, uint256 _currentPrimordialBalance, uint256 _additionalWeightedMultiplier, uint256 _additionalPrimordialAmount) public pure returns (uint256) {
		if (_currentWeightedMultiplier > 0) {
			uint256 _totalWeightedIons = (_currentWeightedMultiplier.mul(_currentPrimordialBalance)).add(_additionalWeightedMultiplier.mul(_additionalPrimordialAmount));
			uint256 _totalIons = _currentPrimordialBalance.add(_additionalPrimordialAmount);
			return _totalWeightedIons.div(_totalIons);
		} else {
			return _additionalWeightedMultiplier;
		}
	}

	/**
	 * @dev Calculate the primordial ion multiplier on a given lot
	 *		Total Primordial Mintable = T
	 *		Total Primordial Minted = M
	 *		Starting Multiplier = S
	 *		Ending Multiplier = E
	 *		To Purchase = P
	 *		Multiplier for next Lot of Amount = (1 - ((M + P/2) / T)) x (S-E)
	 *
	 * @param _purchaseAmount The amount of primordial ion intended to be purchased
	 * @param _totalPrimordialMintable Total Primordial ion mintable
	 * @param _totalPrimordialMinted Total Primordial ion minted so far
	 * @param _startingMultiplier The starting multiplier in (10 ** 6)
	 * @param _endingMultiplier The ending multiplier in (10 ** 6)
	 * @return The multiplier in (10 ** 6)
	 */
	function calculatePrimordialMultiplier(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.sub(_totalPrimordialMinted)) {
			/**
			 * Let temp = M + (P/2)
			 * Multiplier = (1 - (temp / T)) x (S-E)
			 */
			uint256 temp = _totalPrimordialMinted.add(_purchaseAmount.div(2));

			/**
			 * Multiply multiplier with _MULTIPLIER_DIVISOR/_MULTIPLIER_DIVISOR to account for 6 decimals
			 * so, Multiplier = (_MULTIPLIER_DIVISOR/_MULTIPLIER_DIVISOR) * (1 - (temp / T)) * (S-E)
			 * Multiplier = ((_MULTIPLIER_DIVISOR * (1 - (temp / T))) * (S-E)) / _MULTIPLIER_DIVISOR
			 * Multiplier = ((_MULTIPLIER_DIVISOR - ((_MULTIPLIER_DIVISOR * temp) / T)) * (S-E)) / _MULTIPLIER_DIVISOR
			 * Take out the division by _MULTIPLIER_DIVISOR for now and include in later calculation
			 * Multiplier = (_MULTIPLIER_DIVISOR - ((_MULTIPLIER_DIVISOR * temp) / T)) * (S-E)
			 */
			uint256 multiplier = (_MULTIPLIER_DIVISOR.sub(_MULTIPLIER_DIVISOR.mul(temp).div(_totalPrimordialMintable))).mul(_startingMultiplier.sub(_endingMultiplier));
			/**
			 * Since _startingMultiplier and _endingMultiplier are in 6 decimals
			 * Need to divide multiplier by _MULTIPLIER_DIVISOR
			 */
			return multiplier.div(_MULTIPLIER_DIVISOR);
		} else {
			return 0;
		}
	}

	/**
	 * @dev Calculate the bonus percentage of network ion on a given lot
	 *		Total Primordial Mintable = T
	 *		Total Primordial Minted = M
	 *		Starting Network Bonus Multiplier = Bs
	 *		Ending Network Bonus Multiplier = Be
	 *		To Purchase = P
	 *		AO Bonus % = B% = (1 - ((M + P/2) / T)) x (Bs-Be)
	 *
	 * @param _purchaseAmount The amount of primordial ion intended to be purchased
	 * @param _totalPrimordialMintable Total Primordial ion intable
	 * @param _totalPrimordialMinted Total Primordial ion minted so far
	 * @param _startingMultiplier The starting Network ion bonus multiplier
	 * @param _endingMultiplier The ending Network ion bonus multiplier
	 * @return The bonus percentage
	 */
	function calculateNetworkBonusPercentage(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.sub(_totalPrimordialMinted)) {
			/**
			 * Let temp = M + (P/2)
			 * B% = (1 - (temp / T)) x (Bs-Be)
			 */
			uint256 temp = _totalPrimordialMinted.add(_purchaseAmount.div(2));

			/**
			 * Multiply B% with _PERCENTAGE_DIVISOR/_PERCENTAGE_DIVISOR to account for 6 decimals
			 * so, B% = (_PERCENTAGE_DIVISOR/_PERCENTAGE_DIVISOR) * (1 - (temp / T)) * (Bs-Be)
			 * B% = ((_PERCENTAGE_DIVISOR * (1 - (temp / T))) * (Bs-Be)) / _PERCENTAGE_DIVISOR
			 * B% = ((_PERCENTAGE_DIVISOR - ((_PERCENTAGE_DIVISOR * temp) / T)) * (Bs-Be)) / _PERCENTAGE_DIVISOR
			 * Take out the division by _PERCENTAGE_DIVISOR for now and include in later calculation
			 * B% = (_PERCENTAGE_DIVISOR - ((_PERCENTAGE_DIVISOR * temp) / T)) * (Bs-Be)
			 * But since Bs and Be are in 6 decimals, need to divide by _PERCENTAGE_DIVISOR
			 * B% = (_PERCENTAGE_DIVISOR - ((_PERCENTAGE_DIVISOR * temp) / T)) * (Bs-Be) / _PERCENTAGE_DIVISOR
			 */
			uint256 bonusPercentage = (_PERCENTAGE_DIVISOR.sub(_PERCENTAGE_DIVISOR.mul(temp).div(_totalPrimordialMintable))).mul(_startingMultiplier.sub(_endingMultiplier)).div(_PERCENTAGE_DIVISOR);
			return bonusPercentage;
		} else {
			return 0;
		}
	}

	/**
	 * @dev Calculate the bonus amount of network ion on a given lot
	 *		AO Bonus Amount = B% x P
	 *
	 * @param _purchaseAmount The amount of primordial ion intended to be purchased
	 * @param _totalPrimordialMintable Total Primordial ion intable
	 * @param _totalPrimordialMinted Total Primordial ion minted so far
	 * @param _startingMultiplier The starting Network ion bonus multiplier
	 * @param _endingMultiplier The ending Network ion bonus multiplier
	 * @return The bonus percentage
	 */
	function calculateNetworkBonusAmount(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {
		uint256 bonusPercentage = calculateNetworkBonusPercentage(_purchaseAmount, _totalPrimordialMintable, _totalPrimordialMinted, _startingMultiplier, _endingMultiplier);
		/**
		 * Since bonusPercentage is in _PERCENTAGE_DIVISOR format, need to divide it with _PERCENTAGE DIVISOR
		 * when calculating the network ion bonus amount
		 */
		uint256 networkBonus = bonusPercentage.mul(_purchaseAmount).div(_PERCENTAGE_DIVISOR);
		return networkBonus;
	}

	/**
	 * @dev Calculate the maximum amount of Primordial an account can burn
	 *		_primordialBalance = P
	 *		_currentWeightedMultiplier = M
	 *		_maximumMultiplier = S
	 *		_amountToBurn = B
	 *		B = ((S x P) - (P x M)) / S
	 *
	 * @param _primordialBalance Account's primordial ion balance
	 * @param _currentWeightedMultiplier Account's current weighted multiplier
	 * @param _maximumMultiplier The maximum multiplier of this account
	 * @return The maximum burn amount
	 */
	function calculateMaximumBurnAmount(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _maximumMultiplier) public pure returns (uint256) {
		return (_maximumMultiplier.mul(_primordialBalance).sub(_primordialBalance.mul(_currentWeightedMultiplier))).div(_maximumMultiplier);
	}

	/**
	 * @dev Calculate the new multiplier after burning primordial ion
	 *		_primordialBalance = P
	 *		_currentWeightedMultiplier = M
	 *		_amountToBurn = B
	 *		_newMultiplier = E
	 *		E = (P x M) / (P - B)
	 *
	 * @param _primordialBalance Account's primordial ion balance
	 * @param _currentWeightedMultiplier Account's current weighted multiplier
	 * @param _amountToBurn The amount of primordial ion to burn
	 * @return The new multiplier
	 */
	function calculateMultiplierAfterBurn(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToBurn) public pure returns (uint256) {
		return _primordialBalance.mul(_currentWeightedMultiplier).div(_primordialBalance.sub(_amountToBurn));
	}

	/**
	 * @dev Calculate the new multiplier after converting network ion to primordial ion
	 *		_primordialBalance = P
	 *		_currentWeightedMultiplier = M
	 *		_amountToConvert = C
	 *		_newMultiplier = E
	 *		E = (P x M) / (P + C)
	 *
	 * @param _primordialBalance Account's primordial ion balance
	 * @param _currentWeightedMultiplier Account's current weighted multiplier
	 * @param _amountToConvert The amount of network ion to convert
	 * @return The new multiplier
	 */
	function calculateMultiplierAfterConversion(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToConvert) public pure returns (uint256) {
		return _primordialBalance.mul(_currentWeightedMultiplier).div(_primordialBalance.add(_amountToConvert));
	}

	/**
	 * @dev count num of digits
	 * @param number uint256 of the nuumber to be checked
	 * @return uint8 num of digits
	 */
	function numDigits(uint256 number) public pure returns (uint8) {
		uint8 digits = 0;
		while(number != 0) {
			number = number.div(10);
			digits++;
		}
		return digits;
	}
}



contract TheAO {
	address public theAO;
	address public nameTAOPositionAddress;

	
	
	mapping (address => bool) public whitelist;

	constructor() public {
		theAO = msg.sender;
	}

	/**
	 * @dev Checks if msg.sender is in whitelist.
	 */
	modifier inWhitelist() {
		require (whitelist[msg.sender] == true);
		_;
	}

	/**
	 * @dev Transfer ownership of The AO to new address
	 * @param _theAO The new address to be transferred
	 */
	function transferOwnership(address _theAO) public {
		require (msg.sender == theAO);
		require (_theAO != address(0));
		theAO = _theAO;
	}

	/**
	 * @dev Whitelist `_account` address to transact on behalf of others
	 * @param _account The address to whitelist
	 * @param _whitelist Either to whitelist or not
	 */
	function setWhitelist(address _account, bool _whitelist) public {
		require (msg.sender == theAO);
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}
}


/**
 * @title TAOCurrency
 */
contract TAOCurrency is TheAO {
	using SafeMath for uint256;

	
	string public name;
	string public symbol;
	uint8 public decimals;

	
	uint256 public powerOfTen;

	uint256 public totalSupply;

	
	
	mapping (address => uint256) public balanceOf;

	
	
	event Transfer(address indexed from, address indexed to, uint256 value);

	
	
	event Burn(address indexed from, uint256 value);

	/**
	 * Constructor function
	 *
	 * Initializes contract with initial supply TAOCurrency to the creator of the contract
	 */
	constructor (string memory _name, string memory _symbol, address _nameTAOPositionAddress) public {
		name = _name;		
		symbol = _symbol;	

		powerOfTen = 0;
		decimals = 0;

		setNameTAOPositionAddress(_nameTAOPositionAddress);
	}

	/**
	 * @dev Checks if the calling contract address is The AO
	 *		OR
	 *		If The AO is set to a Name/TAO, then check if calling address is the Advocate
	 */
	modifier onlyTheAO {
		require (AOLibrary.isTheAO(msg.sender, theAO, nameTAOPositionAddress));
		_;
	}

	/**
	 * @dev Check if `_id` is a Name or a TAO
	 */
	modifier isNameOrTAO(address _id) {
		require (AOLibrary.isName(_id) || AOLibrary.isTAO(_id));
		_;
	}

	/***** The AO ONLY METHODS *****/
	/**
	 * @dev Transfer ownership of The AO to new address
	 * @param _theAO The new address to be transferred
	 */
	function transferOwnership(address _theAO) public onlyTheAO {
		require (_theAO != address(0));
		theAO = _theAO;
	}

	/**
	 * @dev Whitelist `_account` address to transact on behalf of others
	 * @param _account The address to whitelist
	 * @param _whitelist Either to whitelist or not
	 */
	function setWhitelist(address _account, bool _whitelist) public onlyTheAO {
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}

	/**
	 * @dev The AO set the NameTAOPosition Address
	 * @param _nameTAOPositionAddress The address of NameTAOPosition
	 */
	function setNameTAOPositionAddress(address _nameTAOPositionAddress) public onlyTheAO {
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
	}

	/***** PUBLIC METHODS *****/
	/**
	 * @dev transfer TAOCurrency from other address
	 *
	 * Send `_value` TAOCurrency to `_to` in behalf of `_from`
	 *
	 * @param _from The address of the sender
	 * @param _to The address of the recipient
	 * @param _value the amount to send
	 */
	function transferFrom(address _from, address _to, uint256 _value) public inWhitelist isNameOrTAO(_from) isNameOrTAO(_to) returns (bool) {
		_transfer(_from, _to, _value);
		return true;
	}

	/**
	 * @dev Create `mintedAmount` TAOCurrency and send it to `target`
	 * @param target Address to receive TAOCurrency
	 * @param mintedAmount The amount of TAOCurrency it will receive
	 * @return true on success
	 */
	function mint(address target, uint256 mintedAmount) public inWhitelist isNameOrTAO(target) returns (bool) {
		_mint(target, mintedAmount);
		return true;
	}

	/**
	 *
	 * @dev Whitelisted address remove `_value` TAOCurrency from the system irreversibly on behalf of `_from`.
	 *
	 * @param _from the address of the sender
	 * @param _value the amount of money to burn
	 */
	function whitelistBurnFrom(address _from, uint256 _value) public inWhitelist isNameOrTAO(_from) returns (bool success) {
		require(balanceOf[_from] >= _value);                
		balanceOf[_from] = balanceOf[_from].sub(_value);    
		totalSupply = totalSupply.sub(_value);              
		emit Burn(_from, _value);
		return true;
	}

	/***** INTERNAL METHODS *****/
	/**
	 * @dev Send `_value` TAOCurrency from `_from` to `_to`
	 * @param _from The address of sender
	 * @param _to The address of the recipient
	 * @param _value The amount to send
	 */
	function _transfer(address _from, address _to, uint256 _value) internal {
		require (_to != address(0));							
		require (balanceOf[_from] >= _value);					
		require (balanceOf[_to].add(_value) >= balanceOf[_to]); 
		uint256 previousBalances = balanceOf[_from].add(balanceOf[_to]);
		balanceOf[_from] = balanceOf[_from].sub(_value);        
		balanceOf[_to] = balanceOf[_to].add(_value);            
		emit Transfer(_from, _to, _value);
		assert(balanceOf[_from].add(balanceOf[_to]) == previousBalances);
	}

	/**
	 * @dev Create `mintedAmount` TAOCurrency and send it to `target`
	 * @param target Address to receive TAOCurrency
	 * @param mintedAmount The amount of TAOCurrency it will receive
	 */
	function _mint(address target, uint256 mintedAmount) internal {
		balanceOf[target] = balanceOf[target].add(mintedAmount);
		totalSupply = totalSupply.add(mintedAmount);
		emit Transfer(address(0), address(this), mintedAmount);
		emit Transfer(address(this), target, mintedAmount);
	}
}


contract EthosPeta is TAOCurrency {
	/**
	 * @dev Constructor function
	 */
	constructor(string memory _name, string memory _symbol, address _nameTAOPositionAddress)
		TAOCurrency(_name, _symbol, _nameTAOPositionAddress) public {
		powerOfTen = 15;
		decimals = 15;
	}
}