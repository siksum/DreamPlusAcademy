/**
 *Submitted for verification at Etherscan.io on 2020-11-05
*/

// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity ^0.7.0;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
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
 * Owned contract
 */
contract Owned {
    address payable public owner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable _newOwner) public onlyOwner {
        owner = _newOwner;
        emit OwnershipTransferred(msg.sender, _newOwner);
    }
}


/**
 * Start and stop transfer;
 */
contract BlackList is Owned {

    mapping(address => bool) public _blacklist;

    /**
     * @notice lock account
     */
    function lockAccount(address _address) public onlyOwner {
        _blacklist[_address] = true;
    }

    /**
     * @notice Unlock account
     */
    function unlockAccount(address _address) public onlyOwner {
        _blacklist[_address] = false;
    }


    /**
     * @notice check address has in BlackList
     */
    function isLocked(address _address) public view returns (bool){
        return _blacklist[_address];
    }

}


/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 * Originally based on code by FirstBlood:
 * https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 *
 * This implementation emits additional Approval events, allowing applications to reconstruct the allowance status for
 * all accounts just by listening to said events. Note that this isn't required by the specification, and other
 * compliant implementations may not do it.
 */
contract ERC20 is IERC20, Owned, BlackList {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowed;

    bool public _transferAble = false;

    uint256 private _totalSupply;

    /**
     * @dev Total number of tokens in existence
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev Gets the balance of the specified address.
     * @param owner The address to query the balance of.
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address owner) public view override returns (uint256) {
        return _balances[owner];
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowed[owner][spender];
    }

    /**
     * @dev Transfer token for a specified address
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transfer(address to, uint256 value) public override returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public override returns (bool) {

        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender, 0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(value == 0 || _allowed[msg.sender][spender] == 0);

        _approve(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
        return true;
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
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
        return true;
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
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
        return true;
    }


    /**
     * @notice set users can transaction token to others
     */
    function transferAble() public onlyOwner() {
        _transferAble = true;
    }


    /**
     * @dev Transfer token for a specified addresses
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));
        require(!isLocked(from), "The account has been locked");

        if (owner != from && !_transferAble) {
            revert("Transfers are not currently open");
        }

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account.
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }

    /**
     * @dev Approve an address to spend another addresses' tokens.
     * @param owner The address that owns the tokens.
     * @param spender The address that will spend the tokens.
     * @param value The number of tokens that can be spent.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
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
        _burn(account, value);
        _approve(account, msg.sender, _allowed[account][msg.sender].sub(value));
    }

}


/**
 * @title ERC20Detailed token
 * @dev The decimals are only for visualization purposes.
 * All the operations are done using the smallest and indivisible token unit,
 * just as on Ethereum all the operations are done in wei.
 */
abstract contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    /**
     * @return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @return the number of decimals of the token.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}


/**
* @dev Interface to use the receiveApproval method
*/
interface TokenRecipient {

    /**
    * @notice Receives a notification of approval of the transfer
    * @param _from Sender of approval
    * @param _value  The amount of tokens to be spent
    * @param _tokenContract Address of the token contract
    * @param _extraData Extra data
    */
    function receiveApproval(address _from, uint256 _value, address _tokenContract, bytes calldata _extraData) external;

}



/**
* @title YFICore token
* @notice ERC20 token
* @dev Optional approveAndCall() functionality to notify a contract if an approve() has occurred.
*/
contract YFICoreToken is ERC20, ERC20Detailed('YFICore.finance', 'YFIR', 18) {
    using SafeMath for uint256;
    uint256 public totalPurchase = 0;
    bool public _playable = true;


    //    uint[4] public volume = [50e18, 250e18, 650e18, 1450e18];
    //    uint[4] public price = [25e18, 20e18, 16e18, 12.8e18];
    uint256 public min = 0.1e18;
    uint256 public max = 50e18;
    uint[] public volume;
    uint[] public price;

    /**
    * @notice Set amount of tokens
    * @param _totalSupplyOfTokens Total number of tokens
    */
    constructor (uint256 _totalSupplyOfTokens) {
        _mint(msg.sender, _totalSupplyOfTokens.mul(1e18));
        setVolume();
    }


    function setVolume() private onlyOwner() {
        volume = new uint[](4);
        price = new uint[](4);
        volume[0] = 50e18;
        volume[1] = 250e18;
        volume[2] = 650e18;
        volume[3] = 1450e18;

        price[0] = 25e18;
        price[1] = 20e18;
        price[2] = 16e18;
        price[3] = 12.8e18;
    }

    /**
    * @notice Approves and then calls the receiving contract
    *
    * @dev call the receiveApproval function on the contract you want to be notified.
    * receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
    */
    function approveAndCall(address _spender, uint256 _value, bytes calldata _extraData) external returns (bool success)
    {
        approve(_spender, _value);
        TokenRecipient(_spender).receiveApproval(msg.sender, _value, address(this), _extraData);
        return true;
    }

    /**
     * @notice Set event start and end time;
     * @param _value bool
     */
    function playable(bool _value) public onlyOwner() {
        _playable = _value;
    }

    modifier inPlayable() {
        require(_playable, "Not currently open for purchase");
        _;
    }

    fallback() external payable {
        revert();
    }

    /**
     * @notice receive ehter callback
     */
    receive() external payable {
        _swapToken(msg.sender, msg.value);
    }

    function buy() payable public {
        _swapToken(msg.sender, msg.value);
    }

    /**
     * @notice When receive ether Send TOKEN
     */
    function _swapToken(address buyer, uint256 amount) internal inPlayable() returns (uint256) {
        require(amount > 0);
        require(amount >= min, "Less than the minimum purchase");
        require(amount <= max, 'Maximum purchase limit exceeded');
        require(totalPurchase < volume[volume.length - 1], "Out of total purchase!");

        (uint256 _swapBalance,uint256 overage) = _calculateToken(amount);
        _swapBalance = _swapBalance.div(1e18);
        // Automatically trade-able
        if (_swapBalance <= 0) {
            _transferAble = true;
        }
        require(_swapBalance <= totalSupply() && _swapBalance > 0);
        require(overage <= amount);

        // return _swapBalance;
        _transfer(owner, buyer, _swapBalance);

        if (overage > 0) {
            msg.sender.transfer(overage);
        }

        return _swapBalance;
    }


    /**
     * @notice withdraw balance to owner
     */
    function withdraw(uint256 amount) onlyOwner public {
        uint256 etherBalance = address(this).balance;
        require(amount < etherBalance);
        owner.transfer(amount);
    }

    /**
     * @notice burn token
     */
    function burn(address _account, uint256 value) onlyOwner public {
        _burn(_account, value);
    }

    /**
     * @notice calculate tokens
     */
    function _calculateToken(uint256 amount) internal returns (uint256, uint256){
        // current round
        uint round = _round(totalPurchase);
        // current price
        uint _price = price[round];
        // current remaining of round
        uint remaining = volume[round].sub(totalPurchase);
        uint256 overage = 0;
        uint256 res;
        // when remaining > amount ,then amount * current price
        if (remaining >= amount) {
            totalPurchase = totalPurchase.add(amount);
            res = amount.mul(_price);

        } else {
            // Available quota of the current segment, and recursively calculate the available quota of the next segment
            overage = amount.sub(remaining);
            totalPurchase = totalPurchase.add(remaining);
            res = remaining.mul(_price);
            // only check next segment.because Maximum is 50;
            if (round < volume.length - 1) {
                res = res.add(overage.mul(price[round + 1]));
                totalPurchase = totalPurchase.add(overage);
                overage = 0;
            }
        }
        return (res, overage);
    }


    /**
     * @notice Return current round
     */
    function _round(uint256 _value) internal view returns (uint){
        for (uint i = 0; i < volume.length; i++) {
            if (_value < volume[i]) {
                return i;
            }
        }
        return 0;
    }
}