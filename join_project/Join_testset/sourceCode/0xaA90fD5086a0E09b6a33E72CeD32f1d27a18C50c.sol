/**
 *Submitted for verification at Etherscan.io on 2020-09-22
*/

// File: @openzeppelin/contracts/GSN/Context.sol

// SPDX-License-Identifier: GPL-3.0-only AND MIT

pragma solidity ^0.6.0;

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

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
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

// File: @openzeppelin/contracts/math/SafeMath.sol


pragma solidity ^0.6.0;

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
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol


pragma solidity ^0.6.2;

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
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol


pragma solidity ^0.6.0;





/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20MinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}

// File: @openzeppelin/contracts/access/Ownable.sol


pragma solidity ^0.6.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
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
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/Miner.sol


pragma solidity ^0.6.0;



contract Miner is ERC20, Ownable {
    uint8 private constant DECIMALS = 18;

    address private _minter;

    constructor() public ERC20("Miner", "MINER") Ownable() {
        // explicitly require a minter to be created.
        _minter = address(0);
        _setupDecimals(DECIMALS);
    }

    /**
     * Sets the minter address.
     * @param minter address The minter address.
     */
    function setMinter(address minter) public onlyOwner {
        require(minter != address(0), "Miner/zero-address");
        _minter = minter;
    }

    /**
     * Gets the minter address.
     * @return address The minter address.
     */
    function getMinter() public view returns (address) {
        return _minter;
    }

    function mint(uint256 amount) public onlyMinter {
        _mint(_msgSender(), amount);
    }

    /**
     * Checks that the minter is assigned and is the calling user.
     * If msg.sender does not match the minter, the test blows the gas limit
     * out. Not sure why it doesn't revert on the require.
     */
    modifier onlyMinter {
        require(getMinter() == _msgSender(), "Miner/invalid-minter");
        _;
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol


pragma solidity ^0.6.0;




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
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
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

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/Treasury.sol


pragma solidity ^0.6.0;





enum ProposalType { Mint, Access, Withdrawal }

enum AccessAction { None, Grant, Revoke }

struct Proposal {
    address proposer;
    uint256 expires;
    uint256 signatures;
    bool open;
    ProposalType proposalType;
}

struct Veto {
    address proposer;
    uint256 endorsements;
    bool enforced;
    uint256 proposal;
}

struct MintProposal {
    uint256 amount;
}

struct WithdrawalProposal {
    address recipient;
    uint256 amount;
}

struct AccessProposal {
    address signatory;
    AccessAction action;
}

struct Signatory {
    AccessAction action;
}

contract Treasury is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for Miner;

    Miner private _token;

    uint8 public constant MINIMUM_SIGNATORIES = 3;

    mapping(address => Signatory) public signatories;
    address[] public signatoriesIndex;
    uint256 public grantedCount;

    Proposal[] public proposals;
    // signatures[proposalIndex][signatoryAddress] = signed (true)
    mapping(uint256 => mapping(address => bool)) public signed;
    mapping(uint256 => address[]) public signatures;

    Veto[] public vetoes;
    mapping(uint256 => bool) public vetoedProposals;
    mapping(uint256 => mapping(address => bool)) public vetoed;
    mapping(uint256 => address[]) public vetoers;

    mapping(uint256 => AccessProposal) public accessProposals;
    mapping(uint256 => MintProposal) public mintProposals;
    mapping(uint256 => WithdrawalProposal) public withdrawalProposals;

    constructor(Miner token) public {
        _token = token;
        _grantSignatory(_msgSender());
    }

    function inSigningPeriod() public view returns (bool) {
        if (proposals.length == 0) {
            return false;
        }

        uint256 i = proposals.length.sub(1);
        return _inSigningPeriod(i);
    }

    function _inSigningPeriod(uint256 i) private view returns (bool) {
        return proposals[i].expires > now;
    }

    /**
     * Proposes a minting event.
     * @param amount uint256 The proposed amount to mint.
     */
    function proposeMint(uint256 amount)
        external
        onlySignatory()
        noPendingProposals()
        minimumSignatories()
    {
        require(amount > 0, "Treasury/zero-amount");

        mintProposals[proposals.length] = MintProposal(amount);

        _propose(ProposalType.Mint);
    }

    /**
     * Proposes the granting of signatory based on their public address.
     * @param signatory address The address of the signatory to grant access
     * to.
     */
    function proposeGrant(address signatory)
        external
        onlySignatory()
        noPendingProposals()
    {
        require(signatory != address(0), "Treasury/invalid-address");
        require(
            signatories[signatory].action != AccessAction.Grant,
            "Treasury/access-granted"
        );

        uint256 index = getProposalsCount();

        accessProposals[index] = AccessProposal(signatory, AccessAction.Grant);

        _propose(ProposalType.Access);
    }

    /**
     * Proposes the revoking of a signatory based on their public address.
     * @param signatory address The address of the signatory to revoke access
     * from.
     */
    function proposeRevoke(address signatory)
        external
        onlySignatory()
        noPendingProposals()
    {
        require(
            grantedCount > MINIMUM_SIGNATORIES,
            "Treasury/minimum-signatories"
        );
        require(signatory != address(0), "Treasury/invalid-address");
        require(
            signatories[signatory].action == AccessAction.Grant,
            "Treasury/no-signatory-or-revoked"
        );

        uint256 index = getProposalsCount();

        accessProposals[index] = AccessProposal(signatory, AccessAction.Revoke);

        _propose(ProposalType.Access);
    }

    /**
     * Proposes the withdrawal of Miner to a recipient's wallet address.
     * @param recipient address The address of the recipient.
     * @param amount uint256 The amount of Miner to withdraw to the recipient's
     * wallet.
     */
    function proposeWithdrawal(address recipient, uint256 amount)
        external
        onlySignatory()
        noPendingProposals()
        minimumSignatories()
    {
        require(amount > 0, "Treasury/zero-amount");

        withdrawalProposals[proposals.length] = WithdrawalProposal(
            recipient,
            amount
        );

        _propose(ProposalType.Withdrawal);
    }

    /**
     * Veto an existing, pending proposal.
     */
    function vetoProposal()
        external
        onlySignatory()
        minimumSignatories()
        latestProposalPending()
    {
        uint256 totalProposals = getProposalsCount();

        uint256 index = totalProposals.sub(1);

        require(!vetoedProposals[index], "Treasury/veto-pending");

        Veto memory veto = Veto(msg.sender, 0, false, index);

        vetoedProposals[index] = true;
        vetoes.push(veto);

        endorseVeto();
    }

    /**
     * Endorse a veto.
     */
    function endorseVeto()
        public
        latestProposalPending()
        onlySignatory()
    {
        uint256 totalVetoes = getVetoCount();

        require(totalVetoes > 0, "Treasury/no-vetoes");

        uint256 index = totalVetoes.sub(1);

        require(
            vetoed[index][msg.sender] != true,
            "Treasury/signatory-already-vetoed"
        );

        Proposal storage vetoedProposal = proposals[vetoes[index].proposal];

        vetoed[index][msg.sender] = true;
        vetoers[index].push(msg.sender);

        vetoes[index].endorsements = vetoes[index].endorsements.add(1);

        if (vetoes[index].endorsements >= getRequiredSignatoryCount()) {
            proposals[vetoes[index].proposal].open = false;
            vetoes[index].enforced = true;

            _revokeSignatory(vetoedProposal.proposer);

            emit Vetoed(index, vetoes[index].proposal);
        }
    }

    function _propose(ProposalType proposalType) private returns (uint256) {
        Proposal memory proposal = Proposal(
            msg.sender,
            now + 48 hours,
            0,
            true,
            proposalType
        );

        proposals.push(proposal);

        sign();
    }

    /**
     * Gets the total number of signatories.
     *
     * The getSignatoryCount gets the total number of signatories, whether
     * their access is granted or revoked. To retrieve the number of granted
     * signatories, use grantedCount.
     * @return uint256 The total number of signatories.
     */
    function getSignatoryCount() public view returns (uint256) {
        return signatoriesIndex.length;
    }

    /**
     * Gets the number of proposals.
     * @return uint256 The number of proposals.
     */
    function getProposalsCount() public view returns (uint256) {
        return proposals.length;
    }

    /**
     * Gets the number of vetoes.
     * @return uint256 The number of vetoes.
     */
    function getVetoCount() public view returns (uint256) {
        return vetoes.length;
    }

    /**
     * Gets the signatures for a proposal.
     * @param proposal uint256 the proposal id.
     * @return address[] A list if signatures for the proposal.
     */
    function getSignatures(uint256 proposal)
        external
        view
        returns (address[] memory)
    {
        return signatures[proposal];
    }

    /**
     * Gets the signatures for a veto.
     * @param veto uint256 the veto id.
     * @return address[] A list if signatures for the veto.
     */
    function getVetoEndorsements(uint256 veto)
        external
        view
        returns (address[] memory)
    {
        return vetoers[veto];
    }

    /**
     * Signs a proposal. If the required number of signatories is reached,
     * execute the appropriate proposal action.
     */
    function sign() public onlySignatory() latestProposalPending() {
        require(proposals.length > 0, "Treasury/no-proposals");
        uint256 index = getProposalsCount().sub(1);

        require(
            signed[index][msg.sender] != true,
            "Treasury/signatory-already-signed"
        );

        signatures[index].push(msg.sender);
        signed[index][msg.sender] = true;
        proposals[index].signatures = proposals[index].signatures.add(1);

        if (proposals[index].signatures >= getRequiredSignatoryCount()) {
            proposals[index].open = false;

            if (proposals[index].proposalType == ProposalType.Mint) {
                _printerGoesBrr(mintProposals[index].amount);
            } else if (
                proposals[index].proposalType == ProposalType.Withdrawal
            ) {
                _withdraw(
                    withdrawalProposals[index].recipient,
                    withdrawalProposals[index].amount
                );
            } else {
                _updateSignatoryAccess();
            }
        }

        emit Signed(index);
    }

    function getRequiredSignatoryCount() public view returns (uint256) {
        return grantedCount.div(2).add(1);
    }

    function _updateSignatoryAccess() private {
        uint256 index = getProposalsCount().sub(1);
        // is this a new signatory?
        address signatory = accessProposals[index].signatory;

        if (accessProposals[index].action == AccessAction.Grant) {
            _grantSignatory(signatory);

            emit AccessGranted(signatory);
        } else {
            _revokeSignatory(signatory);

            emit AccessRevoked(signatory);
        }
    }

    function _grantSignatory(address signatory) private {
        // if a new signatory, add to list.
        if (signatories[signatory].action != AccessAction.Revoke) {
            signatoriesIndex.push(signatory);
        }

        signatories[signatory] = Signatory(AccessAction.Grant);
        grantedCount = grantedCount.add(1);
    }

    function _revokeSignatory(address signatory) private {
        signatories[signatory] = Signatory(AccessAction.Revoke);
        grantedCount = grantedCount.sub(1);
    }

    function _printerGoesBrr(uint256 amount) private {
        _token.mint(amount);

        Minted(amount);
    }

    function _withdraw(address recipient, uint256 amount) private {
        _token.transfer(recipient, amount);

        emit Withdrawn(recipient, amount);
    }

    modifier onlySignatory() {
        require(
            signatories[msg.sender].action == AccessAction.Grant,
            "Treasury/invalid-signatory"
        );
        _;
    }

    modifier latestProposalPending() {
        uint256 totalProposals = getProposalsCount();

        if (totalProposals > 0) {
            uint256 index = totalProposals.sub(1);

            require(
                proposals[index].open && inSigningPeriod(),
                "Treasury/proposal-expired"
            );
        }
        _;
    }

    modifier noPendingProposals() {
        uint256 totalProposals = getProposalsCount();

        if (totalProposals > 0) {
            uint256 index = totalProposals.sub(1);

            require(
                !proposals[index].open || !inSigningPeriod(),
                "Treasury/proposal-pending"
            );
        }
        _;
    }

    modifier minimumSignatories() {
        require(
            grantedCount >= MINIMUM_SIGNATORIES,
            "Treasury/minimum-signatories"
        );
        _;
    }

    event Signed(uint256 index);

    event AccessGranted(address signatory);
    event AccessRevoked(address signatory);

    event Minted(uint256 amount);

    event Withdrawn(address recipient, uint256 amount);

    event Vetoed(uint256 veto, uint256 proposal);
}