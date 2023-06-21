/**
 *Submitted for verification at Etherscan.io on 2019-12-18
*/

pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract Token {
    
    /
    uint256 public totalSupply;

    /
    /
    function balanceOf(address _owner) view public returns (uint256 balance);

    /
    /
    /
    /
    function transfer(address _to, uint256 _value) public returns (bool success);

    /
    /
    /
    /
    /
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

    /
    /
    /
    /
    function approve(address _spender, uint256 _value) public returns (bool success);

    /
    /
    /
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);

    event Transfer(address _from, address _to, uint256 _value);
    event Approval(address _owner, address _spender, uint256 _value);
}

contract ERC20Token is Token {

    function transfer(address _to, uint256 _value) public returns (bool success) {
        
        
        
        
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
        
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) view public returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) view public returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    
    
    
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
    
    
    
    
    
    
    
    assembly { size := extcodesize(addr) }
    return size > 0;
  }

}

/**
 * @title ERC165
 * @dev https:
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

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
contract ERC721Receiver {
  /**
   * @dev Magic value to be returned upon successful reception of an NFT
   *  Equals to `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`,
   *  which can be also obtained as `ERC721Receiver(0).onERC721Received.selector`
   */
  bytes4 internal constant ERC721_RECEIVED = 0xf0b9e5ba;

  /**
   * @notice Handle the receipt of an NFT
   * @dev The ERC721 smart contract calls this function on the recipient
   * after a `safetransfer`. This function MAY throw to revert and reject the
   * transfer. This function MUST use 50,000 gas or less. Return of other
   * than the magic value MUST result in the transaction being reverted.
   * Note: the contract address is always the message sender.
   * @param _from The sending address
   * @param _tokenId The NFT identifier which is being transfered
   * @param _data Additional data with no specified format
   * @return `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`
   */
  function onERC721Received(
    address _from,
    uint256 _tokenId,
    bytes memory _data
  )
    public
    returns(bytes4);
}

/**
 * @title ERC721 Non-Fungible Token Standard basic interface
 * @dev see https:
 */
contract ERC721Basic is ERC165 {
  event Transfer(
    address  _from,
    address  _to,
    uint256  _tokenId
  );
  event Approval(
    address  _owner,
    address  _approved,
    uint256  _tokenId
  );
  event ApprovalForAll(
    address  _owner,
    address  _operator,
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
    bytes memory _data
  )
    public;
}

/**
 * @title ERC721 Non-Fungible Token Standard basic implementation
 * @dev see https:
 */
