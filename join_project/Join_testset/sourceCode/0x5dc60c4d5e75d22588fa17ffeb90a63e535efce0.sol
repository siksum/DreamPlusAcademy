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

// File: contracts/chain/AddressChain.sol

pragma solidity >=0.5.0 <0.6.0;


/// @title AddressChain
/// @notice 11 11 11 1 11
/// @dev 1111, 1111 11 11 11 111 111 111.
/// @author jhhong
contract AddressChain {
    using SafeMath for uint256;

    // 111 : 11 11
    struct NodeInfo {
        address prev; // 11 11
        address next; // 11 11
    }
    // 111 : 11 11
    struct NodeList {
        uint256 count; // 111 1 11
        address head; // 111 11
        address tail; // 111 11
        mapping(address => NodeInfo) map; // 111 11 11 11 11
    }

    // 11 11
    NodeList private _slist; // 11 11 (11111)

    // 111 11
    event AddressChainLinked(address indexed node); // 111: 111 111
    event AddressChainUnlinked(address indexed node); // 111: 1111 11

    /// @author jhhong
    /// @notice 111 111 111 111 1111.
    /// @return 111 111 111 11
    function count() public view returns(uint256) {
        return _slist.count;
    }

    /// @author jhhong
    /// @notice 11 11 111 1111.
    /// @return 11 11 11
    function head() public view returns(address) {
        return _slist.head;
    }

    /// @author jhhong
    /// @notice 11 11 111 1111.
    /// @return 11 11 11
    function tail() public view returns(address) {
        return _slist.tail;
    }

    /// @author jhhong
    /// @notice node1 11 11 111 1111.
    /// @param node 11 11 (111 1111 11 11 11 11 11 11)
    /// @return node1 11 11 11
    function nextOf(address node) public view returns(address) {
        return _slist.map[node].next;
    }

    /// @author jhhong
    /// @notice node1 11 11 111 1111.
    /// @param node 11 11 (111 1111 11 11 11 11 11 11)
    /// @return node1 11 11 11
    function prevOf(address node) public view returns(address) {
        return _slist.map[node].prev;
    }

    /// @author jhhong
    /// @notice node1 111 111 11111 1111.
    /// @param node 11 11 111 111 11 11
    /// @return 11 11 (boolean), true: 111(linked), false: 1111 11(unlinked)
    function isLinked(address node) public view returns (bool) {
        if(_slist.count == 1 && _slist.head == node && _slist.tail == node) {
            return true;
        } else {
            return (_slist.map[node].prev == address(0) && _slist.map[node].next == address(0))? (false) :(true);
        }
    }

    /// @author jhhong
    /// @notice 111 11 111 11 111 1111.
    /// @param node 11 111 111 11 11
    function _linkChain(address node) internal {
        require(node != address(0), "AddressChain: try to link to the zero address");
        require(!isLinked(node), "AddressChain: the node is aleady linked");
        if(_slist.count == 0) {
            _slist.head = _slist.tail = node;
        } else {
            _slist.map[node].prev = _slist.tail;
            _slist.map[_slist.tail].next = node;
            _slist.tail = node;
        }
        _slist.count = _slist.count.add(1);
        emit AddressChainLinked(node);
    }

    /// @author jhhong
    /// @notice node 111 1111 11 1111.
    /// @param node 11 1111 11 111 11 11
    function _unlinkChain(address node) internal {
        require(node != address(0), "AddressChain: try to unlink to the zero address");
        require(isLinked(node), "AddressChain: the node is aleady unlinked");
        address tempPrev = _slist.map[node].prev;
        address tempNext = _slist.map[node].next;
        if (_slist.head == node) {
            _slist.head = tempNext;
        }
        if (_slist.tail == node) {
            _slist.tail = tempPrev;
        }
        if (tempPrev != address(0)) {
            _slist.map[tempPrev].next = tempNext;
            _slist.map[node].prev = address(0);
        }
        if (tempNext != address(0)) {
            _slist.map[tempNext].prev = tempPrev;
            _slist.map[node].next = address(0);
        }
        _slist.count = _slist.count.sub(1);
        emit AddressChainUnlinked(node);
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

// File: contracts/token/ERC20/IERC20.sol

pragma solidity >=0.5.0 <0.6.0;

/// @title IERC20
/// @notice EIP20 interface 11
/// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
/// @author jhhong
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: contracts/token/ERC20/ERC20.sol

pragma solidity >=0.5.0 <0.6.0;



/// @title ERC20
/// @notice EIP20 interface 11 1 mint/burn (internal) 11 11
/// @author jhhong
contract ERC20 is IERC20 {
    using SafeMath for uint256;
    
    uint256 private _supply; // 1 111
    mapping(address => uint256) private _balances; // 111 111 111
    mapping(address => mapping(address => uint256)) private _allowances; // 1 111 11 "111 111"1 11
    
    /// @author jhhong
    /// @notice 1111 11111.
    /// @param supply 11 111
    constructor(uint256 supply) internal {
        uint256 pebs = supply;
        _mint(msg.sender, pebs);
    }
    
    /// @author jhhong
    /// @notice 11(spender)11 111(value)1 1111.
    /// @param spender 1111 11
    /// @param amount 111 111
    /// @return 1111 1 true
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
    
    /// @author jhhong
    /// @notice 11(recipient)11 111(amount)1 1111.
    /// @param recipient 1111 11
    /// @param amount 11
    /// @return 1111 1 true
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    
    /// @author jhhong
    /// @notice 11(sender)1 11(recipient)11 111(amount)1 1111.
    /// @param sender 111 11
    /// @param recipient 1111 11
    /// @param amount 11
    /// @return 1111 1 true
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /// @author jhhong
    /// @notice 111 1 1111 1111.
    /// @return 1 111
    function totalSupply() public view returns (uint256) {
        return _supply;
    }
    
    /// @author jhhong
    /// @notice 11(account)1 111 1111 1111.
    /// @param account 11
    /// @return 11(account)1 111 111
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    
    /// @author jhhong
    /// @notice 11(approver)1 11(spender)11 111 1111 1111.
    /// @param approver 111 11
    /// @param spender 1111 11
    /// @return 11(approver)1 11(spender)11 111 111
    function allowance(address approver, address spender) public view returns (uint256) {
        return _allowances[approver][spender];
    }
    
    /// @author jhhong
    /// @notice 11(approver)1 11(spender)11 111(value)1 1111.
    /// @param approver 111 11
    /// @param spender 1111 11
    /// @param value 111 111
    function _approve(address approver, address spender, uint256 value) internal {
        require(approver != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[approver][spender] = value;
        emit Approval(approver, spender, value);
    }
    
    /// @author jhhong
    /// @notice 11(sender)1 11(recipient)11 111(amount)1 1111.
    /// @param sender 111 11
    /// @param recipient 1111 11
    /// @param amount 11
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /// @author jhhong
    /// @notice 111(amount)11 1111 11(account)1 1111 1111.
    /// @dev ERC20Mint1 1111 private 111 supply1 balances1 access1 1 111 ERC201 internal1 111.
    /// @param account 111 1111 11 11
    /// @param amount 111 111
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _supply = _supply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /// @author jhhong
    /// @notice 111(value)11 1111 11(account)1 11111 11.
    /// @dev ERC20Mint1 1111 private 111 supply1 balances1 access1 1 111 ERC201 internal1 111.
    /// @param account 1111 1111 11
    /// @param value 1111 111
    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].sub(value, "ERC20: burn amount exceeds balance");
        _supply = _supply.sub(value);
        emit Transfer(account, address(0), value);
    }
}

// File: contracts/token/ERC20/ERC20Safe.sol

pragma solidity >=0.5.0 <0.6.0;



/// @title ERC20Safe
/// @notice Approve Bug Fix 11 (11 11 11)
/// @author jhhong
contract ERC20Safe is ERC20 {
    using SafeMath for uint256;

    /// @author jhhong
    /// @notice 11(spender)11 111(amount)1 1111.
    /// @dev 11 11111 1111 11 111 1111 1111 01 1111 111 1111.
    /// @param spender 1111 11
    /// @param amount 111 111
    /// @return 1111 1 true
    function approve(address spender, uint256 amount) public returns (bool) {
        require((amount == 0) || (allowance(msg.sender, spender) == 0), "ERC20Safe: approve from non-zero to non-zero allowance");
        return super.approve(spender, amount);
    }

    /// @author jhhong
    /// @notice 11(spender)1 111 1111 111(addedValue)1 1111 1111.
    /// @dev 111 1111 11 11, 111 111 11 111 111 1
    /// @param spender 1111 11
    /// @param addedValue 111 111
    /// @return 1111 1 true
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        uint256 amount = allowance(msg.sender, spender).add(addedValue);
        return super.approve(spender, amount);
    }
    
    /// @author jhhong
    /// @notice 11(spender)1 111 1111 111(subtractedValue)1 111 1111.
    /// @dev 111 1111 11 11, 111 111 11 111 111 1
    /// @param spender 1111 11
    /// @param subtractedValue 11 111
    /// @return 1111 1 true
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        uint256 amount = allowance(msg.sender, spender).sub(subtractedValue, "ERC20: decreased allowance below zero");
        return super.approve(spender, amount);
    }
}

