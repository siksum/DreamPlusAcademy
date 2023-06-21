// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol

pragma solidity ^0.4.24;


/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * See https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.4.24;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

// File: openzeppelin-solidity/contracts/token/ERC20/BasicToken.sol

pragma solidity ^0.4.24;




/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

  /**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.4.24;



/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender)
    public view returns (uint256);

  function transferFrom(address from, address to, uint256 value)
    public returns (bool);

  function approve(address spender, uint256 value) public returns (bool);
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

// File: openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol

pragma solidity ^0.4.24;




/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/issues/20
 * Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

// File: openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol

pragma solidity ^0.4.24;



/**
 * @title DetailedERC20 token
 * @dev The decimals are only for visualization purposes.
 * All the operations are done using the smallest and indivisible token unit,
 * just as on Ethereum all the operations are done in wei.
 */
contract DetailedERC20 is ERC20 {
  string public name;
  string public symbol;
  uint8 public decimals;

  constructor(string _name, string _symbol, uint8 _decimals) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
  }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.4.24;


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}

// File: openzeppelin-solidity/contracts/introspection/ERC165.sol

pragma solidity ^0.4.24;


/**
 * @title ERC165
 * @dev https://github.com/ethereum/EIPs/blob/master/EIPS/eip-165.md
 */
interface ERC165 {

  /**
   * @notice Query if a contract implements an interface
   * @param _interfaceId The interface identifier, as specified in ERC-165
   * @dev Interface identification is specified in ERC-165. This function
   * uses less than 30,000 gas.
   */
  function supportsInterface(bytes4 _interfaceId)
    external
    view
    returns (bool);
}

// File: openzeppelin-solidity/contracts/token/ERC721/ERC721Basic.sol

pragma solidity ^0.4.24;



/**
 * @title ERC721 Non-Fungible Token Standard basic interface
 * @dev see https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Basic is ERC165 {
  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 indexed _tokenId
  );
  event Approval(
    address indexed _owner,
    address indexed _approved,
    uint256 indexed _tokenId
  );
  event ApprovalForAll(
    address indexed _owner,
    address indexed _operator,
    bool _approved
  );

  function balanceOf(address _owner) public view returns (uint256 _balance);
  function ownerOf(uint256 _tokenId) public view returns (address _owner);
  function exists(uint256 _tokenId) public view returns (bool _exists);

  function approve(address _to, uint256 _tokenId) public;
  function getApproved(uint256 _tokenId)
    public view returns (address _operator);

  function setApprovalForAll(address _operator, bool _approved) public;
  function isApprovedForAll(address _owner, address _operator)
    public view returns (bool);

  function transferFrom(address _from, address _to, uint256 _tokenId) public;
  function safeTransferFrom(address _from, address _to, uint256 _tokenId)
    public;

  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId,
    bytes _data
  )
    public;
}

// File: openzeppelin-solidity/contracts/token/ERC721/ERC721.sol

pragma solidity ^0.4.24;



/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Enumerable is ERC721Basic {
  function totalSupply() public view returns (uint256);
  function tokenOfOwnerByIndex(
    address _owner,
    uint256 _index
  )
    public
    view
    returns (uint256 _tokenId);

  function tokenByIndex(uint256 _index) public view returns (uint256);
}


/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Metadata is ERC721Basic {
  function name() external view returns (string _name);
  function symbol() external view returns (string _symbol);
  function tokenURI(uint256 _tokenId) public view returns (string);
}


/**
 * @title ERC-721 Non-Fungible Token Standard, full implementation interface
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721 is ERC721Basic, ERC721Enumerable, ERC721Metadata {
}

// File: openzeppelin-solidity/contracts/token/ERC721/ERC721Receiver.sol

pragma solidity ^0.4.24;


/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
contract ERC721Receiver {
  /**
   * @dev Magic value to be returned upon successful reception of an NFT
   *  Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`,
   *  which can be also obtained as `ERC721Receiver(0).onERC721Received.selector`
   */
  bytes4 internal constant ERC721_RECEIVED = 0x150b7a02;

  /**
   * @notice Handle the receipt of an NFT
   * @dev The ERC721 smart contract calls this function on the recipient
   * after a `safetransfer`. This function MAY throw to revert and reject the
   * transfer. Return of other than the magic value MUST result in the 
   * transaction being reverted.
   * Note: the contract address is always the message sender.
   * @param _operator The address which called `safeTransferFrom` function
   * @param _from The address which previously owned the token
   * @param _tokenId The NFT identifier which is being transfered
   * @param _data Additional data with no specified format
   * @return `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes _data
  )
    public
    returns(bytes4);
}

// File: openzeppelin-solidity/contracts/AddressUtils.sol

pragma solidity ^0.4.24;


/**
 * Utility library of inline functions on addresses
 */
library AddressUtils {

  /**
   * Returns whether the target address is a contract
   * @dev This function will return false if invoked during the constructor of a contract,
   * as the code is not actually created until after the constructor finishes.
   * @param addr address to check
   * @return whether the target address is a contract
   */
  function isContract(address addr) internal view returns (bool) {
    uint256 size;
    // XXX Currently there is no better way to check if there is a contract in an address
    // than to check the size of the code at that address.
    // See https://ethereum.stackexchange.com/a/14016/36603
    // for more details about how this works.
    // TODO Check this again before the Serenity release, because all addresses will be
    // contracts then.
    // solium-disable-next-line security/no-inline-assembly
    assembly { size := extcodesize(addr) }
    return size > 0;
  }

}

