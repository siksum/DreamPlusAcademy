pragma solidity ^ 0.4 .16;
/* 111111111111 */
contract owned {

	address public owner;

	constructor() public {
		owner = msg.sender;
	}

	/* 1111 */
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}

	/* 11111111 onlyOwner1111111111111 */
	function transferOwnership(address newOwner) onlyOwner public {
		owner = newOwner;
	}
}

/* receiveApproval1111111111111111111111111111111111111111 */
contract tokenRecipient {
	function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public;
}

contract TokenERC20 {
	// 1111
	string public name; //1111
	string public symbol; //1111
	uint8 public decimals = 18; //11111111 181111 111111

	uint256 public totalSupply; //1111

	// 11111111111
	mapping(address => uint256) public balanceOf;

	// A1111B1111
	mapping(address => mapping(address => uint256)) public allowance;

	// 111111
	event Transfer(address indexed from, address indexed to, uint256 value);

	// 11111111
	event Burn(address indexed from, uint256 value);

	/* 1111 */
	constructor(
		uint256 initialSupply,
		string tokenName,
		string tokenSymbol
	) public {
		totalSupply = initialSupply * 10 ** uint256(decimals); // 11decimals1111111
		balanceOf[msg.sender] = totalSupply; // 11111111111
		name = tokenName; // 1111111
		symbol = tokenSymbol; // 1111111
	}

	/* 1111111 */
	function _transfer(address _from, address _to, uint _value) internal {
		// 111110x01 1burn111111
		require(_to != 0x0);
		// 1111111111111
		//require(canOf[_from] >= _value);

		require(balanceOf[_from] >= _value);

		// 111111111111111
		require(balanceOf[_to] + _value > balanceOf[_to]);
		// 11111111111 1111111111
		uint previousBalances = balanceOf[_from] + balanceOf[_to];

		// 1111111
		balanceOf[_from] -= _value;

		// 11111111
		balanceOf[_to] += _value;

		emit Transfer(_from, _to, _value);
		// 11111 11111
		assert(balanceOf[_from] + balanceOf[_to] == previousBalances);

	}

	/* 11tokens */
	function transfer(address _to, uint256 _value) public {
		_transfer(msg.sender, _to, _value);
	}

	/* 111111111 */
	function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
		require(_value <= allowance[_from][msg.sender]); // Check allowance
		allowance[_from][msg.sender] -= _value;
		_transfer(_from, _to, _value);
		return true;
	}

	/*  11111111111111111111transferFrom()1111111111111 */
	function approve(address _spender, uint256 _value) public
	returns(bool success) {
		allowance[msg.sender][_spender] = _value;
		return true;
	}

	/*
	1111111111 111
	111111111, 1111111111receiveApproval, 1111111111111111111111111111111111111111transferFrom)
	*/

	function approveAndCall(address _spender, uint256 _value, bytes _extraData)
	public
	returns(bool success) {
		tokenRecipient spender = tokenRecipient(_spender);
		if(approve(_spender, _value)) {
			spender.receiveApproval(msg.sender, _value, this, _extraData);
			return true;
		}
	}

	/**
	 * 1111
	 */
	function burn(uint256 _value) public returns(bool success) {
		require(balanceOf[msg.sender] >= _value); // Check if the sender has enough
		balanceOf[msg.sender] -= _value; // Subtract from the sender
		totalSupply -= _value; // Updates totalSupply
		emit Burn(msg.sender, _value);
		return true;
	}

	/**
	 * 111111111
	 */
	function burnFrom(address _from, uint256 _value) public returns(bool success) {
		require(balanceOf[_from] >= _value); // Check if the targeted balance is enough
		require(_value <= allowance[_from][msg.sender]); // Check allowance
		balanceOf[_from] -= _value; // Subtract from the targeted balance
		allowance[_from][msg.sender] -= _value; // Subtract from the sender's allowance
		totalSupply -= _value; // Update totalSupply
		emit Burn(_from, _value);
		return true;
	}
}

