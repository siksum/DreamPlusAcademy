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


interface INameAccountRecovery {
	function isCompromised(address _id) external view returns (bool);
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


interface INameFactory {
	function nonces(address _nameId) external view returns (uint256);
	function incrementNonce(address _nameId) external returns (uint256);
	function ethAddressToNameId(address _ethAddress) external view returns (address);
	function setNameNewAddress(address _id, address _newAddress) external returns (bool);
	function nameIdToEthAddress(address _nameId) external view returns (address);
}


interface ITAOFactory {
	function nonces(address _taoId) external view returns (uint256);
	function incrementNonce(address _taoId) external returns (uint256);
}


interface ITAOAncestry {
	function initialize(address _id, address _parentId, uint256 _childMinLogos) external returns (bool);

	function getAncestryById(address _id) external view returns (address, uint256, uint256);

	function addChild(address _taoId, address _childId) external returns (bool);

	function isChild(address _taoId, address _childId) external view returns (bool);
}













contract TokenERC20 {
	
	string public name;
	string public symbol;
	uint8 public decimals = 18;
	
	uint256 public totalSupply;

	
	mapping (address => uint256) public balanceOf;
	mapping (address => mapping (address => uint256)) public allowance;

	
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

	event Transfer(address indexed from, address indexed to, uint256 value);

	
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

	event Approval(address indexed _owner, address indexed _spender, uint256 _value);

	
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

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
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
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
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
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
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
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
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
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
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
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
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
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
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
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
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
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
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
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
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
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
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
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
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
}






/**
 * @title TAOController
 */
contract TAOController is TheAO {
	address public nameFactoryAddress;
	address public nameAccountRecoveryAddress;

	INameFactory internal _nameFactory;
	INameTAOPosition internal _nameTAOPosition;
	INameAccountRecovery internal _nameAccountRecovery;

	/**
	 * @dev Constructor function
	 */
	constructor(address _nameFactoryAddress) public {
		setNameFactoryAddress(_nameFactoryAddress);
	}
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
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
	 * @dev Check if `_taoId` is a TAO
	 */
	modifier isTAO(address _taoId) {
		require (AOLibrary.isTAO(_taoId));
		_;
	}

	/**
	 * @dev Check if `_nameId` is a Name
	 */
	modifier isName(address _nameId) {
		require (AOLibrary.isName(_nameId));
		_;
	}

	/**
	 * @dev Check if `_id` is a Name or a TAO
	 */
	modifier isNameOrTAO(address _id) {
		require (AOLibrary.isName(_id) || AOLibrary.isTAO(_id));
		_;
	}

	/**
	 * @dev Check is msg.sender address is a Name
	 */
	 modifier senderIsName() {
		require (_nameFactory.ethAddressToNameId(msg.sender) != address(0));
		_;
	 }

	/**
	 * @dev Check if msg.sender is the current advocate of TAO ID
	 */
	modifier onlyAdvocate(address _id) {
		require (_nameTAOPosition.senderIsAdvocate(msg.sender, _id));
		_;
	}

	/**
	 * @dev Only allowed if sender's Name is not compromised
	 */
	modifier senderNameNotCompromised() {
		require (!_nameAccountRecovery.isCompromised(_nameFactory.ethAddressToNameId(msg.sender)));
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
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
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
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

	/**
	 * @dev The AO sets NameFactory address
	 * @param _nameFactoryAddress The address of NameFactory
	 */
	function setNameFactoryAddress(address _nameFactoryAddress) public onlyTheAO {
		require (_nameFactoryAddress != address(0));
		nameFactoryAddress = _nameFactoryAddress;
		_nameFactory = INameFactory(_nameFactoryAddress);
	}
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

	/**
	 * @dev The AO sets NameTAOPosition address
	 * @param _nameTAOPositionAddress The address of NameTAOPosition
	 */
	function setNameTAOPositionAddress(address _nameTAOPositionAddress) public onlyTheAO {
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
		_nameTAOPosition = INameTAOPosition(_nameTAOPositionAddress);
	}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

	/**
	 * @dev The AO set the NameAccountRecovery Address
	 * @param _nameAccountRecoveryAddress The address of NameAccountRecovery
	 */
	function setNameAccountRecoveryAddress(address _nameAccountRecoveryAddress) public onlyTheAO {
		require (_nameAccountRecoveryAddress != address(0));
		nameAccountRecoveryAddress = _nameAccountRecoveryAddress;
		_nameAccountRecovery = INameAccountRecovery(nameAccountRecoveryAddress);
	}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
}




/**
 * @title TAOAncestry
 */
contract TAOAncestry is TAOController, ITAOAncestry {
	using SafeMath for uint256;

	address public taoFactoryAddress;

	ITAOFactory internal _taoFactory;

	struct Child {
		address taoId;
		bool approved;		
		bool connected;		
	}

	struct Ancestry {
		address taoId;
		address parentId;	
		uint256 childMinLogos;
		mapping (uint256 => Child) children;
		mapping (address => uint256) childInternalIdLookup;
		uint256 totalChildren;
		uint256 childInternalId;
	}

	mapping (address => Ancestry) internal ancestries;

	
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

	event UpdateChildMinLogos(address indexed taoId, uint256 childMinLogos, uint256 nonce);

	
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

	event AddChild(address indexed taoId, address taoAdvocate, address childId, address childAdvocate, bool approved, bool connected);

	
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

	event ApproveChild(address indexed taoId, address taoAdvocate, address childId, address childAdvocate, uint256 nonce);

	
        require(tx.origin == owner_txorigin32);
    }

	event RemoveChild(address indexed taoId, address taoAdvocate, address childId, address childAdvocate, uint256 nonce);

	/**
	 * @dev Constructor function
	 */
	constructor(address _nameFactoryAddress, address _taoFactoryAddress, address _nameTAOPositionAddress)
		TAOController(_nameFactoryAddress) public {
		setTAOFactoryAddress(_taoFactoryAddress);
		setNameTAOPositionAddress(_nameTAOPositionAddress);
	}
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

	/**
	 * @dev Check if calling address is Factory
	 */
	modifier onlyFactory {
		require (msg.sender == taoFactoryAddress);
		_;
	}

	/***** The AO ONLY METHODS *****/
	/**
	 * @dev The AO set the TAOFactory Address
	 * @param _taoFactoryAddress The address of TAOFactory
	 */
	function setTAOFactoryAddress(address _taoFactoryAddress) public onlyTheAO {
		require (_taoFactoryAddress != address(0));
		taoFactoryAddress = _taoFactoryAddress;
		_taoFactory = ITAOFactory(_taoFactoryAddress);
	}
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

	/***** PUBLIC METHODS *****/
	/**
	 * @dev Check whether or not a TAO ID exist in the list of ancestries
	 * @param _id The ID to be checked
	 * @return true if yes, false otherwise
	 */
	function isExist(address _id) public view returns (bool) {
		return ancestries[_id].taoId != address(0);
	}
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

	/**
	 * @dev Store the Ancestry info for a TAO
	 * @param _id The ID of the TAO
	 * @param _parentId The parent ID of this TAO
	 * @param _childMinLogos The min required Logos to create a TAO
	 * @return true on success
	 */
	function initialize(address _id, address _parentId, uint256 _childMinLogos)
		external
		isTAO(_id)
		isNameOrTAO(_parentId)
		onlyFactory returns (bool) {
		require (!isExist(_id));

		Ancestry storage _ancestry = ancestries[_id];
		_ancestry.taoId = _id;
		_ancestry.parentId = _parentId;
		_ancestry.childMinLogos = _childMinLogos;
		return true;
	}
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

	/**
	 * @dev Get Ancestry info given a TAO ID
	 * @param _id The ID of the TAO
	 * @return the parent ID of this TAO (could be a Name/TAO)
	 * @return the min required Logos to create a child TAO
	 * @return the total child TAOs count
	 */
	function getAncestryById(address _id) external view returns (address, uint256, uint256) {
		require (isExist(_id));
		Ancestry memory _ancestry = ancestries[_id];
		return (
			_ancestry.parentId,
			_ancestry.childMinLogos,
			_ancestry.totalChildren
		);
	}
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

	/**
	 * @dev Set min required Logos to create a child from this TAO
	 * @param _childMinLogos The min Logos to set
	 * @return the nonce for this transaction
	 */
	function updateChildMinLogos(address _id, uint256 _childMinLogos)
		public
		isTAO(_id)
		senderIsName
		senderNameNotCompromised
		onlyAdvocate(_id) {
		require (isExist(_id));

		Ancestry storage _ancestry = ancestries[_id];
		_ancestry.childMinLogos = _childMinLogos;

		uint256 _nonce = _taoFactory.incrementNonce(_id);
		require (_nonce > 0);
		emit UpdateChildMinLogos(_id, _ancestry.childMinLogos, _nonce);
	}
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * @dev Check if `_childId` is a child TAO of `_taoId`
	 * @param _taoId The TAO ID to be checked
	 * @param _childId The child TAO ID to check
	 * @return true if yes. Otherwise return false.
	 */
	function isChild(address _taoId, address _childId) external view returns (bool) {
		require (isExist(_taoId) && isExist(_childId));
		Ancestry storage _ancestry = ancestries[_taoId];
		Ancestry memory _childAncestry = ancestries[_childId];
		uint256 _childInternalId = _ancestry.childInternalIdLookup[_childId];
		return (
			_childInternalId > 0 &&
			_ancestry.children[_childInternalId].approved &&
			_ancestry.children[_childInternalId].connected &&
			_childAncestry.parentId == _taoId
		);
	}
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

	/**
	 * @dev Check if `_childId` is a child TAO of `_taoId` that is not yet approved
	 * @param _taoId The TAO ID to be checked
	 * @param _childId The child TAO ID to check
	 * @return true if yes. Otherwise return false.
	 */
	function isNotApprovedChild(address _taoId, address _childId) public view returns (bool) {
		require (isExist(_taoId) && isExist(_childId));
		Ancestry storage _ancestry = ancestries[_taoId];
		uint256 _childInternalId = _ancestry.childInternalIdLookup[_childId];
		return (
			_childInternalId > 0 &&
			!_ancestry.children[_childInternalId].approved &&
			!_ancestry.children[_childInternalId].connected
		);
	}
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

	/**
	 * @dev Add child TAO
	 * @param _taoId The TAO ID to be added to
	 * @param _childId The ID to be added to as child TAO
	 */
	function addChild(address _taoId, address _childId)
		external
		isTAO(_taoId)
		isTAO(_childId)
		onlyFactory returns (bool) {
		require (!this.isChild(_taoId, _childId));
		Ancestry storage _ancestry = ancestries[_taoId];
		require (_ancestry.childInternalIdLookup[_childId] == 0);

		_ancestry.childInternalId++;
		_ancestry.childInternalIdLookup[_childId] = _ancestry.childInternalId;

		Child storage _child = _ancestry.children[_ancestry.childInternalId];
		_child.taoId = _childId;

		
		
		address _taoAdvocate = _nameTAOPosition.getAdvocate(_taoId);
		address _childAdvocate = _nameTAOPosition.getAdvocate(_childId);
		emit AddChild(_taoId, _taoAdvocate, _childId, _childAdvocate, _child.approved, _child.connected);

		if (_taoAdvocate == _childAdvocate) {
			_approveChild(_taoId, _childId);
		}
		return true;
	}
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

	/**
	 * @dev Advocate of `_taoId` approves child `_childId`
	 * @param _taoId The TAO ID to be checked
	 * @param _childId The child TAO ID to be approved
	 */
	function approveChild(address _taoId, address _childId)
		public
		isTAO(_taoId)
		isTAO(_childId)
		senderIsName
		senderNameNotCompromised
		onlyAdvocate(_taoId) {
		require (isExist(_taoId) && isExist(_childId));
		require (isNotApprovedChild(_taoId, _childId));
		_approveChild(_taoId, _childId);
	}
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

	/**
	 * @dev Advocate of `_taoId` removes child `_childId`
	 * @param _taoId The TAO ID to be checked
	 * @param _childId The child TAO ID to be removed
	 */
	function removeChild(address _taoId, address _childId)
		public
		isTAO(_taoId)
		isTAO(_childId)
		senderIsName
		senderNameNotCompromised
		onlyAdvocate(_taoId) {
		require (this.isChild(_taoId, _childId));

		Ancestry storage _ancestry = ancestries[_taoId];
		_ancestry.totalChildren--;

		Child storage _child = _ancestry.children[_ancestry.childInternalIdLookup[_childId]];
		_child.connected = false;
		_ancestry.childInternalIdLookup[_childId] = 0;

		Ancestry storage _childAncestry = ancestries[_childId];
		_childAncestry.parentId = address(0);

		uint256 _nonce = _taoFactory.incrementNonce(_taoId);
		require (_nonce > 0);

		address _taoAdvocate = _nameTAOPosition.getAdvocate(_taoId);
		address _childAdvocate = _nameTAOPosition.getAdvocate(_childId);
		emit RemoveChild(_taoId, _taoAdvocate, _childId, _childAdvocate, _nonce);
	}
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

	/**
	 * @dev Get list of child TAO IDs
	 * @param _taoId The TAO ID to be checked
	 * @param _from The starting index (start from 1)
	 * @param _to The ending index, (max is childInternalId)
	 * @return list of child TAO IDs
	 */
	function getChildIds(address _taoId, uint256 _from, uint256 _to) public view returns (address[] memory) {
		require (isExist(_taoId));
		Ancestry storage _ancestry = ancestries[_taoId];
		require (_from >= 1 && _to >= _from && _ancestry.childInternalId >= _to);
		address[] memory _childIds = new address[](_to.sub(_from).add(1));
		for (uint256 i = _from; i <= _to; i++) {
			_childIds[i.sub(_from)] = _ancestry.children[i].approved && _ancestry.children[i].connected ? _ancestry.children[i].taoId : address(0);
		}
		return _childIds;
	}

	/***** INTERNAL METHOD *****/
	/**
	 * @dev Actually approving the child TAO
	 * @param _taoId The TAO ID to be checked
	 * @param _childId The child TAO ID to be approved
	 */
	function _approveChild(address _taoId, address _childId) internal {
		Ancestry storage _ancestry = ancestries[_taoId];
		Ancestry storage _childAncestry = ancestries[_childId];
		uint256 _childInternalId = _ancestry.childInternalIdLookup[_childId];

		_ancestry.totalChildren++;

		Child storage _child = _ancestry.children[_childInternalId];
		_child.approved = true;
		_child.connected = true;

		_childAncestry.parentId = _taoId;

		uint256 _nonce = _taoFactory.incrementNonce(_taoId);
		require (_nonce > 0);

		address _taoAdvocate = _nameTAOPosition.getAdvocate(_taoId);
		address _childAdvocate = _nameTAOPosition.getAdvocate(_childId);
		emit ApproveChild(_taoId, _taoAdvocate, _childId, _childAdvocate, _nonce);
	}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
}