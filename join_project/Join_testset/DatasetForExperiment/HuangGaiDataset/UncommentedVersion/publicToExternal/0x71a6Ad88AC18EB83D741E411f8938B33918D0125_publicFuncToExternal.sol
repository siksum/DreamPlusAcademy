/**
 *Submitted for verification at Etherscan.io on 2020-11-04
*/

/**
 *Submitted for verification at Etherscan.io on 2020-11-03
*/





pragma solidity ^0.5.15;

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
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

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
     * https:
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
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

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
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}





pragma solidity ^0.5.15;

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
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
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
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

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
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}





pragma solidity ^0.5.15;

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
        
        
        

        uint256 size;
        
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https:
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https:
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https:
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        
        (bool success, ) = recipient.call.value(amount)("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
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
     * use https:
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
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
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(
        address target,
        bytes memory data,
        uint256 weiValue,
        string memory errorMessage
    ) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        
        (bool success, bytes memory returndata) = target.call.value(weiValue)(
            data
        );
        if (success) {
            return returndata;
        } else {
            
            if (returndata.length > 0) {
                

                
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





pragma solidity ^0.5.15;




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

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transfer.selector, to, value)
        );
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transferFrom.selector, from, to, value)
        );
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        
        
        
        
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.approve.selector, spender, value)
        );
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(
            value
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(
            value,
            "SafeERC20: decreased allowance below zero"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        
        
        

        bytes memory returndata = address(token).functionCall(
            data,
            "SafeERC20: low-level call failed"
        );
        if (returndata.length > 0) {
            
            
            require(
                abi.decode(returndata, (bool)),
                "SafeERC20: ERC20 operation did not succeed"
            );
        }
    }
}



pragma solidity >=0.5.0;

interface UniswapPair {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    event Mint(address indexed sender, uint256 amount0, uint256 amount1);
    event Burn(
        address indexed sender,
        uint256 amount0,
        uint256 amount1,
        address indexed to
    );
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint256);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );

    function price0CumulativeLast() external view returns (uint256);

    function price1CumulativeLast() external view returns (uint256);

    function kLast() external view returns (uint256);

    function mint(address to) external returns (uint256 liquidity);

    function burn(address to)
        external
        returns (uint256 amount0, uint256 amount1);

    function swap(
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    ) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}





pragma solidity >=0.4.0;



library Babylonian {
    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        
    }
}





pragma solidity >=0.4.0;



library FixedPoint {
    
    
    struct uq112x112 {
        uint224 _x;
    }

    
    
    struct uq144x112 {
        uint256 _x;
    }

    uint8 private constant RESOLUTION = 112;
    uint256 private constant Q112 = uint256(1) << RESOLUTION;
    uint256 private constant Q224 = Q112 << RESOLUTION;

    
    function encode(uint112 x) internal pure returns (uq112x112 memory) {
        return uq112x112(uint224(x) << RESOLUTION);
    }

    
    function encode144(uint144 x) internal pure returns (uq144x112 memory) {
        return uq144x112(uint256(x) << RESOLUTION);
    }

    
    function div(uq112x112 memory self, uint112 x)
        internal
        pure
        returns (uq112x112 memory)
    {
        require(x != 0, "FixedPoint: DIV_BY_ZERO");
        return uq112x112(self._x / uint224(x));
    }

    
    
    function mul(uq112x112 memory self, uint256 y)
        internal
        pure
        returns (uq144x112 memory)
    {
        uint256 z;
        require(
            y == 0 || (z = uint256(self._x) * y) / y == uint256(self._x),
            "FixedPoint: MULTIPLICATION_OVERFLOW"
        );
        return uq144x112(z);
    }

    
    
    function fraction(uint112 numerator, uint112 denominator)
        internal
        pure
        returns (uq112x112 memory)
    {
        require(denominator > 0, "FixedPoint: DIV_BY_ZERO");
        return uq112x112((uint224(numerator) << RESOLUTION) / denominator);
    }

    
    function decode(uq112x112 memory self) internal pure returns (uint112) {
        return uint112(self._x >> RESOLUTION);
    }

    
    function decode144(uq144x112 memory self) internal pure returns (uint144) {
        return uint144(self._x >> RESOLUTION);
    }

    
    function reciprocal(uq112x112 memory self)
        internal
        pure
        returns (uq112x112 memory)
    {
        require(self._x != 0, "FixedPoint: ZERO_RECIPROCAL");
        return uq112x112(uint224(Q224 / self._x));
    }

    
    function sqrt(uq112x112 memory self)
        internal
        pure
        returns (uq112x112 memory)
    {
        return uq112x112(uint224(Babylonian.sqrt(uint256(self._x)) << 56));
    }
}





pragma solidity >=0.5.0;




library UniswapV2OracleLibrary {
    using FixedPoint for *;

    
    function currentBlockTimestamp() internal view returns (uint32) {
        return uint32(block.timestamp % 2**32);
    }

    
    function currentCumulativePrices(address pair, bool isToken0)
        internal
        view
        returns (uint256 priceCumulative, uint32 blockTimestamp)
    {
        blockTimestamp = currentBlockTimestamp();
        (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        ) = UniswapPair(pair).getReserves();
        if (isToken0) {
            priceCumulative = UniswapPair(pair).price0CumulativeLast();

            
            if (blockTimestampLast != blockTimestamp) {
                
                uint32 timeElapsed = blockTimestamp - blockTimestampLast;
                
                
                priceCumulative +=
                    uint256(FixedPoint.fraction(reserve1, reserve0)._x) *
                    timeElapsed;
            }
        } else {
            priceCumulative = UniswapPair(pair).price1CumulativeLast();
            
            if (blockTimestampLast != blockTimestamp) {
                
                uint32 timeElapsed = blockTimestamp - blockTimestampLast;
                
                
                priceCumulative +=
                    uint256(FixedPoint.fraction(reserve0, reserve1)._x) *
                    timeElapsed;
            }
        }
    }
}





