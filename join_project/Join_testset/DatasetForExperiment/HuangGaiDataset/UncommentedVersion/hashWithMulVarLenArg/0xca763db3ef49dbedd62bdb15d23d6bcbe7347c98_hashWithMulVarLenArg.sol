

pragma solidity 0.5.8;

/**
 * @title ERC20 interface
 * @dev see https:
 */
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}



pragma solidity 0.5.8;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
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
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}



pragma solidity 0.5.8;



/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https:
 * Originally based on code by FirstBlood:
 * https:
 *
 * This implementation emits additional Approval events, allowing applications to reconstruct the allowance status for
 * all accounts just by listening to said events. Note that this isn't required by the specification, and other
 * compliant implementations may not do it.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    /**
     * @dev Total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev Gets the balance of the specified address.
     * @param owner The address to query the balance of.
     * @return A uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    /**
     * @dev Transfer token to a specified address
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https:
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
        return true;
    }

    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     * approve should be called when _allowed[msg.sender][spender] == 0. To increment
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param addedValue The amount of tokens to increase the allowance by.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     * approve should be called when _allowed[msg.sender][spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param subtractedValue The amount of tokens to decrease the allowance by.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
        return true;
    }

    /**
     * @dev Transfer token for a specified addresses
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account.
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }

    /**
     * @dev Approve an address to spend another addresses' tokens.
     * @param owner The address that owns the tokens.
     * @param spender The address that will spend the tokens.
     * @param value The number of tokens that can be spent.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account, deducting from the sender's allowance for said account. Uses the
     * internal burn function.
     * Emits an Approval event (reflecting the reduced allowance).
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burnFrom(address account, uint256 value) internal {
        _burn(account, value);
        _approve(account, msg.sender, _allowed[account][msg.sender].sub(value));
    }
}



pragma solidity 0.5.8;

/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    /**
     * @dev give an account access to this role
     */
    function add(Role storage role, address account) internal {
        require(account != address(0));
        require(!has(role, account));

        role.bearer[account] = true;
    }

    /**
     * @dev remove an account's access to this role
     */
    function remove(Role storage role, address account) internal {
        require(account != address(0));
        require(has(role, account));

        role.bearer[account] = false;
    }

    /**
     * @dev check if an account has this role
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0));
        return role.bearer[account];
    }
}



pragma solidity 0.5.8;


contract MinterRole {
    using Roles for Roles.Role;

    event MinterAdded(address indexed account);
    event MinterRemoved(address indexed account);

    Roles.Role private _minters;

    constructor () internal {
        _addMinter(msg.sender);
    }

    modifier onlyMinter() {
        require(isMinter(msg.sender));
        _;
    }

    function isMinter(address account) public view returns (bool) {
        return _minters.has(account);
    }

    function addMinter(address account) public onlyMinter {
        _addMinter(account);
    }

    function renounceMinter() public {
        _removeMinter(msg.sender);
    }

    function _addMinter(address account) internal {
        _minters.add(account);
        emit MinterAdded(account);
    }

    function _removeMinter(address account) internal {
        _minters.remove(account);
        emit MinterRemoved(account);
    }
}



pragma solidity 0.5.8;



/**
 * @title ERC20Mintable
 * @dev ERC20 minting logic
 */
contract ERC20Mintable is ERC20, MinterRole {
    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param value The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 value) public onlyMinter returns (bool) {
        _mint(to, value);
        return true;
    }
}



pragma solidity 0.5.8;

/**
 * @title PayableOwnable
 * @dev The PayableOwnable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 * PayableOwnable is extended from open-zeppelin Ownable smart contract, with the difference of making the owner
 * a payable address.
 */
contract PayableOwnable {
    address payable private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address payable) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address payable newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address payable newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}



pragma solidity 0.5.8;