contract ERC721BasicToken is SupportsInterfaceWithLookup, ERC721Basic {

  bytes4 private constant InterfaceId_ERC721 = 0x80ac58cd;
  0x80ac58cd ===
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
  0x4f558e79 ===
   *   bytes4(keccak256('exists(uint256)'))
   */

  using SafeMath for uint256;
  using AddressUtils for address;

  
  
  bytes4 private constant ERC721_RECEIVED = 0xf0b9e5ba;

  
  mapping (uint256 => address) internal tokenOwner;

  
  mapping (uint256 => address) internal tokenApprovals;

  
  mapping (address => uint256) internal ownedTokensCount;

  
  mapping (address => mapping (address => bool)) internal operatorApprovals;


  uint public testint;
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
   * `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`; otherwise,
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
    
    safeTransferFrom(_from, _to, _tokenId, "");
  }

  /**
   * @dev Safely transfers the ownership of a given token ID to another address
   * If the target address is a contract, it must implement `onERC721Received`,
   * which is called upon a safe transfer, and return the magic value
   * `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`; otherwise,
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
    bytes memory _data
  )
    public
    canTransfer(_tokenId)
  {
    transferFrom(_from, _to, _tokenId);
    
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
    bytes memory _data
  )
    internal
    returns (bool)
  {
    if (!_to.isContract()) {
      return true;
    }
    bytes4 retval = ERC721Receiver(_to).onERC721Received(
      _from, _tokenId, _data);
    return (retval == ERC721_RECEIVED);
  }
}

contract ERC721BasicTokenMock is ERC721BasicToken {
  function mint(address _to, uint256 _tokenId) public {
    super._mint(_to, _tokenId);
  }

  function burn(uint256 _tokenId) public {
    super._burn(ownerOf(_tokenId), _tokenId);
  }
}

contract StandardBounties {

  using SafeMath for uint256;

  Structs
   */

  struct Bounty {
    address payable[] issuers; 
    address[] approvers; 
    uint deadline; 
    address token; 
    uint tokenVersion; 
    uint balance; 
    bool hasPaidOut; 
    Fulfillment[] fulfillments; 
    Contribution[] contributions; 
  }

  struct Fulfillment {
    address payable[] fulfillers; 
    address submitter; 
  }

  struct Contribution {
    address payable contributor; 
    uint amount; 
    bool refunded; 
  }

  Storage
   */

  uint public numBounties; 
  mapping(uint => Bounty) public bounties; 
  mapping (uint => mapping (uint => bool)) public tokenBalances; 


  address public owner; 
  address public metaTxRelayer; 

  bool public callStarted; 

  Modifiers
   */

  modifier callNotStarted(){
    require(!callStarted);
    callStarted = true;
    _;
    callStarted = false;
  }

  modifier validateBountyArrayIndex(
    uint _index)
  {
    require(_index < numBounties);
    _;
  }

  modifier validateContributionArrayIndex(
    uint _bountyId,
    uint _index)
  {
    require(_index < bounties[_bountyId].contributions.length);
    _;
  }

  modifier validateFulfillmentArrayIndex(
    uint _bountyId,
    uint _index)
  {
    require(_index < bounties[_bountyId].fulfillments.length);
    _;
  }

  modifier validateIssuerArrayIndex(
    uint _bountyId,
    uint _index)
  {
    require(_index < bounties[_bountyId].issuers.length);
    _;
  }

  modifier validateApproverArrayIndex(
    uint _bountyId,
    uint _index)
  {
    require(_index < bounties[_bountyId].approvers.length);
    _;
  }

  modifier onlyIssuer(
  address _sender,
  uint _bountyId,
  uint _issuerId)
  {
  require(_sender == bounties[_bountyId].issuers[_issuerId]);
  _;
  }

  modifier onlySubmitter(
    address _sender,
    uint _bountyId,
    uint _fulfillmentId)
  {
    require(_sender ==
            bounties[_bountyId].fulfillments[_fulfillmentId].submitter);
    _;
  }

  modifier onlyContributor(
  address _sender,
  uint _bountyId,
  uint _contributionId)
  {
    require(_sender ==
            bounties[_bountyId].contributions[_contributionId].contributor);
    _;
  }

  modifier isApprover(
    address _sender,
    uint _bountyId,
    uint _approverId)
  {
    require(_sender == bounties[_bountyId].approvers[_approverId]);
    _;
  }

  modifier hasNotPaid(
    uint _bountyId)
  {
    require(!bounties[_bountyId].hasPaidOut);
    _;
  }

  modifier hasNotRefunded(
    uint _bountyId,
    uint _contributionId)
  {
    require(!bounties[_bountyId].contributions[_contributionId].refunded);
    _;
  }

  modifier senderIsValid(
    address _sender)
  {
    require(msg.sender == _sender || msg.sender == metaTxRelayer);
    _;
  }

 Public functions
  */

  constructor() public {
    
    owner = msg.sender;
  }

  /
  /
  function setMetaTxRelayer(address _relayer)
    external
  {
    require(msg.sender == owner); 
    require(metaTxRelayer == address(0)); 
    metaTxRelayer = _relayer;
  }

  /
  /
  /
  /
  /
  /
  /
  /
  function issueBounty(
    address payable _sender,
    address payable[] memory _issuers,
    address[] memory _approvers,
    string memory _data,
    uint _deadline,
    address _token,
    uint _tokenVersion)
    public
    senderIsValid(_sender)
    returns (uint)
  {
    require(_tokenVersion == 0 || _tokenVersion == 20 || _tokenVersion == 721); 
    require(_issuers.length > 0 || _approvers.length > 0); 

    uint bountyId = numBounties; 

    Bounty storage newBounty = bounties[bountyId];
    newBounty.issuers = _issuers;
    newBounty.approvers = _approvers;
    newBounty.deadline = _deadline;
    newBounty.tokenVersion = _tokenVersion;

    if (_tokenVersion != 0){
      newBounty.token = _token;
    }

    numBounties = numBounties.add(1); 

    emit BountyIssued(bountyId,
                      _sender,
                      _issuers,
                      _approvers,
                      _data, 
                      _deadline,
                      _token,
                      _tokenVersion);

    return (bountyId);
  }

  /


  function issueAndContribute(
    address payable _sender,
    address payable[] memory _issuers,
    address[] memory _approvers,
    string memory _data,
    uint _deadline,
    address _token,
    uint _tokenVersion,
    uint _depositAmount)
    public
    payable
    returns(uint)
  {
    uint bountyId = issueBounty(_sender, _issuers, _approvers, _data, _deadline, _token, _tokenVersion);

    contribute(_sender, bountyId, _depositAmount);

    return (bountyId);
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
  function contribute(
    address payable _sender,
    uint _bountyId,
    uint _amount)
    public
    payable
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    callNotStarted
  {
    require(_amount > 0); 

    bounties[_bountyId].contributions.push(
      Contribution(_sender, _amount, false)); 

    if (bounties[_bountyId].tokenVersion == 0){

      bounties[_bountyId].balance = bounties[_bountyId].balance.add(_amount); 

      require(msg.value == _amount);
    } else if (bounties[_bountyId].tokenVersion == 20){

      bounties[_bountyId].balance = bounties[_bountyId].balance.add(_amount); 

      require(msg.value == 0); 
      require(ERC20Token(bounties[_bountyId].token).transferFrom(_sender,
                                                                 address(this),
                                                                 _amount));
    } else if (bounties[_bountyId].tokenVersion == 721){
      tokenBalances[_bountyId][_amount] = true; 


      require(msg.value == 0); 
      ERC721BasicToken(bounties[_bountyId].token).transferFrom(_sender,
                                                               address(this),
                                                               _amount);
    } else {
      revert();
    }

    emit ContributionAdded(_bountyId,
                           bounties[_bountyId].contributions.length - 1, 
                           _sender,
                           _amount);
  }

  /
  /
  /
  /
  /
  /
  function refundContribution(
    address _sender,
    uint _bountyId,
    uint _contributionId)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateContributionArrayIndex(_bountyId, _contributionId)
    onlyContributor(_sender, _bountyId, _contributionId)
    hasNotPaid(_bountyId)
    hasNotRefunded(_bountyId, _contributionId)
    callNotStarted
  {
    require(now > bounties[_bountyId].deadline); 

    Contribution storage contribution = bounties[_bountyId].contributions[_contributionId];

    contribution.refunded = true;

    transferTokens(_bountyId, contribution.contributor, contribution.amount); 

    emit ContributionRefunded(_bountyId, _contributionId);
  }

  /
  /
  /
  /
  function refundMyContributions(
    address _sender,
    uint _bountyId,
    uint[] memory _contributionIds)
    public
    senderIsValid(_sender)
  {
    for (uint i = 0; i < _contributionIds.length; i++){
        refundContribution(_sender, _bountyId, _contributionIds[i]);
    }
  }

  /
  /
  /
  /
  /
  function refundContributions(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    uint[] memory _contributionIds)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    onlyIssuer(_sender, _bountyId, _issuerId)
    callNotStarted
  {
    for (uint i = 0; i < _contributionIds.length; i++){
      require(_contributionIds[i] < bounties[_bountyId].contributions.length);

      Contribution storage contribution = bounties[_bountyId].contributions[_contributionIds[i]];

      require(!contribution.refunded);

      contribution.refunded = true;

      transferTokens(_bountyId, contribution.contributor, contribution.amount); 
    }

    emit ContributionsRefunded(_bountyId, _sender, _contributionIds);
  }

  /
  /
  /
  /
  /
  /
  function drainBounty(
    address payable _sender,
    uint _bountyId,
    uint _issuerId,
    uint[] memory _amounts)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    onlyIssuer(_sender, _bountyId, _issuerId)
    callNotStarted
  {
    if (bounties[_bountyId].tokenVersion == 0 || bounties[_bountyId].tokenVersion == 20){
      require(_amounts.length == 1); 
      require(_amounts[0] <= bounties[_bountyId].balance); 
      transferTokens(_bountyId, _sender, _amounts[0]); 
    } else {
      for (uint i = 0; i < _amounts.length; i++){
        require(tokenBalances[_bountyId][_amounts[i]]);
        transferTokens(_bountyId, _sender, _amounts[i]);
      }
    }

    emit BountyDrained(_bountyId, _sender, _amounts);
  }

  /
  /
  /
  /
  /
  function performAction(
    address _sender,
    uint _bountyId,
    string memory _data)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
  {
    emit ActionPerformed(_bountyId, _sender, _data); 
  }

  /
  /
  /
  /
  /
  function fulfillBounty(
    address _sender,
    uint _bountyId,
    address payable[] memory  _fulfillers,
    string memory _data)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
  {
    require(now < bounties[_bountyId].deadline); 
    require(_fulfillers.length > 0); 

    bounties[_bountyId].fulfillments.push(Fulfillment(_fulfillers, _sender));

    emit BountyFulfilled(_bountyId,
                         (bounties[_bountyId].fulfillments.length - 1),
                         _fulfillers,
                         _data, 
                         _sender);
  }

  /
  /
  /
  /
  /
  /
  function updateFulfillment(
  address _sender,
  uint _bountyId,
  uint _fulfillmentId,
  address payable[] memory _fulfillers,
  string memory _data)
  public
  senderIsValid(_sender)
  validateBountyArrayIndex(_bountyId)
  validateFulfillmentArrayIndex(_bountyId, _fulfillmentId)
  onlySubmitter(_sender, _bountyId, _fulfillmentId) 
  {
    bounties[_bountyId].fulfillments[_fulfillmentId].fulfillers = _fulfillers;
    emit FulfillmentUpdated(_bountyId,
                            _fulfillmentId,
                            _fulfillers,
                            _data); 
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
  function acceptFulfillment(
    address _sender,
    uint _bountyId,
    uint _fulfillmentId,
    uint _approverId,
    uint[] memory _tokenAmounts)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateFulfillmentArrayIndex(_bountyId, _fulfillmentId)
    isApprover(_sender, _bountyId, _approverId)
    callNotStarted
  {
    
    bounties[_bountyId].hasPaidOut = true;

    Fulfillment storage fulfillment = bounties[_bountyId].fulfillments[_fulfillmentId];

    require(_tokenAmounts.length == fulfillment.fulfillers.length); 

    for (uint256 i = 0; i < fulfillment.fulfillers.length; i++){
        if (_tokenAmounts[i] > 0){
          
          transferTokens(_bountyId, fulfillment.fulfillers[i], _tokenAmounts[i]);
        }
    }
    emit FulfillmentAccepted(_bountyId,
                             _fulfillmentId,
                             _sender,
                             _tokenAmounts);
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
  /
  function fulfillAndAccept(
    address _sender,
    uint _bountyId,
    address payable[] memory _fulfillers,
    string memory _data,
    uint _approverId,
    uint[] memory _tokenAmounts)
    public
    senderIsValid(_sender)
  {
    
    fulfillBounty(_sender, _bountyId, _fulfillers, _data);

    
    acceptFulfillment(_sender,
                      _bountyId,
                      bounties[_bountyId].fulfillments.length - 1,
                      _approverId,
                      _tokenAmounts);
  }



  /
  /
  /
  /
  /
  /
  /
  /
  function changeBounty(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    address payable[] memory _issuers,
    address payable[] memory _approvers,
    string memory _data,
    uint _deadline)
    public
    senderIsValid(_sender)
  {
    require(_bountyId < numBounties); 
    require(_issuerId < bounties[_bountyId].issuers.length); 
    require(_sender == bounties[_bountyId].issuers[_issuerId]); 

    require(_issuers.length > 0 || _approvers.length > 0); 

    bounties[_bountyId].issuers = _issuers;
    bounties[_bountyId].approvers = _approvers;
    bounties[_bountyId].deadline = _deadline;
    emit BountyChanged(_bountyId,
                       _sender,
                       _issuers,
                       _approvers,
                       _data,
                       _deadline);
  }

  /
  /
  /
  /
  /
  /
  function changeIssuer(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    uint _issuerIdToChange,
    address payable _newIssuer)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateIssuerArrayIndex(_bountyId, _issuerIdToChange)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    require(_issuerId < bounties[_bountyId].issuers.length || _issuerId == 0);

    bounties[_bountyId].issuers[_issuerIdToChange] = _newIssuer;

    emit BountyIssuersUpdated(_bountyId, _sender, bounties[_bountyId].issuers);
  }

  /
  /
  /
  /
  /
  /
  function changeApprover(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    uint _approverId,
    address payable _approver)
    external
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    onlyIssuer(_sender, _bountyId, _issuerId)
    validateApproverArrayIndex(_bountyId, _approverId)
  {
    bounties[_bountyId].approvers[_approverId] = _approver;

    emit BountyApproversUpdated(_bountyId, _sender, bounties[_bountyId].approvers);
  }

  /
  /
  /
  /
  /
  /
  /
  function changeIssuerAndApprover(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    uint _issuerIdToChange,
    uint _approverIdToChange,
    address payable _issuer)
    external
    senderIsValid(_sender)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    require(_bountyId < numBounties);
    require(_approverIdToChange < bounties[_bountyId].approvers.length);
    require(_issuerIdToChange < bounties[_bountyId].issuers.length);

    bounties[_bountyId].issuers[_issuerIdToChange] = _issuer;
    bounties[_bountyId].approvers[_approverIdToChange] = _issuer;

    emit BountyIssuersUpdated(_bountyId, _sender, bounties[_bountyId].issuers);
    emit BountyApproversUpdated(_bountyId, _sender, bounties[_bountyId].approvers);
  }

  /
  /
  /
  /
  /
  function changeData(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    string memory _data)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateIssuerArrayIndex(_bountyId, _issuerId)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    emit BountyDataChanged(_bountyId, _sender, _data); 
  }

  /
  /
  /
  /
  /
  function changeDeadline(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    uint _deadline)
    external
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateIssuerArrayIndex(_bountyId, _issuerId)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    bounties[_bountyId].deadline = _deadline;

    emit BountyDeadlineChanged(_bountyId, _sender, _deadline);
  }

  /
  /
  /
  /
  /
  function addIssuers(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    address payable[] memory _issuers)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateIssuerArrayIndex(_bountyId, _issuerId)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    for (uint i = 0; i < _issuers.length; i++){
      bounties[_bountyId].issuers.push(_issuers[i]);
    }

    emit BountyIssuersUpdated(_bountyId, _sender, bounties[_bountyId].issuers);
  }

  /
  /
  /
  /
  /
  function addApprovers(
    address _sender,
    uint _bountyId,
    uint _issuerId,
    address[] memory _approvers)
    public
    senderIsValid(_sender)
    validateBountyArrayIndex(_bountyId)
    validateIssuerArrayIndex(_bountyId, _issuerId)
    onlyIssuer(_sender, _bountyId, _issuerId)
  {
    for (uint i = 0; i < _approvers.length; i++){
      bounties[_bountyId].approvers.push(_approvers[i]);
    }

    emit BountyApproversUpdated(_bountyId, _sender, bounties[_bountyId].approvers);
  }

  /
  /
  /
  function getBounty(uint _bountyId)
    external
    view
    returns (Bounty memory)
  {
    return bounties[_bountyId];
  }


  function transferTokens(uint _bountyId, address payable _to, uint _amount)
    internal
  {
    if (bounties[_bountyId].tokenVersion == 0){
      require(_amount > 0); 
      require(bounties[_bountyId].balance >= _amount);

      bounties[_bountyId].balance = bounties[_bountyId].balance.sub(_amount);

      _to.transfer(_amount);
    } else if (bounties[_bountyId].tokenVersion == 20){
      require(_amount > 0); 
      require(bounties[_bountyId].balance >= _amount);

      bounties[_bountyId].balance = bounties[_bountyId].balance.sub(_amount);

      require(ERC20Token(bounties[_bountyId].token).transfer(_to, _amount));
    } else if (bounties[_bountyId].tokenVersion == 721){
      require(tokenBalances[_bountyId][_amount]);

      tokenBalances[_bountyId][_amount] = false; 

      ERC721BasicToken(bounties[_bountyId].token).transferFrom(address(this),
                                                               _to,
                                                               _amount);
    } else {
      revert();
    }
  }

  Events
   */

  event BountyIssued(uint _bountyId, address payable _creator, address payable[] _issuers, address[] _approvers, string _data, uint _deadline, address _token, uint _tokenVersion);
  event ContributionAdded(uint _bountyId, uint _contributionId, address payable _contributor, uint _amount);
  event ContributionRefunded(uint _bountyId, uint _contributionId);
  event ContributionsRefunded(uint _bountyId, address _issuer, uint[] _contributionIds);
  event BountyDrained(uint _bountyId, address _issuer, uint[] _amounts);
  event ActionPerformed(uint _bountyId, address _fulfiller, string _data);
  event BountyFulfilled(uint _bountyId, uint _fulfillmentId, address payable[] _fulfillers, string _data, address _submitter);
  event FulfillmentUpdated(uint _bountyId, uint _fulfillmentId, address payable[] _fulfillers, string _data);
  event FulfillmentAccepted(uint _bountyId, uint  _fulfillmentId, address _approver, uint[] _tokenAmounts);
  event BountyChanged(uint _bountyId, address _changer, address payable[] _issuers, address payable[] _approvers, string _data, uint _deadline);
  event BountyIssuersUpdated(uint _bountyId, address _changer, address payable[] _issuers);
  event BountyApproversUpdated(uint _bountyId, address _changer, address[] _approvers);
  event BountyDataChanged(uint _bountyId, address _changer, string _data);
  event BountyDeadlineChanged(uint _bountyId, address _changer, uint _deadline);
}

