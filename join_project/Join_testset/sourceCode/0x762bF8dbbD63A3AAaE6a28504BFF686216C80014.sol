/**
 *Submitted for verification at Etherscan.io on 2020-09-03
*/

// File: @openzeppelin/contracts/math/Math.sol

pragma solidity ^0.5.0;

/**
 * @dev Standard math utilities missing in the Solidity language.
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
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.5.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    function mint(address account, uint amount) external;

    function burn(uint amount) external;

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.5;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following 
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.0;

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) {// Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/IRewardDistributionRecipient.sol

pragma solidity ^0.5.0;

contract IRewardDistributionRecipient is Ownable {
    address rewardDistribution;
    address public rewardVote;
    address public rewardReferral;

    function notifyRewardAmount(uint256 reward) external;

    modifier onlyRewardDistribution() {
        require(_msgSender() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function setRewardDistribution(address _rewardDistribution) external onlyOwner {
        rewardDistribution = _rewardDistribution;
    }

    function setRewardVote(address _rewardVote) external onlyOwner {
        rewardVote = _rewardVote;
    }

    function setRewardReferral(address _rewardReferral) external onlyOwner {
        rewardReferral = _rewardReferral;
    }
}

// File: contracts/CurveRewards.sol

pragma solidity ^0.5.0;

contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;

    mapping(address => uint256) private _totalSupply; // token_address -> total_supply
    mapping(address => mapping(address => uint256)) private _balances; // token_address -> map(account -> balance)

    function totalSupply(address tokenAddress) public view returns (uint256) {
        return _totalSupply[tokenAddress];
    }

    function balanceOf(address tokenAddress, address account) public view returns (uint256) {
        return _balances[tokenAddress][account];
    }

    function tokenStake(address tokenAddress, uint256 amount) internal {
        address sender = msg.sender;
        require(!address(sender).isContract(), "Andre, we are farming in peace, go harvest somewhere else sir.");
        require(tx.origin == sender, "Andre, stahp.");
        _totalSupply[tokenAddress] = _totalSupply[tokenAddress].add(amount);
        _balances[tokenAddress][sender] = _balances[tokenAddress][sender].add(amount);
        IERC20(tokenAddress).safeTransferFrom(sender, address(this), amount);
    }

    function tokenWithdraw(address tokenAddress, uint256 amount) internal {
        _totalSupply[tokenAddress] = _totalSupply[tokenAddress].sub(amount);
        _balances[tokenAddress][msg.sender] = _balances[tokenAddress][msg.sender].sub(amount);
        IERC20(tokenAddress).safeTransfer(msg.sender, amount);
    }
}

interface IYFVIReferral {
    function setReferrer(address farmer, address referrer) external;
    function getReferrer(address farmer) external view returns (address);
}

interface IYFVIVote {
    function averageVotingValue(address poolAddress, uint256 votingItem) external view returns (uint16);
}

contract YFVIRewardsStableCoin is LPTokenWrapper, IRewardDistributionRecipient {
    IERC20 public token;

    uint256 public constant DURATION = 7 days;
    uint8 public constant NUMBER_EPOCHS = 10;
    uint256 public constant REFERRAL_COMMISSION_PERCENT = 5;
    uint256 public constant EPOCH_REWARD = 63000 ether;
    uint256 public constant TOTAL_REWARD = EPOCH_REWARD * NUMBER_EPOCHS;
    uint256 public initreward = EPOCH_REWARD;
    uint256 public currentEpochReward = initreward;
    uint256 public totalAccumulatedReward = 0;
    uint8 public currentEpoch = 0;
    uint256 public starttime = 0;
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public accumulatedStakingPower; // will accumulate every time staker does getReward()

    address public USDT_TOKEN_ADDRESS;
    address public USDC_TOKEN_ADDRESS;
    address public TUSD_TOKEN_ADDRESS;
    address public DAI_TOKEN_ADDRESS;
    address payable private _wallet;

    address[4] public SUPPORTED_STAKING_COIN_ADDRESSES;
    uint256[4] public SUPPORTED_STAKING_COIN_WEI_MULTIPLE = [1000000000000, 1000000000000, 1, 1];

    mapping(address => uint256) public supportedStakingCoinWeiMultiple; // token_address -> wei_multiple (because USDT and USDC have decimals = 6 only. Need to multiply by 1e12)
    mapping(address => address) public affiliate; // account_address -> referrer_address
    mapping(address => uint256) public referredCount; // referrer_address -> num_of_referred

    event RewardAdded(uint256 reward);
    event Burned(uint256 reward);
    event Staked(address indexed user, address indexed tokenAddress, uint256 amount);
    event Withdrawn(address indexed user, address indexed tokenAddress, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
    event CommissionPaid(address indexed user, uint256 reward);

    constructor (address payable wallet, address usdtAddr, address usdcAddr, address tusdAddr, address daiAddr, address tokenAddr, uint256 genesis) public {
        _wallet = wallet;
        USDT_TOKEN_ADDRESS = usdtAddr;
        USDC_TOKEN_ADDRESS = usdcAddr;
        TUSD_TOKEN_ADDRESS = tusdAddr;
        DAI_TOKEN_ADDRESS = daiAddr;
        token = IERC20(tokenAddr);
        starttime = genesis;
        SUPPORTED_STAKING_COIN_ADDRESSES = [USDT_TOKEN_ADDRESS, USDC_TOKEN_ADDRESS, TUSD_TOKEN_ADDRESS, DAI_TOKEN_ADDRESS];
        for (uint8 i = 0; i < 4; i++) {
            supportedStakingCoinWeiMultiple[SUPPORTED_STAKING_COIN_ADDRESSES[i]] = SUPPORTED_STAKING_COIN_WEI_MULTIPLE[i];
        }
    }

    modifier updateReward(address account) {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = lastTimeRewardApplicable();
        if (account != address(0)) {
            rewards[account] = earned(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    function lastTimeRewardApplicable() public view returns (uint256) {
        return Math.min(block.timestamp, periodFinish);
    }

    function weiTotalSupply() public view returns (uint256) {
        uint256 __weiTotalSupply = 0;
        for (uint8 i = 0; i < 4; i++) {
            __weiTotalSupply = __weiTotalSupply.add(super.totalSupply(SUPPORTED_STAKING_COIN_ADDRESSES[i]).mul(SUPPORTED_STAKING_COIN_WEI_MULTIPLE[i]));
        }
        return __weiTotalSupply;
    }

    function rewardPerToken() public view returns (uint256) {
        if (weiTotalSupply() == 0) {
            return rewardPerTokenStored;
        }
        return
        rewardPerTokenStored.add(
            lastTimeRewardApplicable()
            .sub(lastUpdateTime)
            .mul(rewardRate)
            .mul(1e18)
            .div(weiTotalSupply())
        );
    }

    function weiBalanceOf(address account) public view returns (uint256) {
        uint256 __weiBalance = 0;
        for (uint8 i = 0; i < 4; i++) {
            uint256 __balance = super.balanceOf(SUPPORTED_STAKING_COIN_ADDRESSES[i], account);
            if (__balance > 0) {
                __weiBalance = __weiBalance.add(__balance.mul(SUPPORTED_STAKING_COIN_WEI_MULTIPLE[i]));
            }
        }
        return __weiBalance;
    }

    function earned(address account) public view returns (uint256) {
        return
        weiBalanceOf(account)
        .mul(rewardPerToken().sub(userRewardPerTokenPaid[account]))
        .div(1e18)
        .add(rewards[account]);
    }

    function stakingPower(address account) public view returns (uint256) {
        return accumulatedStakingPower[account].add(earned(account));
    }

    function wallet() public view returns (address payable) {
        return _wallet;
    }

    function stake(address tokenAddress, uint256 amount, address referrer) public updateReward(msg.sender) checkNextEpoch checkStart {
        require(amount > 0, "Cannot stake 0");
        require(supportedStakingCoinWeiMultiple[tokenAddress] > 0, "Not supported coin");
        require(referrer != msg.sender, "You cannot refer yourself.");
        super.tokenStake(tokenAddress, amount);
        emit Staked(msg.sender, tokenAddress, amount);
        if (rewardReferral != address(0) && referrer != address(0)) {
            IYFVIReferral(rewardReferral).setReferrer(msg.sender, referrer);
        }
    }

    function withdraw(address tokenAddress, uint256 amount) public updateReward(msg.sender) checkNextEpoch checkStart {
        require(amount > 0, "Cannot withdraw 0");
        require(supportedStakingCoinWeiMultiple[tokenAddress] > 0, "Not supported coin");
        super.tokenWithdraw(tokenAddress, amount);
        emit Withdrawn(msg.sender, tokenAddress, amount);
    }

    function exit() external {
        for (uint8 i = 0; i < 4; i++) {
            uint256 __balance = balanceOf(SUPPORTED_STAKING_COIN_ADDRESSES[i], msg.sender);
            if (__balance > 0) {
                withdraw(SUPPORTED_STAKING_COIN_ADDRESSES[i], __balance);
            }
        }
        getReward();
    }

    function getReward() public updateReward(msg.sender) checkNextEpoch checkStart {
        uint256 reward = earned(msg.sender);
        if (reward > 1) {
            accumulatedStakingPower[msg.sender] = accumulatedStakingPower[msg.sender].add(rewards[msg.sender]);
            rewards[msg.sender] = 0;

            uint256 actualPaid = reward.mul(100 - REFERRAL_COMMISSION_PERCENT).div(100); // 95%
            uint256 commission = reward - actualPaid; // 5%

            token.safeTransfer(msg.sender, actualPaid);
            emit RewardPaid(msg.sender, actualPaid);

            address referrer = address(0);
            if (rewardReferral != address(0)) {
                referrer = IYFVIReferral(rewardReferral).getReferrer(msg.sender);
            }
            if (referrer != address(0)) { // send commission to referrer
                token.safeTransfer(referrer, commission);
                emit RewardPaid(msg.sender, commission);
            } else {// or sent to vault
                token.safeTransfer(_wallet, commission);
                emit RewardPaid(_wallet, commission);
            }
        }
    }

    function nextRewardMultiplier() public view returns (uint16) {
        if (rewardVote != address(0)) {
            uint16 votingValue = IYFVIVote(rewardVote).averageVotingValue(address(this), periodFinish);
            if (votingValue > 0) return votingValue;
        }
        return 100;
    }

    modifier checkNextEpoch() {
        if (block.timestamp >= periodFinish) {
            initreward = EPOCH_REWARD; // (by consensus)

            uint16 rewardMultiplier = nextRewardMultiplier(); // 50% -> 200% (by vote)
            currentEpochReward = initreward.mul(rewardMultiplier).div(100); // x0.50 -> x2.00 (by vote)

            if (totalAccumulatedReward.add(currentEpochReward) > TOTAL_REWARD) {
                currentEpochReward = TOTAL_REWARD.sub(totalAccumulatedReward); // limit total reward
            }

            if (currentEpochReward > 0) {
                token.mint(address(this), currentEpochReward);
                totalAccumulatedReward = totalAccumulatedReward.add(currentEpochReward);
                currentEpoch++;
            }

            rewardRate = currentEpochReward.div(DURATION);
            periodFinish = block.timestamp.add(DURATION);
            emit RewardAdded(currentEpochReward);
        }
        _;
    }

    modifier checkStart() {
        require(block.timestamp > starttime, "not start");
        _;
    }

    function notifyRewardAmount(uint256 reward) external onlyRewardDistribution updateReward(address(0)) {
        if (block.timestamp >= periodFinish) {
            rewardRate = reward.div(DURATION);
        } else {
            uint256 remaining = periodFinish.sub(block.timestamp);
            uint256 leftover = remaining.mul(rewardRate);
            rewardRate = reward.add(leftover).div(DURATION);
        }
        token.mint(address(this), reward);
        totalAccumulatedReward = totalAccumulatedReward.add(reward);
        currentEpoch++;
        lastUpdateTime = block.timestamp;
        periodFinish = block.timestamp.add(DURATION);
        emit RewardAdded(reward);
    }
}