// File: openzeppelin-solidity/contracts/introspection/SupportsInterfaceWithLookup.sol

pragma solidity ^0.4.24;



/**
 * @title SupportsInterfaceWithLookup
 * @author Matt Condon (@shrugs)
 * @dev Implements ERC165 using a lookup table.
 */
contract SupportsInterfaceWithLookup is ERC165 {
  bytes4 public constant InterfaceId_ERC165 = 0x01ffc9a7;
  /**
   * 0x01ffc9a7 ===
   *   bytes4(keccak256('supportsInterface(bytes4)'))
   */

  /**
   * @dev a mapping of interface id to whether or not it's supported
   */
  mapping(bytes4 => bool) internal supportedInterfaces;

  /**
   * @dev A contract implementing SupportsInterfaceWithLookup
   * implement ERC165 itself
   */
  constructor()
    public
  {
    _registerInterface(InterfaceId_ERC165);
  }

  /**
   * @dev implement supportsInterface(bytes4) using a lookup table
   */
  function supportsInterface(bytes4 _interfaceId)
    external
    view
    returns (bool)
  {
    return supportedInterfaces[_interfaceId];
  }

  /**
   * @dev private method for registering an interface
   */
  function _registerInterface(bytes4 _interfaceId)
    internal
  {
    require(_interfaceId != 0xffffffff);
    supportedInterfaces[_interfaceId] = true;
  }
}

// File: openzeppelin-solidity/contracts/token/ERC721/ERC721BasicToken.sol

pragma solidity ^0.4.24;







