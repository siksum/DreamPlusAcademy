/**
 *Submitted for verification at Etherscan.io on 2020-05-11
*/

// File: contracts/DkargoPrefix.sol

pragma solidity >=0.5.0 <0.6.0;

/// @title DkargoPrefix
/// @notice 1111 1111 11 111 prefix 1111 11
/// @author jhhong
contract DkargoPrefix {
    
    string internal _dkargoPrefix; // 1111-1111
    
    /// @author jhhong
    /// @notice 1111 11111 1111.
    /// @return 1111 1111 (string)
    function getDkargoPrefix() public view returns(string memory) {
        return _dkargoPrefix;
    }

    /// @author jhhong
    /// @notice 1111 11111 1111.
    /// @param prefix 111 1111
    function _setDkargoPrefix(string memory prefix) internal {
        _dkargoPrefix = prefix;
    }
}

// File: contracts/authority/Ownership.sol

pragma solidity >=0.5.0 <0.6.0;

/// @title Onwership
/// @dev 11 11 1 111 11 11
/// @author jhhong
contract Ownership {
    address private _owner;

    event OwnershipTransferred(address indexed old, address indexed expected);

    /// @author jhhong
    /// @notice 1111 111 1 111 1111.
    modifier onlyOwner() {
        require(isOwner() == true, "Ownership: only the owner can call");
        _;
    }

    /// @author jhhong
    /// @notice 1111 11111.
    constructor() internal {
        emit OwnershipTransferred(_owner, msg.sender);
        _owner = msg.sender;
    }

    /// @author jhhong
    /// @notice 1111 1111.
    /// @param expected 111 11 11
    function transferOwnership(address expected) public onlyOwner {
        require(expected != address(0), "Ownership: new owner is the zero address");
        emit OwnershipTransferred(_owner, expected);
        _owner = expected;
    }

    /// @author jhhong
    /// @notice 11 111 1111.
    /// @return 11 11
    function owner() public view returns (address) {
        return _owner;
    }

    /// @author jhhong
    /// @notice 11111 1111.
    /// @return 11 11 (boolean)
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
}

// File: contracts/libs/SafeMath64.sol

