/**
 *Submitted for verification at Etherscan.io on 2020-10-16
*/

// File: @openzeppelin\contracts\token\ERC20\IERC20.sol

// SPDX-License-Identifier: MIT

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

// File: node_modules\@openzeppelin\contracts\math\SafeMath.sol

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
     *
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
     *
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
     *
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
     *
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
     *
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
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
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
     *
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
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: node_modules\@openzeppelin\contracts\utils\Address.sol

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

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin\contracts\token\ERC20\SafeERC20.sol

pragma solidity ^0.6.0;




/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
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

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
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
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin\contracts\utils\EnumerableSet.sol

pragma solidity ^0.6.0;

/**
 * @dev Library for managing
 * https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
 * types.
 *
 * Sets have the following properties:
 *
 * - Elements are added, removed, and checked for existence in constant time
 * (O(1)).
 * - Elements are enumerated in O(n). No guarantees are made on the ordering.
 *
 * ```
 * contract Example {
 *     // Add the library methods
 *     using EnumerableSet for EnumerableSet.AddressSet;
 *
 *     // Declare a set state variable
 *     EnumerableSet.AddressSet private mySet;
 * }
 * ```
 *
 * As of v3.0.0, only sets of type `address` (`AddressSet`) and `uint256`
 * (`UintSet`) are supported.
 */
library EnumerableSet {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;

        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) { // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            // When the value to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            bytes32 lastvalue = set._values[lastIndex];

            // Move the last value to the index where the value to delete is
            set._values[toDeleteIndex] = lastvalue;
            // Update the index for the moved value
            set._indexes[lastvalue] = toDeleteIndex + 1; // All indexes are 1-based

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        require(set._values.length > index, "EnumerableSet: index out of bounds");
        return set._values[index];
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint256(_at(set._inner, index)));
    }


    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }
}

// File: node_modules\@openzeppelin\contracts\GSN\Context.sol

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
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin\contracts\access\Ownable.sol

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

// File: contracts\SakeToken.sol

pragma solidity 0.6.12;