/**
 * @title ERC721 Non-Fungible Token Standard basic implementation
 * @dev see https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721BasicToken is SupportsInterfaceWithLookup, ERC721Basic {

  bytes4 private constant InterfaceId_ERC721 = 0x80ac58cd;
  /*
   * 0x80ac58cd ===
   *   bytes4(keccak256('balanceOf(address)')) ^
   *   bytes4(keccak256('ownerOf(uint256)')) ^
   *   bytes4(keccak256('approve(address,uint256)')) ^
   *   bytes4(keccak256('getApproved(uint256)')) ^
   *   bytes4(keccak256('setApprovalForAll(address,bool)')) ^
   *   bytes4(keccak256('isApprovedForAll(address,address)')) ^
   *   bytes4(keccak256('transferFrom(address,address,uint256)')) ^
   *   bytes4(keccak256('safeTransferFrom(address,address,uint256)')) ^
   *   bytes4(keccak256('safeTransferFrom(address,address,uint256,bytes)'))
   */

  bytes4 private constant InterfaceId_ERC721Exists = 0x4f558e79;
  /*
   * 0x4f558e79 ===
   *   bytes4(keccak256('exists(uint256)'))
   */

  using SafeMath for uint256;
  using AddressUtils for address;

  // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
  // which can be also obtained as `ERC721Receiver(0).onERC721Received.selector`
  bytes4 private constant ERC721_RECEIVED = 0x150b7a02;

  // Mapping from token ID to owner
  mapping (uint256 => address) internal tokenOwner;

  // Mapping from token ID to approved address
  mapping (uint256 => address) internal tokenApprovals;

  // Mapping from owner to number of owned token
  mapping (address => uint256) internal ownedTokensCount;

  // Mapping from owner to operator approvals
  mapping (address => mapping (address => bool)) internal operatorApprovals;

  /**
   * @dev Guarantees msg.sender is owner of the given token
   * @param _tokenId uint256 ID of the token to validate its ownership belongs to msg.sender
   */
  modifier onlyOwnerOf(uint256 _tokenId) {
    require(ownerOf(_tokenId) == msg.sender);
    _;
  }

  /**
   * @dev Checks msg.sender can transfer a token, by being owner, approved, or operator
   * @param _tokenId uint256 ID of the token to validate
   */
  modifier canTransfer(uint256 _tokenId) {
    require(isApprovedOrOwner(msg.sender, _tokenId));
    _;
  }

  constructor()
    public
  {
    // register the supported interfaces to conform to ERC721 via ERC165
    _registerInterface(InterfaceId_ERC721);
    _registerInterface(InterfaceId_ERC721Exists);
  }

  /**
   * @dev Gets the balance of the specified address
   * @param _owner address to query the balance of
   * @return uint256 representing the amount owned by the passed address
   */
  function balanceOf(address _owner) public view returns (uint256) {
    require(_owner != address(0));
    return ownedTokensCount[_owner];
  }

  /**
   * @dev Gets the owner of the specified token ID
   * @param _tokenId uint256 ID of the token to query the owner of
   * @return owner address currently marked as the owner of the given token ID
   */
  function ownerOf(uint256 _tokenId) public view returns (address) {
    address owner = tokenOwner[_tokenId];
    require(owner != address(0));
    return owner;
  }

  /**
   * @dev Returns whether the specified token exists
   * @param _tokenId uint256 ID of the token to query the existence of
   * @return whether the token exists
   */
  function exists(uint256 _tokenId) public view returns (bool) {
    address owner = tokenOwner[_tokenId];
    return owner != address(0);
  }

  /**
   * @dev Approves another address to transfer the given token ID
   * The zero address indicates there is no approved address.
   * There can only be one approved address per token at a given time.
   * Can only be called by the token owner or an approved operator.
   * @param _to address to be approved for the given token ID
   * @param _tokenId uint256 ID of the token to be approved
   */
  function approve(address _to, uint256 _tokenId) public {
    address owner = ownerOf(_tokenId);
    require(_to != owner);
    require(msg.sender == owner || isApprovedForAll(owner, msg.sender));

    tokenApprovals[_tokenId] = _to;
    emit Approval(owner, _to, _tokenId);
  }

  /**
   * @dev Gets the approved address for a token ID, or zero if no address set
   * @param _tokenId uint256 ID of the token to query the approval of
   * @return address currently approved for the given token ID
   */
  function getApproved(uint256 _tokenId) public view returns (address) {
    return tokenApprovals[_tokenId];
  }

  /**
   * @dev Sets or unsets the approval of a given operator
   * An operator is allowed to transfer all tokens of the sender on their behalf
   * @param _to operator address to set the approval
   * @param _approved representing the status of the approval to be set
   */
  function setApprovalForAll(address _to, bool _approved) public {
    require(_to != msg.sender);
    operatorApprovals[msg.sender][_to] = _approved;
    emit ApprovalForAll(msg.sender, _to, _approved);
  }

  /**
   * @dev Tells whether an operator is approved by a given owner
   * @param _owner owner address which you want to query the approval of
   * @param _operator operator address which you want to query the approval of
   * @return bool whether the given operator is approved by the given owner
   */
  function isApprovedForAll(
    address _owner,
    address _operator
  )
    public
    view
    returns (bool)
  {
    return operatorApprovals[_owner][_operator];
  }

  /**
   * @dev Transfers the ownership of a given token ID to another address
   * Usage of this method is discouraged, use `safeTransferFrom` whenever possible
   * Requires the msg sender to be the owner, approved, or operator
   * @param _from current owner of the token
   * @param _to address to receive the ownership of the given token ID
   * @param _tokenId uint256 ID of the token to be transferred
  */
  function transferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    public
    canTransfer(_tokenId)
  {
    require(_from != address(0));
    require(_to != address(0));

    clearApproval(_from, _tokenId);
    removeTokenFrom(_from, _tokenId);
    addTokenTo(_to, _tokenId);

    emit Transfer(_from, _to, _tokenId);
  }

  /**
   * @dev Safely transfers the ownership of a given token ID to another address
   * If the target address is a contract, it must implement `onERC721Received`,
   * which is called upon a safe transfer, and return the magic value
   * `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
   * the transfer is reverted.
   *
   * Requires the msg sender to be the owner, approved, or operator
   * @param _from current owner of the token
   * @param _to address to receive the ownership of the given token ID
   * @param _tokenId uint256 ID of the token to be transferred
  */
  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    public
    canTransfer(_tokenId)
  {
    // solium-disable-next-line arg-overflow
    safeTransferFrom(_from, _to, _tokenId, "");
  }

  /**
   * @dev Safely transfers the ownership of a given token ID to another address
   * If the target address is a contract, it must implement `onERC721Received`,
   * which is called upon a safe transfer, and return the magic value
   * `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
   * the transfer is reverted.
   * Requires the msg sender to be the owner, approved, or operator
   * @param _from current owner of the token
   * @param _to address to receive the ownership of the given token ID
   * @param _tokenId uint256 ID of the token to be transferred
   * @param _data bytes data to send along with a safe transfer check
   */
  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId,
    bytes _data
  )
    public
    canTransfer(_tokenId)
  {
    transferFrom(_from, _to, _tokenId);
    // solium-disable-next-line arg-overflow
    require(checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
  }

  /**
   * @dev Returns whether the given spender can transfer a given token ID
   * @param _spender address of the spender to query
   * @param _tokenId uint256 ID of the token to be transferred
   * @return bool whether the msg.sender is approved for the given token ID,
   *  is an operator of the owner, or is the owner of the token
   */
  function isApprovedOrOwner(
    address _spender,
    uint256 _tokenId
  )
    internal
    view
    returns (bool)
  {
    address owner = ownerOf(_tokenId);
    // Disable solium check because of
    // https://github.com/duaraghav8/Solium/issues/175
    // solium-disable-next-line operator-whitespace
    return (
      _spender == owner ||
      getApproved(_tokenId) == _spender ||
      isApprovedForAll(owner, _spender)
    );
  }

  /**
   * @dev Internal function to mint a new token
   * Reverts if the given token ID already exists
   * @param _to The address that will own the minted token
   * @param _tokenId uint256 ID of the token to be minted by the msg.sender
   */
  function _mint(address _to, uint256 _tokenId) internal {
    require(_to != address(0));
    addTokenTo(_to, _tokenId);
    emit Transfer(address(0), _to, _tokenId);
  }

  /**
   * @dev Internal function to burn a specific token
   * Reverts if the token does not exist
   * @param _tokenId uint256 ID of the token being burned by the msg.sender
   */
  function _burn(address _owner, uint256 _tokenId) internal {
    clearApproval(_owner, _tokenId);
    removeTokenFrom(_owner, _tokenId);
    emit Transfer(_owner, address(0), _tokenId);
  }

  /**
   * @dev Internal function to clear current approval of a given token ID
   * Reverts if the given address is not indeed the owner of the token
   * @param _owner owner of the token
   * @param _tokenId uint256 ID of the token to be transferred
   */
  function clearApproval(address _owner, uint256 _tokenId) internal {
    require(ownerOf(_tokenId) == _owner);
    if (tokenApprovals[_tokenId] != address(0)) {
      tokenApprovals[_tokenId] = address(0);
    }
  }

  /**
   * @dev Internal function to add a token ID to the list of a given address
   * @param _to address representing the new owner of the given token ID
   * @param _tokenId uint256 ID of the token to be added to the tokens list of the given address
   */
  function addTokenTo(address _to, uint256 _tokenId) internal {
    require(tokenOwner[_tokenId] == address(0));
    tokenOwner[_tokenId] = _to;
    ownedTokensCount[_to] = ownedTokensCount[_to].add(1);
  }

  /**
   * @dev Internal function to remove a token ID from the list of a given address
   * @param _from address representing the previous owner of the given token ID
   * @param _tokenId uint256 ID of the token to be removed from the tokens list of the given address
   */
  function removeTokenFrom(address _from, uint256 _tokenId) internal {
    require(ownerOf(_tokenId) == _from);
    ownedTokensCount[_from] = ownedTokensCount[_from].sub(1);
    tokenOwner[_tokenId] = address(0);
  }

  /**
   * @dev Internal function to invoke `onERC721Received` on a target address
   * The call is not executed if the target address is not a contract
   * @param _from address representing the previous owner of the given token ID
   * @param _to target address that will receive the tokens
   * @param _tokenId uint256 ID of the token to be transferred
   * @param _data bytes optional data to send along with the call
   * @return whether the call correctly returned the expected magic value
   */
  function checkAndCallSafeTransfer(
    address _from,
    address _to,
    uint256 _tokenId,
    bytes _data
  )
    internal
    returns (bool)
  {
    if (!_to.isContract()) {
      return true;
    }
    bytes4 retval = ERC721Receiver(_to).onERC721Received(
      msg.sender, _from, _tokenId, _data);
    return (retval == ERC721_RECEIVED);
  }
}

