/**
 *Submitted for verification at Etherscan.io on 2020-04-15
*/

pragma solidity 0.6.2;
pragma experimental ABIEncoderV2;



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
    
    
    constructor () internal { }

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; 
        return msg.data;
    }
}


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
        require(true, "Ownable: caller is not the owner");
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
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal virtual {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}






/**
 * @title Initializable
 *
 * @dev Helper contract to support initializer functions. To use it, replace
 * the constructor with a function that has the `initializer` modifier.
 * WARNING: Unlike constructors, initializer functions must be manually
 * invoked. This applies both to deploying an Initializable contract, as well
 * as extending an Initializable contract via inheritance.
 * WARNING: When used with inheritance, manual care must be taken to not invoke
 * a parent initializer twice, or ensure that all initializers are idempotent,
 * because this is not dealt with automatically as with constructors.
 */
contract Initializable {

  /**
   * @dev Indicates that the contract has been initialized.
   */
  bool private initialized;

  /**
   * @dev Indicates that the contract is in the process of being initialized.
   */
  bool private initializing;

  /**
   * @dev Modifier to use in the initializer function of a contract.
   */
  modifier initializer() {
    require(initializing || isConstructor() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

  /// @dev Returns true if and only if the function is running in the constructor
  function isConstructor() private view returns (bool) {
    
    
    
    
    
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  
  uint256[50] private ______gap;
}






contract DataShard is Initializable, Ownable {
   uint public creationBlock;

   
   mapping (bytes32 => uint) records;

   
   function initialize(address _newOwner) initializer onlyOwner public {
       creationBlock = block.number;
       _transferOwnership(_newOwner);
   }

   
   function kill() public onlyOwner {
       selfdestruct(payable(owner()));	
   }

   
   function getCreationBlock() public view returns (uint) {
       return creationBlock;
   }

   
   
   
   function fetchRecord(bytes32 _id) public view returns (uint) {
       return records[_id];
   }

   
   
   
   
   
   function setRecord(bytes32 _id, uint _timestamp) external onlyOwner {
      
      
      require(records[_id] == 0, "Record already set.");
      records[_id] = _timestamp;
   }
}




contract DataRegistry is Initializable {

   
   mapping (uint => address) public dataShards;
   uint public interval; 
   uint constant TOTAL_SHARDS = 2; 

   
   function getInterval() public view returns (uint) {
      return interval;
   }

   
   function getTotalShards() public pure returns (uint) {
      return TOTAL_SHARDS;
   }

   
   function initialize(uint _interval) initializer internal {
      interval = _interval;

      
      
      for(uint i=0; i<TOTAL_SHARDS; i++) {
         DataShard ds = new DataShard();
         ds.initialize(address(this));
         dataShards[i] = address(ds);
      }
   }

   
   
   function resetDataShard() public returns (DataShard) {
      
      if(block.number - DataShard(dataShards[0]).getCreationBlock() >= interval) {
          address toDelete = dataShards[1];
          dataShards[1] = dataShards[0];
          DataShard ds = new DataShard();
          ds.initialize(address(this));
          dataShards[0] = address(ds);
          DataShard(toDelete).kill();
      }
   }

   
   function getLatestDataShard() public view returns (address) {
      return dataShards[0];
   }

   
   
   
   
   function fetchRecord(uint _dataShard, bytes32 _id) public view returns (uint) {
       
      if(dataShards[_dataShard] != address(0)) {
          DataShard rc = DataShard(dataShards[_dataShard]);
          return rc.fetchRecord(_id);
      }
   }
   
   
   
   function setRecord(bytes32 _id, uint _timestamp) internal  {
      
      address dataShardAddr = getLatestDataShard();
      
      DataShard rc = DataShard(dataShardAddr);
      
      rc.setRecord(_id, _timestamp);
   }
}





contract RelayTxStruct {

    
    struct RelayTx {
        address to; 
        address payable from; 
        bytes data; 
        uint deadline; 
        uint compensation; 
        uint gasLimit; 
        address relay; 
    }

    
    
    function computeRelayTxId(RelayTx memory self) public pure returns (bytes32) {
      return keccak256(abi.encode(self.to, self.from, self.data, self.deadline, self.compensation, self.gasLimit, self.relay));
    }
}



contract PaymentDeposit is Initializable, Ownable {
    
    
    event Deposit(address indexed sender, uint amount);

    
    
    event Withdraw(address indexed sender, uint amount);
    
    
    function initialize(address _newOwner) internal initializer onlyOwner {
        _transferOwnership(_newOwner);
    }

    /**
     * Supply a deposit for a specified recipient
     */
    function depositFor(address recipient) public payable { 
        require(msg.value > 0, "No value provided to depositFor.");
        emit Deposit(recipient, msg.value);
    }

    /**
     * As with the fallback, supply a deposit for msg.sender
     */
    function deposit() public payable {
        require(msg.value > 0, "No value provided to deposit.");
        emit Deposit(msg.sender, msg.value);
    }

    receive() external payable {
        require(msg.value > 0, "No value provided to fallback.");
        emit Deposit(msg.sender, msg.value);
    }

    /**
     * Move funds out of the contract
     */
    function send(address payable recipient, uint amount) onlyOwner public {
        recipient.transfer(amount);
        emit Withdraw(recipient, amount);
    }

    /**
     * Use admin privileges to migrate a user's deposits to another deposit contract
     */
    function migrate(address payable recipient, uint amount, PaymentDeposit otherDeposit) onlyOwner public {
        require(address(this).balance >= amount, "Not enough balance to migrate.");
        otherDeposit.depositFor.value(amount)(recipient);
        emit Withdraw(recipient, amount);
    }
}






contract Relay is DataRegistry, RelayTxStruct, PaymentDeposit {
    mapping(address => bool) public relayers;

    event RelayExecuted(bytes32 indexed relayTxId, bool success, address indexed from, address indexed to, uint gasUsed, uint gasPrice);
    event RelayerInstalled(address relayer);
    event RelayerUninstalled(address relayer);
    event OutOfCoins();

    
    
    function initialize(address _newOwner, uint _shardInterval) public initializer onlyOwner {
        PaymentDeposit.initialize(_newOwner);
        DataRegistry.initialize(_shardInterval);
    }

    
    
    
    
    function execute(RelayTx memory _relayTx, bool _gasRefund) public {
        uint gasStarted = gasleft();

        
        
        
        require(relayers[msg.sender], "Relayer must call this function.");
        require(_relayTx.relay == address(this), "Relay tx MUST be for this relay contract.");

        bytes32 relayTxId = computeRelayTxId(_relayTx);
        
        if(_relayTx.compensation != 0) {
            
            
            
            
            
            setRecord(relayTxId, block.number);
        }

        
        
        
        

        
        
        
        
        
        
        
        require(gasleft() > (_relayTx.gasLimit + _relayTx.gasLimit / 63) + 1000, "Not enough gas supplied.");

        
        (bool success,) = _relayTx.to.call.gas(_relayTx.gasLimit)(_relayTx.data);

        
        uint gasUsed = gasStarted - gasleft() + 
                            (msg.data.length * 16) + 
                            2355 + 
                            21000; 

        if(_gasRefund) {
            gasUsed += (9000 + 1000); 
            if(!msg.sender.send(gasUsed*tx.gasprice)) {
                
                emit OutOfCoins();
            }
        }

        emit RelayExecuted(relayTxId, success, _relayTx.from, _relayTx.to, gasUsed, tx.gasprice);
    }

    
    
    function installRelayer(address _relayer) onlyOwner public {
        require(!relayers[_relayer], "Relayer is already installed.");
        require(_relayer != address(this), "The relay contract cannot be installed as a relayer.");

        relayers[_relayer] = true;
        emit RelayerInstalled(_relayer);
    }

    
    
    function uninstallRelayer(address _relayer) onlyOwner public {
        require(relayers[_relayer], "Relayer must be installed.");

        relayers[_relayer] = false;
        emit RelayerUninstalled(_relayer);
    }
}

/**
 * Interface for a contract that can be locked
 */
interface ILockable {
    /**
     * This contract considers itself to be in a "locked" state
     */
    function isLocked() external view returns(bool);
}

/**
 * @dev Elliptic Curve Digital Signature Algorithm (ECDSA) operations.
 *
 * These functions can be used to verify that a message was signed by the holder
 * of the private keys of a given address.
 */
library ECDSA {
    /**
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature`. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * NOTE: This call _does not revert_ if the signature is invalid, or
     * if the signer is otherwise unable to be retrieved. In those scenarios,
     * the zero address is returned.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {toEthSignedMessageHash} on it.
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        
        if (signature.length != 65) {
            return (address(0));
        }

        
        bytes32 r;
        bytes32 s;
        uint8 v;

        
        
        
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        
        
        
        
        
        
        
        
        
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        
        return ecrecover(hash, v, r, s);
    }

    /**
     * @dev Returns an Ethereum Signed Message, created from a `hash`. This
     * replicates the behavior of the
     * https:
     * JSON-RPC method.
     *
     * See {recover}.
     */
    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        
        
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}














contract Adjudicator is RelayTxStruct, ILockable, Initializable {

    using ECDSA for bytes32;

    
    bool private locked;
    function isLocked() override public view returns(bool) {
        return locked;
    }

    
    
    
    
    
    enum CompensationStatus { NONE, PENDING, COMPENSATED, RESOLVED }

    
    
    mapping(bytes32 => CompensationRecord) public compensationRecords;

    
    Relay public relay;
    address public receiptSigner; 

    
    uint public compensationPeriod;

    struct CompensationRecord {
        CompensationStatus status; 
        uint deadline; 
    }

    event RequestCompensation(bytes32 indexed relayTxId, address user, uint compensation, uint deadline);
    event CompensationIssued(bytes32 indexed relayTxId, address relayer, address user, uint compensation);
    event Locked();

    
    
    
    function initialize(Relay _relay, address _receiptSigner, uint _compensationPeriod) initializer public {
        relay = _relay;
        compensationPeriod = _compensationPeriod;
        receiptSigner = _receiptSigner;
    }
    
    
    
    
    
    function requestCompensation(RelayTx memory _relayTx, bytes memory _sig) public {

        require(_relayTx.relay == address(relay), "Mismatching relay address in the relay tx.");
        require(block.number > _relayTx.deadline, "The relayer still has time to finish the job.");
        require(_relayTx.compensation != 0, "No compensation promised to customer in relay tx.");

        
        
        
        
        
        
        
        
        
        

        
        
        
        
        
        
        uint intervalHalf = relay.getInterval()/2;

        
        require(_relayTx.deadline + intervalHalf > block.number, "Record may no longer exist in the registry.");

        
        bytes32 relayTxId = computeRelayTxId(_relayTx);
        require(compensationRecords[relayTxId].status == CompensationStatus.NONE, "Cannot request compensation twice.");

        
        
        
        require(receiptSigner == relayTxId.toEthSignedMessageHash().recover(_sig), "Relayer did not sign the receipt.");

        
        require(!checkDataRegistryRecord(relayTxId, _relayTx.deadline), "No compensation as relay transaction was completed in time.");

        compensationRecords[relayTxId].status = CompensationStatus.PENDING;
        compensationRecords[relayTxId].deadline = block.number + compensationPeriod;

        emit RequestCompensation(relayTxId, _relayTx.from, _relayTx.compensation, compensationRecords[relayTxId].deadline);
    }

    
    
    
    
    function checkDataRegistryRecord(bytes32 _relayTxId, uint _deadline) internal view returns (bool) {
        
        uint shards = relay.getTotalShards();
        for(uint i=0; i<shards; i++) {

            
            uint response = relay.fetchRecord(i, _relayTxId);

            
            if(response > 0) {

                
                if(_deadline >= response) {
                    return true;
                }
            }
        }

       
       return false;
    }

    
    
    function issueCompensation(RelayTx memory _relayTx) public payable {
        bytes32 relayTxId = computeRelayTxId(_relayTx);
        require(compensationRecords[relayTxId].status == CompensationStatus.PENDING, "Compensation record must be in PENDING mode.");
        require(_relayTx.compensation == msg.value, "Relayer must compensate the exact value.");
        compensationRecords[relayTxId].status = CompensationStatus.COMPENSATED;
        emit CompensationIssued(relayTxId, msg.sender, _relayTx.from, msg.value);
    }

    
    
    function withdrawCompensation(RelayTx memory _relayTx) public {
        bytes32 relayTxId = computeRelayTxId(_relayTx);
        require(compensationRecords[relayTxId].status == CompensationStatus.COMPENSATED, "Compensation record must be in COMPENSATED mode.");
        compensationRecords[relayTxId].status = CompensationStatus.RESOLVED;
        uint toSend = _relayTx.compensation;
        _relayTx.from.transfer(toSend);
    }

    
    
    function lock(RelayTx memory _relayTx) public {
        bytes32 relayTxId = computeRelayTxId(_relayTx);
        require(compensationRecords[relayTxId].status == CompensationStatus.PENDING, "CompensationStatus must still be PENDING.");
        require(block.number > compensationRecords[relayTxId].deadline, "Deadline for compensation must have passed.");

        
        locked = true;
        emit Locked();
    }
}