/**
 *Submitted for verification at Etherscan.io on 2020-11-05
*/

// SPDX-License-Identifier: MIT

pragma solidity 0.6.6;


// 
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

// 
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

// 
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

interface IPriceProvider {
    function providerName() external view returns (string memory);
    function update() external;
    function lastPrice() external view returns (uint32);
    function updateRequred() external view returns (bool);
}

contract PriceManager is Ownable {

    using SafeMath for uint;

    struct Price {
        string provider; // ex. CoinGecko, CoinMarketCap, ...
        uint64 timestamp;
        uint32 price;
        uint32 x;
    }

    address public tautrino;

    IPriceProvider[] public providers;
    Price[] public lastPrices;

    uint32 public lastAvgPrice;
    uint32[] public primeNumbers = [23, 41, 59, 67, 73, 89, 97]; // prime numbers to get random number

    /**
     * @dev Throws if called by any account other than the governance.
     */
    modifier onlyTautrino() {
        require(tautrino == msg.sender, "tautrino!");
        _;
    }

    /**
     * @dev Constructor.
     * @param _tautrino Tautrino contract address.
     */

    constructor(address _tautrino) public Ownable() {
        tautrino = _tautrino;
    }

    /**
     * @dev Update tautrino.
     * @param _tautrino The address of tautrino.
     */

    function setTautrino(address _tautrino) external onlyTautrino {
        tautrino = _tautrino;
    }

    /**
     * @dev Add new price provider.
     * @param _provider The address of new provider.
     */

    function addProvider(address _provider) external onlyOwner {
        IPriceProvider _newProvider = IPriceProvider(_provider);
        if (_newProvider.updateRequred()) {
            _newProvider.update();
        }
        providers.push(_newProvider);
    }

    /**
     * @dev Remove existing price provider.
     * @param index Index of provider to remove.
     */

    function removeProvider(uint index) external onlyOwner {
        require(index < providers.length, "index out of bounds");

        if (index < providers.length - 1) {
            providers[index] = providers[providers.length - 1];
        }

        providers.pop();
    }

    /**
     * @dev Calculate average price by the following formular.
     * (price1 * x1 + price2 * x2 + price3 * x3 + ...) / (x1 + x2 + x3 + ...)
     * price1, price2, price3, ... will be fetched from price providers.
     * x1, x2, x3, ... will be generated by current timestamp and prime numbers.
     *
     * @return Calculated average price.
     */

    function averagePrice() external onlyTautrino returns (uint32) {
        require(providers.length > 0, "No providers");

        delete lastPrices;
        uint _priceSum = 0;
        uint _xSum = 0;

        for (uint i = 0; i < providers.length; i++) {
            if (providers[i].updateRequred()) {
                providers[i].update();
            }
            uint32 _price = providers[i].lastPrice();
            uint _x = uint(keccak256(abi.encodePacked(_price, block.coinbase, block.timestamp, block.difficulty, blockhash(block.number)))).mod(uint(primeNumbers[i])).add(1);

            lastPrices.push(Price({
                provider: providers[i].providerName(),
                timestamp: uint64(block.timestamp),
                price: _price,
                x: uint32(_x)
            }));
            _priceSum = _priceSum.add(uint(_price).mul(_x));
            _xSum = _xSum.add(_x);
        }

        require(_priceSum > 0, "Price is not updated yet");

        lastAvgPrice = uint32(_priceSum.div(_xSum));
        return lastAvgPrice;
    }

    /**
     * @dev Add new prime number.
     * @param _primeNumber New prime number to add.
     */

    function addPrimeNumber(uint32 _primeNumber) external onlyOwner {
        primeNumbers.push(_primeNumber);
    }

    /**
     * @dev Remove existing prime number.
     * @param index Index to remove.
     */

    function removePrimeNumber(uint index) external onlyOwner {
        require(index < primeNumbers.length, "index out of bounds");

        if (index < primeNumbers.length - 1) {
            primeNumbers[index] = primeNumbers[primeNumbers.length - 1];
        }

        primeNumbers.pop();
    }

    /**
     * @return Number of providers in providers list.
     */

    function providerSize() external view returns (uint) {
        return providers.length;
    }

    /**
     * @return Number of prices fetched.
     */

    function lastPricesSize() external view returns (uint) {
        return lastPrices.length;
    }
}