// File: openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol

pragma solidity ^0.4.24;





/**
 * @title Full ERC721 Token
 * This implementation includes all the required and some optional functionality of the ERC721 standard
 * Moreover, it includes approve all functionality using operator terminology
 * @dev see https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Token is SupportsInterfaceWithLookup, ERC721BasicToken, ERC721 {

  bytes4 private constant InterfaceId_ERC721Enumerable = 0x780e9d63;
  /**
   * 0x780e9d63 ===
   *   bytes4(keccak256('totalSupply()')) ^
   *   bytes4(keccak256('tokenOfOwnerByIndex(address,uint256)')) ^
   *   bytes4(keccak256('tokenByIndex(uint256)'))
   */

  bytes4 private constant InterfaceId_ERC721Metadata = 0x5b5e139f;
  /**
   * 0x5b5e139f ===
   *   bytes4(keccak256('name()')) ^
   *   bytes4(keccak256('symbol()')) ^
   *   bytes4(keccak256('tokenURI(uint256)'))
   */

  // Token name
  string internal name_;

  // Token symbol
  string internal symbol_;

  // Mapping from owner to list of owned token IDs
  mapping(address => uint256[]) internal ownedTokens;

  // Mapping from token ID to index of the owner tokens list
  mapping(uint256 => uint256) internal ownedTokensIndex;

  // Array with all token ids, used for enumeration
  uint256[] internal allTokens;

  // Mapping from token id to position in the allTokens array
  mapping(uint256 => uint256) internal allTokensIndex;

  // Optional mapping for token URIs
  mapping(uint256 => string) internal tokenURIs;

  /**
   * @dev Constructor function
   */
  constructor(string _name, string _symbol) public {
    name_ = _name;
    symbol_ = _symbol;

    // register the supported interfaces to conform to ERC721 via ERC165
    _registerInterface(InterfaceId_ERC721Enumerable);
    _registerInterface(InterfaceId_ERC721Metadata);
  }

  /**
   * @dev Gets the token name
   * @return string representing the token name
   */
  function name() external view returns (string) {
    return name_;
  }

  /**
   * @dev Gets the token symbol
   * @return string representing the token symbol
   */
  function symbol() external view returns (string) {
    return symbol_;
  }

  /**
   * @dev Returns an URI for a given token ID
   * Throws if the token ID does not exist. May return an empty string.
   * @param _tokenId uint256 ID of the token to query
   */
  function tokenURI(uint256 _tokenId) public view returns (string) {
    require(exists(_tokenId));
    return tokenURIs[_tokenId];
  }

  /**
   * @dev Gets the token ID at a given index of the tokens list of the requested owner
   * @param _owner address owning the tokens list to be accessed
   * @param _index uint256 representing the index to be accessed of the requested tokens list
   * @return uint256 token ID at the given index of the tokens list owned by the requested address
   */
  function tokenOfOwnerByIndex(
    address _owner,
    uint256 _index
  )
    public
    view
    returns (uint256)
  {
    require(_index < balanceOf(_owner));
    return ownedTokens[_owner][_index];
  }

  /**
   * @dev Gets the total amount of tokens stored by the contract
   * @return uint256 representing the total amount of tokens
   */
  function totalSupply() public view returns (uint256) {
    return allTokens.length;
  }

  /**
   * @dev Gets the token ID at a given index of all the tokens in this contract
   * Reverts if the index is greater or equal to the total number of tokens
   * @param _index uint256 representing the index to be accessed of the tokens list
   * @return uint256 token ID at the given index of the tokens list
   */
  function tokenByIndex(uint256 _index) public view returns (uint256) {
    require(_index < totalSupply());
    return allTokens[_index];
  }

  /**
   * @dev Internal function to set the token URI for a given token
   * Reverts if the token ID does not exist
   * @param _tokenId uint256 ID of the token to set its URI
   * @param _uri string URI to assign
   */
  function _setTokenURI(uint256 _tokenId, string _uri) internal {
    require(exists(_tokenId));
    tokenURIs[_tokenId] = _uri;
  }

  /**
   * @dev Internal function to add a token ID to the list of a given address
   * @param _to address representing the new owner of the given token ID
   * @param _tokenId uint256 ID of the token to be added to the tokens list of the given address
   */
  function addTokenTo(address _to, uint256 _tokenId) internal {
    super.addTokenTo(_to, _tokenId);
    uint256 length = ownedTokens[_to].length;
    ownedTokens[_to].push(_tokenId);
    ownedTokensIndex[_tokenId] = length;
  }

  /**
   * @dev Internal function to remove a token ID from the list of a given address
   * @param _from address representing the previous owner of the given token ID
   * @param _tokenId uint256 ID of the token to be removed from the tokens list of the given address
   */
  function removeTokenFrom(address _from, uint256 _tokenId) internal {
    super.removeTokenFrom(_from, _tokenId);

    uint256 tokenIndex = ownedTokensIndex[_tokenId];
    uint256 lastTokenIndex = ownedTokens[_from].length.sub(1);
    uint256 lastToken = ownedTokens[_from][lastTokenIndex];

    ownedTokens[_from][tokenIndex] = lastToken;
    ownedTokens[_from][lastTokenIndex] = 0;
    // Note that this will handle single-element arrays. In that case, both tokenIndex and lastTokenIndex are going to
    // be zero. Then we can make sure that we will remove _tokenId from the ownedTokens list since we are first swapping
    // the lastToken to the first position, and then dropping the element placed in the last position of the list

    ownedTokens[_from].length--;
    ownedTokensIndex[_tokenId] = 0;
    ownedTokensIndex[lastToken] = tokenIndex;
  }

  /**
   * @dev Internal function to mint a new token
   * Reverts if the given token ID already exists
   * @param _to address the beneficiary that will own the minted token
   * @param _tokenId uint256 ID of the token to be minted by the msg.sender
   */
  function _mint(address _to, uint256 _tokenId) internal {
    super._mint(_to, _tokenId);

    allTokensIndex[_tokenId] = allTokens.length;
    allTokens.push(_tokenId);
  }

  /**
   * @dev Internal function to burn a specific token
   * Reverts if the token does not exist
   * @param _owner owner of the token to burn
   * @param _tokenId uint256 ID of the token being burned by the msg.sender
   */
  function _burn(address _owner, uint256 _tokenId) internal {
    super._burn(_owner, _tokenId);

    // Clear metadata (if any)
    if (bytes(tokenURIs[_tokenId]).length != 0) {
      delete tokenURIs[_tokenId];
    }

    // Reorg all tokens array
    uint256 tokenIndex = allTokensIndex[_tokenId];
    uint256 lastTokenIndex = allTokens.length.sub(1);
    uint256 lastToken = allTokens[lastTokenIndex];

    allTokens[tokenIndex] = lastToken;
    allTokens[lastTokenIndex] = 0;

    allTokens.length--;
    allTokensIndex[_tokenId] = 0;
    allTokensIndex[lastToken] = tokenIndex;
  }

}