/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract BTYCT is owned, TokenERC20 {

	uint256 public totalSupply; //1111
	uint256 public decimals = 18; //1111111
	uint256 public sellPrice = 510; //1111 111111111 /1000
	uint256 public buyPrice =  526; //1111 11111111111 /1000
	uint256 public sysPrice = 766 * 10 ** uint256(decimals); //111111
	uint256 public sysPer = 225; //11111111 /100
	
	//uint256 public onceOuttime = 86400; //11111 11 
	//uint256 public onceAddTime = 864000; //11111 11
	//uint256 public onceoutTimePer = 8640000; //111111 11
	
	uint256 public onceOuttime = 120; //11111 11  
	uint256 public onceAddTime = 600; //11111 11
	uint256 public onceoutTimePer = 12000; //111111 11

	/* 1111 */
	mapping(address => bool) public frozenAccount;
	// 11111111111
	mapping(address => uint256) public freezeOf;
	// 11111111111
	mapping(address => uint256) public canOf;
	// 11111111111
	mapping(address => uint) public cronoutOf;
	// 11111111111
	mapping(address => uint) public cronaddOf;

	/* 11 */
	event FrozenFunds(address target, bool frozen);
	//event Logs (string);
	/* 1111 */

	function BTYCT(
		uint256 initialSupply,
		string tokenName,
		string tokenSymbol
	) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}

	/* 111 1111111111 */
	function _transfer(address _from, address _to, uint _value) internal {
		require(_to != 0x0); // Prevent transfer to 0x0 address. Use burn() instead
		require(canOf[_from] >= _value);
		require(balanceOf[_from] >= _value); // Check if the sender has enough

		require(balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
		require(!frozenAccount[_from]); // Check if sender is frozen
		require(!frozenAccount[_to]); // Check if recipient is frozen

		//11 
		if(cronaddOf[_from] < 1) {
			cronaddOf[_from] = now + onceAddTime;
		}
		if(cronaddOf[_to] < 1) {
			cronaddOf[_to] = now + onceAddTime;
		}
		//11 
		if(cronoutOf[_to] < 1) {
			cronoutOf[_to] = now + onceOuttime;
		}
		if(cronoutOf[_to] < 1) {
			cronoutOf[_to] = now + onceOuttime;
		}
		//if(freezeOf[_from] > 0) {
		uint lefttime = now - cronoutOf[_from];
		if(lefttime > onceOuttime) {
			uint leftper = lefttime / onceoutTimePer;
			if(leftper > 1) {
				leftper = 1;
			}
			canOf[_from] = balanceOf[_from] * leftper;
			freezeOf[_from] = balanceOf[_from] - canOf[_from];
			cronoutOf[_from] = now + onceOuttime;
		}

		
		uint lefttimes = now - cronoutOf[_to];
		if(lefttimes >= onceOuttime) {
			uint leftpers = lefttime / onceoutTimePer;
			if(leftpers > 1) {
				leftpers = 1;
			}
			canOf[_to] = balanceOf[_to] * leftpers;
			freezeOf[_to] = balanceOf[_to] - canOf[_to];
			cronoutOf[_to] = now + onceOuttime;
		}
	

		balanceOf[_from] -= _value; // Subtract from the sender
		balanceOf[_to] += _value;
		//1111

		canOf[_from] -= _value;
		freezeOf[_from] = balanceOf[_from] - canOf[_from];

		//1111 
		freezeOf[_to] += _value;
		canOf[_to] = balanceOf[_to] - freezeOf[_to];

		emit Transfer(_from, _to, _value);
	}

	//111111
	function getcan(address target) public returns (uint256 _value) {
	    if(cronoutOf[target] < 1) {
	        _value = 0;
	    }else{
	        uint lefttime = now - cronoutOf[target];
	        uint leftnum = lefttime/onceoutTimePer;
	        if(leftnum > 1){
	            leftnum = 1;
	        }
	        _value = balanceOf[target]*leftnum;
	    }
	}
	
	/// 111111111
	function mintToken(address target, uint256 mintedAmount) onlyOwner public {
		require(!frozenAccount[target]);
		balanceOf[target] += mintedAmount;
		balanceOf[this] -= mintedAmount;
		
		cronoutOf[target] = now + onceOuttime;
		cronaddOf[target] = now + onceAddTime;
		freezeOf[target] = balanceOf[target] + mintedAmount;
		
		emit Transfer(0, this, mintedAmount);
		emit Transfer(this, target, mintedAmount);

	}
	//11111011111
	function mint() public {
		require(!frozenAccount[msg.sender]);
		require(cronaddOf[msg.sender] > 0 && now > cronaddOf[msg.sender] && balanceOf[msg.sender] >= sysPrice);
		uint256 mintAmount = balanceOf[msg.sender] * sysPer / 10000;
		balanceOf[msg.sender] += mintAmount;
		balanceOf[this] -= mintAmount;
		
		freezeOf[msg.sender] = balanceOf[msg.sender] + mintAmount;
		cronaddOf[msg.sender] = now + onceAddTime;
		
		emit Transfer(0, this, mintAmount);
		emit Transfer(this, msg.sender, mintAmount);

	}

	/// 11 or 1111
	function freezeAccount(address target, bool freeze) onlyOwner public {
		frozenAccount[target] = freeze;
		emit FrozenFunds(target, freeze);
	}
	// 11111111
	function setPrices(uint256 newSellPrice, uint256 newBuyPrice) onlyOwner public {
		sellPrice = newSellPrice;
		buyPrice = newBuyPrice;

	}
	//111111
	function setmyPrice(uint256 systyPrice, uint256 sysPermit) onlyOwner public {
		sysPrice = systyPrice;
		sysPer = sysPermit;
	}
	// 11
	function buy() payable public returns(uint256 amount) {
	    require(!frozenAccount[msg.sender]);
		require(buyPrice > 0 && msg.value > buyPrice); // Avoid dividing 0, sending small amounts and spam
		amount = msg.value / (buyPrice/1000); // Calculate the amount of Dentacoins
		require(balanceOf[this] >= amount); // checks if it has enough to sell
		balanceOf[msg.sender] += amount; // adds the amount to buyer's balance
		balanceOf[this] -= amount; // subtracts amount from seller's balance
		emit Transfer(this, msg.sender, amount); // execute an event reflecting the change
		return amount; // ends function and returns
	}

	// 11
	function sell(uint256 amount) public returns(uint revenue) {
	    require(!frozenAccount[msg.sender]);
		require(sellPrice > 0); // Avoid selling and spam
		require(balanceOf[msg.sender] >= amount); // checks if the sender has enough to sell
		if(cronoutOf[msg.sender] < 1) {
			cronoutOf[msg.sender] = now + onceOuttime;
		}
		uint lefttime = now - cronoutOf[msg.sender];
		if(lefttime > onceOuttime) {
			uint leftper = lefttime / onceoutTimePer;
			if(leftper > 1) {
				leftper = 1;
			}
			canOf[msg.sender] = balanceOf[msg.sender] * leftper;
			freezeOf[msg.sender] = balanceOf[msg.sender] - canOf[msg.sender];
			cronoutOf[msg.sender] = now + onceOuttime;
		}
		require(canOf[msg.sender] >= amount);
		balanceOf[this] += amount; // adds the amount to owner's balance
		balanceOf[msg.sender] -= amount; // subtracts the amount from seller's balance
		revenue = amount * sellPrice/1000;
		require(msg.sender.send(revenue)); // sends ether to the seller: it's important to do this last to prevent recursion attacks
		emit Transfer(msg.sender, this, amount); // executes an event reflecting on the change
		return revenue;

	}

}