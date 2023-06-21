pragma solidity ^0.5.7;	
/** 
 _____                   __  __      ______      ____                 ____       ______      ______   
/\  __`\     /'\_/`\    /\ \/\ \    /\__  _\    /\  _`\              /\  _`\    /\__  _\    /\__  _\  
\ \ \/\ \   /\      \   \ \ `\\ \   \/_/\ \/    \ \,\L\_\            \ \ \L\ \  \/_/\ \/    \/_/\ \/  
 \ \ \ \ \  \ \ \__\ \   \ \ , ` \     \ \ \     \/_\__ \    _______  \ \  _ <'    \ \ \       \ \ \  
  \ \ \_\ \  \ \ \_/\ \   \ \ \`\ \     \_\ \__    /\ \L\ \ /\______\  \ \ \L\ \    \_\ \__     \ \ \ 
   \ \_____\  \ \_\\ \_\   \ \_\ \_\    /\_____\   \ `\____\\/______/   \ \____/    /\_____\     \ \_\
    \/_____/   \/_/ \/_/    \/_/\/_/    \/_____/    \/_____/             \/___/     \/_____/      \/_/

    WEBSITE: www.omnis-bit.com


    This contract's staking features are based on the code provided at
    https:

    SafeMath Library provided by OpenZeppelin
    https:

    TODO: Third Party Audit
    
    Contract Developed and Designed by StartBlock for the Omnis-Bit Team
    Contract Writer: Fares A. Akel C.
    Service Provider Contact: info@startblock.tech
 */

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

/**
 * @title Admined
 * @dev The Admined contract has an owner address, can set administrators,
 * and provides authorization control functions. These features can be used in other contracts
 * through interfacing, so external contracts can check main contract admin levels
 */
