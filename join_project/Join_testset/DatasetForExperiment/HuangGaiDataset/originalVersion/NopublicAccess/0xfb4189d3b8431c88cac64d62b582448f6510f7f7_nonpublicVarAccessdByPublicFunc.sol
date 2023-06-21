pragma solidity 0.5.7;


contract Ownable {
    address internal owner;
    address internal pendingOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Modifier throws if called by any account other than the pendingOwner.
     */
    modifier onlyPendingOwner() {
        require(msg.sender == pendingOwner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Allows the current owner to set the pendingOwner address.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner public {
        pendingOwner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Allows the pendingOwner address to finalize the transfer.
     */
    function claimOwnership() onlyPendingOwner public {
        emit OwnershipTransferred(owner, pendingOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        owner = pendingOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pendingOwner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}


contract FastnFurious is Ownable {
    using SafeMath for uint;
    
    // round => winner
    mapping(uint => address payable) internal winners;
    
    // round => gain
    mapping(uint => uint) internal balances;
    
    uint internal minBet = 0.1 ether; // 0.1 ether;
    
    uint internal startTime = 1554076800; // 04.01.2019 00:00:00
    uint internal roundTime = 60; // 1 min in sec
    
    address payable internal wallet;
    address payable internal jackpot;
    
    uint internal pool;
    
    uint internal walletPercent = 20;
    uint internal nextRoundPercent = 15;
    uint internal jackpotPercent = 15;
    uint internal lastRound;
        
    constructor (address payable _wallet, address payable _jackpot) public {
        require(_wallet != address(0));
        require(_jackpot != address(0));
        
    	wallet = _wallet;
    	jackpot = _jackpot;  
    }
    
    function () external payable {
        require(gasleft() > 150000);
        setBet(msg.sender);
    }
    
    function setBet(address payable _player) public payable {
        require(msg.value >= minBet);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint currentRound = getCurrentRound();
        
        if (currentRound > 1 && balances[currentRound] == 0) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint gain = balances[lastRound];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	balances[lastRound] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	balances[currentRound] = balances[currentRound].add(pool);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	pool = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
            address payable winner = getWinner(lastRound); 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            winner.transfer(gain);
        }
        
        lastRound = currentRound;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint amount = msg.value;
        uint toWallet = amount.mul(walletPercent).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint toNextRound = amount.mul(nextRoundPercent).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint toJackpot = amount.mul(jackpotPercent).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        winners[currentRound] = _player;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[currentRound] = balances[currentRound].add(amount).sub(toWallet).sub(toNextRound).sub(toJackpot);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pool = pool.add(toNextRound);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        jackpot.transfer(toJackpot);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        wallet.transfer(toWallet);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getWinner(uint _round) public view returns (address payable) {
        if (winners[_round] != address(0)) return winners[_round];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        else return wallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function changeRoundTime(uint _time) onlyOwner public {
        roundTime = _time;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function changeStartTime(uint _time) onlyOwner public {
        startTime = _time;    	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function changeWallet(address payable _wallet) onlyOwner public {
        wallet = _wallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function changeJackpot(address payable _jackpot) onlyOwner public {
        jackpot = _jackpot;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function changeMinimalBet(uint _minBet) onlyOwner public {
        minBet = _minBet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function changePercents(uint _toWinner, uint _toNextRound, uint _toWallet, uint _toJackPot) onlyOwner public {
        uint total = _toWinner.add(_toNextRound).add(_toWallet).add(_toJackPot);
        require(total == 100);
        
        walletPercent = _toWallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        nextRoundPercent = _toNextRound;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        jackpotPercent = _toJackPot;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getCurrentRound() public view returns (uint) {
        return now.sub(startTime).div(roundTime).add(1); // start round is 1	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getPreviosRound() public view returns (uint) {
        return getCurrentRound().sub(1);    
    }
    
    function getRoundBalance(uint _round) public view returns (uint) {
        return balances[_round];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getRoundByTime(uint _time) public view returns (uint) {
        return _time.sub(startTime).div(roundTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
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
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}