contract PumaPayPullPayment is PayableOwnable {

    using SafeMath for uint256;

    /
    /
    /

    event LogExecutorAdded(address executor);
    event LogExecutorRemoved(address executor);
    event LogSetConversionRate(string currency, uint256 conversionRate);

    event LogPullPaymentRegistered(
        address customerAddress,
        bytes32 paymentID,
        string uniqueReferenceID
    );

    event LogPullPaymentCancelled(
        address customerAddress,
        bytes32 paymentID,
        string uniqueReferenceID
    );

    event LogPullPaymentExecuted(
        address customerAddress,
        bytes32 paymentID,
        string uniqueReferenceID,
        uint256 pmaAmountTransferred
    );

    /
    /
    /

    uint256 constant private DECIMAL_FIXER = 10 ** 10;              /
    uint256 constant private FIAT_TO_CENT_FIXER = 100;              /
    uint256 constant private OVERFLOW_LIMITER_NUMBER = 10 ** 20;    /

    uint256 constant private ONE_ETHER = 1 ether;                               /
    uint256 constant private FUNDING_AMOUNT = 0.5 ether;                          /
    uint256 constant private MINIMUM_AMOUNT_OF_ETH_FOR_OPERATORS = 0.15 ether;  /

    /
    /
    /

    IERC20 public token;

    mapping(string => uint256) private conversionRates;
    mapping(address => bool) public executors;
    mapping(address => mapping(address => PullPayment)) public pullPayments;

    struct PullPayment {
        bytes32 paymentID;                      /
        bytes32 businessID;                     /
        string uniqueReferenceID;               /
        string currency;                        /
        uint256 initialPaymentAmountInCents;    /
        uint256 fiatAmountInCents;              /
        uint256 frequency;                      /
        uint256 numberOfPayments;               /
        uint256 startTimestamp;                 /
        uint256 nextPaymentTimestamp;           /
        uint256 lastPaymentTimestamp;           /
        uint256 cancelTimestamp;                /
        address treasuryAddress;                /
    }

    /
    /
    /
    modifier isExecutor() {
        require(executors[msg.sender], "msg.sender not an executor");
        _;
    }

    modifier executorExists(address _executor) {
        require(executors[_executor], "Executor does not exists.");
        _;
    }

    modifier executorDoesNotExists(address _executor) {
        require(!executors[_executor], "Executor already exists.");
        _;
    }

    modifier paymentExists(address _customer, address _pullPaymentExecutor) {
        require(doesPaymentExist(_customer, _pullPaymentExecutor), "Pull Payment does not exists");
        _;
    }

    modifier paymentNotCancelled(address _customer, address _pullPaymentExecutor) {
        require(pullPayments[_customer][_pullPaymentExecutor].cancelTimestamp == 0, "Pull Payment is cancelled.");
        _;
    }

    modifier isValidPullPaymentExecutionRequest(address _customer, address _pullPaymentExecutor, bytes32 _paymentID) {
        require(
            (pullPayments[_customer][_pullPaymentExecutor].initialPaymentAmountInCents > 0 ||
        (now >= pullPayments[_customer][_pullPaymentExecutor].startTimestamp &&
        now >= pullPayments[_customer][_pullPaymentExecutor].nextPaymentTimestamp)
            ), "Invalid pull payment execution request - Time of execution is invalid."
        );
        require(pullPayments[_customer][_pullPaymentExecutor].numberOfPayments > 0,
            "Invalid pull payment execution request - Number of payments is zero.");

        require((pullPayments[_customer][_pullPaymentExecutor].cancelTimestamp == 0 ||
        pullPayments[_customer][_pullPaymentExecutor].cancelTimestamp > pullPayments[_customer][_pullPaymentExecutor].nextPaymentTimestamp),
            "Invalid pull payment execution request - Pull payment is cancelled");
        require(keccak256(
            abi.encodePacked(pullPayments[_customer][_pullPaymentExecutor].paymentID)
        ) == keccak256(abi.encodePacked(_paymentID)),
            "Invalid pull payment execution request - Payment ID not matching.");
        _;
    }

    modifier isValidDeletionRequest(bytes32 _paymentID, address _customer, address _pullPaymentExecutor) {
        require(_customer != address(0), "Invalid deletion request - Client address is ZERO_ADDRESS.");
        require(_pullPaymentExecutor != address(0), "Invalid deletion request - Beneficiary address is ZERO_ADDRESS.");
        require(_paymentID.length != 0, "Invalid deletion request - Payment ID is empty.");
        _;
    }

    modifier isValidAddress(address _address) {
        require(_address != address(0), "Invalid address - ZERO_ADDRESS provided");
        _;
    }

    modifier validConversionRate(string memory _currency) {
        require(bytes(_currency).length != 0, "Invalid conversion rate - Currency is empty.");
        require(conversionRates[_currency] > 0, "Invalid conversion rate - Must be higher than zero.");
        _;
    }

    modifier validAmount(uint256 _fiatAmountInCents) {
        require(_fiatAmountInCents > 0, "Invalid amount - Must be higher than zero");
        _;
    }

    /
    /
    /

    /
    /
    constructor (address _token)
    public {
        require(_token != address(0), "Invalid address for token - ZERO_ADDRESS provided");
        token = IERC20(_token);
    }

    
    function() external payable {
    }

    /
    /
    /

    /
    /
    /
    /

    function addExecutor(address payable _executor)
    public
    onlyOwner
    isValidAddress(_executor)
    executorDoesNotExists(_executor)
    {
        _executor.transfer(FUNDING_AMOUNT);
        executors[_executor] = true;

        if (isFundingNeeded(owner())) {
            owner().transfer(FUNDING_AMOUNT);
        }

        emit LogExecutorAdded(_executor);
    }

    /
    /
    /
    function removeExecutor(address payable _executor)
    public
    onlyOwner
    isValidAddress(_executor)
    executorExists(_executor)
    {
        executors[_executor] = false;
        if (isFundingNeeded(owner())) {
            owner().transfer(FUNDING_AMOUNT);
        }
        emit LogExecutorRemoved(_executor);
    }

    /
    /
    /
    /
    /
    function setRate(string memory _currency, uint256 _rate)
    public
    onlyOwner
    returns (bool) {
        conversionRates[_currency] = _rate;
        emit LogSetConversionRate(_currency, _rate);

        if (isFundingNeeded(owner())) {
            owner().transfer(FUNDING_AMOUNT);
        }

        return true;
    }

    /
    /
    /

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function registerPullPayment(
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes32[2] memory _ids, 
        address[3] memory _addresses, 
        string memory _currency,
        string memory _uniqueReferenceID,
        uint256 _initialPaymentAmountInCents,
        uint256 _fiatAmountInCents,
        uint256 _frequency,
        uint256 _numberOfPayments,
        uint256 _startTimestamp
    )
    public
    isExecutor()
    {
        require(_ids[0].length > 0, "Payment ID is empty.");
        require(_ids[1].length > 0, "Business ID is empty.");
        require(bytes(_currency).length > 0, "Currency is empty.");
        require(bytes(_uniqueReferenceID).length > 0, "Unique Reference ID is empty.");
        require(_addresses[0] != address(0), "Customer Address is ZERO_ADDRESS.");
        require(_addresses[1] != address(0), "Beneficiary Address is ZERO_ADDRESS.");
        require(_addresses[2] != address(0), "Treasury Address is ZERO_ADDRESS.");
        require(_fiatAmountInCents > 0, "Payment amount in fiat is zero.");
        require(_frequency > 0, "Payment frequency is zero.");
        require(_frequency < OVERFLOW_LIMITER_NUMBER, "Payment frequency is higher thant the overflow limit.");
        require(_numberOfPayments > 0, "Payment number of payments is zero.");
        require(_numberOfPayments < OVERFLOW_LIMITER_NUMBER, "Payment number of payments is higher thant the overflow limit.");
        require(_startTimestamp > 0, "Payment start time is zero.");
        require(_startTimestamp < OVERFLOW_LIMITER_NUMBER, "Payment start time is higher thant the overflow limit.");

        pullPayments[_addresses[0]][_addresses[1]].currency = _currency;
        pullPayments[_addresses[0]][_addresses[1]].initialPaymentAmountInCents = _initialPaymentAmountInCents;
        pullPayments[_addresses[0]][_addresses[1]].fiatAmountInCents = _fiatAmountInCents;
        pullPayments[_addresses[0]][_addresses[1]].frequency = _frequency;
        pullPayments[_addresses[0]][_addresses[1]].startTimestamp = _startTimestamp;
        pullPayments[_addresses[0]][_addresses[1]].numberOfPayments = _numberOfPayments;
        pullPayments[_addresses[0]][_addresses[1]].paymentID = keccak256(abi.encodePacked(_ids, _addresses));	
        pullPayments[_addresses[0]][_addresses[1]].businessID = keccak256(abi.encodePacked(_ids, _addresses));	
        pullPayments[_addresses[0]][_addresses[1]].uniqueReferenceID = _uniqueReferenceID;
        pullPayments[_addresses[0]][_addresses[1]].treasuryAddress = _addresses[2];

        require(isValidRegistration(
                v,
                r,
                s,
                _addresses[0],
                _addresses[1],
                pullPayments[_addresses[0]][_addresses[1]]),
            "Invalid pull payment registration - ECRECOVER_FAILED"
        );

        pullPayments[_addresses[0]][_addresses[1]].nextPaymentTimestamp = _startTimestamp;
        pullPayments[_addresses[0]][_addresses[1]].lastPaymentTimestamp = 0;
        pullPayments[_addresses[0]][_addresses[1]].cancelTimestamp = 0;

        if (isFundingNeeded(msg.sender)) {
            msg.sender.transfer(FUNDING_AMOUNT);
        }

        emit LogPullPaymentRegistered(
            _addresses[0],
            _ids[0],
            _uniqueReferenceID
        );
    }

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function deletePullPayment(
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes32 _paymentID,
        address _customer,
        address _pullPaymentExecutor
    )
    public
    isExecutor()
    paymentExists(_customer, _pullPaymentExecutor)
    paymentNotCancelled(_customer, _pullPaymentExecutor)
    isValidDeletionRequest(_paymentID, _customer, _pullPaymentExecutor)
    {
        require(isValidDeletion(v, r, s, _paymentID, _customer, _pullPaymentExecutor), "Invalid deletion - ECRECOVER_FAILED.");

        pullPayments[_customer][_pullPaymentExecutor].cancelTimestamp = now;

        if (isFundingNeeded(msg.sender)) {
            msg.sender.transfer(FUNDING_AMOUNT);
        }

        emit LogPullPaymentCancelled(
            _customer,
            _paymentID,
            pullPayments[_customer][_pullPaymentExecutor].uniqueReferenceID
        );
    }

    /
    /
    /

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function executePullPayment(address _customer, bytes32 _paymentID)
    public
    paymentExists(_customer, msg.sender)
    isValidPullPaymentExecutionRequest(_customer, msg.sender, _paymentID)
    {
        uint256 amountInPMA;

        if (pullPayments[_customer][msg.sender].initialPaymentAmountInCents > 0) {
            amountInPMA = calculatePMAFromFiat(
                pullPayments[_customer][msg.sender].initialPaymentAmountInCents,
                pullPayments[_customer][msg.sender].currency
            );
            pullPayments[_customer][msg.sender].initialPaymentAmountInCents = 0;
        } else {
            amountInPMA = calculatePMAFromFiat(
                pullPayments[_customer][msg.sender].fiatAmountInCents,
                pullPayments[_customer][msg.sender].currency
            );

            pullPayments[_customer][msg.sender].nextPaymentTimestamp =
            pullPayments[_customer][msg.sender].nextPaymentTimestamp + pullPayments[_customer][msg.sender].frequency;
            pullPayments[_customer][msg.sender].numberOfPayments = pullPayments[_customer][msg.sender].numberOfPayments - 1;
        }

        pullPayments[_customer][msg.sender].lastPaymentTimestamp = now;
        token.transferFrom(
            _customer,
            pullPayments[_customer][msg.sender].treasuryAddress,
            amountInPMA
        );

        emit LogPullPaymentExecuted(
            _customer,
            pullPayments[_customer][msg.sender].paymentID,
            pullPayments[_customer][msg.sender].uniqueReferenceID,
            amountInPMA
        );
    }

    function getRate(string memory _currency) public view returns (uint256) {
        return conversionRates[_currency];
    }

    /
    /
    /

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function calculatePMAFromFiat(uint256 _fiatAmountInCents, string memory _currency)
    internal
    view
    validConversionRate(_currency)
    validAmount(_fiatAmountInCents)
    returns (uint256) {
        return ONE_ETHER.mul(DECIMAL_FIXER).mul(_fiatAmountInCents).div(conversionRates[_currency]).div(FIAT_TO_CENT_FIXER);
    }

    /
    /
    /
    /
    /
    /
    /
    /
    /
    function isValidRegistration(
        uint8 v,
        bytes32 r,
        bytes32 s,
        address _customer,
        address _pullPaymentExecutor,
        PullPayment memory _pullPayment
    )
    internal
    pure
    returns (bool)
    {
        return ecrecover(
            keccak256(
                abi.encodePacked(
                    _pullPaymentExecutor,
                    _pullPayment.paymentID,
                    _pullPayment.businessID,
                    _pullPayment.uniqueReferenceID,
                    _pullPayment.treasuryAddress,
                    _pullPayment.currency,
                    _pullPayment.initialPaymentAmountInCents,
                    _pullPayment.fiatAmountInCents,
                    _pullPayment.frequency,
                    _pullPayment.numberOfPayments,
                    _pullPayment.startTimestamp
                )
            ),
            v, r, s) == _customer;
    }

    /
    /
    /
    /
    /
    /
    /
    /
    /
    function isValidDeletion(
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes32 _paymentID,
        address _customer,
        address _pullPaymentExecutor
    )
    internal
    view
    returns (bool)
    {
        return ecrecover(
            keccak256(
                abi.encodePacked(
                    _paymentID,
                    _pullPaymentExecutor
                )
            ), v, r, s) == _customer
        && keccak256(
            abi.encodePacked(pullPayments[_customer][_pullPaymentExecutor].paymentID)
        ) == keccak256(abi.encodePacked(_paymentID)
        );
    }

    /
    /
    /
    /
    function doesPaymentExist(address _customer, address _pullPaymentExecutor)
    internal
    view
    returns (bool) {
        return (
        bytes(pullPayments[_customer][_pullPaymentExecutor].currency).length > 0 &&
        pullPayments[_customer][_pullPaymentExecutor].fiatAmountInCents > 0 &&
        pullPayments[_customer][_pullPaymentExecutor].frequency > 0 &&
        pullPayments[_customer][_pullPaymentExecutor].startTimestamp > 0 &&
        pullPayments[_customer][_pullPaymentExecutor].numberOfPayments > 0 &&
        pullPayments[_customer][_pullPaymentExecutor].nextPaymentTimestamp > 0
        );
    }

    /
    /
    /
    /
    function isFundingNeeded(address _address)
    private
    view
    returns (bool) {
        return address(_address).balance <= MINIMUM_AMOUNT_OF_ETH_FOR_OPERATORS;
    }
}