pragma solidity 0.5.15;



contract YUANTokenStorage {
    using SafeMath for uint256;

    /**
     * @dev Guard variable for re-entrancy checks. Not currently used
     */
    bool internal _notEntered;

    /**
     * @notice EIP-20 token name for this token
     */
    string public name;

    /**
     * @notice EIP-20 token symbol for this token
     */
    string public symbol;

    /**
     * @notice EIP-20 token decimals for this token
     */
    uint8 public decimals;

    /**
     * @notice Governor for this contract
     */
    address public gov;

    /**
     * @notice Pending governance for this contract
     */
    address public pendingGov;

    /**
     * @notice Approved rebaser for this contract
     */
    address public rebaser;

    /**
     * @notice Approved migrator for this contract
     */
    address public migrator;

    /**
     * @notice Incentivizer address of YUAN protocol
     */
    address public incentivizer;

    /**
     * @notice Total supply of YUANs
     */
    uint256 public totalSupply;

    /**
     * @notice Internal decimals used to handle scaling factor
     */
    uint256 public constant internalDecimals = 10**24;

    /**
     * @notice Used for percentage maths
     */
    uint256 public constant BASE = 10**18;

    /**
     * @notice Scaling factor that adjusts everyone's balances
     */
    uint256 public yuansScalingFactor;

    mapping(address => uint256) internal _yuanBalances;

    mapping(address => mapping(address => uint256)) internal _allowedFragments;

    uint256 public initSupply;

    
    bytes32
        public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    bytes32 public DOMAIN_SEPARATOR;
}



pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