// SakeToken with Governance.
contract SakeToken is Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name = "SakeToken";
    string private _symbol = "SAKE";
    uint8 private _decimals = 18;

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

        _moveDelegates(_delegates[sender], _delegates[recipient], amount);
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

    /// @notice Creates `_amount` token to `_to`. Must only be called by the owner (SakeMaster).
    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
        _moveDelegates(address(0), _delegates[_to], _amount);
    }

    // Copied and modified from YAM code:
    // https://github.com/yam-finance/yam-protocol/blob/master/contracts/token/YAMGovernanceStorage.sol
    // https://github.com/yam-finance/yam-protocol/blob/master/contracts/token/YAMGovernance.sol
    // Which is copied and modified from COMPOUND:
    // https://github.com/compound-finance/compound-protocol/blob/master/contracts/Governance/Comp.sol

    /// @notice A record of each accounts delegate
    mapping (address => address) internal _delegates;

    /// @notice A checkpoint for marking number of votes from a given block
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

    /// @notice A record of votes checkpoints for each account, by index
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

    /// @notice The number of checkpoints for each account
    mapping (address => uint32) public numCheckpoints;

    /// @notice The EIP-712 typehash for the contract's domain
    bytes32 public constant DOMAIN_TYPEHASH = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");

    /// @notice The EIP-712 typehash for the delegation struct used by the contract
    bytes32 public constant DELEGATION_TYPEHASH = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");

    /// @notice A record of states for signing / validating signatures
    mapping (address => uint) public nonces;

    /// @notice An event thats emitted when an account changes its delegate
    event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);

    /// @notice An event thats emitted when a delegate account's vote balance changes
    event DelegateVotesChanged(address indexed delegate, uint previousBalance, uint newBalance);

    /**
     * @notice Delegate votes from `msg.sender` to `delegatee`
     * @param delegator The address to get delegatee for
     */
    function delegates(address delegator)
        external
        view
        returns (address)
    {
        return _delegates[delegator];
    }

   /**
    * @notice Delegate votes from `msg.sender` to `delegatee`
    * @param delegatee The address to delegate votes to
    */
    function delegate(address delegatee) external {
        return _delegate(msg.sender, delegatee);
    }

    /**
     * @notice Delegates votes from signatory to `delegatee`
     * @param delegatee The address to delegate votes to
     * @param nonce The contract state required to match the signature
     * @param expiry The time at which to expire the signature
     * @param v The recovery byte of the signature
     * @param r Half of the ECDSA signature pair
     * @param s Half of the ECDSA signature pair
     */
    function delegateBySig(
        address delegatee,
        uint nonce,
        uint expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        external
    {
        bytes32 domainSeparator = keccak256(
            abi.encode(
                DOMAIN_TYPEHASH,
                keccak256(bytes(name())),
                getChainId(),
                address(this)
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                DELEGATION_TYPEHASH,
                delegatee,
                nonce,
                expiry
            )
        );

        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                domainSeparator,
                structHash
            )
        );

        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "SAKE::delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "SAKE::delegateBySig: invalid nonce");
        require(now <= expiry, "SAKE::delegateBySig: signature expired");
        return _delegate(signatory, delegatee);
    }

    /**
     * @notice Gets the current votes balance for `account`
     * @param account The address to get votes balance
     * @return The number of current votes for `account`
     */
    function getCurrentVotes(address account)
        external
        view
        returns (uint256)
    {
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

    /**
     * @notice Determine the prior number of votes for an account as of a block number
     * @dev Block number must be a finalized block or else this function will revert to prevent misinformation.
     * @param account The address of the account to check
     * @param blockNumber The block number to get the vote balance at
     * @return The number of votes the account had as of the given block
     */
    function getPriorVotes(address account, uint blockNumber)
        external
        view
        returns (uint256)
    {
        require(blockNumber < block.number, "SAKE::getPriorVotes: not yet determined");

        uint32 nCheckpoints = numCheckpoints[account];
        if (nCheckpoints == 0) {
            return 0;
        }

        // First check most recent balance
        if (checkpoints[account][nCheckpoints - 1].fromBlock <= blockNumber) {
            return checkpoints[account][nCheckpoints - 1].votes;
        }

        // Next check implicit zero balance
        if (checkpoints[account][0].fromBlock > blockNumber) {
            return 0;
        }

        uint32 lower = 0;
        uint32 upper = nCheckpoints - 1;
        while (upper > lower) {
            uint32 center = upper - (upper - lower) / 2; // ceil, avoiding overflow
            Checkpoint memory cp = checkpoints[account][center];
            if (cp.fromBlock == blockNumber) {
                return cp.votes;
            } else if (cp.fromBlock < blockNumber) {
                lower = center;
            } else {
                upper = center - 1;
            }
        }
        return checkpoints[account][lower].votes;
    }

    function _delegate(address delegator, address delegatee)
        internal
    {
        address currentDelegate = _delegates[delegator];
        uint256 delegatorBalance = balanceOf(delegator); // balance of underlying SAKEs (not scaled);
        _delegates[delegator] = delegatee;

        emit DelegateChanged(delegator, currentDelegate, delegatee);

        _moveDelegates(currentDelegate, delegatee, delegatorBalance);
    }

    function _moveDelegates(address srcRep, address dstRep, uint256 amount) internal {
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                // decrease old representative
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint256 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint256 srcRepNew = srcRepOld.sub(amount);
                _writeCheckpoint(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                // increase new representative
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint256 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint256 dstRepNew = dstRepOld.add(amount);
                _writeCheckpoint(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _writeCheckpoint(
        address delegatee,
        uint32 nCheckpoints,
        uint256 oldVotes,
        uint256 newVotes
    )
        internal
    {
        uint32 blockNumber = safe32(block.number, "SAKE::_writeCheckpoint: block number exceeds 32 bits");

        if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[delegatee] = nCheckpoints + 1;
        }

        emit DelegateVotesChanged(delegatee, oldVotes, newVotes);
    }

    function safe32(uint n, string memory errorMessage) internal pure returns (uint32) {
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function getChainId() internal pure returns (uint) {
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}

// File: contracts\SakeMasterV2.sol

pragma solidity 0.6.12;







// SakeMaster is the master of Sake. He can make Sake and he is a fair guy.
//
// Note that it's ownable and the owner wields tremendous power. The ownership
// will be transferred to a governance smart contract once SAKE is sufficiently
// distributed and the community can show to govern itself.
//
// Have fun reading it. Hopefully it's bug-free. God bless.
contract SakeMasterV2 is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    // Info of each user.
    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        uint256 amountStoken; // How many S tokens the user has provided.
        uint256 amountLPtoken; // How many LP tokens the user has provided.
        uint256 pengdingSake; // record sake amount when user withdraw lp.
        uint256 rewardDebt; // Reward debt. See explanation below.
        uint256 lastWithdrawBlock; // user last withdraw time;

        //
        // We do some fancy math here. Basically, any point in time, the amount of SAKEs
        // entitled to a user but is pending to be distributed is:
        //
        //   pending reward = (user.amount * pool.accSakePerShare) - user.rewardDebt
        //
        // Whenever a user deposits or withdraws LP tokens to a pool. Here's what happens:
        //   1. The pool's `accSakePerShare` (and `lastRewardBlock`) gets updated.
        //   2. User receives the pending reward sent to his/her address.
        //   3. User's `amount` gets updated.
        //   4. User's `rewardDebt` gets updated.
    }

    // Info of each pool.
    struct PoolInfo {
        IERC20 lpToken; // Address of LP token contract.
        IERC20 sToken; // Address of S token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. SAKEs to distribute per block.
        uint256 lastRewardBlock; // Last block number that SAKEs distribution occurs.
        uint256 accSakePerShare; // Accumulated SAKEs per share, times 1e12. See below.
        uint256 multiplierSToken; // times 1e8;
        bool sakeLockSwitch; // true-have sake withdraw interval,default 1 months;false-no withdraw interval,but have sake withdraw fee,default 10%
    }

    // The SAKE TOKEN!
    SakeToken public sake;
    // sakeMaker address.
    address public sakeMaker;
    // admin address.
    address public admin;
    // receive sake fee address
    address public sakeFeeAddress;
    // Block number when trade mining speed up period ends.
    uint256 public tradeMiningSpeedUpEndBlock;
    // Block number when phase II yield farming period ends.
    uint256 public yieldFarmingIIEndBlock;
    // Block number when trade mining period ends.
    uint256 public tradeMiningEndBlock;
    // trade mining speed end block num,about 1 months.
    uint256 public tradeMiningSpeedUpEndBlockNum = 192000;
    // phase II yield farming end block num,about 6 months.
    uint256 public yieldFarmingIIEndBlockNum = 1152000;
    // trade mining end block num,about 12 months.
    uint256 public tradeMiningEndBlockNum = 2304000;
    // SAKE tokens created per block for phase II yield farming.
    uint256 public sakePerBlockYieldFarming = 5 * 10**18;
    // SAKE tokens created per block for trade mining.
    uint256 public sakePerBlockTradeMining = 10 * 10**18;
    // Bonus muliplier for trade mining.
    uint256 public constant BONUS_MULTIPLIER = 2;
    // withdraw block num interval,about 1 months.
    uint256 public withdrawInterval = 192000;
    // Total allocation poitns. Must be the sum of all allocation points in all pools.
    uint256 public totalAllocPoint = 0;
    // The block number when SAKE mining starts.
    uint256 public startBlock;
    // The ratio of withdraw lp fee(default is 0%)
    uint8 public lpFeeRatio = 0;
    // The ratio of withdraw sake fee if no withdraw interval(default is 10%)
    uint8 public sakeFeeRatio = 10;

    // Info of each pool.
    PoolInfo[] public poolInfo;
    // Info of each user that stakes LP tokens and S tokens.
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;

    event Deposit(address indexed user, uint256 indexed pid, uint256 amountLPtoken, uint256 amountStoken);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amountLPtoken);
    event EmergencyWithdraw(address indexed user, uint256 indexed pid, uint256 amountLPtoken);

    constructor(
        SakeToken _sake,
        address _admin,
        address _sakeMaker,
        address _sakeFeeAddress,
        uint256 _startBlock
    ) public {
        sake = _sake;
        admin = _admin;
        sakeMaker = _sakeMaker;
        sakeFeeAddress = _sakeFeeAddress;
        startBlock = _startBlock;
        tradeMiningSpeedUpEndBlock = startBlock.add(tradeMiningSpeedUpEndBlockNum);
        yieldFarmingIIEndBlock = startBlock.add(yieldFarmingIIEndBlockNum);
        tradeMiningEndBlock = startBlock.add(tradeMiningEndBlockNum);
    }

    function poolLength() external view returns (uint256) {
        return poolInfo.length;
    }

    // XXX DO NOT add the same LP token more than once.
    function _checkValidity(IERC20 _lpToken, IERC20 _sToken) internal view {
        for (uint256 i = 0; i < poolInfo.length; i++) {
            require(poolInfo[i].lpToken != _lpToken && poolInfo[i].sToken != _sToken, "pool exist");
        }
    }

    // Add a new lp to the pool. Can only be called by the admin.
    function add(
        uint256 _allocPoint,
        uint256 _multiplierSToken,
        IERC20 _lpToken,
        IERC20 _sToken,
        bool _withUpdate
    ) public {
        require(msg.sender == admin, "add:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        _checkValidity(_lpToken, _sToken);
        uint256 lastRewardBlock = block.number > startBlock ? block.number : startBlock;
        totalAllocPoint = totalAllocPoint.add(_allocPoint);
        poolInfo.push(
            PoolInfo({
                lpToken: _lpToken,
                sToken: _sToken,
                allocPoint: _allocPoint,
                multiplierSToken: _multiplierSToken,
                lastRewardBlock: lastRewardBlock,
                accSakePerShare: 0,
                sakeLockSwitch: true
            })
        );
    }

    // Update the given pool's SAKE allocation point. Can only be called by the admin.
    function set(
        uint256 _pid,
        uint256 _allocPoint,
        bool _withUpdate
    ) public {
        require(msg.sender == admin, "set:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        totalAllocPoint = totalAllocPoint.sub(poolInfo[_pid].allocPoint).add(_allocPoint);
        poolInfo[_pid].allocPoint = _allocPoint;
    }

    function setMultiplierSToken(
        uint256 _pid,
        uint256 _multiplierSToken,
        bool _withUpdate
    ) public {
        require(msg.sender == admin, "sms:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        poolInfo[_pid].multiplierSToken = _multiplierSToken;
    }

    // set sake withdraw switch. Can only be called by the admin.
    function setSakeLockSwitch(
        uint256 _pid,
        bool _sakeLockSwitch,
        bool _withUpdate
    ) public {
        require(msg.sender == admin, "s:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        poolInfo[_pid].sakeLockSwitch = _sakeLockSwitch;
    }

    // Return reward multiplier over the given _from to _to block.
    function getMultiplier(uint256 _from, uint256 _to) public view returns (uint256 multipY, uint256 multipT) {
        uint256 _toFinalY = _to > yieldFarmingIIEndBlock ? yieldFarmingIIEndBlock : _to;
        uint256 _toFinalT = _to > tradeMiningEndBlock ? tradeMiningEndBlock : _to;
        // phase II yield farming multiplier
        if (_from >= yieldFarmingIIEndBlock) {
            multipY = 0;
        } else {
            multipY = _toFinalY.sub(_from);
        }
        // trade mining multiplier
        if (_from >= tradeMiningEndBlock) {
            multipT = 0;
        } else {
            if (_toFinalT <= tradeMiningSpeedUpEndBlock) {
                multipT = _toFinalT.sub(_from).mul(BONUS_MULTIPLIER);
            } else {
                if (_from < tradeMiningSpeedUpEndBlock) {
                    multipT = tradeMiningSpeedUpEndBlock.sub(_from).mul(BONUS_MULTIPLIER).add(
                        _toFinalT.sub(tradeMiningSpeedUpEndBlock)
                    );
                } else {
                    multipT = _toFinalT.sub(_from);
                }
            }
        }
    }

    function getSakePerBlock(uint256 blockNum) public view returns (uint256) {
        if (blockNum <= tradeMiningSpeedUpEndBlock) {
            return sakePerBlockYieldFarming.add(sakePerBlockTradeMining.mul(BONUS_MULTIPLIER));
        } else if (blockNum > tradeMiningSpeedUpEndBlock && blockNum <= yieldFarmingIIEndBlock) {
            return sakePerBlockYieldFarming.add(sakePerBlockTradeMining);
        } else if (blockNum > yieldFarmingIIEndBlock && blockNum <= tradeMiningEndBlock) {
            return sakePerBlockTradeMining;
        } else {
            return 0;
        }
    }

    // Handover the saketoken mintage right.
    function handoverSakeMintage(address newOwner) public onlyOwner {
        sake.transferOwnership(newOwner);
    }

    // View function to see pending SAKEs on frontend.
    function pendingSake(uint256 _pid, address _user) external view returns (uint256) {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_user];
        uint256 accSakePerShare = pool.accSakePerShare;
        uint256 lpTokenSupply = pool.lpToken.balanceOf(address(this));
        uint256 sTokenSupply = pool.sToken.balanceOf(address(this));
        if (block.number > pool.lastRewardBlock && lpTokenSupply != 0) {
            uint256 totalSupply = lpTokenSupply.add(sTokenSupply.mul(pool.multiplierSToken).div(1e8));
            (uint256 multipY, uint256 multipT) = getMultiplier(pool.lastRewardBlock, block.number);
            uint256 sakeRewardY = multipY.mul(sakePerBlockYieldFarming).mul(pool.allocPoint).div(totalAllocPoint);
            uint256 sakeRewardT = multipT.mul(sakePerBlockTradeMining).mul(pool.allocPoint).div(totalAllocPoint);
            uint256 sakeReward = sakeRewardY.add(sakeRewardT);
            accSakePerShare = accSakePerShare.add(sakeReward.mul(1e12).div(totalSupply));
        }
        return user.amount.mul(accSakePerShare).div(1e12).add(user.pengdingSake).sub(user.rewardDebt);
    }

    // Update reward vairables for all pools. Be careful of gas spending!
    function massUpdatePools() public {
        uint256 length = poolInfo.length;
        for (uint256 pid = 0; pid < length; ++pid) {
            updatePool(pid);
        }
    }

    // Update reward variables of the given pool to be up-to-date.
    function updatePool(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        if (block.number <= pool.lastRewardBlock) {
            return;
        }
        uint256 lpTokenSupply = pool.lpToken.balanceOf(address(this));
        uint256 sTokenSupply = pool.sToken.balanceOf(address(this));
        if (lpTokenSupply == 0) {
            pool.lastRewardBlock = block.number;
            return;
        }
        (uint256 multipY, uint256 multipT) = getMultiplier(pool.lastRewardBlock, block.number);
        if (multipY == 0 && multipT == 0) {
            pool.lastRewardBlock = block.number;
            return;
        }
        uint256 sakeRewardY = multipY.mul(sakePerBlockYieldFarming).mul(pool.allocPoint).div(totalAllocPoint);
        uint256 sakeRewardT = multipT.mul(sakePerBlockTradeMining).mul(pool.allocPoint).div(totalAllocPoint);
        uint256 sakeReward = sakeRewardY.add(sakeRewardT);
        uint256 totalSupply = lpTokenSupply.add(sTokenSupply.mul(pool.multiplierSToken).div(1e8));
        if (sake.owner() == address(this)) {
            sake.mint(address(this), sakeRewardT);
        }
        pool.accSakePerShare = pool.accSakePerShare.add(sakeReward.mul(1e12).div(totalSupply));
        pool.lastRewardBlock = block.number;
    }

    // Deposit LP tokens to SakeMasterV2 for SAKE allocation.
    function deposit(
        uint256 _pid,
        uint256 _amountlpToken,
        uint256 _amountsToken
    ) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        if (_amountlpToken <= 0 && user.pengdingSake == 0) {
            require(user.amountLPtoken > 0, "deposit:invalid");
        }
        updatePool(_pid);
        uint256 pending = user.amount.mul(pool.accSakePerShare).div(1e12).add(user.pengdingSake).sub(user.rewardDebt);
        uint256 _originAmountStoken = user.amountStoken;
        user.amountLPtoken = user.amountLPtoken.add(_amountlpToken);
        user.amountStoken = user.amountStoken.add(_amountsToken);
        user.amount = user.amount.add(_amountlpToken.add(_amountsToken.mul(pool.multiplierSToken).div(1e8)));
        user.pengdingSake = pending;
        if (pool.sakeLockSwitch) {
            if (block.number > (user.lastWithdrawBlock.add(withdrawInterval))) {
                user.lastWithdrawBlock = block.number;
                user.pengdingSake = 0;
                user.amountStoken = _amountsToken;
                user.amount = user.amountLPtoken.add(_amountsToken.mul(pool.multiplierSToken).div(1e8));
                pool.sToken.safeTransfer(address(1), _originAmountStoken);
                if (pending > 0) {
                    _safeSakeTransfer(msg.sender, pending);
                }
            }
        } else {
            user.lastWithdrawBlock = block.number;
            user.pengdingSake = 0;
            if (_amountlpToken == 0 && _amountsToken == 0) {
                user.amountStoken = 0;
                user.amount = user.amountLPtoken;
                pool.sToken.safeTransfer(address(1), _originAmountStoken);
            }
            if (pending > 0) {
                uint256 sakeFee = pending.mul(sakeFeeRatio).div(100);
                uint256 sakeToUser = pending.sub(sakeFee);
                _safeSakeTransfer(msg.sender, sakeToUser);
                _safeSakeTransfer(sakeFeeAddress, sakeFee);
            }
        }
        user.rewardDebt = user.amount.mul(pool.accSakePerShare).div(1e12);
        pool.lpToken.safeTransferFrom(address(msg.sender), address(this), _amountlpToken);
        pool.sToken.safeTransferFrom(address(msg.sender), address(this), _amountsToken);
        emit Deposit(msg.sender, _pid, _amountlpToken, _amountsToken);
    }

    // Withdraw LP tokens from SakeMaster.
    function withdraw(uint256 _pid, uint256 _amountLPtoken) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        require(user.amountLPtoken >= _amountLPtoken, "withdraw: LP amount not enough");
        updatePool(_pid);
        uint256 pending = user.amount.mul(pool.accSakePerShare).div(1e12).add(user.pengdingSake).sub(user.rewardDebt);
        user.amountLPtoken = user.amountLPtoken.sub(_amountLPtoken);
        uint256 _amountStoken = user.amountStoken;
        user.amountStoken = 0;
        user.amount = user.amountLPtoken;
        user.rewardDebt = user.amount.mul(pool.accSakePerShare).div(1e12);
        if (pool.sakeLockSwitch) {
            if (block.number > (user.lastWithdrawBlock.add(withdrawInterval))) {
                user.lastWithdrawBlock = block.number;
                user.pengdingSake = 0;
                _safeSakeTransfer(msg.sender, pending);
            } else {
                user.pengdingSake = pending;
            }
        } else {
            user.lastWithdrawBlock = block.number;
            user.pengdingSake = 0;
            uint256 sakeFee = pending.mul(sakeFeeRatio).div(100);
            uint256 sakeToUser = pending.sub(sakeFee);
            _safeSakeTransfer(msg.sender, sakeToUser);
            _safeSakeTransfer(sakeFeeAddress, sakeFee);
        }
        uint256 lpTokenFee;
        uint256 lpTokenToUser;
        if (block.number < tradeMiningEndBlock) {
            lpTokenFee = _amountLPtoken.mul(lpFeeRatio).div(100);
            pool.lpToken.safeTransfer(sakeMaker, lpTokenFee);
        }
        lpTokenToUser = _amountLPtoken.sub(lpTokenFee);
        pool.lpToken.safeTransfer(address(msg.sender), lpTokenToUser);
        pool.sToken.safeTransfer(address(1), _amountStoken);
        emit Withdraw(msg.sender, _pid, lpTokenToUser);
    }

    // Withdraw without caring about rewards. EMERGENCY ONLY.
    function emergencyWithdraw(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        require(user.amountLPtoken > 0, "withdraw: LP amount not enough");
        uint256 _amountLPtoken = user.amountLPtoken;
        uint256 _amountStoken = user.amountStoken;
        user.amount = 0;
        user.amountLPtoken = 0;
        user.amountStoken = 0;
        user.rewardDebt = 0;

        uint256 lpTokenFee;
        uint256 lpTokenToUser;
        if (block.number < tradeMiningEndBlock) {
            lpTokenFee = _amountLPtoken.mul(lpFeeRatio).div(100);
            pool.lpToken.safeTransfer(sakeMaker, lpTokenFee);
        }
        lpTokenToUser = _amountLPtoken.sub(lpTokenFee);
        pool.lpToken.safeTransfer(address(msg.sender), lpTokenToUser);
        pool.sToken.safeTransfer(address(1), _amountStoken);
        emit EmergencyWithdraw(msg.sender, _pid, lpTokenToUser);
    }

    // Safe sake transfer function, just in case if rounding error causes pool to not have enough SAKEs.
    function _safeSakeTransfer(address _to, uint256 _amount) internal {
        uint256 sakeBal = sake.balanceOf(address(this));
        if (_amount > sakeBal) {
            sake.transfer(_to, sakeBal);
        } else {
            sake.transfer(_to, _amount);
        }
    }

    // Update admin address by owner.
    function setAdmin(address _adminaddr) public onlyOwner {
        require(_adminaddr != address(0), "invalid address");
        admin = _adminaddr;
    }

    // Update sakeMaker address by admin.
    function setSakeMaker(address _sakeMaker) public {
        require(msg.sender == admin, "sm:Call must come from admin.");
        require(_sakeMaker != address(0), "invalid address");
        sakeMaker = _sakeMaker;
    }

    // Update sakeFee address by admin.
    function setSakeFeeAddress(address _sakeFeeAddress) public {
        require(msg.sender == admin, "sf:Call must come from admin.");
        require(_sakeFeeAddress != address(0), "invalid address");
        sakeFeeAddress = _sakeFeeAddress;
    }

    // update tradeMiningSpeedUpEndBlock by owner
    function setTradeMiningSpeedUpEndBlock(uint256 _endBlock) public {
        require(msg.sender == admin, "tmsu:Call must come from admin.");
        require(_endBlock > startBlock, "invalid endBlock");
        tradeMiningSpeedUpEndBlock = _endBlock;
    }

    // update yieldFarmingIIEndBlock by owner
    function setYieldFarmingIIEndBlock(uint256 _endBlock) public {
        require(msg.sender == admin, "yf:Call must come from admin.");
        require(_endBlock > startBlock, "invalid endBlock");
        yieldFarmingIIEndBlock = _endBlock;
    }

    // update tradeMiningEndBlock by owner
    function setTradeMiningEndBlock(uint256 _endBlock) public {
        require(msg.sender == admin, "tm:Call must come from admin.");
        require(_endBlock > startBlock, "invalid endBlock");
        tradeMiningEndBlock = _endBlock;
    }

    function setSakeFeeRatio(uint8 newRatio) public {
        require(msg.sender == admin, "sfr:Call must come from admin.");
        require(newRatio >= 0 && newRatio <= 100, "invalid ratio");
        sakeFeeRatio = newRatio;
    }

    function setLpFeeRatio(uint8 newRatio) public {
        require(msg.sender == admin, "lp:Call must come from admin.");
        require(newRatio >= 0 && newRatio <= 100, "invalid ratio");
        lpFeeRatio = newRatio;
    }

    function setWithdrawInterval(uint256 _blockNum) public {
        require(msg.sender == admin, "i:Call must come from admin.");
        withdrawInterval = _blockNum;
    }

    // set sakePerBlock phase II yield farming
    function setSakePerBlockYieldFarming(uint256 _sakePerBlockYieldFarming, bool _withUpdate) public {
        require(msg.sender == admin, "yield:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        sakePerBlockYieldFarming = _sakePerBlockYieldFarming;
    }

    // set sakePerBlock trade mining
    function setSakePerBlockTradeMining(uint256 _sakePerBlockTradeMining, bool _withUpdate) public {
        require(msg.sender == admin, "trade:Call must come from admin.");
        if (_withUpdate) {
            massUpdatePools();
        }
        sakePerBlockTradeMining = _sakePerBlockTradeMining;
    }
}