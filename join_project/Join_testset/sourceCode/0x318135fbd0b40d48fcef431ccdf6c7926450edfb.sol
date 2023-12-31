/**
 *Submitted for verification at Etherscan.io on 2020-01-29
*/

// File: @openzeppelin\contracts\token\ERC20\IERC20.sol

pragma solidity ^0.5.0;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

// File: @openzeppelin\contracts\GSN\Context.sol

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

// File: @openzeppelin\contracts\ownership\Ownable.sol

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
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
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

// File: @openzeppelin\contracts\math\SafeMath.sol

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

// File: @openzeppelin\contracts\utils\Address.sol

pragma solidity ^0.5.5;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * IMPORTANT: It is unsafe to assume that an address for which this
     * function returns false is an externally-owned account (EOA) and not a
     * contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
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


interface IIEarnAPR {
    function getAPROptions(address _token) external view returns (
      uint256 uniapr,
      uint256 capr,
      uint256 unicapr,
      uint256 iapr,
      uint256 uniiapr,
      uint256 aapr,
      uint256 uniaapr,
      uint256 dapr
    );
}


contract IEarnManager is Ownable {
    using SafeMath for uint;
    using Address for address;

    address public APR;

    constructor() public {
        APR = address(0x9CaD8AB10daA9AF1a9D2B878541f41b697268eEC);
    }

    function recommendSNX() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F);
    }
    function recommendUSDT() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    }
    function recommendBAT() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x0D8775F648430679A709E98d2b0Cb6250d2887EF);
    }
    function recommendMKR() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2);
    }
    function recommendZRX() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xE41d2489571d322189246DaFA5ebDe1F4699F498);
    }
    function recommendREP() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x1985365e9f78359a9B6AD760e32412f4a445E862);
    }
    function recommendKNC() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xdd974D5C2e2928deA5F71b9825b8b646686BD200);
    }
    function recommendWBTC() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
    }
    function recommendLINK() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    }
    function recommendSUSD() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51);
    }
    function recommendDAI() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }
    function recommendETH() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
    }
    function recommendUSDC() public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      return recommend(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    }

    function recommend(address _token) public view returns (
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    ) {
      (,capr,,iapr,,aapr,,dapr) = IIEarnAPR(APR).getAPROptions(_token);
      uint256 max = 0;
      if (capr > max) {
        max = capr;
      }
      if (iapr > max) {
        max = iapr;
      }
      if (aapr > max) {
        max = aapr;
      }
      if (dapr > max) {
        max = dapr;
      }
      choice = 'None';

      if (max == dapr) {
        choice = 'dYdX';
      }
      if (max == aapr) {
        choice = 'Aave';
      }
      if (max == iapr) {
        choice = 'Fulcrum';
      }
      if (max == capr) {
        choice = 'Compound';
      }
      return (
        choice,
        capr,
        iapr,
        aapr,
        dapr
      );
    }

    /* Decision trees

    */

    /* Net outcomes;

      BAT: cBAT vs aBAT
      DAI: cDAI vs iDAI vs aDAI vs dDAI
      KNC: iKNC vs aKNC
      LINK: iLINK vs aLINK
      MKR: aMKR
      REP: cREP vs aREP
      SNX: aSNX
      sUSD: iSUSD vs aSUSD
      USDC: cUSDC vs iUSDC vs aUSDC vs dUSDC
      USDT: aUSDT
      wBTC: cWBTC vs iWTBC vs aWBTC
      ZRX: cZRX vs iZRX vs aZRX

    */

    function set_new_APR(address _new_APR) public onlyOwner {
        APR = _new_APR;
    }

    // incase of half-way error
    function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
        uint qty = _TokenAddress.balanceOf(address(this));
        _TokenAddress.transfer(msg.sender, qty);
    }
    // incase of half-way error
    function inCaseETHGetsStuck() onlyOwner public{
        (bool result, ) = msg.sender.call.value(address(this).balance)("");
        require(result, "transfer of ETH failed");
    }
}