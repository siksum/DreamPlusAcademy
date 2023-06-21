pragma solidity 0.5.2;

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

/**
 * @title Math
 * @dev Assorted math operations
 */
library Math {
    /**
    * @dev Returns the largest of two numbers.
    */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
    * @dev Returns the smallest of two numbers.
    */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
    * @dev Calculates the average of two numbers. Since these are integers,
    * averages of an even and odd number cannot be represented, and will be
    * rounded down.
    */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

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
        require(c / a == b, "SafeMath#mul: Integer overflow");

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0, "SafeMath#div: Invalid divisor zero");
        uint256 c = a / b;
        

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath#sub: Integer underflow");
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath#add: Integer overflow");

        return c;
    }

    /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath#mod: Invalid divisor zero");
        return a % b;
    }
}

contract IUniswapExchange {
    
    function tokenAddress() external view returns (address token);
    
    function factoryAddress() external view returns (address factory);
    
    function addLiquidity(uint256 min_liquidity, uint256 max_tokens, uint256 deadline) external payable returns (uint256);
    function removeLiquidity(uint256 amount, uint256 min_eth, uint256 min_tokens, uint256 deadline) external returns (uint256, uint256);
    
    function getEthToTokenInputPrice(uint256 eth_sold) external view returns (uint256 tokens_bought);
    function getEthToTokenOutputPrice(uint256 tokens_bought) external view returns (uint256 eth_sold);
    function getTokenToEthInputPrice(uint256 tokens_sold) external view returns (uint256 eth_bought);
    function getTokenToEthOutputPrice(uint256 eth_bought) external view returns (uint256 tokens_sold);
    
    function ethToTokenSwapInput(uint256 min_tokens, uint256 deadline) external payable returns (uint256  tokens_bought);
    function ethToTokenTransferInput(uint256 min_tokens, uint256 deadline, address recipient) external payable returns (uint256  tokens_bought);
    function ethToTokenSwapOutput(uint256 tokens_bought, uint256 deadline) external payable returns (uint256  eth_sold);
    function ethToTokenTransferOutput(uint256 tokens_bought, uint256 deadline, address recipient) external payable returns (uint256  eth_sold);
    
    function tokenToEthSwapInput(uint256 tokens_sold, uint256 min_eth, uint256 deadline) external returns (uint256  eth_bought);
    function tokenToEthTransferInput(uint256 tokens_sold, uint256 min_tokens, uint256 deadline, address recipient) external returns (uint256  eth_bought);
    function tokenToEthSwapOutput(uint256 eth_bought, uint256 max_tokens, uint256 deadline) external returns (uint256  tokens_sold);
    function tokenToEthTransferOutput(uint256 eth_bought, uint256 max_tokens, uint256 deadline, address recipient) external returns (uint256  tokens_sold);
    
    function tokenToTokenSwapInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address token_addr) external returns (uint256  tokens_bought);
    function tokenToTokenTransferInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address recipient, address token_addr) external returns (uint256  tokens_bought);
    function tokenToTokenSwapOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address token_addr) external returns (uint256  tokens_sold);
    function tokenToTokenTransferOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address recipient, address token_addr) external returns (uint256  tokens_sold);
    
    function tokenToExchangeSwapInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address exchange_addr) external returns (uint256  tokens_bought);
    function tokenToExchangeTransferInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address recipient, address exchange_addr) external returns (uint256  tokens_bought);
    function tokenToExchangeSwapOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address exchange_addr) external returns (uint256  tokens_sold);
    function tokenToExchangeTransferOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address recipient, address exchange_addr) external returns (uint256  tokens_sold);
    
    bytes32 public name;
    bytes32 public symbol;
    uint256 public decimals;
    function transfer(address _to, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 value) external returns (bool);
    function approve(address _spender, uint256 _value) external returns (bool);
    function allowance(address _owner, address _spender) external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256);
    
    function setup(address token_addr) external;
}