contract Admined {
    address public owner; 
    mapping(address => uint256) public level;

    /**
     * @dev The Admined constructor sets the original `owner` of the contract to the sender
     * account and assing high level privileges.
     */
    constructor() public {
        owner = msg.sender;
        level[owner] = 3;
        emit OwnerSet(owner);
        emit LevelSet(owner, level[owner]);
    }

    /**
     * @dev Throws if called by any account with lower level than minLvl.
     * @param _minLvl Minimum level to use the function
     */
    modifier onlyAdmin(uint256 _minLvl) {
        require(level[msg.sender] >= _minLvl, 'You do not have privileges for this transaction');
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyAdmin(3) public {
        require(newOwner != address(0), 'Address cannot be zero');

        owner = newOwner;
        level[owner] = 3;

        emit OwnerSet(owner);
        emit LevelSet(owner, level[owner]);

        level[msg.sender] = 0;
        emit LevelSet(msg.sender, level[msg.sender]);
    }

    /**
     * @dev Allows the assignment of new privileges to a new address.
     * @param userAddress The address to transfer ownership to.
     * @param lvl Lvl to assign.
     */
    function setLevel(address userAddress, uint256 lvl) onlyAdmin(2) public {
        require(userAddress != address(0), 'Address cannot be zero');
        require(lvl < level[msg.sender], 'You do not have privileges for this level assignment');

        level[userAddress] = lvl;
        emit LevelSet(userAddress, level[userAddress]);
    }

    event LevelSet(address indexed user, uint256 lvl);
    event OwnerSet(address indexed user);

}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https:
 */
contract ERC20Basic {
    uint256 public totalSupply;

    function balanceOf(address who) public view returns(uint256);

    function transfer(address to, uint256 value) public returns(bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https:
 */
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns(uint256);

    function transferFrom(address from, address to, uint256 value) public returns(bool);

    function approve(address spender, uint256 value) public returns(bool);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract StakerToken {
    uint256 public stakeStartTime;
    uint256 public stakeMinAge;
    uint256 public stakeMaxAge;

    function claimStake() public returns(bool);

    function coinAge() public view returns(uint256);

    function annualInterest() public view returns(uint256);
}

contract OMNIS is ERC20, StakerToken, Admined {
    using SafeMath
    for uint256;
    ///////////////////////////////////////////////////////////////////
    
    string public name = "OMNIS-BIT";
    string public symbol = "OMNIS";
    string public version = "v3";
    uint8 public decimals = 18;

    uint public totalSupply;
    uint public maxTotalSupply;
    uint public totalInitialSupply;
    bool public globalBalancesFreeze; 

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;
    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    struct Airdrop {
        uint value;
        bool claimed;
    }

    address public airdropWallet;

    mapping(address => Airdrop) public airdrops; 
    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    enum PaymentStatus {
        Requested,
        Rejected,
        Pending,
        Completed,
        Refunded
    }

    struct Payment {
        address provider;
        address customer;
        uint value;
        string comment;
        PaymentStatus status;
        bool refundApproved;
    }

    uint escrowCounter;
    uint public escrowFeePercent = 5; 
    bool public escrowEnabled = true;

    /**
     * @dev Throws if escrow is disabled.
     */
    modifier escrowIsEnabled() {
        require(escrowEnabled == true, 'Escrow is Disabled');
        _;
    }

    mapping(uint => Payment) public payments;
    address public collectionAddress;
    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    struct transferInStruct {
        uint128 amount;
        uint64 time;
    }

    uint public chainStartTime;
    uint public chainStartBlockNumber;
    uint public stakeStartTime;
    uint public stakeMinAge = 3 days;
    uint public stakeMaxAge = 90 days;

    mapping(address => bool) public userFreeze;

    mapping(address => transferInStruct[]) transferIns;

    modifier canPoSclaimStake() {
        require(totalSupply < maxTotalSupply, 'Max supply reached');
        _;
    }
    
    ///////////////////////////////////////////////////////////////////

    /**
     * @dev Throws if any frozen is applied.
     * @param _holderWallet Address of the actual token holder
     */
    modifier notFrozen(address _holderWallet) {
        require(globalBalancesFreeze == false, 'Balances are globally frozen');
        require(userFreeze[_holderWallet] == false, 'Balance frozen by the user');
        _;
    }

    ///////////////////////////////////////////////////////////////////
    
    event ClaimStake(address indexed _address, uint _reward);
    event NewCollectionWallet(address newWallet);

    event ClaimDrop(address indexed user, uint value);
    event NewAirdropWallet(address newWallet);

    event GlobalFreeze(bool status);

    event EscrowLock(bool status);
    event NewFeeRate(uint newFee);
    event PaymentCreation(
        uint indexed orderId,
        address indexed provider,
        address indexed customer,
        uint value,
        string description
    );
    event PaymentUpdate(
        uint indexed orderId,
        address indexed provider,
        address indexed customer,
        uint value,
        PaymentStatus status
    );
    event PaymentRefundApprove(
        uint indexed orderId,
        address indexed provider,
        address indexed customer,
        bool status
    );
    ///////////////////////////////////////////////////////////////////

    constructor() public {

        maxTotalSupply = 1000000000 * 10 ** 18; 
        totalInitialSupply = 820000000 * 10 ** 18; 
        chainStartTime = now; 
        chainStartBlockNumber = block.number; 
        totalSupply = totalInitialSupply;
        collectionAddress = msg.sender; 
        airdropWallet = msg.sender; 
        balances[msg.sender] = totalInitialSupply;

        emit Transfer(address(0), msg.sender, totalInitialSupply);
    }

    /**
     * @dev setCurrentEscrowFee
     * @dev Allow an admin from level 3 to set the Escrow Service Fee
     * @param _newFee The new fee rate
     */
    function setCurrentEscrowFee(uint _newFee) onlyAdmin(3) public {
        require(_newFee < 1000, 'Fee is higher than 100%');
        escrowFeePercent = _newFee;
        emit NewFeeRate(escrowFeePercent);
    }

    /**
     * @dev setCollectionWallet
     * @dev Allow an admin from level 3 to set the Escrow Service Fee Wallet
     * @param _newWallet The new fee wallet
     */
    function setCollectionWallet(address _newWallet) onlyAdmin(3) public {
        require(_newWallet != address(0), 'Address cannot be zero');
        collectionAddress = _newWallet;
        emit NewCollectionWallet(collectionAddress);
    }

    /**
     * @dev setAirDropWallet
     * @dev Allow an admin from level 3 to set the Airdrop Service Wallet
     * @param _newWallet The new Airdrop wallet
     */
    function setAirDropWallet(address _newWallet) onlyAdmin(3) public {
        require(_newWallet != address(0), 'Address cannot be zero');
        airdropWallet = _newWallet;
        emit NewAirdropWallet(airdropWallet);
    }

    ///////////////////////////////////////////////////////////////////
    
    function transfer(address _to, uint256 _value) public notFrozen(msg.sender) returns(bool) {
        require(_to != address(0), 'Address cannot be zero');

        if (msg.sender == _to) return claimStake();

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);

        
        if (transferIns[msg.sender].length > 0) delete transferIns[msg.sender];
        uint64 _now = uint64(now);
        transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]), _now));
        transferIns[_to].push(transferInStruct(uint128(_value), _now));
        ///////////////////////////////////////////////////////////////

        return true;
    }

    function balanceOf(address _owner) public view returns(uint256 balance) {
        return balances[_owner];
    }

    function transferFrom(address _from, address _to, uint256 _value) notFrozen(_from) public returns(bool) {
        require(_to != address(0), 'Address cannot be zero');

        uint256 _allowance = allowed[_from][msg.sender];
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        emit Transfer(_from, _to, _value);

        
        if (transferIns[_from].length > 0) delete transferIns[_from];
        uint64 _now = uint64(now);
        transferIns[_from].push(transferInStruct(uint128(balances[_from]), _now));
        transferIns[_to].push(transferInStruct(uint128(_value), _now));
        ///////////////////////////////////////////////////////////////

        return true;
    }

    function approve(address _spender, uint256 _value) public returns(bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public view returns(uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    /**
     * @dev claimStake
     * @dev Allow any user to claim stake earned
     */
    function claimStake() canPoSclaimStake public returns(bool) {
        if (balances[msg.sender] <= 0) return false;
        if (transferIns[msg.sender].length <= 0) return false;

        uint reward = getProofOfStakeReward(msg.sender);
        if (reward <= 0) return false;
        totalSupply = totalSupply.add(reward);
        balances[msg.sender] = balances[msg.sender].add(reward);

        
        delete transferIns[msg.sender];
        transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]), uint64(now)));
        ///////////////////////////////////////////////////////////////

        emit Transfer(address(0), msg.sender, reward);
        emit ClaimStake(msg.sender, reward);
        return true;
    }

    /**
     * @dev getBlockNumber
     * @dev Returns the block number since deployment
     */
    function getBlockNumber() public view returns(uint blockNumber) {
        blockNumber = block.number.sub(chainStartBlockNumber);
    }

    /**
     * @dev coinAge
     * @dev Returns the coinage for the callers account
     */
    function coinAge() public view returns(uint myCoinAge) {
        myCoinAge = getCoinAge(msg.sender, now);
    }

    /**
     * @dev annualInterest
     * @dev Returns the current interest rate
     */
    function annualInterest() public view returns(uint interest) {
        uint _now = now;
        
        
        
        interest = (1 * 1e15); 
        if ((_now.sub(stakeStartTime)).div(365 days) == 0) {
            interest = (106 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 1) {
            interest = (49 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 2) {
            interest = (24 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 3) {
            interest = (13 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 4) {
            interest = (11 * 1e15);
        }
    }

    /**
     * @dev getProofOfStakeReward
     * @dev Returns the current stake of a wallet
     * @param _address is the user wallet
     */
    function getProofOfStakeReward(address _address) public view returns(uint) {
        require((now >= stakeStartTime) && (stakeStartTime > 0), 'Staking is not yet enabled');

        uint _now = now;
        uint _coinAge = getCoinAge(_address, _now);
        if (_coinAge <= 0) return 0;

        
        
        
        uint interest = (1 * 1e15); 

        if ((_now.sub(stakeStartTime)).div(365 days) == 0) {
            interest = (106 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 1) {
            interest = (49 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 2) {
            interest = (24 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 3) {
            interest = (13 * 1e15);
        } else if ((_now.sub(stakeStartTime)).div(365 days) == 4) {
            interest = (11 * 1e1);
        }

        return (_coinAge * interest).div(365 * (10 ** uint256(decimals)));
    }

    function getCoinAge(address _address, uint _now) internal view returns(uint _coinAge) {
        if (transferIns[_address].length <= 0) return 0;

        for (uint i = 0; i < transferIns[_address].length; i++) {
            if (_now < uint(transferIns[_address][i].time).add(stakeMinAge)) continue;

            uint nCoinSeconds = _now.sub(uint(transferIns[_address][i].time));
            if (nCoinSeconds > stakeMaxAge) nCoinSeconds = stakeMaxAge;

            _coinAge = _coinAge.add(uint(transferIns[_address][i].amount) * nCoinSeconds.div(1 days));
        }
    }


    /**
     * @dev setStakeStartTime
     * @dev Used by the owner to define the staking period start
     * @param timestamp time in UNIX format
     */
    function setStakeStartTime(uint timestamp) onlyAdmin(3) public {
        require((stakeStartTime <= 0) && (timestamp >= chainStartTime), 'Wrong time set');
        stakeStartTime = timestamp;
    }
    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    /**
     * @dev batchTransfer
     * @dev Used by the owner to deliver several transfers at the same time (Airdrop)
     * @param _recipients Array of addresses
     * @param _values Array of values
     */
    function batchTransfer(
        address[] calldata _recipients,
        uint[] calldata _values
    ) onlyAdmin(1)
    external returns(bool) {
        
        require(_recipients.length > 0 && _recipients.length == _values.length, 'Addresses and Values have wrong sizes');
        
        uint total = 0;
        for (uint i = 0; i < _values.length; i++) {
            total = total.add(_values[i]);
        }
        
        require(total <= balances[msg.sender], 'Not enough funds for the transaction');
        
        uint64 _now = uint64(now);
        for (uint j = 0; j < _recipients.length; j++) {
            balances[_recipients[j]] = balances[_recipients[j]].add(_values[j]);
            
            transferIns[_recipients[j]].push(transferInStruct(uint128(_values[j]), _now));
            ///////////////////////////////////////////////////////////////
            emit Transfer(msg.sender, _recipients[j], _values[j]);
        }
        
        balances[msg.sender] = balances[msg.sender].sub(total);
        if (transferIns[msg.sender].length > 0) delete transferIns[msg.sender];
        if (balances[msg.sender] > 0) transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]), _now));

        return true;
    }

    /**
     * @dev dropSet
     * @dev Used by the owner to set several self-claiming drops at the same time (Airdrop)
     * @param _recipients Array of addresses
     * @param _values Array of values1
     */
    function dropSet(
        address[] calldata _recipients,
        uint[] calldata _values
    ) onlyAdmin(1)
    external returns(bool) {
        
        require(_recipients.length > 0 && _recipients.length == _values.length, 'Addresses and Values have wrong sizes');

        for (uint j = 0; j < _recipients.length; j++) {
            
            airdrops[_recipients[j]].value = _values[j];
            airdrops[_recipients[j]].claimed = false;
        }

        return true;
    }

    /**
     * @dev claimAirdrop
     * @dev Allow any user with a drop set to claim it
     */
    function claimAirdrop() external returns(bool) {
        
        require(airdrops[msg.sender].claimed == false, 'Airdrop already claimed');
        require(airdrops[msg.sender].value != 0, 'No airdrop value to claim');

        
        uint _value = airdrops[msg.sender].value;

        
        airdrops[msg.sender].claimed = true;
        
        airdrops[msg.sender].value = 0;

        
        address _from = airdropWallet;
        
        address _to = msg.sender;
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);

        emit Transfer(_from, _to, _value);
        emit ClaimDrop(_to, _value);

        
        if (transferIns[_from].length > 0) delete transferIns[_from];
        uint64 _now = uint64(now);
        transferIns[_from].push(transferInStruct(uint128(balances[_from]), _now));
        transferIns[_to].push(transferInStruct(uint128(_value), _now));
        ///////////////////////////////////////////////////////////////

        return true;

    }

    /**
     * @dev userFreezeBalance
     * @dev Allow a user to safe Lock/Unlock it's balance
     * @param _lock Lock Status to set
     */
    function userFreezeBalance(bool _lock) public returns(bool) {
        userFreeze[msg.sender] = _lock;
    }

    /**
     * @dev ownerFreeze
     * @dev Allow the owner to globally freeze tokens for a migration/snapshot
     * @param _lock Lock Status to set
     */
    function ownerFreeze(bool _lock) onlyAdmin(3) public returns(bool) {
        globalBalancesFreeze = _lock;
        emit GlobalFreeze(globalBalancesFreeze);
    }

    
    ///////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////
    
    /**
     * @dev createPaymentRequest
     * @dev Allow an user to request start a Escrow process
     * @param _customer Counterpart that will receive payment on success
     * @param _value Amount to be escrowed
     * @param _description Description
     */
    function createPaymentRequest(
        address _customer,
        uint _value,
        string calldata _description
    )
    escrowIsEnabled()
    notFrozen(msg.sender)
    external returns(uint) {

        require(_customer != address(0), 'Address cannot be zero');
        require(_value > 0, 'Value cannot be zero');

        payments[escrowCounter] = Payment(msg.sender, _customer, _value, _description, PaymentStatus.Requested, false);
        emit PaymentCreation(escrowCounter, msg.sender, _customer, _value, _description);

        escrowCounter = escrowCounter.add(1);
        return escrowCounter - 1;

    }

    /**
     * @dev answerPaymentRequest
     * @dev Allow a user to answer to a Escrow process
     * @param _orderId the request ticket number
     * @param _answer request answer
     */
    function answerPaymentRequest(uint _orderId, bool _answer) external returns(bool) {
        
        Payment storage payment = payments[_orderId];

        require(payment.status == PaymentStatus.Requested, 'Ticket wrong status, expected "Requested"');
        require(payment.customer == msg.sender, 'You are not allowed to manage this ticket');

        if (_answer == true) {

            address _to = address(this);

            balances[payment.provider] = balances[payment.provider].sub(payment.value);
            balances[_to] = balances[_to].add(payment.value);
            emit Transfer(payment.provider, _to, payment.value);

            
            if (transferIns[payment.provider].length > 0) delete transferIns[payment.provider];
            uint64 _now = uint64(now);
            transferIns[payment.provider].push(transferInStruct(uint128(balances[payment.provider]), _now));
            ///////////////////////////////////////////////////////////////

            payments[_orderId].status = PaymentStatus.Pending;

            emit PaymentUpdate(_orderId, payment.provider, payment.customer, payment.value, PaymentStatus.Pending);

        } else {

            payments[_orderId].status = PaymentStatus.Rejected;

            emit PaymentUpdate(_orderId, payment.provider, payment.customer, payment.value, PaymentStatus.Rejected);

        }

        return true;
    }


    /**
     * @dev release
     * @dev Allow a provider or admin user to release a payment
     * @param _orderId Ticket number of the escrow service
     */
    function release(uint _orderId) external returns(bool) {
        
        Payment storage payment = payments[_orderId];
        
        require(payment.status == PaymentStatus.Pending, 'Ticket wrong status, expected "Pending"');
        
        require(level[msg.sender] >= 2 || msg.sender == payment.provider, 'You are not allowed to manage this ticket');
        
        address _from = address(this);
        
        address _to = payment.customer;
        
        uint _value = payment.value;
        
        uint _fee = _value.mul(escrowFeePercent).div(1000);
        
        _value = _value.sub(_fee);
        
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
        
        balances[_from] = balances[_from].sub(_fee);
        balances[collectionAddress] = balances[collectionAddress].add(_fee);
        emit Transfer(_from, collectionAddress, _fee);
        
        if (transferIns[_from].length > 0) delete transferIns[_from];
        
        uint64 _now = uint64(now);
        
        transferIns[_to].push(transferInStruct(uint128(_value), _now));
        
        transferIns[collectionAddress].push(transferInStruct(uint128(_fee), _now));
        
        payment.status = PaymentStatus.Completed;
        
        emit PaymentUpdate(_orderId, payment.provider, payment.customer, payment.value, payment.status);

        return true;
    }

    /**
     * @dev refund
     * @dev Allow a user to refund a payment
     * @param _orderId Ticket number of the escrow service
     */
    function refund(uint _orderId) external returns(bool) {
        
        Payment storage payment = payments[_orderId];
        
        require(payment.status == PaymentStatus.Pending, 'Ticket wrong status, expected "Pending"');
        
        require(payment.refundApproved, 'Refund has not been approved yet');
        
        address _from = address(this);
        
        address _to = payment.provider;
        
        uint _value = payment.value;
        
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
        
        if (transferIns[_from].length > 0) delete transferIns[_from];
        
        uint64 _now = uint64(now);
        transferIns[_to].push(transferInStruct(uint128(_value), _now));
        
        payment.status = PaymentStatus.Refunded;
        
        emit PaymentUpdate(_orderId, payment.provider, payment.customer, payment.value, payment.status);

        return true;
    }

    /**
     * @dev approveRefund
     * @dev Allow a user to approve a refund
     * @param _orderId Ticket number of the escrow service
     */
    function approveRefund(uint _orderId) external returns(bool) {
        
        Payment storage payment = payments[_orderId];
        
        require(payment.status == PaymentStatus.Pending, 'Ticket wrong status, expected "Pending"');
        
        require(level[msg.sender] >= 2 || msg.sender == payment.customer, 'You are not allowed to manage this ticket');
        
        payment.refundApproved = true;

        emit PaymentRefundApprove(_orderId, payment.provider, payment.customer, payment.refundApproved);

        return true;
    }

    /**
     * @dev escrowLockSet
     * @dev Allow the owner to lock the escrow feature
     * @param _lock lock indicator
     */
    function escrowLockSet(bool _lock) external onlyAdmin(3) returns(bool) {        
        escrowEnabled = _lock;
        emit EscrowLock(escrowEnabled);
        return true;
    }

    
    ///////////////////////////////////////////////////////////////////
}