pragma solidity >=0.5.0 <0.6.0;

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
library SafeMath64 {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint64 a, uint64 b) internal pure returns (uint64) {
        uint64 c = a + b;
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
    function sub(uint64 a, uint64 b) internal pure returns (uint64) {
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
     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.
     * @dev Get it via `npm install @openzeppelin/contracts@next`.
     */
    function sub(uint64 a, uint64 b, string memory errorMessage) internal pure returns (uint64) {
        require(b <= a, errorMessage);
        uint64 c = a - b;

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
    function mul(uint64 a, uint64 b) internal pure returns (uint64) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint64 c = a * b;
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
     * Requirements:uint64
     * - The divisor cannot be zero.
     */
    function div(uint64 a, uint64 b) internal pure returns (uint64) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint64 c = a / b;
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
    function mod(uint64 a, uint64 b) internal pure returns (uint64) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: contracts/chain/Uint64Chain.sol

pragma solidity >=0.5.0 <0.6.0;


/// @title Uint64Chain
/// @notice Uint64 Type 11 11 1 11
/// @dev 111 1 1111 11 TIME-BASE 111 111 111 111.
/// @author jhhong
contract Uint64Chain {
    using SafeMath64 for uint64;

    // 111 : 11 11
    struct NodeInfo {
        uint64 prev; // 11 11
        uint64 next; // 11 11
    }
    // 111 : 11 11
    struct NodeList {
        uint64 count; // 111 1 11
        uint64 head; // 111 11
        uint64 tail; // 111 11
        mapping(uint64 => NodeInfo) map; // 111 11 11 11 11
    }

    // 11 11
    NodeList private _slist; // 11 11 (11111)

    // 111 11
    event Uint64ChainLinked(uint64 indexed node); // 111: 111 111
    event Uint64ChainUnlinked(uint64 indexed node); // 111: 1111 11

    /// @author jhhong
    /// @notice 111 111 111 111 1111.
    /// @return 111 111 111 11
    function count() public view returns(uint64) {
        return _slist.count;
    }

    /// @author jhhong
    /// @notice 11 11 111 1111.
    /// @return 11 11 11
    function head() public view returns(uint64) {
        return _slist.head;
    }

    /// @author jhhong
    /// @notice 11 11 111 1111.
    /// @return 11 11 11
    function tail() public view returns(uint64) {
        return _slist.tail;
    }

    /// @author jhhong
    /// @notice node1 11 11 111 1111.
    /// @param node 11 11 (111 1111 11 11 11 11 11 11)
    /// @return node1 11 11 11
    function nextOf(uint64 node) public view returns(uint64) {
        return _slist.map[node].next;
    }

    /// @author jhhong
    /// @notice node1 11 11 111 1111.
    /// @param node 11 11 (111 1111 11 11 11 11 11 11)
    /// @return node1 11 11 11
    function prevOf(uint64 node) public view returns(uint64) {
        return _slist.map[node].prev;
    }

    /// @author jhhong
    /// @notice node1 111 111 11111 1111.
    /// @param node 11 11 111 111 11 11
    /// @return 11 11 (boolean), true: 111(linked), false: 1111 11(unlinked)
    function isLinked(uint64 node) public view returns (bool) {
        if(_slist.count == 1 && _slist.head == node && _slist.tail == node) {
            return true;
        } else {
            return (_slist.map[node].prev == uint64(0) && _slist.map[node].next == uint64(0))? (false) :(true);
        }
    }

    /// @author jhhong
    /// @notice 111 11 111 11 111 1111.
    /// @param node 11 111 111 11 11
    function _linkChain(uint64 node) internal {
        require(!isLinked(node), "Uint64Chain: the node is aleady linked");
        if(_slist.count == 0) {
            _slist.head = _slist.tail = node;
        } else {
            _slist.map[node].prev = _slist.tail;
            _slist.map[_slist.tail].next = node;
            _slist.tail = node;
        }
        _slist.count = _slist.count.add(1);
        emit Uint64ChainLinked(node);
    }

    /// @author jhhong
    /// @notice node 111 1111 11 1111.
    /// @param node 11 1111 11 111 11 11
    function _unlinkChain(uint64 node) internal {
        require(isLinked(node), "Uint64Chain: the node is aleady unlinked");
        uint64 tempPrev = _slist.map[node].prev;
        uint64 tempNext = _slist.map[node].next;
        if (_slist.head == node) {
            _slist.head = tempNext;
        }
        if (_slist.tail == node) {
            _slist.tail = tempPrev;
        }
        if (tempPrev != uint64(0)) {
            _slist.map[tempPrev].next = tempNext;
            _slist.map[node].prev = uint64(0);
        }
        if (tempNext != uint64(0)) {
            _slist.map[tempNext].prev = tempPrev;
            _slist.map[node].next = uint64(0);
        }
        _slist.count = _slist.count.sub(1);
        emit Uint64ChainUnlinked(node);
    }
}

// File: contracts/introspection/ERC165/IERC165.sol

pragma solidity >=0.5.0 <0.6.0;

/// @title IERC165
/// @dev EIP165 interface 11
/// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-165.md
/// @author jhhong
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: contracts/introspection/ERC165/ERC165.sol

pragma solidity >=0.5.0 <0.6.0;


/// @title ERC165
/// @dev EIP165 interface 11
/// @author jhhong
contract ERC165 is IERC165 {
    
    mapping(bytes4 => bool) private _infcs; // INTERFACE ID1 11111 1111 11 11 11

    /// @author jhhong
    /// @notice 1111 11111.
    /// @dev bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
    constructor() internal {
        _registerInterface(0x01ffc9a7); // supportsInterface()1 INTERFACE ID 11
    }

    /// @author jhhong
    /// @notice 11111 INTERFACE ID1 111111 111 1111.
    /// @param infcid 11111 111 INTERFACE ID (Function Selector)
    /// @return 1111 (boolean)
    function supportsInterface(bytes4 infcid) external view returns (bool) {
        return _infcs[infcid];
    }

    /// @author jhhong
    /// @notice INTERFACE ID1 1111.
    /// @param infcid 111 INTERFACE ID (Function Selector)
    function _registerInterface(bytes4 infcid) internal {
        require(infcid != 0xffffffff, "ERC165: invalid interface id");
        _infcs[infcid] = true;
    }
}

// File: contracts/libs/Address.sol

pragma solidity >=0.5.0 <0.6.0;

/**
 * @dev Collection of functions related to the address type,
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * > It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /// @dev jhhong add features
    /// add useful functions and modifier definitions
    /// date: 2020.02.24

    /// @author jhhong
    /// @notice call 111 11 11 111 1111.
    /// @param addr 11 111 1111 11
    /// @param rawdata Bytes111 11111 (11111 + 11111)
    /// @return 11 11 (bytes type) => abi.decode1 111111 1
    function _call(address addr, bytes memory rawdata) internal returns(bytes memory) {
        (bool success, bytes memory data) = address(addr).call(rawdata);
        require(success == true, "Address: function(call) call failed");
        return data;
    }

    /// @author jhhong
    /// @notice delegatecall 111 11 11 111 1111.
    /// @param addr 11 111 1111 11
    /// @param rawdata Bytes111 11111 (11111 + 11111)
    /// @return 11 11 (bytes type) => abi.decode1 111111 1
    function _dcall(address addr, bytes memory rawdata) internal returns(bytes memory) {
        (bool success, bytes memory data) = address(addr).delegatecall(rawdata);
        require(success == true, "Address: function(delegatecall) call failed");
        return data;
    }

    /// @author jhhong
    /// @notice staticcall 111 11 11 111 1111.
    /// @dev bool 11 11 1111 view / pure 11 CALL 1 1111.
    /// @param addr 11 111 1111 11
    /// @param rawdata Bytes111 11111 (11111 + 11111)
    /// @return 11 11 (bytes type) => abi.decode1 111111 1
    function _vcall(address addr, bytes memory rawdata) internal view returns(bytes memory) {
        (bool success, bytes memory data) = address(addr).staticcall(rawdata);
        require(success == true, "Address: function(staticcall) call failed");
        return data;
    }
}

// File: contracts/libs/refs/SafeMath.sol

pragma solidity >=0.5.0 <0.6.0;

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
     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.
     * @dev Get it via `npm install @openzeppelin/contracts@next`.
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
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
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
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
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
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: contracts/DkargoFund.sol

pragma solidity >=0.5.0 <0.6.0;







/// @title DkargoFund
/// @notice 1111 11 1111 11
/// @author jhhong
contract DkargoFund is Ownership, Uint64Chain, ERC165, DkargoPrefix {
    using Address for address;
    using SafeMath for uint256;

    mapping(uint64 => uint256) private _plans; // 11 11
    address private _beneficier; // 111 11
    address private _token; // 11 1111 11
    uint256 private _totals; // 111 111 1 111, 111 11 1111 111 1 11.
    
    event BeneficierUpdated(address indexed beneficier); // 111: 111 11
    event PlanSet(uint64 time, uint256 amount); // 111: 1111 11 (amount=011 11)
    event Withdraw(uint256 amount); // 111: 11

    /// @author jhhong
    /// @notice 1111 11111.
    /// @param token 11 1111 11
    /// @param beneficier 111 11
    constructor(address token, address beneficier) public {
        require(token != address(0), "DkargoFund: token is null");
        require(beneficier != address(0), "DkargoFund: beneficier is null");
        _setDkargoPrefix("fund"); // 1111 11 (fund)
        _registerInterface(0x946edbed); // INTERFACE ID 11 (getDkargoPrefix)
        _token = token;
        _beneficier = beneficier;
    }

    /// @author jhhong
    /// @notice 1111 1111 1111.
    /// @dev 111 111 EOA, CA 1 11 1111.
    /// @param beneficier 111 111 11 (address)
    function setBeneficier(address beneficier) onlyOwner public {
        require(beneficier != address(0), "DkargoFund: beneficier is null");
        require(beneficier != _beneficier, "DkargoFund: should be not equal");
        _beneficier = beneficier;
        emit BeneficierUpdated(beneficier);
    }

    /// @author jhhong
    /// @notice 11 111 1111.
    /// @dev amount!=011 1 111 11111 1111. linkChain 111 1111. 111 111 111 11 11 1111.
    /// amount=011 111 11111 1111. unlinkChain 111 1111. 111 111 111 11 11 revert11.
    /// time1 11 11(block.timestamp)11 1 1111 11.
    /// 111 1111 11 amount1 11 balanceOf(fundCA)1 111 1 11.
    /// @param time 11 111 11
    /// @param amount 11 111 11
    function setPlan(uint64 time, uint256 amount) onlyOwner public {
        require(time > block.timestamp, "DkargoFund: invalid time");
        _totals = _totals.add(amount); // 111 11 111 1 11111 11
        _totals = _totals.sub(_plans[time]); // 1 111111 11 111 111 11
        require(_totals <= fundAmount(), "DkargoFund: over the limit"); // 1 1111 11
        _plans[time] = amount; // 11 11 11
        emit PlanSet(time, amount); // 111 11
        if(amount == 0) { // 1111 11
            _unlinkChain(time); // 111 1111 111 11, revert("AddressChain: the node is aleady unlinked")
        } else if(isLinked(time) == false) { // 1 111 1111 1111, 11 111 11 11, 11 1111 11 111 1111 11
            _linkChain(time);
        }
    }

    /// @author jhhong
    /// @notice 111 111 111111 1111.
    /// @dev 1111 11 index1 11 11111. revert!
    /// 1111 11 (11 111) 11 1111 1111 revert!
    /// @param index 11 111, setPlan11 1111 11 11 1111.
    function withdraw(uint64 index) onlyOwner public {
        require(index <= block.timestamp, "DkargoFund: an unexpired plan");
        require(_plans[index] > 0, "DkargoFund: plan is not set");
        bytes memory cmd = abi.encodeWithSignature("transfer(address,uint256)", _beneficier, _plans[index]);
        bytes memory data = address(_token)._call(cmd);
        bool result = abi.decode(data, (bool));
        require(result == true, "DkargoFund: failed to proceed raw-data");
        _totals = _totals.sub(_plans[index]); // 1 111111 11 111 111 11
        emit Withdraw(_plans[index]);
        _plans[index] = 0;
        _unlinkChain(index);
    }

    /// @author jhhong
    /// @notice Fund 11111 1111 1111.
    /// @return Fund 11111 111 (uint256)
    function fundAmount() public view returns(uint256) {
        bytes memory data = address(_token)._vcall(abi.encodeWithSignature("balanceOf(address)", address(this)));
        return abi.decode(data, (uint256));
    }

    /// @author jhhong
    /// @notice 111 111 1 111 1111.
    /// @return 111 111 1 11 (uint256)
    function totalPlannedAmount() public view returns(uint256) {
        return _totals;
    }
    
    /// @author jhhong
    /// @notice 11 1111 1111 11 111 1111.
    /// @param index 11 111, setPlan11 1111 11 11 1111.
    /// @return 11 1111 1111 11 11 (uint256)
    function plannedAmountOf(uint64 index) public view returns(uint256) {
        return _plans[index];
    }

    /// @author jhhong
    /// @notice 111 111 1111.
    /// @return 111 11 (address)
    function beneficier() public view returns(address) {
        return _beneficier;
    }

    /// @author jhhong
    /// @notice 11(ERC-20) 111 1111.
    /// @return 11 11 (address)
    function token() public view returns(address) {
        return _token;
    }
}