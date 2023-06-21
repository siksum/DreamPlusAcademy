/**
 *Submitted for verification at Etherscan.io on 2020-06-08
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
      
      
      if(records[_id] == 0) {
         records[_id] = _timestamp;
      }
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
        uint chainId; 
        address relay; 
    }

    
    
    function computeRelayTxId(RelayTx memory self) public pure returns (bytes32) {
      return keccak256(abi.encode(self.to, self.from, self.data, self.deadline, self.compensation, self.gasLimit, self.chainId, self.relay));
    }
}



contract PaymentDeposit is Initializable, Ownable {

    mapping(address => uint) public depositors;
    uint public uniqueDepositors; 

    
    
    event Deposit(address indexed sender, uint amount, uint indexed index);

    
    
    event Withdraw(address indexed sender, uint amount);
    
    
    function initialize(address _newOwner) internal initializer onlyOwner {
        _transferOwnership(_newOwner);
    }

    /**
     * Supply a deposit for a specified recipient.
     * Caution: The recipient must be an externally owned account as all jobs sent to 
     * any.sender must be signed and associated with a positive balance in this contract. 
     */
    function depositFor(address recipient) public payable { 
        require(msg.value > 0, "No value provided to depositFor.");
        uint index = getDepositorIndex(recipient);
        emit Deposit(recipient, msg.value, index);
    }

    /** 
     * Sets the depositors index if necessary.
     */
    function getDepositorIndex(address _depositor) internal returns(uint) {
        if(depositors[_depositor] == 0) {
            uniqueDepositors = uniqueDepositors + 1;
            depositors[_depositor] = uniqueDepositors;
        }

        return depositors[_depositor];
    }

    /*
     * It is only intended for external users who want to deposit via a wallet.
     */ 
    receive() external payable {
        require(msg.value > 0, "No value provided to fallback.");
        require(tx.origin == msg.sender, "Only EOA can deposit directly.");
        uint index = getDepositorIndex(msg.sender);
        emit Deposit(msg.sender, msg.value, index);
    }

    /**
     * Move funds out of the contract
     */
    function withdraw(address payable recipient, uint amount) onlyOwner public {
        recipient.transfer(amount);
        emit Withdraw(recipient, amount);
    }

    /**
     * Move funds out of the contract
     * Depositor is the OWNER of the funds being withdrawn. 
     * Recipient is the RECEIVER of the funds. 
     */
    function withdrawFor(address payable depositor, address payable recipient, uint amount) onlyOwner public {
        require(depositors[depositor]>0, "Depositor has never deposited funds.");
        recipient.transfer(amount);
        emit Withdraw(depositor, amount);
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