contract IUniswapFactory {
    
    address public exchangeTemplate;
    uint256 public tokenCount;
    
    function createExchange(address token) external returns (address payable exchange);
    
    function getExchange(address token) external view returns (address payable exchange);
    function getToken(address exchange) external view returns (address token);
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
    function getTokenWithId(uint256 tokenId) external view returns (address token);
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   
}
}

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
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   
}

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
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
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    /**
    * @dev Transfer token for a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   
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
        require(spender != address(0), "ERC20#approve: Cannot approve address zero");

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
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
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     * approve should be called when allowed_[_spender] == 0. To increment
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param addedValue The amount of tokens to increase the allowance by.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0), "ERC20#increaseAllowance: Cannot increase allowance for address zero");

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     * approve should be called when allowed_[_spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param subtractedValue The amount of tokens to decrease the allowance by.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0), "ERC20#decreaseAllowance: Cannot decrease allowance for address zero");

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].sub(subtractedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  
    balances_intou6[msg.sender] -= _value;  
    balances_intou6[_to] += _value;  
    return true;
  }

    /**
    * @dev Transfer token for a specified addresses
    * @param from The address to transfer from.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "ERC20#_transfer: Cannot transfer to address zero");

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  
    balances_intou2[msg.sender] -= _value;  
    balances_intou2[_to] += _value;  
    return true;
  }

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0), "ERC20#_mint: Cannot mint to address zero");

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   
}

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account.
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20#_burn: Cannot burn from address zero");

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
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
        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(value);
        _burn(account, value);
        emit Approval(account, msg.sender, _allowed[account][msg.sender]);
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   
}
}

contract OracleToken is ERC20 {
    string public name = "Polaris Token";
    string public symbol = "PLRS";
    uint8 public decimals = 18;
    address public oracle;
    address public token;

    constructor(address _token) public payable {
        oracle = msg.sender;
        token = _token;
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }

    function () external payable {}
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }

    function mint(address to, uint amount) public returns (bool) {
        require(msg.sender == oracle, "OracleToken::mint: Only Oracle can call mint");
        _mint(to, amount);
        return true;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }

    function redeem(uint amount) public {
        uint ethAmount = address(this).balance.mul(amount).div(totalSupply());
        _burn(msg.sender, amount);
        msg.sender.transfer(ethAmount);
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
}

pragma experimental ABIEncoderV2;


contract Polaris {
    using Math for uint;
    using SafeMath for uint;

  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
  event NewMedian(address indexed token, uint ethReserve, uint tokenReserve);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
  event Subscribe(address indexed token, address indexed subscriber, uint amount);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event Unsubscribe(address indexed token, address indexed subscriber, uint amount);

    uint8 public constant MAX_CHECKPOINTS = 15;

    
    uint public constant CHECKPOINT_REWARD = 1e18;

    
    uint public constant MIN_PRICE_CHANGE = .01e18; 
    uint public constant MAX_TIME_SINCE_LAST_CHECKPOINT = 3 hours;

    uint public constant PENDING_PERIOD = 3.5 minutes;

    address public constant ETHER = address(0);

    
    uint public constant MONTHLY_SUBSCRIPTION_FEE = 5 ether;
    uint public constant ONE_MONTH_IN_SECONDS = 30 days;

    IUniswapFactory public uniswap;

    struct Account {
        uint balance;
        uint collectionTimestamp;
    }

    struct Checkpoint {
        uint ethReserve;
        uint tokenReserve;
    }

    struct Medianizer {
        uint8 tail;
        uint pendingStartTimestamp;
        uint latestTimestamp;
        Checkpoint[] prices;
        Checkpoint[] pending;
        Checkpoint median;
    }

    
    mapping (address => mapping (address => Account)) public accounts;

    
    mapping (address => OracleToken) public oracleTokens;

    
    mapping (address => Medianizer) private medianizers;

    constructor(IUniswapFactory _uniswap) public {
        uniswap = _uniswap;
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}

    /**
     * @dev Subscribe to read the price of a given token (e.g, DAI).
     * @param token The address of the token to subscribe to.
     */
    function subscribe(address token) public payable {
        Account storage account = accounts[token][msg.sender];
        _collect(token, account);
        account.balance = account.balance.add(msg.value);
        require(account.balance >= MONTHLY_SUBSCRIPTION_FEE, "Polaris::subscribe: Account balance is below the minimum");
        emit Subscribe(token, msg.sender, msg.value);
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

    /**
     * @dev Unsubscribe to a given token (e.g, DAI).
     * @param token The address of the token to unsubscribe from.
     * @param amount The requested amount to withdraw, in wei.
     * @return The actual amount withdrawn, in wei.
     */
    function unsubscribe(address token, uint amount) public returns (uint) {
        Account storage account = accounts[token][msg.sender];
        _collect(token, account);
        uint maxWithdrawAmount = account.balance.sub(MONTHLY_SUBSCRIPTION_FEE);
        uint actualWithdrawAmount = amount.min(maxWithdrawAmount);
        account.balance = account.balance.sub(actualWithdrawAmount);
        msg.sender.transfer(actualWithdrawAmount);
        emit Unsubscribe(token, msg.sender, actualWithdrawAmount);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }

    /**
     * @dev Collect subscription fees from a subscriber.
     * @param token The address of the subscribed token to collect fees from.
     * @param who The address of the subscriber.
     */
    function collect(address token, address who) public {
        Account storage account = accounts[token][who];
        _collect(token, account);
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Add a new price checkpoint.
     * @param token The address of the token to checkpoint.
     */
    function poke(address token) public {
        require(_isHuman(), "Polaris::poke: Poke must be called by an externally owned account");
        OracleToken oracleToken = oracleTokens[token];

        
        Checkpoint memory checkpoint = _newCheckpoint(token);

        if (address(oracleToken) == address(0)) {
            _initializeMedianizer(token, checkpoint);
        } else {
            Medianizer storage medianizer = medianizers[token];

            require(medianizer.latestTimestamp != block.timestamp, "Polaris::poke: Cannot poke more than once per block");

            
            if (_willRewardCheckpoint(token, checkpoint)) {
                oracleToken.mint(msg.sender, CHECKPOINT_REWARD);
            }

            
            if (block.timestamp.sub(medianizer.pendingStartTimestamp) > PENDING_PERIOD || medianizer.pending.length == MAX_CHECKPOINTS) {
                medianizer.pending.length = 0;
                medianizer.tail = (medianizer.tail + 1) % MAX_CHECKPOINTS;
                medianizer.pendingStartTimestamp = block.timestamp;
            }

            medianizer.latestTimestamp = block.timestamp;

            
            medianizer.pending.push(checkpoint);
            
            
            medianizer.prices[medianizer.tail] = _medianize(medianizer.pending);
            
            
            medianizer.median = _medianize(medianizer.prices);

            emit NewMedian(token, medianizer.median.ethReserve, medianizer.median.tokenReserve);
        }
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Get price data for a given token.
     * @param token The address of the token to query.
     * @return The price data struct.
     */
    function getMedianizer(address token) public view returns (Medianizer memory) {
        require(_isSubscriber(accounts[token][msg.sender]) || _isHuman(), "Polaris::getMedianizer: Not subscribed");
        return medianizers[token];
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}

    /**
     * @notice This uses the x * y = k bonding curve to determine the destination amount based on the medianized price.
     *              1x = (1y * x) / (y + 1y)
     * @dev Get the amount of destination token, based on a given amount of source token.
     * @param src The address of the source token.
     * @param dest The address of the destination token.
     * @param srcAmount The amount of the source token.
     * @return The amount of destination token.
     */
    function getDestAmount(address src, address dest, uint srcAmount) public view returns (uint) {
        if (!_isHuman()) {
            require(src == ETHER || _isSubscriber(accounts[src][msg.sender]), "Polaris::getDestAmount: Not subscribed");
            require(dest == ETHER || _isSubscriber(accounts[dest][msg.sender]), "Polaris::getDestAmount: Not subscribed");    
        }

        if (src == dest) {
            return srcAmount;
        } else if (src == ETHER) {
            Checkpoint memory median = medianizers[dest].median;
            return srcAmount.mul(median.tokenReserve).div(median.ethReserve.add(srcAmount));
        } else if (dest == ETHER) {
            Checkpoint memory median = medianizers[src].median;
            return srcAmount.mul(median.ethReserve).div(median.tokenReserve.add(srcAmount));
        } else {
            Checkpoint memory srcMedian = medianizers[src].median;
            Checkpoint memory destMedian = medianizers[dest].median;
            
            uint ethAmount = srcAmount.mul(srcMedian.ethReserve).div(srcMedian.tokenReserve.add(srcAmount));
            return ethAmount.mul(destMedian.ethReserve).div(destMedian.tokenReserve.add(ethAmount));
        }
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Determine whether a given checkpoint would be rewarded with newly minted oracle tokens.
     * @param token The address of the token to query checkpoint for.
     * @return True if given checkpoint satisfies any of the following:
     *              Less than required checkpoints exist to calculate a valid median
     *              Exceeds max time since last checkpoint
     *              Exceeds minimum price change from median AND no pending checkpoints
     *              Exceeds minimum percent change from pending checkpoints median
     *              Exceeds minimum percent change from last checkpoint
     */
    function willRewardCheckpoint(address token) public view returns (bool) {
        Checkpoint memory checkpoint = _newCheckpoint(token);
        return _willRewardCheckpoint(token, checkpoint);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}

    /**
     * @dev Get the account for a given subscriber of a token feed.
     * @param token The token to query the account of the given subscriber.
     * @param who The subscriber to query the account of the given token feed.
     * @return The account of the subscriber of the given token feed.
     */
    function getAccount(address token, address who) public view returns (Account memory) {
        return accounts[token][who];
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }

    /**
     * @dev Get the owed amount for a given subscriber of a token feed.
     * @param token The token to query the owed amount of the given subscriber.
     * @param who The subscriber to query the owed amount for the given token feed.
     * @return The owed amount of the subscriber of the given token feed.
     */
    function getOwedAmount(address token, address who) public view returns (uint) {
        Account storage account = accounts[token][who];
        return _getOwedAmount(account);
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}

    /**
     * @dev Update the subscriber balance of a given token feed.
     * @param token The token to collect subscription revenues for.
     * @param account The subscriber account to collect subscription revenues from.
     */
    function _collect(address token, Account storage account) internal {
        if (account.balance == 0) {
            account.collectionTimestamp = block.timestamp;
            return;
        }

        uint owedAmount = _getOwedAmount(account);
        OracleToken oracleToken = oracleTokens[token];

        
        if (owedAmount >= account.balance) {
            address(oracleToken).transfer(account.balance);
            account.balance = 0;
        } else {
            address(oracleToken).transfer(owedAmount);
            account.balance = account.balance.sub(owedAmount);
        }

        account.collectionTimestamp = block.timestamp;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Initialize the medianizer
     * @param token The token to initialize the medianizer for.
     * @param checkpoint The new checkpoint to initialize the medianizer with.
     */
    function _initializeMedianizer(address token, Checkpoint memory checkpoint) internal {
        address payable exchange = uniswap.getExchange(token);
        require(exchange != address(0), "Polaris::_initializeMedianizer: Token must exist on Uniswap");

        OracleToken oracleToken = new OracleToken(token);
        oracleTokens[token] = oracleToken;
        
        oracleToken.mint(msg.sender, CHECKPOINT_REWARD.mul(10));

        Medianizer storage medianizer = medianizers[token];
        medianizer.pending.push(checkpoint);
        medianizer.median = checkpoint;
        medianizer.latestTimestamp = block.timestamp;
        medianizer.pendingStartTimestamp = block.timestamp;

        
        for (uint i = 0; i < MAX_CHECKPOINTS; i++) {
            medianizer.prices.push(checkpoint);
        }
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }

    /**
     * @dev Find the median given an array of checkpoints.
     * @param checkpoints The array of checkpoints to find the median.
     * @return The median checkpoint within the given array.
     */
    function _medianize(Checkpoint[] memory checkpoints) internal pure returns (Checkpoint memory) {
        
        uint k = checkpoints.length.div(2); 
        uint left = 0;
        uint right = checkpoints.length.sub(1);

        while (left < right) {
            uint pivotIndex = left.add(right).div(2);
            Checkpoint memory pivotCheckpoint = checkpoints[pivotIndex];

            (checkpoints[pivotIndex], checkpoints[right]) = (checkpoints[right], checkpoints[pivotIndex]);
            uint storeIndex = left;
            for (uint i = left; i < right; i++) {
                if (_isLessThan(checkpoints[i], pivotCheckpoint)) {
                    (checkpoints[storeIndex], checkpoints[i]) = (checkpoints[i], checkpoints[storeIndex]);
                    storeIndex++;
                }
            }

            (checkpoints[storeIndex], checkpoints[right]) = (checkpoints[right], checkpoints[storeIndex]);
            if (storeIndex < k) {
                left = storeIndex.add(1);
            } else {
                right = storeIndex;
            }
        }

        return checkpoints[k];
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Determine if checkpoint x is less than checkpoint y.
     * @param x The first checkpoint for comparison.
     * @param y The second checkpoint for comparison.
     * @return True if x is less than y.
     */
    function _isLessThan(Checkpoint memory x, Checkpoint memory y) internal pure returns (bool) {
        return x.ethReserve.mul(y.tokenReserve) < y.ethReserve.mul(x.tokenReserve);
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

    /**
     * @dev Check if msg.sender is an externally owned account.
     * @return True if msg.sender is an externally owned account, false if smart contract.
     */
    function _isHuman() internal view returns (bool) {
        return msg.sender == tx.origin;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Get the reserve values of a Uniswap exchange for a given token.
     * @param token The token to query the reserve values for.
     * @return A checkpoint holding the appropriate reserve values.
     */
    function _newCheckpoint(address token) internal view returns (Checkpoint memory) {
        address payable exchange = uniswap.getExchange(token);
        return Checkpoint({
            ethReserve: exchange.balance,
            tokenReserve: IERC20(token).balanceOf(exchange)
        });
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

    /**
     * @dev Get subscriber status of a given account for a given token.
     * @param account The account to query.
     * @return True if subscribed.
     */
    function _isSubscriber(Account storage account) internal view returns (bool) {
        
        return account.balance > _getOwedAmount(account);
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }

    /**
     * @dev Get amount owed by an account. Accrued amount minus collections.
     * @param account The account to query.
     * @return Amount owed.
     */
    function _getOwedAmount(Account storage account) internal view returns (uint) {
        if (account.collectionTimestamp == 0) return 0;

        uint timeElapsed = block.timestamp.sub(account.collectionTimestamp);
        return MONTHLY_SUBSCRIPTION_FEE.mul(timeElapsed).div(ONE_MONTH_IN_SECONDS);
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /**
     * @dev Determine whether a given checkpoint would be rewarded with newly minted oracle tokens.
     * @param token The address of the token to query checkpoint for.
     * @param checkpoint The checkpoint to test for reward of oracle tokens.
     * @return True if given checkpoint satisfies any of the following:
     *              Less than required checkpoints exist to calculate a valid median
     *              Exceeds max time since last checkpoint
     *              Exceeds minimum price change from median AND no pending checkpoints
     *              Exceeds minimum percent change from pending checkpoints median
     *              Exceeds minimum percent change from last checkpoint
     */
    function _willRewardCheckpoint(address token, Checkpoint memory checkpoint) internal view returns (bool) {
        Medianizer memory medianizer = medianizers[token];

        return (
            medianizer.prices.length < MAX_CHECKPOINTS ||
            block.timestamp.sub(medianizer.latestTimestamp) >= MAX_TIME_SINCE_LAST_CHECKPOINT ||
            (block.timestamp.sub(medianizer.pendingStartTimestamp) >= PENDING_PERIOD && _percentChange(medianizer.median, checkpoint) >= MIN_PRICE_CHANGE) ||
            _percentChange(medianizer.prices[medianizer.tail], checkpoint) >= MIN_PRICE_CHANGE ||
            _percentChange(medianizer.pending[medianizer.pending.length.sub(1)], checkpoint) >= MIN_PRICE_CHANGE
        );
    }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }

    /**
     * @dev Get the percent change between two checkpoints.
     * @param x The first checkpoint.
     * @param y The second checkpoint.
     * @return The absolute value of the percent change, with 18 decimals of precision (e.g., .01e18 = 1%).
     */
    function _percentChange(Checkpoint memory x, Checkpoint memory y) internal pure returns (uint) {
        uint a = x.ethReserve.mul(y.tokenReserve);
        uint b = y.ethReserve.mul(x.tokenReserve);
        uint diff = a > b ? a.sub(b) : b.sub(a);
        return diff.mul(10 ** 18).div(a);
    }

}