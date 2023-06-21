/**
 *Submitted for verification at Etherscan.io on 2020-01-24
*/

pragma solidity ^0.5.8;

/**
 * @title ERC20 interface
 * @dev see https:
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
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
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
        
        require(b > 0);
        uint256 c = a / b;
        

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
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https:
 * Originally based on code by FirstBlood:
 * https:
 *
 * This implementation emits additional Approval events, allowing applications to reconstruct the allowance status for
 * all accounts just by listening to said events. Note that this isn't required by the specification, and other
 * compliant implementations may not do it.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    /**
    * @dev Transfer token for a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https:
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
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
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
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
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
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
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].sub(subtractedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    /**
    * @dev Transfer token for a specified addresses
    * @param from The address to transfer from.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

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
     * @dev Internal function that burns an amount of the token of a given
     * account, deducting from the sender's allowance for said account. Uses the
     * internal burn function.
     * Emits an Approval event (reflecting the reduced allowance).
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burnFrom(address account, uint256 value) internal {
        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(value);
        _burn(account, value);
        emit Approval(account, msg.sender, _allowed[account][msg.sender]);
    }
}


/**
 * @title Helps contracts guard against reentrancy attacks.
 * @author Remco Bloemen <remco@21.com>, Eenae <alexey@mixbytes.io>
 * @dev If you mark a function `nonReentrant`, you should also
 * mark it `external`.
 */
contract ReentrancyGuard {
    /
    uint256 private _guardCounter;

    constructor() public {
        
        
        _guardCounter = 1;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}


/
/
/
/
/
/
/
/
/
/
contract WrappedCF is ERC20, ReentrancyGuard {

    
    using SafeMath for uint256;

    **** */
    
    **** */

    /
    /
    /
    event DepositChainFaceAndMintToken(
        uint256 chainFaceId
    );

    /
    /
    /
    event BurnTokenAndWithdrawChainFace(
        uint256 chainFaceId
    );

    ***** */
    
    ***** */

    /
    /
    /
    /
    /
    /
    /
    uint256[] private depositedChainFacesArray;

    /
    /
    /
    /
    /
    /
    /
    mapping (uint256 => bool) private chainFaceIsDepositedInContract;

    ******* */
    
    ******* */

    /
    uint8 constant public decimals = 18;
    string constant public name = "Wrapped ChainFaces";
    string constant public symbol = "WCF";

    /
    /
    /
    address public chainFaceCoreAddress = 0x91047Abf3cAb8da5A9515c8750Ab33B4f1560a7A;
    ChainFaceCore chainFaceCore;

    ******* */
    
    ******* */

    /
    /
    /
    /
    function depositChainFacesAndMintTokens(uint256[] calldata _chainFaceIds) external nonReentrant {
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');
        for(uint i = 0; i < _chainFaceIds.length; i++){
            uint256 chainFaceToDeposit = _chainFaceIds[i];
            require(msg.sender == chainFaceCore.ownerOf(chainFaceToDeposit), 'you do not own this ChainFace');
            require(chainFaceCore.isApprovedForAll(msg.sender, address(this)), 'you must approveForAll() this contract to give it permission to withdraw this ChainFace before you can deposit a ChainFace');
            chainFaceCore.transferFrom(msg.sender, address(this), chainFaceToDeposit);
            _pushChainFace(chainFaceToDeposit);
            emit DepositChainFaceAndMintToken(chainFaceToDeposit);
        }
        _mint(msg.sender, (_chainFaceIds.length).mul(10**18));
    }

    /
    /
    /
    /
    /
    /
    function burnTokensAndWithdrawChainFaces(uint256[] calldata _chainFaceIds, address[] calldata _destinationAddresses) external nonReentrant {
        require(_chainFaceIds.length == _destinationAddresses.length, 'you did not provide a destination address for each of the ChainFaces you wish to withdraw');
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');

        uint256 numTokensToBurn = _chainFaceIds.length;
        require(balanceOf(msg.sender) >= numTokensToBurn.mul(10**18), 'you do not own enough tokens to withdraw this many ERC721 ChainFaces');
        _burn(msg.sender, numTokensToBurn.mul(10**18));
        
        for(uint i = 0; i < numTokensToBurn; i++){
            uint256 chainFaceToWithdraw = _chainFaceIds[i];
            if(address(this).balance == 0){	
                chainFaceToWithdraw = _popChainFace();
            } else {
                require(chainFaceIsDepositedInContract[chainFaceToWithdraw] == true, 'this chainFace has already been withdrawn');
                require(address(this) == chainFaceCore.ownerOf(chainFaceToWithdraw), 'the contract does not own this ChainFace');
                chainFaceIsDepositedInContract[chainFaceToWithdraw] = false;
            }
            chainFaceCore.transferFrom(address(this), _destinationAddresses[i], chainFaceToWithdraw);
            emit BurnTokenAndWithdrawChainFace(chainFaceToWithdraw);
        }
    }

    /
    /
    function _pushChainFace(uint256 _chainFaceIds) internal {
        depositedChainFacesArray.push(_chainFaceIds);
        chainFaceIsDepositedInContract[_chainFaceIds] = true;
    }

    /
    /
    /
    /
    /
    function _popChainFace() internal returns(uint256){
        require(depositedChainFacesArray.length > 0, 'there are no ChainFaces in the array');
        uint256 chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
        depositedChainFacesArray.length--;
        while(chainFaceIsDepositedInContract[chainFaceId] == false){
            chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
            depositedChainFacesArray.length--;
        }
        chainFaceIsDepositedInContract[chainFaceId] = false;
        return chainFaceId;
    }

    /
    /
    /
    /
    /
    /
    /
    function batchRemoveWithdrawnChainFacesFromStorage(uint256 _numSlotsToCheck) external {
        require(_numSlotsToCheck <= depositedChainFacesArray.length, 'you are trying to batch remove more slots than exist in the array');
        uint256 arrayIndex = depositedChainFacesArray.length;
        for(uint i = 0; i < _numSlotsToCheck; i++){
            arrayIndex = arrayIndex.sub(1);
            uint256 chainFaceId = depositedChainFacesArray[arrayIndex];
            if(chainFaceIsDepositedInContract[chainFaceId] == false){
                depositedChainFacesArray.length--;
            } else {
                return;
            }
        }
    }

    /
    /
    constructor() public {
        chainFaceCore = ChainFaceCore(chainFaceCoreAddress);
    }

    /
    /
    /
    /
    /
    function() external payable {}
}

/
contract ChainFaceCore {
    function ownerOf(uint256 _tokenId) public view returns (address owner);
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
    function isApprovedForAll(address _owner, address _operator) public view returns (bool _bool);
    mapping (uint256 => address) public chainFaceIndexToApproved;
}