contract BountiesMetaTxRelayer {

  

  StandardBounties public bountiesContract;
  mapping(address => uint) public replayNonce;


  constructor(address _contract) public {
    bountiesContract = StandardBounties(_contract);
  }

  function metaIssueBounty(
    bytes memory signature,
    address payable[] memory _issuers,
    address[] memory _approvers,
    string memory _data,
    uint _deadline,
    address _token,
    uint _tokenVersion,
    uint _nonce)
    public
    returns (uint)
    {
    bytes32 metaHash = keccak256(abi.encodePacked(_issuers, _approvers));	
    address signer = getSigner(metaHash, signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;
    return bountiesContract.issueBounty(address(uint160(signer)),
                                         _issuers,
                                         _approvers,
                                         _data,
                                         _deadline,
                                         _token,
                                         _tokenVersion);
  }

  function metaIssueAndContribute(
    bytes memory signature,
    address payable[] memory _issuers,
    address[] memory _approvers,
    string memory _data,
    uint _deadline,
    address _token,
    uint _tokenVersion,
    uint _depositAmount,
    uint _nonce)
    public
    payable
    returns (uint)
    {
    bytes32 metaHash = keccak256(abi.encodePacked(_issuers, _approvers));	
    address signer = getSigner(metaHash, signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    if (msg.value > 0){
      return bountiesContract.issueAndContribute.value(msg.value)(address(uint160(signer)),
                                                 _issuers,
                                                 _approvers,
                                                 _data,
                                                 _deadline,
                                                 _token,
                                                 _tokenVersion,
                                                 _depositAmount);
    } else {
      return bountiesContract.issueAndContribute(address(uint160(signer)),
                                                 _issuers,
                                                 _approvers,
                                                 _data,
                                                 _deadline,
                                                 _token,
                                                 _tokenVersion,
                                                 _depositAmount);
    }

  }

  function metaContribute(
    bytes memory _signature,
    uint _bountyId,
    uint _amount,
    uint _nonce)
    public
    payable
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaContribute",
                                                  _bountyId,
                                                  _amount,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    if (msg.value > 0){
      bountiesContract.contribute.value(msg.value)(address(uint160(signer)), _bountyId, _amount);
    } else {
      bountiesContract.contribute(address(uint160(signer)), _bountyId, _amount);
    }
  }


  function metaRefundContribution(
    bytes memory _signature,
    uint _bountyId,
    uint _contributionId,
    uint _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaRefundContribution",
                                                  _bountyId,
                                                  _contributionId,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.refundContribution(signer, _bountyId, _contributionId);
  }

  function metaRefundMyContributions(
    bytes memory _signature,
    uint _bountyId,
    uint[] memory _contributionIds,
    uint _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaRefundMyContributions",
                                                  _bountyId,
                                                  _contributionIds,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.refundMyContributions(signer, _bountyId, _contributionIds);
  }

  function metaRefundContributions(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    uint[] memory _contributionIds,
    uint _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaRefundContributions",
                                                  _bountyId,
                                                  _issuerId,
                                                  _contributionIds,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.refundContributions(signer, _bountyId, _issuerId, _contributionIds);
  }

  function metaDrainBounty(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    uint[] memory _amounts,
    uint _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaDrainBounty",
                                                  _bountyId,
                                                  _issuerId,
                                                  _amounts,
                                                  _nonce));
    address payable signer = address(uint160(getSigner(metaHash, _signature)));

    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.drainBounty(signer, _bountyId, _issuerId, _amounts);
  }

  function metaPerformAction(
    bytes memory _signature,
    uint _bountyId,
    string memory _data,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaPerformAction",
                                                  _bountyId,
                                                  _data,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.performAction(signer, _bountyId, _data);
  }

  function metaFulfillBounty(
    bytes memory _signature,
    uint _bountyId,
    address payable[] memory  _fulfillers,
    string memory _data,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaFulfillBounty",
                                                  _bountyId,
                                                  _fulfillers,
                                                  _data,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.fulfillBounty(signer, _bountyId, _fulfillers, _data);
  }

  function metaUpdateFulfillment(
    bytes memory _signature,
    uint _bountyId,
    uint _fulfillmentId,
    address payable[] memory  _fulfillers,
    string memory _data,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaUpdateFulfillment",
                                                  _bountyId,
                                                  _fulfillmentId,
                                                  _fulfillers,
                                                  _data,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.updateFulfillment(signer, _bountyId, _fulfillmentId, _fulfillers, _data);
  }

  function metaAcceptFulfillment(
    bytes memory _signature,
    uint _bountyId,
    uint _fulfillmentId,
    uint _approverId,
    uint[] memory _tokenAmounts,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaAcceptFulfillment",
                                                  _bountyId,
                                                  _fulfillmentId,
                                                  _approverId,
                                                  _tokenAmounts,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.acceptFulfillment(signer,
                       _bountyId,
                       _fulfillmentId,
                       _approverId,
                       _tokenAmounts);
  }

  function metaFulfillAndAccept(
    bytes memory _signature,
    uint _bountyId,
    address payable[] memory _fulfillers,
    string memory _data,
    uint _approverId,
    uint[] memory _tokenAmounts,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encodePacked(_fulfillers, _tokenAmounts));	
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.fulfillAndAccept(signer,
                      _bountyId,
                      _fulfillers,
                      _data,
                      _approverId,
                      _tokenAmounts);
  }

  function metaChangeBounty(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    address payable[] memory _issuers,
    address payable[] memory _approvers,
    string memory _data,
    uint _deadline,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encodePacked(_issuers, _approvers));	
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.changeBounty(signer,
                  _bountyId,
                  _issuerId,
                  _issuers,
                  _approvers,
                  _data,
                  _deadline);
  }

  function metaChangeIssuer(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    uint _issuerIdToChange,
    address payable _newIssuer,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaChangeIssuer",
                                                  _bountyId,
                                                  _issuerId,
                                                  _issuerIdToChange,
                                                  _newIssuer,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.changeIssuer(signer,
                  _bountyId,
                  _issuerId,
                  _issuerIdToChange,
                  _newIssuer);
  }

  function metaChangeApprover(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    uint _approverId,
    address payable _approver,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaChangeApprover",
                                                  _bountyId,
                                                  _issuerId,
                                                  _approverId,
                                                  _approver,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.changeApprover(signer,
                  _bountyId,
                  _issuerId,
                  _approverId,
                  _approver);
  }

  function metaChangeData(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    string memory _data,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaChangeData",
                                                  _bountyId,
                                                  _issuerId,
                                                  _data,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.changeData(signer,
                _bountyId,
                _issuerId,
                _data);
  }

  function metaChangeDeadline(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    uint  _deadline,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaChangeDeadline",
                                                  _bountyId,
                                                  _issuerId,
                                                  _deadline,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.changeDeadline(signer,
                    _bountyId,
                    _issuerId,
                    _deadline);
  }

  function metaAddIssuers(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    address payable[] memory _issuers,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaAddIssuers",
                                                  _bountyId,
                                                  _issuerId,
                                                  _issuers,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.addIssuers(signer,
                _bountyId,
                _issuerId,
                _issuers);
  }

  function metaAddApprovers(
    bytes memory _signature,
    uint _bountyId,
    uint _issuerId,
    address[] memory _approvers,
    uint256 _nonce)
    public
    {
    bytes32 metaHash = keccak256(abi.encode(address(this),
                                                  "metaAddApprovers",
                                                  _bountyId,
                                                  _issuerId,
                                                  _approvers,
                                                  _nonce));
    address signer = getSigner(metaHash, _signature);
    
    require(signer != address(0));
    require(_nonce == replayNonce[signer]);

    
    replayNonce[signer]++;

    bountiesContract.addApprovers(signer,
                _bountyId,
                _issuerId,
                _approvers);
  }

  function getSigner(
    bytes32 _hash,
    bytes memory _signature)
    internal
    pure
    returns (address)
  {
    bytes32 r;
    bytes32 s;
    uint8 v;
    if (_signature.length != 65){
      return address(0);
    }
    assembly {
      r := mload(add(_signature, 32))
      s := mload(add(_signature, 64))
      v := byte(0, mload(add(_signature, 96)))
    }
    if (v < 27){
      v += 27;
    }
    if (v != 27 && v != 28){
      return address(0);
    } else {
        return ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)), v, r, s );
    }
  }
}