// File: contracts/LeasedEmblem.sol

pragma solidity ^0.4.24;



contract LeasedEmblem is  ERC721Token, Ownable {


  address internal leaseExchange;


  struct Metadata {
    uint256 amount;
    address leasor;
    uint256 duration;
    uint256 tradeExpiry;
    uint256 leaseExpiry;
    bool isMining;
  }


  mapping(uint256 => Metadata) public metadata;


  mapping(address => uint256[]) internal leasedTokens;


  mapping(uint256 => uint256) internal leasedTokensIndex;


  mapping (uint256 => address) internal tokenLeasor;


  mapping (address => uint256) internal leasedTokensCount;

  uint256 highestId = 1;

  uint256 sixMonths       = 15768000;

  constructor (string _name, string _symbol) public ERC721Token(_name, _symbol) {
  }



  function getNewId() public view returns(uint256) {
    return highestId;
  }

  function leasorOf(uint256 _tokenId) public view returns (address) {
    address owner = tokenLeasor[_tokenId];
    require(owner != address(0));
    return owner;
  }

  function balanceOfLeasor(address _leasor) public view returns (uint256) {
    require(_leasor != address(0));
    return leasedTokensCount[_leasor];
  }

  function tokenOfLeasorByIndex(address _leasor,uint256 _index) public view returns (uint256){
    require(_index < balanceOfLeasor(_leasor));
    return leasedTokens[_leasor][_index];
  }

  function addTokenToLeasor(address _to, uint256 _tokenId) internal {
    require(tokenLeasor[_tokenId] == address(0));
    tokenLeasor[_tokenId] = _to;
    leasedTokensCount[_to] = leasedTokensCount[_to].add(1);
    uint256 length = leasedTokens[_to].length;
    leasedTokens[_to].push(_tokenId);
    leasedTokensIndex[_tokenId] = length;
  }

  function removeTokenFromLeasor(address _from, uint256 _tokenId) internal {
    require(leasorOf(_tokenId) == _from);
    leasedTokensCount[_from] = leasedTokensCount[_from].sub(1);
    tokenLeasor[_tokenId] = address(0);

    uint256 tokenIndex = leasedTokensIndex[_tokenId];
    uint256 lastTokenIndex = leasedTokens[_from].length.sub(1);
    uint256 lastToken = leasedTokens[_from][lastTokenIndex];

    leasedTokens[_from][tokenIndex] = lastToken;
    leasedTokens[_from][lastTokenIndex] = 0;
    leasedTokens[_from].length--;
    leasedTokensIndex[_tokenId] = 0;
    leasedTokensIndex[lastToken] = tokenIndex;
  }

  function setLeaseExchange(address _leaseExchange) public onlyOwner {
    leaseExchange = _leaseExchange;
  }

  function totalAmount() external view returns (uint256) {
    uint256 amount = 0;
    for(uint256 i = 0; i < allTokens.length; i++){
      amount += metadata[allTokens[i]].amount;
    }
    return amount;
  }

  function setMetadata(uint256 _tokenId, uint256 amount, address leasor, uint256 duration,uint256 tradeExpiry, uint256 leaseExpiry) internal {
    require(exists(_tokenId));
    metadata[_tokenId]= Metadata(amount,leasor,duration,tradeExpiry,leaseExpiry,false);
  }

  function getMetadata(uint256 _tokenId) public view returns (uint256, address, uint256, uint256,uint256, bool) {
    require(exists(_tokenId));
    return (
      metadata[_tokenId].amount,
      metadata[_tokenId].leasor,
      metadata[_tokenId].duration,
      metadata[_tokenId].tradeExpiry,
      metadata[_tokenId].leaseExpiry,
      metadata[_tokenId].isMining
    );
  }

  function getAmountForUser(address owner) external view returns (uint256) {
    uint256 amount = 0;
    uint256 numTokens = balanceOf(owner);

    for(uint256 i = 0; i < numTokens; i++){
      amount += metadata[tokenOfOwnerByIndex(owner,i)].amount;
    }
    return amount;
  }

  function getAmountForUserMining(address owner) external view returns (uint256) {
    uint256 amount = 0;
    uint256 numTokens = balanceOf(owner);

    for(uint256 i = 0; i < numTokens; i++){
      if(metadata[tokenOfOwnerByIndex(owner,i)].isMining) {
        amount += metadata[tokenOfOwnerByIndex(owner,i)].amount;
      }
    }
    return amount;
  }

  function getAmount(uint256 _tokenId) public view returns (uint256) {
    require(exists(_tokenId));
    return metadata[_tokenId].amount;
  }

  function getTradeExpiry(uint256 _tokenId) public view returns (uint256) {
    require(exists(_tokenId));
    return metadata[_tokenId].tradeExpiry;
  }

  function getDuration(uint256 _tokenId) public view returns (uint256) {
    require(exists(_tokenId));
    return metadata[_tokenId].duration;
  }

  function getIsMining(uint256 _tokenId) public view returns (bool) {
    require(exists(_tokenId));
    return metadata[_tokenId].isMining;
  }

  function startMining(address _owner, uint256 _tokenId) public returns (bool) {
    require(msg.sender == leaseExchange);
    require(exists(_tokenId));
    require(ownerOf(_tokenId) == _owner);
    require(now < metadata[_tokenId].tradeExpiry);
    require(metadata[_tokenId].isMining == false);
    Metadata storage m = metadata[_tokenId];
    m.isMining = true;
    m.leaseExpiry = now + m.duration;
    return true;
  }

  function canRetrieveEMB(address _leasor, uint256 _tokenId) public view returns (bool) {
    require(exists(_tokenId));
    require(metadata[_tokenId].leasor == _leasor);
    if(metadata[_tokenId].isMining == false) {
      return(now > metadata[_tokenId].leaseExpiry);
    }
    else {
      return(now > metadata[_tokenId].tradeExpiry);
    }
  }

  function endLease(address _leasee, uint256 _tokenId) public {
    require(msg.sender == leaseExchange);
    require(exists(_tokenId));
    require(ownerOf(_tokenId) == _leasee);
    require(now > metadata[_tokenId].leaseExpiry);
    removeTokenFromLeasor(metadata[_tokenId].leasor, _tokenId);
    _burn(_leasee, _tokenId);
  }

  function splitLEMB(uint256 _tokenId, uint256 amount) public {
    require(exists(_tokenId));
    require(ownerOf(_tokenId) == msg.sender);
    require(metadata[_tokenId].isMining == false);
    require(now < metadata[_tokenId].tradeExpiry);
    require(amount < getAmount(_tokenId));

    uint256 _newTokenId = getNewId();

    Metadata storage m = metadata[_tokenId];
    m.amount = m.amount - amount;

    _mint(msg.sender, _newTokenId);
    addTokenToLeasor(m.leasor, _newTokenId);
    setMetadata(_newTokenId, amount, m.leasor, m.duration,m.tradeExpiry, 0);
    highestId = highestId + 1;
  }

  function mintUniqueTokenTo(address _to, uint256 amount, address leasor, uint256 duration) public {
    require(msg.sender == leaseExchange);
    uint256 _tokenId = getNewId();
    _mint(_to, _tokenId);
    addTokenToLeasor(leasor, _tokenId);
    uint256 tradeExpiry = now + sixMonths;
    setMetadata(_tokenId, amount, leasor, duration,tradeExpiry, 0);
    highestId = highestId + 1;
  }

  function _burn(address _owner, uint256 _tokenId) internal {
    super._burn(_owner, _tokenId);
    delete metadata[_tokenId];
  }

  modifier canTransfer(uint256 _tokenId) {
    require(isApprovedOrOwner(msg.sender, _tokenId));
    require(metadata[_tokenId].isMining == false);
    _;
  }

}