// File: contracts/DkargoToken.sol

pragma solidity >=0.5.0 <0.6.0;






/// @title DkargoToken
/// @notice 1111 11 1111 11 (111 deploy1)
/// @dev burn 11 11 (public)
/// @author jhhong
contract DkargoToken is Ownership, ERC20Safe, AddressChain, ERC165, DkargoPrefix {
    
    string private _name; // 11 11
    string private _symbol; // 11 11
    
    /// @author jhhong
    /// @notice 1111 11111.
    /// @dev 11 1111 11 11, msg.sender1 11 1111 1111.
    /// @param name 11 11
    /// @param symbol 11 11
    /// @param supply 11 111
    constructor(string memory name, string memory symbol, uint256 supply) ERC20(supply) public {
        _setDkargoPrefix("token"); // 1111 11 (token)
        _registerInterface(0x946edbed); // INTERFACE ID 11 (getDkargoPrefix)
        _name = name;
        _symbol = symbol;
        _linkChain(msg.sender);
    }

    /// @author jhhong
    /// @notice 111 1111 1 111 1111 1111.
    /// @param amount 1111 111
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    /// @author jhhong
    /// @notice 111 1111. (1111: msg.sender)
    /// @dev 11 1 111 11 11 111 111 1111.
    /// @param to 111 11 11
    /// @param value 11 11 (111)
    function transfer(address to, uint256 value) public returns (bool) {
        bool ret = super.transfer(to, value);
        if(isLinked(msg.sender) && balanceOf(msg.sender) == 0) {
            _unlinkChain(msg.sender);
        }
        if(!isLinked(to) && balanceOf(to) > 0) {
            _linkChain(to);
        }
        return ret;
    }

    /// @author jhhong
    /// @notice 111 1111. (1111: from)
    /// @dev 11 1 111 11 11 111 111 1111.
    /// @param from 111 11 11
    /// @param to 111 11 11
    /// @param value 11 11 (111)
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        bool ret = super.transferFrom(from, to, value);
        if(isLinked(from) && balanceOf(from) == 0) {
            _unlinkChain(from);
        }
        if(!isLinked(to) && balanceOf(to) > 0) {
            _linkChain(to);
        }
        return ret;
    }

    /// @author jhhong
    /// @notice 111 111 1111.
    /// @return 11 11
    function name() public view returns(string memory) {
        return _name;
    }
    
    /// @author jhhong
    /// @notice 111 111 1111.
    /// @return 11 11
    function symbol() public view returns(string memory) {
        return _symbol;
    }

    /// @author jhhong
    /// @notice 11 1111 1111.
    /// @dev 111 11 18 (peb) 1 1111.
    /// @return 11 111
    function decimals() public pure returns(uint256) {
        return 18;
    }
}