/**
 *Submitted for verification at Etherscan.io on 2020-09-26
*/

// File: @openzeppelin/contracts/GSN/Context.sol



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

// File: contracts/registries/IAddressRegistry.sol



pragma solidity >=0.4.21 <0.7.0;

interface IAddressRegistry {
    function get(bytes32 _key) external view returns(address);
    function set(bytes32 _key, address _value) external;
}

// File: contracts/registries/AddressRegistryParent.sol


pragma solidity >=0.4.21 <0.7.0;



contract AddressRegistryParent is Ownable, IAddressRegistry{
    bytes32[] internal _keys;
    mapping(bytes32 => address) internal _registry;

    event AddressAdded(bytes32 _key, address _value);

    function set(bytes32 _key, address _value) external override onlyOwner() {
        _check(_key, _value);
        emit AddressAdded(_key, _value);
        _keys.push(_key);
        _registry[_key] = _value;
    }

    function get(bytes32 _key) external override view returns(address) {
        return _registry[_key];
    }

    function _check(bytes32 _key, address _value) internal virtual {
        require(_value != address(0), "Nullable address");
        require(_registry[_key] == address(0), "Existed key");
    }
}

// File: contracts/oracleIterators/IOracleIterator.sol



pragma solidity >=0.4.21 <0.7.0;

interface IOracleIterator {
    /// @notice Proof of oracle iterator contract
    /// @dev Verifies that contract is a oracle iterator contract
    /// @return true if contract is a oracle iterator contract
    function isOracleIterator() external pure returns(bool);

    /// @notice Symbol of the oracle iterator
    /// @dev Should be resolved through OracleIteratorRegistry contract
    /// @return oracle iterator symbol
    function symbol() external view returns (string memory);

    /// @notice Algorithm that, for the type of oracle used by the derivative,
    //  finds the value closest to a given timestamp
    /// @param _oracle iteratable oracle through
    /// @param _timestamp a given timestamp
    /// @param _roundHint specified round for a given timestamp
    /// @return the value closest to a given timestamp
    function getUnderlingValue(address _oracle, uint _timestamp, uint _roundHint) external view returns(int);
}

// File: contracts/registries/OracleIteratorRegistry.sol

// "SPDX-License-Identifier: GNU General Public License v3.0"

pragma solidity >=0.4.21 <0.7.0;



contract OracleIteratorRegistry is AddressRegistryParent {
    function _check(bytes32 _key, address _value) internal virtual override{
        super._check(_key, _value);

        require(_key == keccak256(abi.encodePacked(IOracleIterator(_value).symbol())), "Incorrect hash");

        require(IOracleIterator(_value).isOracleIterator(), "Should be oracle iterator");
    }
}