/* Copyright 2020 Compound Labs, Inc.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

contract YUANGovernanceStorage {
    /// @notice A record of each accounts delegate
    mapping(address => address) internal _delegates;

    /// @notice A checkpoint for marking number of votes from a given block
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

    /// @notice A record of votes checkpoints for each account, by index
    mapping(address => mapping(uint32 => Checkpoint)) public checkpoints;

    /// @notice The number of checkpoints for each account
    mapping(address => uint32) public numCheckpoints;

    /// @notice The EIP-712 typehash for the contract's domain
    bytes32 public constant DOMAIN_TYPEHASH = keccak256(
        "EIP712Domain(string name,uint256 chainId,address verifyingContract)"
    );

    /// @notice The EIP-712 typehash for the delegation struct used by the contract
    bytes32 public constant DELEGATION_TYPEHASH = keccak256(
        "Delegation(address delegatee,uint256 nonce,uint256 expiry)"
    );

    /// @notice A record of states for signing / validating signatures
    mapping(address => uint256) public nonces;
}





pragma solidity 0.5.15;



contract YUANTokenInterface is YUANTokenStorage, YUANGovernanceStorage {
    /// @notice An event thats emitted when an account changes its delegate
    event DelegateChanged(
        address indexed delegator,
        address indexed fromDelegate,
        address indexed toDelegate
    );

    /// @notice An event thats emitted when a delegate account's vote balance changes
    event DelegateVotesChanged(
        address indexed delegate,
        uint256 previousBalance,
        uint256 newBalance
    );

    /**
     * @notice Event emitted when tokens are rebased
     */
    event Rebase(
        uint256 epoch,
        uint256 prevYuansScalingFactor,
        uint256 newYuansScalingFactor
    );

    /*** Gov Events ***/

    /**
     * @notice Event emitted when pendingGov is changed
     */
    event NewPendingGov(address oldPendingGov, address newPendingGov);

    /**
     * @notice Event emitted when gov is changed
     */
    event NewGov(address oldGov, address newGov);

    /**
     * @notice Sets the rebaser contract
     */
    event NewRebaser(address oldRebaser, address newRebaser);

    /**
     * @notice Sets the migrator contract
     */
    event NewMigrator(address oldMigrator, address newMigrator);

    /**
     * @notice Sets the incentivizer contract
     */
    event NewIncentivizer(address oldIncentivizer, address newIncentivizer);

    /* - ERC20 Events - */

    /**
     * @notice EIP20 Transfer event
     */
    event Transfer(address indexed from, address indexed to, uint256 amount);

    /**
     * @notice EIP20 Approval event
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );

    /* - Extra Events - */
    /**
     * @notice Tokens minted event
     */
    event Mint(address to, uint256 amount);

    
    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function balanceOf(address who) external view returns (uint256);

    function balanceOfUnderlying(address who) external view returns (uint256);

    function allowance(address owner_, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function increaseAllowance(address spender, uint256 addedValue)
        external
        returns (bool);

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        returns (bool);

    function maxScalingFactor() external view returns (uint256);

    function yuanToFragment(uint256 yuan) external view returns (uint256);

    function fragmentToYuan(uint256 value) external view returns (uint256);

    /* - Governance Functions - */
    function getPriorVotes(address account, uint256 blockNumber)
        external
        view
        returns (uint256);

    function delegateBySig(
        address delegatee,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function delegate(address delegatee) external;

    function delegates(address delegator) external view returns (address);

    function getCurrentVotes(address account) external view returns (uint256);

    /* - Permissioned/Governance functions - */
    function mint(address to, uint256 amount) external returns (bool);

    function rebase(
        uint256 epoch,
        uint256 indexDelta,
        bool positive
    ) external returns (uint256);

    function _setRebaser(address rebaser_) external;

    function _setIncentivizer(address incentivizer_) external;

    function _setPendingGov(address pendingGov_) external;

    function _acceptGov() external;
}





pragma solidity 0.5.15;







interface BAL {
    function gulp(address token) external;
}

interface IPriceOracle {
    function getPrice(address asset) external view returns (uint256);
}

contract YUANRebaser {
    using SafeMath for uint256;

    modifier onlyGov() {
        require(msg.sender == gov);
        _;
    }

    struct Transaction {
        bool enabled;
        address destination;
        bytes data;
    }

    struct UniVars {
        uint256 yuansToUni;
        uint256 amountFromReserves;
        uint256 mintToReserves;
    }

    /// @notice an event emitted when a transaction fails
    event TransactionFailed(
        address indexed destination,
        uint256 index,
        bytes data
    );

    /// @notice an event emitted when maxSlippageFactor is changed
    event NewMaxSlippageFactor(
        uint256 oldSlippageFactor,
        uint256 newSlippageFactor
    );

    /// @notice an event emitted when deviationThreshold is changed
    event NewDeviationThreshold(
        uint256 oldDeviationThreshold,
        uint256 newDeviationThreshold
    );

    /**
     * @notice Sets the treasury mint percentage of rebase
     */
    event NewRebaseMintPercent(
        uint256 reserveIndex,
        uint256 oldRebaseMintPerc,
        uint256 newRebaseMintPerc
    );

    /**
     * @notice Sets the reserve contract
     */
    event NewReserveContract(
        uint256 reserveIndex,
        address oldReserveContract,
        address newReserveContract
    );

    /**
     * @notice Sets the price oracle
     */
    event NewPriceOracle(address oldPriceOracle, address newPriceOracle);

    /**
     * @notice Sets the reserve contract
     */
    event TreasuryIncreased(
        uint256 reservesAdded,
        uint256 yuansSold,
        uint256 yuansFromReserves,
        uint256 yuansToReserves
    );

    /**
     * @notice Event emitted when pendingGov is changed
     */
    event NewPendingGov(address oldPendingGov, address newPendingGov);

    /**
     * @notice Event emitted when gov is changed
     */
    event NewGov(address oldGov, address newGov);

    
    Transaction[] public transactions;

    /// @notice Governance address
    address public gov;

    /// @notice Pending Governance address
    address public pendingGov;

    /// @notice Spreads out getting to the target price
    uint256 public rebaseLag;

    /// @notice Peg target
    uint256 public targetRate;

    /// @notice Price Oracle of Peg target
    address public priceOracle;

    
    
    
    uint256 public deviationThreshold;

    /// @notice More than this much time must pass between rebase operations.
    uint256 public minRebaseTimeIntervalSec;

    /// @notice Block timestamp of last rebase operation
    uint256 public lastRebaseTimestampSec;

    /// @notice The rebase window begins this many seconds into the minRebaseTimeInterval period.
    
    uint256 public rebaseWindowOffsetSec;

    /// @notice The length of the time window where a rebase operation is allowed to execute, in seconds.
    uint256 public rebaseWindowLengthSec;

    /// @notice The number of rebase cycles since inception
    uint256 public epoch;

    
    
    ///@notice boolean showing rebase activation status
    bool public rebasingActive;

    /// @notice delays rebasing activation to facilitate liquidity
    uint256 public constant rebaseDelay = 9 days;

    /// @notice Time of TWAP initialization
    uint256 public timeOfTWAPInit;

    /// @notice YUAN token address
    address public yuanAddress;

    /// @notice reserve token
    address public reserveToken;

    /// @notice Reserves vault contracts
    address[3] public reservesContracts;

    /// @notice Reserves contract percentages
    uint256[3] public rebaseMintPercs;

    /// @notice pair for reserveToken <> YUAN
    address public uniswap_pair;

    /// @notice list of uniswap pairs to sync
    address[] public uniSyncPairs;

    /// @notice list of balancer pairs to gulp
    address[] public balGulpPairs;

    /// @notice last TWAP update time
    uint32 public blockTimestampLast;

    /// @notice last TWAP cumulative price;
    uint256 public priceCumulativeLast;

    /// @notice address to send part of treasury to
    address public public_goods;

    /// @notice percentage of treasury to send to public goods address
    uint256 public public_goods_perc;

    
    
    
    
    /// @notice the maximum slippage factor when buying reserve token
    uint256 public maxSlippageFactor;

    /// @notice Whether or not this token is first in uniswap YUAN<>Reserve pair
    bool public isToken0;

    uint256 public constant BASE = 10**18;

    uint256 public constant MAX_SLIPPAGE_PARAM = 1180339 * 10**11; 

    uint256 public constant MAX_MINT_PERC_PARAM = 25 * 10**16; 

    constructor(
        address yuanAddress_,
        address reserveToken_,
        address uniswap_factory,
        address[3] memory reservesContracts_,
        address public_goods_,
        uint256 public_goods_perc_,
        address priceOracle_
    ) public {
        minRebaseTimeIntervalSec = 12 hours;
        rebaseWindowOffsetSec = 7200; 

        (address token0, address token1) = sortTokens(
            yuanAddress_,
            reserveToken_
        );

        
        if (token0 == yuanAddress_) {
            isToken0 = true;
        } else {
            isToken0 = false;
        }
        
        uniswap_pair = pairFor(uniswap_factory, token0, token1);

        uniSyncPairs.push(uniswap_pair);

        
        reservesContracts[0] = reservesContracts_[0]; 
        reservesContracts[1] = reservesContracts_[1]; 
        reservesContracts[2] = reservesContracts_[2]; 

        
        reserveToken = reserveToken_;

        yuanAddress = yuanAddress_;

        public_goods = public_goods_;
        public_goods_perc = public_goods_perc_;

        
        
        maxSlippageFactor = 5409258 * 10**10;

        
        targetRate = BASE;

        
        priceOracle = priceOracle_;

        
        rebaseLag = 10;

        
        rebaseMintPercs[0] = 10**17; 
        rebaseMintPercs[1] = 0; 
        rebaseMintPercs[2] = 0; 

        
        deviationThreshold = 5 * 10**16;

        
        rebaseWindowLengthSec = 60 * 60;

        
        gov = msg.sender;
    }

    function removeUniPair(uint256 index) public onlyGov {
        if (index >= uniSyncPairs.length) return;

        for (uint256 i = index; i < uniSyncPairs.length - 1; i++) {
            uniSyncPairs[i] = uniSyncPairs[i + 1];
        }
        uniSyncPairs.length--;
    }

    function removeBalPair(uint256 index) public onlyGov {
        if (index >= balGulpPairs.length) return;

        for (uint256 i = index; i < balGulpPairs.length - 1; i++) {
            balGulpPairs[i] = balGulpPairs[i + 1];
        }
        balGulpPairs.length--;
    }

    /**
    @notice Adds pairs to sync
    *
    */
    function addSyncPairs(
        address[] memory uniSyncPairs_,
        address[] memory balGulpPairs_
    ) public onlyGov {
        for (uint256 i = 0; i < uniSyncPairs_.length; i++) {
            uniSyncPairs.push(uniSyncPairs_[i]);
        }

        for (uint256 i = 0; i < balGulpPairs_.length; i++) {
            balGulpPairs.push(balGulpPairs_[i]);
        }
    }

    /**
    @notice Uniswap synced pairs
    *
    */
    function getUniSyncPairs() public view returns (address[] memory) {
        address[] memory pairs = uniSyncPairs;
        return pairs;
    }

    /**
    @notice Uniswap synced pairs
    *
    */
    function getBalGulpPairs() public view returns (address[] memory) {
        address[] memory pairs = balGulpPairs;
        return pairs;
    }

    /**
    @notice Updates slippage factor
    @param maxSlippageFactor_ the new slippage factor
    *
    */
    function setMaxSlippageFactor(uint256 maxSlippageFactor_) public onlyGov {
        require(maxSlippageFactor_ < MAX_SLIPPAGE_PARAM);
        uint256 oldSlippageFactor = maxSlippageFactor;
        maxSlippageFactor = maxSlippageFactor_;
        emit NewMaxSlippageFactor(oldSlippageFactor, maxSlippageFactor_);
    }

    /**
    @notice Updates rebase mint percentage of specified reserve
    @param reserveIndex_ the index of specified reserve
    @param rebaseMintPerc_ the new rebase mint percentage
    *
    */
    function setRebaseMintPerc(uint256 reserveIndex_, uint256 rebaseMintPerc_)
        public
        onlyGov
    {
        require(reserveIndex_ < 3);

        uint256 oldRebaseMintPercs = rebaseMintPercs[reserveIndex_];
        rebaseMintPercs[reserveIndex_] = rebaseMintPerc_;

        require(
            rebaseMintPercs[0] + rebaseMintPercs[1] + rebaseMintPercs[2] <
                MAX_MINT_PERC_PARAM
        );

        emit NewRebaseMintPercent(
            reserveIndex_,
            oldRebaseMintPercs,
            rebaseMintPerc_
        );
    }

    /**
    @notice Updates reserve contract
    @param reserveIndex_ the index of specified reserve
    @param reservesContract_ the new reserve contract
    *
    */
    function setReserveContract(
        uint256 reserveIndex_,
        address reservesContract_
    ) public onlyGov {
        require(reserveIndex_ < 3);
        address oldReservesContract = reservesContracts[reserveIndex_];
        reservesContracts[reserveIndex_] = reservesContract_;
        emit NewReserveContract(
            reserveIndex_,
            oldReservesContract,
            reservesContract_
        );
    }

    /** @notice sets the pendingGov
     * @param pendingGov_ The address of the rebaser contract to use for authentication.
     */
    function _setPendingGov(address pendingGov_) public onlyGov {	
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NewPendingGov(oldPendingGov, pendingGov_);
    }

    /** @notice lets msg.sender accept governance
     *
     */
    function _acceptGov() public {	
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NewGov(oldGov, gov);
    }

    /** @notice Initializes TWAP start point, starts countdown to first rebase
     *
     */
    function init_twap() public {
        require(timeOfTWAPInit == 0, "already activated");
        (
            uint256 priceCumulative,
            uint32 blockTimestamp
        ) = UniswapV2OracleLibrary.currentCumulativePrices(
            uniswap_pair,
            isToken0
        );
        require(blockTimestamp > 0, "no trades");
        blockTimestampLast = blockTimestamp;
        priceCumulativeLast = priceCumulative;
        timeOfTWAPInit = blockTimestamp;
    }

    /** @notice Activates rebasing
     *   @dev One way function, cannot be undone, callable by anyone
     */
    function activate_rebasing() public {
        require(timeOfTWAPInit > 0, "twap wasnt intitiated, call init_twap()");
        
        require(now >= timeOfTWAPInit + rebaseDelay, "!end_delay");

        
        uint256 price = IPriceOracle(priceOracle).getPrice(reserveToken);
        require(price > 0, "Reserve token price is not available");

        rebasingActive = true;
    }

    /**
     * @notice Initiates a new rebase operation, provided the minimum time period has elapsed.
     *
     * @dev The supply adjustment equals (_totalSupply * DeviationFromTargetRate) / rebaseLag
     *      Where DeviationFromTargetRate is (MarketOracleRate - targetRate) / targetRate
     *      and targetRate is 1e18
     */
    function rebase() public {
        
        require(msg.sender == tx.origin || msg.sender == gov);
        
        _inRebaseWindow();

        
        require(lastRebaseTimestampSec.add(minRebaseTimeIntervalSec) < now);

        
        lastRebaseTimestampSec = now.sub(now.mod(minRebaseTimeIntervalSec)).add(
            rebaseWindowOffsetSec
        );

        epoch = epoch.add(1);

        
        uint256 exchangeRate = getExchangeRate();

        
        (uint256 offPegPerc, bool positive) = computeOffPegPerc(exchangeRate);

        uint256 indexDelta = offPegPerc;

        
        indexDelta = indexDelta.div(rebaseLag);

        YUANTokenInterface yuan = YUANTokenInterface(yuanAddress);

        if (positive) {
            require(
                yuan.yuansScalingFactor().mul(BASE.add(indexDelta)).div(BASE) <
                    yuan.maxScalingFactor(),
                "new scaling factor will be too big"
            );
        }

        uint256 currSupply = yuan.totalSupply();

        uint256[3] memory mintAmounts;
        
        if (positive) {
            uint256 rebaseMintPerc = rebaseMintPercs[0] +
                rebaseMintPercs[1] +
                rebaseMintPercs[2];
            uint256 mintPerc = indexDelta.mul(rebaseMintPerc).div(BASE);

            mintAmounts[0] = currSupply
                .mul(indexDelta.mul(rebaseMintPercs[0]).div(BASE))
                .div(BASE);
            mintAmounts[1] = currSupply
                .mul(indexDelta.mul(rebaseMintPercs[1]).div(BASE))
                .div(BASE);
            mintAmounts[2] = currSupply
                .mul(indexDelta.mul(rebaseMintPercs[2]).div(BASE))
                .div(BASE);

            indexDelta = indexDelta.sub(mintPerc);
        }

        
        
        yuan.rebase(epoch, indexDelta, positive);

        
        afterRebase(mintAmounts, offPegPerc);
    }

    function uniswapV2Call(
        address sender,
        uint256 amount0,
        uint256 amount1,
        bytes memory data
    ) public {
        
        require(msg.sender == uniswap_pair, "bad msg.sender");
        
        require(sender == address(this), "bad origin");
        UniVars memory uniVars = abi.decode(data, (UniVars));

        YUANTokenInterface yuan = YUANTokenInterface(yuanAddress);

        if (uniVars.amountFromReserves > 0) {
            
            yuan.transferFrom(
                reservesContracts[0],
                uniswap_pair,
                uniVars.amountFromReserves
            );
            if (uniVars.amountFromReserves < uniVars.yuansToUni) {
                
                
                yuan.mint(
                    uniswap_pair,
                    uniVars.yuansToUni.sub(uniVars.amountFromReserves)
                );
            }
        } else {
            
            yuan.mint(uniswap_pair, uniVars.yuansToUni);
        }

        
        if (uniVars.mintToReserves > 0) {
            yuan.mint(reservesContracts[0], uniVars.mintToReserves);
        }

        
        if (isToken0) {
            if (public_goods != address(0) && public_goods_perc > 0) {
                uint256 amount_to_public_goods = amount1
                    .mul(public_goods_perc)
                    .div(BASE);
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    reservesContracts[0],
                    amount1.sub(amount_to_public_goods)
                );
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    public_goods,
                    amount_to_public_goods
                );
                emit TreasuryIncreased(
                    amount1.sub(amount_to_public_goods),
                    uniVars.yuansToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            } else {
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    reservesContracts[0],
                    amount1
                );
                emit TreasuryIncreased(
                    amount1,
                    uniVars.yuansToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            }
        } else {
            if (public_goods != address(0) && public_goods_perc > 0) {
                uint256 amount_to_public_goods = amount0
                    .mul(public_goods_perc)
                    .div(BASE);
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    reservesContracts[0],
                    amount0.sub(amount_to_public_goods)
                );
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    public_goods,
                    amount_to_public_goods
                );
                emit TreasuryIncreased(
                    amount0.sub(amount_to_public_goods),
                    uniVars.yuansToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            } else {
                SafeERC20.safeTransfer(
                    IERC20(reserveToken),
                    reservesContracts[0],
                    amount0
                );
                emit TreasuryIncreased(
                    amount0,
                    uniVars.yuansToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            }
        }
    }

    function buyReserveAndTransfer(uint256 mintAmount, uint256 offPegPerc)
        internal
    {
        UniswapPair pair = UniswapPair(uniswap_pair);

        YUANTokenInterface yuan = YUANTokenInterface(yuanAddress);

        
        (uint256 token0Reserves, uint256 token1Reserves, ) = pair.getReserves();

        
        uint256 excess = yuan.balanceOf(reservesContracts[0]);

        uint256 tokens_to_max_slippage = uniswapMaxSlippage(
            token0Reserves,
            token1Reserves,
            offPegPerc
        );

        UniVars memory uniVars = UniVars({
            yuansToUni: tokens_to_max_slippage, 
            amountFromReserves: excess, 
            mintToReserves: 0 
        });

        
        
        
        
        if (isToken0) {
            if (tokens_to_max_slippage > mintAmount.add(excess)) {
                
                

                
                uint256 buyTokens = getAmountOut(
                    mintAmount + excess,
                    token0Reserves,
                    token1Reserves
                );
                uniVars.yuansToUni = mintAmount + excess;
                uniVars.amountFromReserves = excess;
                
                pair.swap(0, buyTokens, address(this), abi.encode(uniVars));
            } else {
                if (tokens_to_max_slippage > excess) {
                    
                    uint256 buyTokens = getAmountOut(
                        tokens_to_max_slippage,
                        token0Reserves,
                        token1Reserves
                    );

                    
                    uniVars.mintToReserves = mintAmount.sub(
                        (tokens_to_max_slippage - excess)
                    );
                    pair.swap(0, buyTokens, address(this), abi.encode(uniVars));
                } else {
                    
                    uint256 buyTokens = getAmountOut(
                        tokens_to_max_slippage,
                        token0Reserves,
                        token1Reserves
                    );
                    uniVars.amountFromReserves = tokens_to_max_slippage;
                    uniVars.mintToReserves = mintAmount;
                    
                    
                    pair.swap(0, buyTokens, address(this), abi.encode(uniVars));
                }
            }
        } else {
            if (tokens_to_max_slippage > mintAmount.add(excess)) {
                
                uint256 buyTokens = getAmountOut(
                    mintAmount + excess,
                    token1Reserves,
                    token0Reserves
                );
                uniVars.yuansToUni = mintAmount + excess;
                uniVars.amountFromReserves = excess;
                
                pair.swap(buyTokens, 0, address(this), abi.encode(uniVars));
            } else {
                if (tokens_to_max_slippage > excess) {
                    
                    uint256 buyTokens = getAmountOut(
                        tokens_to_max_slippage,
                        token1Reserves,
                        token0Reserves
                    );

                    
                    uniVars.mintToReserves = mintAmount.sub(
                        (tokens_to_max_slippage - excess)
                    );
                    
                    pair.swap(buyTokens, 0, address(this), abi.encode(uniVars));
                } else {
                    
                    uint256 buyTokens = getAmountOut(
                        tokens_to_max_slippage,
                        token1Reserves,
                        token0Reserves
                    );
                    uniVars.amountFromReserves = tokens_to_max_slippage;
                    uniVars.mintToReserves = mintAmount;
                    
                    
                    pair.swap(buyTokens, 0, address(this), abi.encode(uniVars));
                }
            }
        }
    }

    function uniswapMaxSlippage(
        uint256 token0,
        uint256 token1,
        uint256 offPegPerc
    ) internal view returns (uint256) {
        if (isToken0) {
            if (offPegPerc >= 10**17) {
                
                return token0.mul(maxSlippageFactor).div(BASE);
            } else {
                
                
                
                
                
                
                return token0.mul(offPegPerc).div(3 * BASE);
            }
        } else {
            if (offPegPerc >= 10**17) {
                return token1.mul(maxSlippageFactor).div(BASE);
            } else {
                return token1.mul(offPegPerc).div(3 * BASE);
            }
        }
    }

    /**
     * @notice given an input amount of an asset and pair reserves, returns the maximum output amount of the other asset
     *
     * @param amountIn input amount of the asset
     * @param reserveIn reserves of the asset being sold
     * @param reserveOut reserves if the asset being purchased
     */

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) internal pure returns (uint256 amountOut) {
        require(amountIn > 0, "UniswapV2Library: INSUFFICIENT_INPUT_AMOUNT");
        require(
            reserveIn > 0 && reserveOut > 0,
            "UniswapV2Library: INSUFFICIENT_LIQUIDITY"
        );
        uint256 amountInWithFee = amountIn.mul(997);
        uint256 numerator = amountInWithFee.mul(reserveOut);
        uint256 denominator = reserveIn.mul(1000).add(amountInWithFee);
        amountOut = numerator / denominator;
    }

    function afterRebase(uint256[3] memory mintAmounts, uint256 offPegPerc)
        internal
    {
        
        for (uint256 i = 0; i < uniSyncPairs.length; i++) {
            UniswapPair(uniSyncPairs[i]).sync();
        }

        
        for (uint256 i = 0; i < balGulpPairs.length; i++) {
            BAL(balGulpPairs[i]).gulp(yuanAddress);
        }

        if (mintAmounts[0] > 0) {
            buyReserveAndTransfer(mintAmounts[0], offPegPerc);
        }

        YUANTokenInterface yuan = YUANTokenInterface(yuanAddress);

        if (mintAmounts[1] > 0) yuan.mint(reservesContracts[1], mintAmounts[1]);
        if (mintAmounts[2] > 0) yuan.mint(reservesContracts[2], mintAmounts[2]);

        
        for (uint256 i = 0; i < transactions.length; i++) {
            Transaction storage t = transactions[i];
            if (t.enabled) {
                bool result = externalCall(t.destination, t.data);
                if (!result) {
                    emit TransactionFailed(t.destination, i, t.data);
                    revert("Transaction Failed");
                }
            }
        }
    }

    /**
     * @notice Calculates TWAP from uniswap
     *
     * @dev When liquidity is low, this can be manipulated by an end of block -> next block
     *      attack. We delay the activation of rebases 12 hours after liquidity incentives
     *      to reduce this attack vector. Additional there is very little supply
     *      to be able to manipulate this during that time period of highest vuln.
     */
    function getTWAP() internal returns (uint256) {
        (
            uint256 priceCumulative,
            uint32 blockTimestamp
        ) = UniswapV2OracleLibrary.currentCumulativePrices(
            uniswap_pair,
            isToken0
        );
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; 

        

        
        uint256 priceAverage = uint256(
            uint224((priceCumulative - priceCumulativeLast) / timeElapsed)
        );

        priceCumulativeLast = priceCumulative;
        blockTimestampLast = blockTimestamp;

        
        
        
        if (priceAverage > uint192(-1)) {
            
            
            return (priceAverage >> 112) * BASE;
        }
        
        
        return (priceAverage * BASE) >> 112;
    }

    /**
     * @notice Calculates exchange rate
     *
     */
    function getExchangeRate() internal returns (uint256) {
        uint256 price = IPriceOracle(priceOracle).getPrice(reserveToken);
        require(price > 0, "Reserve token price can not be 0");

        return getTWAP().mul(price).div(BASE);
    }

    /**
     * @notice Calculates current TWAP from uniswap
     *
     */
    function getCurrentTWAP() public view returns (uint256) {
        (
            uint256 priceCumulative,
            uint32 blockTimestamp
        ) = UniswapV2OracleLibrary.currentCumulativePrices(
            uniswap_pair,
            isToken0
        );
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; 

        

        
        uint256 priceAverage = uint256(
            uint224((priceCumulative - priceCumulativeLast) / timeElapsed)
        );

        
        
        
        if (priceAverage > uint192(-1)) {
            
            
            return (priceAverage >> 112) * BASE;
        }
        
        
        return (priceAverage * BASE) >> 112;
    }

    /**
     * @notice Calculates current exchange rate
     *
     */
    function getCurrentExchangeRate() public view returns (uint256) {
        return
            getCurrentTWAP()
                .mul(IPriceOracle(priceOracle).getPrice(reserveToken))
                .div(BASE);
    }

    /**
     * @notice Sets the deviation threshold fraction. If the exchange rate given by the market
     *         oracle is within this fractional distance from the targetRate, then no supply
     *         modifications are made.
     * @param deviationThreshold_ The new exchange rate threshold fraction.
     */
    function setDeviationThreshold(uint256 deviationThreshold_)
        public	
        onlyGov
    {
        require(deviationThreshold > 0);
        uint256 oldDeviationThreshold = deviationThreshold;
        deviationThreshold = deviationThreshold_;
        emit NewDeviationThreshold(oldDeviationThreshold, deviationThreshold_);
    }

    /**
     * @notice Sets the rebase lag parameter.
               It is used to dampen the applied supply adjustment by 1 / rebaseLag
               If the rebase lag R, equals 1, the smallest value for R, then the full supply
               correction is applied on each rebase cycle.
               If it is greater than 1, then a correction of 1/R of is applied on each rebase.
     * @param rebaseLag_ The new rebase lag parameter.
     */
    function setRebaseLag(uint256 rebaseLag_) public onlyGov {	
        require(rebaseLag_ > 0);
        rebaseLag = rebaseLag_;
    }

    /**
     * @notice Sets the targetRate parameter.
     * @param targetRate_ The new target rate parameter.
     */
    function setTargetRate(uint256 targetRate_) public onlyGov {	
        require(targetRate_ > 0);
        targetRate = targetRate_;
    }

    /**
     * @notice Sets the the price oracle.
     * @param priceOracle_ The new price oracle.
     */
    function setPriceOracle(address priceOracle_) public onlyGov {	
        require(priceOracle_ != address(0));
        address oldPriceOracle = priceOracle;
        priceOracle = priceOracle_;
        emit NewPriceOracle(oldPriceOracle, priceOracle_);
    }

    /**
     * @notice Sets the parameters which control the timing and frequency of
     *         rebase operations.
     *         a) the minimum time period that must elapse between rebase cycles.
     *         b) the rebase window offset parameter.
     *         c) the rebase window length parameter.
     * @param minRebaseTimeIntervalSec_ More than this much time must pass between rebase
     *        operations, in seconds.
     * @param rebaseWindowOffsetSec_ The number of seconds from the beginning of
              the rebase interval, where the rebase window begins.
     * @param rebaseWindowLengthSec_ The length of the rebase window in seconds.
     */
    function setRebaseTimingParameters(
        uint256 minRebaseTimeIntervalSec_,
        uint256 rebaseWindowOffsetSec_,
        uint256 rebaseWindowLengthSec_
    ) public onlyGov {	
        require(minRebaseTimeIntervalSec_ > 0);
        require(rebaseWindowOffsetSec_ < minRebaseTimeIntervalSec_);
        require(
            rebaseWindowOffsetSec_ + rebaseWindowLengthSec_ <
                minRebaseTimeIntervalSec_
        );
        minRebaseTimeIntervalSec = minRebaseTimeIntervalSec_;
        rebaseWindowOffsetSec = rebaseWindowOffsetSec_;
        rebaseWindowLengthSec = rebaseWindowLengthSec_;
    }

    /**
     * @return If the latest block timestamp is within the rebase time window it, returns true.
     *         Otherwise, returns false.
     */
    function inRebaseWindow() public view returns (bool) {
        
        _inRebaseWindow();
        return true;
    }

    function _inRebaseWindow() internal view {
        
        require(rebasingActive, "rebasing not active");

        require(
            now.mod(minRebaseTimeIntervalSec) >= rebaseWindowOffsetSec,
            "too early"
        );
        require(
            now.mod(minRebaseTimeIntervalSec) <
                (rebaseWindowOffsetSec.add(rebaseWindowLengthSec)),
            "too late"
        );
    }

    /**
     * @return Computes in % how far off market is from peg
     */
    function computeOffPegPerc(uint256 rate)
        private
        view
        returns (uint256, bool)
    {
        if (withinDeviationThreshold(rate)) {
            return (0, false);
        }

        
        if (rate > targetRate) {
            return (rate.sub(targetRate).mul(BASE).div(targetRate), true);
        } else {
            return (targetRate.sub(rate).mul(BASE).div(targetRate), false);
        }
    }

    /**
     * @param rate The current exchange rate, an 18 decimal fixed point number.
     * @return If the rate is within the deviation threshold from the target rate, returns true.
     *         Otherwise, returns false.
     */
    function withinDeviationThreshold(uint256 rate)
        private
        view
        returns (bool)
    {
        uint256 absoluteDeviationThreshold = targetRate
            .mul(deviationThreshold)
            .div(10**18);

        return
            (rate >= targetRate &&
                rate.sub(targetRate) < absoluteDeviationThreshold) ||
            (rate < targetRate &&
                targetRate.sub(rate) < absoluteDeviationThreshold);
    }

    /* - Constructor Helpers - */

    
    function pairFor(
        address factory,
        address token0,
        address token1
    ) internal pure returns (address pair) {
        pair = address(
            uint256(
                keccak256(
                    abi.encodePacked(
                        hex"ff",
                        factory,
                        keccak256(abi.encodePacked(token0, token1)),
                        hex"96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f" 
                    )
                )
            )
        );
    }

    
    function sortTokens(address tokenA, address tokenB)
        internal
        pure
        returns (address token0, address token1)
    {
        require(tokenA != tokenB, "UniswapV2Library: IDENTICAL_ADDRESSES");
        (token0, token1) = tokenA < tokenB
            ? (tokenA, tokenB)
            : (tokenB, tokenA);
        require(token0 != address(0), "UniswapV2Library: ZERO_ADDRESS");
    }

    /* -- Rebase helpers -- */

    /**
     * @notice Adds a transaction that gets called for a downstream receiver of rebases
     * @param destination Address of contract destination
     * @param data Transaction data payload
     */
    function addTransaction(address destination, bytes calldata data)
        external
        onlyGov
    {
        transactions.push(
            Transaction({enabled: true, destination: destination, data: data})
        );
    }

    /**
     * @param index Index of transaction to remove.
     *              Transaction ordering may have changed since adding.
     */
    function removeTransaction(uint256 index) public onlyGov {	
        require(index < transactions.length, "index out of bounds");

        if (index < transactions.length - 1) {
            transactions[index] = transactions[transactions.length - 1];
        }

        transactions.length--;
    }

    /**
     * @param index Index of transaction. Transaction ordering may have changed since adding.
     * @param enabled True for enabled, false for disabled.
     */
    function setTransactionEnabled(uint256 index, bool enabled)
        public	
        onlyGov
    {
        require(
            index < transactions.length,
            "index must be in range of stored tx list"
        );
        transactions[index].enabled = enabled;
    }

    /**
     * @dev wrapper to call the encoded transactions on downstream consumers.
     * @param destination Address of destination contract.
     * @param data The encoded data payload.
     * @return True on success
     */
    function externalCall(address destination, bytes memory data)
        internal
        returns (bool)
    {
        bool result;
        assembly {
            
            
            
            let outputAddress := mload(0x40)

            
            let dataAddress := add(data, 32)

            result := call(
                
                
                
                
                sub(gas, 34710),
                destination,
                0, 
                dataAddress,
                mload(data), 
                outputAddress,
                0 
            )
        }
        return result;
    }

    
    function rescueTokens(
        address token,
        address to,
        uint256 amount
    ) public onlyGov returns (bool) {	
        
        SafeERC20.safeTransfer(IERC20(token), to, amount);
    }
}