// File: contracts/Emblem.sol

pragma solidity ^0.4.24;






contract Emblem is DetailedERC20, StandardToken, Ownable {
  using SafeMath for uint256;

   mapping (bytes12 => address) public vanityAddresses;
   mapping (address => bytes12[]) public ownedVanities;
   mapping (address => mapping(bytes12 => uint256)) public ownedVanitiesIndex;
   mapping (bytes12 => uint256) allVanitiesIndex;
   bytes12[] public allVanities;
   mapping (address => mapping (bytes12 => address)) internal allowedVanities;

   mapping (bytes12 => uint256) vanityFees;
   mapping (bytes12 => bool) vanityFeeEnabled;

   bool internal useVanityFees = true;
   uint256 internal vanityPurchaseCost = 100 * (10 ** 8);

   mapping (address => bool) public frozenAccounts;
   bool public completeFreeze = false;

   mapping (address => bool) internal freezable;
   mapping (address => bool) internal externalFreezers;

   address leaseExchange;
   LeasedEmblem LEMB;

   event TransferVanity(address from, address to, bytes12 vanity);
   event ApprovedVanity(address from, address to, bytes12 vanity);
   event VanityPurchased(address from, bytes12 vanity);

   constructor(string _name, string _ticker, uint8 _decimal, uint256 _supply, address _wallet, address _lemb) DetailedERC20(_name, _ticker, _decimal) public {
     totalSupply_ = _supply;
     balances[_wallet] = _supply;
     LEMB = LeasedEmblem(_lemb);
   }

   function setLeaseExchange(address _leaseExchange) public onlyOwner {
     leaseExchange = _leaseExchange;
   }

   function setVanityPurchaseCost(uint256 cost) public onlyOwner {
     vanityPurchaseCost = cost;
   }

   function enableFees(bool enabled) public onlyOwner {
     useVanityFees = enabled;
   }

   function setLEMB(address _lemb) public onlyOwner {
     LEMB = LeasedEmblem(_lemb);
   }

   function setVanityFee(bytes12 vanity, uint256 fee) public onlyOwner {
     require(fee >= 0);
     vanityFees[vanity] = fee;
   }

   function getFee(bytes12 vanity) public view returns(uint256) {
     return vanityFees[vanity];
   }

   function enabledVanityFee(bytes12 vanity) public view returns(bool) {
     return vanityFeeEnabled[vanity] && useVanityFees;
   }

   function setTicker(string _ticker) public onlyOwner {
     symbol = _ticker;
   }

   function approveOwner(uint256 _value) public onlyOwner returns (bool) {
     allowed[msg.sender][address(this)] = _value;
     return true;
   }

   function vanityAllowance(address _owner, bytes12 _vanity, address _spender) public view returns (bool) {
     return allowedVanities[_owner][_vanity] == _spender;
   }

   function getVanityOwner(bytes12 _vanity) public view returns (address) {
     return vanityAddresses[_vanity];
   }

   function getAllVanities() public view returns (bytes12[]){
     return allVanities;
   }

   function getMyVanities() public view returns (bytes12[]){
     return ownedVanities[msg.sender];
   }

   function approveVanity(address _spender, bytes12 _vanity) public returns (bool) {
     require(vanityAddresses[_vanity] == msg.sender);
     allowedVanities[msg.sender][_vanity] = _spender;

     emit ApprovedVanity(msg.sender, _spender, _vanity);
     return true;
   }

   function clearVanityApproval(bytes12 _vanity) public returns (bool){
     require(vanityAddresses[_vanity] == msg.sender);
     delete allowedVanities[msg.sender][_vanity];
     return true;
   }

   function transferVanity(bytes12 van, address newOwner) public returns (bool) {
     require(newOwner != 0x0);
     require(vanityAddresses[van] == msg.sender);

     vanityAddresses[van] = newOwner;
     ownedVanities[newOwner].push(van);
     ownedVanitiesIndex[newOwner][van] = ownedVanities[newOwner].length.sub(1);

     uint256 vanityIndex = ownedVanitiesIndex[msg.sender][van];
     uint256 lastVanityIndex = ownedVanities[msg.sender].length.sub(1);
     bytes12 lastVanity = ownedVanities[msg.sender][lastVanityIndex];

     ownedVanities[msg.sender][vanityIndex] = lastVanity;
     ownedVanities[msg.sender][lastVanityIndex] = "";
     ownedVanities[msg.sender].length--;

     ownedVanitiesIndex[msg.sender][van] = 0;
     ownedVanitiesIndex[msg.sender][lastVanity] = vanityIndex;

     emit TransferVanity(msg.sender, newOwner,van);

     return true;
   }

   function transferVanityFrom(
     address _from,
     address _to,
     bytes12 _vanity
   )
     public
     returns (bool)
   {
     require(_to != address(0));
     require(_from == vanityAddresses[_vanity]);
     require(msg.sender == allowedVanities[_from][_vanity]);

     vanityAddresses[_vanity] = _to;
     ownedVanities[_to].push(_vanity);
     ownedVanitiesIndex[_to][_vanity] = ownedVanities[_to].length.sub(1);

     uint256 vanityIndex = ownedVanitiesIndex[_from][_vanity];
     uint256 lastVanityIndex = ownedVanities[_from].length.sub(1);
     bytes12 lastVanity = ownedVanities[_from][lastVanityIndex];

     ownedVanities[_from][vanityIndex] = lastVanity;
     ownedVanities[_from][lastVanityIndex] = "";
     ownedVanities[_from].length--;

     ownedVanitiesIndex[_from][_vanity] = 0;
     ownedVanitiesIndex[_from][lastVanity] = vanityIndex;

     emit TransferVanity(msg.sender, _to,_vanity);

     return true;
   }

   function purchaseVanity(bytes12 van) public returns (bool) {
     require(vanityAddresses[van] == address(0));

     for(uint8 i = 0; i < 12; i++){
       require((van[i] >= 48 && van[i] <= 57) || (van[i] >= 65 && van[i] <= 90));
     }

     require(canTransfer(msg.sender,vanityPurchaseCost));

     balances[msg.sender] = balances[msg.sender].sub(vanityPurchaseCost);
     balances[address(this)] = balances[address(this)].add(vanityPurchaseCost);
     emit Transfer(msg.sender, address(this), vanityPurchaseCost);

     vanityAddresses[van] = msg.sender;
     ownedVanities[msg.sender].push(van);
     ownedVanitiesIndex[msg.sender][van] = ownedVanities[msg.sender].length.sub(1);
     allVanities.push(van);
     allVanitiesIndex[van] = allVanities.length.sub(1);

     emit VanityPurchased(msg.sender, van);
   }

   function freezeTransfers(bool _freeze) public onlyOwner {
     completeFreeze = _freeze;
   }

   function freezeAccount(address _target, bool _freeze) public onlyOwner {
     frozenAccounts[_target] = _freeze;
   }

   function canTransfer(address _account,uint256 _value) internal view returns (bool) {
      return (!frozenAccounts[_account] && !completeFreeze && (_value + LEMB.getAmountForUserMining(_account) <= balances[_account]));
   }

   function transfer(address _to, uint256 _value) public returns (bool){
      require(canTransfer(msg.sender,_value));
      super.transfer(_to,_value);
   }


   function multiTransfer(bytes32[] _addressesAndAmounts) public {
      for (uint i = 0; i < _addressesAndAmounts.length; i++) {
          address to = address(_addressesAndAmounts[i] >> 96);
          uint amount = uint(uint56(_addressesAndAmounts[i]));
          transfer(to, amount);
      }
   }

   function freezeMe(bool freeze) public {
     require(!frozenAccounts[msg.sender]);
     freezable[msg.sender] = freeze;
   }

   function canFreeze(address _target) public view returns(bool){
     return freezable[_target];
   }

   function isFrozen(address _target) public view returns(bool) {
     return completeFreeze || frozenAccounts[_target];
   }

   function externalFreezeAccount(address _target, bool _freeze) public {
     require(freezable[_target]);
     require(externalFreezers[msg.sender]);
     frozenAccounts[_target] = _freeze;
   }

   function setExternalFreezer(address _target, bool _canFreeze) public onlyOwner {
     externalFreezers[_target] = _canFreeze;
   }


   function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
      require(!completeFreeze);
      if(msg.sender != leaseExchange) require(canTransfer(_from,_value));
      super.transferFrom(_from,_to,_value);
   }

   function decreaseApproval(address _spender,uint256 _subtractedValue) public returns (bool) {


     if(_spender == leaseExchange) {
       require(allowed[msg.sender][_spender].sub(_subtractedValue) >= LEMB.getAmountForUserMining(msg.sender));
     }
     super.decreaseApproval(_spender,_subtractedValue);
   }

   function approve(address _spender, uint256 _value) public returns (bool) {


     if(_spender == leaseExchange){
       require(_value >= LEMB.getAmountForUserMining(msg.sender));
     }

     allowed[msg.sender][_spender] = _value;
     emit Approval(msg.sender, _spender, _value);
     return true;
   }

}