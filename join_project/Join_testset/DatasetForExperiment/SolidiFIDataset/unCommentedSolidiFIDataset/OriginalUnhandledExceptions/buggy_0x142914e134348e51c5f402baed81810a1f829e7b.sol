/**
 *Submitted for verification at Etherscan.io on 2020-08-26
*/

pragma solidity ^0.5.4;

contract Account {

    
    address public implementation;

    
    address public manager;
    
    
    mapping (bytes4 => address) public enabled;

  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  event EnabledStaticCall(address indexed module, bytes4 indexed method);
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Invoked(address indexed module, address indexed target, uint indexed value, bytes data);
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  event Received(uint indexed value, address indexed sender, bytes data);

  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  event AccountInit(address indexed account);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event ManagerChanged(address indexed mgr);

    modifier allowAuthorizedLogicContractsCallsOnly {
        require(LogicManager(manager).isAuthorized(msg.sender), "not an authorized logic");
        _;
    }

     /**
     * @dev better to create and init account through AccountCreator.createAccount, which avoids race condition on Account.init
     */
    function init(address _manager, address _accountStorage, address[] calldata _logics, address[] calldata _keys, address[] calldata _backups)
        external
    {
        require(manager == address(0), "Account: account already initialized");
        require(_manager != address(0) && _accountStorage != address(0), "Account: address is null");
        manager = _manager;

        for (uint i = 0; i < _logics.length; i++) {
            address logic = _logics[i];
            require(LogicManager(manager).isAuthorized(logic), "must be authorized logic");

            BaseLogic(logic).initAccount(this);
        }

        AccountStorage(_accountStorage).initAccount(this, _keys, _backups);

        emit AccountInit(address(this));
    }

    /**
    * @dev Account calls an external target contract.
    * @param _target The target contract address.
    * @param _value ETH value of the call.
    * @param _data data of the call.
    */
    function invoke(address _target, uint _value, bytes calldata _data)
        external
        allowAuthorizedLogicContractsCallsOnly
        returns (bytes memory _res)
    {
        bool success;
        
        (success, _res) = _target.call.value(_value)(_data);
        require(success, "call to target failed");
        emit Invoked(msg.sender, _target, _value, _data);
    }

    /**
    * @dev Enables a static method by specifying the target module to which the call must be delegated.
    * @param _module The target module.
    * @param _method The static method signature.
    */
    function enableStaticCall(address _module, bytes4 _method) external allowAuthorizedLogicContractsCallsOnly {
        enabled[_method] = _module;
        emit EnabledStaticCall(_module, _method);
    }

    /**
    * @dev Reserved method to change account's manager. Normally it's unused.
    * Calling this method requires adding a new authorized logic.
    * @param _newMgr New logic manager.
    */
    function changeManager(address _newMgr) external allowAuthorizedLogicContractsCallsOnly {
        require(_newMgr != address(0), "address cannot be null");
        require(_newMgr != manager, "already changed");
        manager = _newMgr;
        emit ManagerChanged(_newMgr);
    }

     /**
     * @dev This method makes it possible for the wallet to comply to interfaces expecting the wallet to
     * implement specific static methods. It delegates the static call to a target contract if the data corresponds
     * to an enabled method, or logs the call otherwise.
     */
    function() external payable {
        if(msg.data.length > 0) {
            address logic = enabled[msg.sig];
            if(logic == address(0)) {
                emit Received(msg.value, msg.sender, msg.data);
            }
            else {
                require(LogicManager(manager).isAuthorized(logic), "must be an authorized logic for static call");
                
                assembly {
                    calldatacopy(0, 0, calldatasize())
                    let result := staticcall(gas, logic, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch result
                    case 0 {revert(0, returndatasize())}
                    default {return (0, returndatasize())}
                }
            }
        }
    }
}

contract Owned {

    
    address public owner;

  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  event OwnerChanged(address indexed _newOwner);

    /**
     * @dev Throws if the sender is not the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Lets the owner transfer ownership of the contract to a new owner.
     * @param _newOwner The new owner.
     */
    function changeOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OwnerChanged(_newOwner);
    }
}

contract LogicManager is Owned {

  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  event UpdateLogicSubmitted(address indexed logic, bool value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event UpdateLogicCancelled(address indexed logic);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event UpdateLogicDone(address indexed logic, bool value);

    struct pending {
        bool value; 
        uint dueTime; 
    }

    
    mapping (address => bool) public authorized;

    
    address[] public authorizedLogics;

    
    mapping (address => pending) public pendingLogics;

    struct pendingTime {
        uint curPendingTime; 
        uint nextPendingTime; 
        uint dueTime; 
    }

    pendingTime public pt;

    
    uint public logicCount;

    constructor(address[] memory _initialLogics, uint256 _pendingTime) public
    {
        for (uint i = 0; i < _initialLogics.length; i++) {
            address logic = _initialLogics[i];
            authorized[logic] = true;
            logicCount += 1;
        }
        authorizedLogics = _initialLogics;

        pt.curPendingTime = _pendingTime;
        pt.nextPendingTime = _pendingTime;
        pt.dueTime = now;
    }

    /**
     * @dev Submit a new pending time. Called only by owner.
     * @param _pendingTime The new pending time.
     */
    function submitUpdatePendingTime(uint _pendingTime) external onlyOwner {
        pt.nextPendingTime = _pendingTime;
        pt.dueTime = pt.curPendingTime + now;
    }

    /**
     * @dev Trigger updating pending time.
     */
    function triggerUpdatePendingTime() external {
        require(pt.dueTime <= now, "too early to trigger updatePendingTime");
        pt.curPendingTime = pt.nextPendingTime;
    }

    /**
     * @dev check if a logic contract is authorized.
     */
    function isAuthorized(address _logic) external view returns (bool) {
        return authorized[_logic];
    }

    /**
     * @dev get the authorized logic array.
     */
    function getAuthorizedLogics() external view returns (address[] memory) {
        return authorizedLogics;
    }

    /**
     * @dev Submit a new logic. Called only by owner.
     * @param _logic The new logic contract address.
     * @param _value True: enable a new logic; False: disable an old logic.
     */
    function submitUpdate(address _logic, bool _value) external onlyOwner {
        pending storage p = pendingLogics[_logic];
        p.value = _value;
        p.dueTime = now + pt.curPendingTime;
        emit UpdateLogicSubmitted(_logic, _value);
    }

    /**
     * @dev Cancel a logic update. Called only by owner.
     */
    function cancelUpdate(address _logic) external onlyOwner {
        delete pendingLogics[_logic];
        emit UpdateLogicCancelled(_logic);
    }

    /**
     * @dev Trigger updating a new logic.
     * @param _logic The logic contract address.
     */
    function triggerUpdateLogic(address _logic) external {
        pending memory p = pendingLogics[_logic];
        require(p.dueTime > 0, "pending logic not found");
        require(p.dueTime <= now, "too early to trigger updateLogic");
        updateLogic(_logic, p.value);
        delete pendingLogics[_logic];
    }

    /**
     * @dev To update an existing logic, for example authorizedLogics[1],
     * first a new logic is added to the array end, then copied to authorizedLogics[1],
     * then the last logic is dropped, done.
     */
    function updateLogic(address _logic, bool _value) internal {
        if (authorized[_logic] != _value) {
            if(_value) {
                logicCount += 1;
                authorized[_logic] = true;
                authorizedLogics.push(_logic);
            }
            else {
                logicCount -= 1;
                require(logicCount > 0, "must have at least one logic module");
                delete authorized[_logic];
                removeLogic(_logic);
            }
            emit UpdateLogicDone(_logic, _value);
        }
    }

    function removeLogic(address _logic) internal {
        uint len = authorizedLogics.length;
        address lastLogic = authorizedLogics[len - 1];
        if (_logic != lastLogic) {
            for (uint i = 0; i < len; i++) {
                 if (_logic == authorizedLogics[i]) {
                     authorizedLogics[i] = lastLogic;
                     break;
                 }
            }
        }
        authorizedLogics.length--;
    }
}


contract AccountStorage {

    modifier allowAccountCallsOnly(Account _account) {
        require(msg.sender == address(_account), "caller must be account");
        _;
    }

    modifier allowAuthorizedLogicContractsCallsOnly(address payable _account) {
        require(LogicManager(Account(_account).manager()).isAuthorized(msg.sender), "not an authorized logic");
        _;
    }

    struct KeyItem {
        address pubKey;
        uint256 status;
    }

    struct BackupAccount {
        address backup;
        uint256 effectiveDate;
        uint256 expiryDate;
    }

    struct DelayItem {
        bytes32 hash;
        uint256 dueTime;
    }

    struct Proposal {
        bytes32 hash;
        address[] approval;
    }

    
    mapping (address => uint256) operationKeyCount;

    
    mapping (address => mapping(uint256 => KeyItem)) keyData;

    
    mapping (address => mapping(uint256 => BackupAccount)) backupData;

    
    mapping (address => mapping(bytes4 => DelayItem)) delayData;

    
    mapping (address => mapping(address => mapping(bytes4 => Proposal))) proposalData;

    

    function getOperationKeyCount(address _account) external view returns(uint256) {
        return operationKeyCount[_account];
    }

    function increaseKeyCount(address payable _account) external allowAuthorizedLogicContractsCallsOnly(_account) {
        operationKeyCount[_account] = operationKeyCount[_account] + 1;
    }

    

    function getKeyData(address _account, uint256 _index) public view returns(address) {
        KeyItem memory item = keyData[_account][_index];
        return item.pubKey;
    }

    function setKeyData(address payable _account, uint256 _index, address _key) external allowAuthorizedLogicContractsCallsOnly(_account) {
        require(_key != address(0), "invalid _key value");
        KeyItem storage item = keyData[_account][_index];
        item.pubKey = _key;
    }

    

    function getKeyStatus(address _account, uint256 _index) external view returns(uint256) {
        KeyItem memory item = keyData[_account][_index];
        return item.status;
    }

    function setKeyStatus(address payable _account, uint256 _index, uint256 _status) external allowAuthorizedLogicContractsCallsOnly(_account) {
        KeyItem storage item = keyData[_account][_index];
        item.status = _status;
    }

    

    function getBackupAddress(address _account, uint256 _index) external view returns(address) {
        BackupAccount memory b = backupData[_account][_index];
        return b.backup;
    }

    function getBackupEffectiveDate(address _account, uint256 _index) external view returns(uint256) {
        BackupAccount memory b = backupData[_account][_index];
        return b.effectiveDate;
    }

    function getBackupExpiryDate(address _account, uint256 _index) external view returns(uint256) {
        BackupAccount memory b = backupData[_account][_index];
        return b.expiryDate;
    }

    function setBackup(address payable _account, uint256 _index, address _backup, uint256 _effective, uint256 _expiry)
        external
        allowAuthorizedLogicContractsCallsOnly(_account)
    {
        BackupAccount storage b = backupData[_account][_index];
        b.backup = _backup;
        b.effectiveDate = _effective;
        b.expiryDate = _expiry;
    }

    function setBackupExpiryDate(address payable _account, uint256 _index, uint256 _expiry)
        external
        allowAuthorizedLogicContractsCallsOnly(_account)
    {
        BackupAccount storage b = backupData[_account][_index];
        b.expiryDate = _expiry;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    function clearBackupData(address payable _account, uint256 _index) external allowAuthorizedLogicContractsCallsOnly(_account) {
        delete backupData[_account][_index];
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {
      }
	else
      {
      }
}

    

    function getDelayDataHash(address payable _account, bytes4 _actionId) external view returns(bytes32) {
        DelayItem memory item = delayData[_account][_actionId];
        return item.hash;
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {
      }
	else
      {
      }
}

    function getDelayDataDueTime(address payable _account, bytes4 _actionId) external view returns(uint256) {
        DelayItem memory item = delayData[_account][_actionId];
        return item.dueTime;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function setDelayData(address payable _account, bytes4 _actionId, bytes32 _hash, uint256 _dueTime) external allowAuthorizedLogicContractsCallsOnly(_account) {
        DelayItem storage item = delayData[_account][_actionId];
        item.hash = _hash;
        item.dueTime = _dueTime;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function clearDelayData(address payable _account, bytes4 _actionId) external allowAuthorizedLogicContractsCallsOnly(_account) {
        delete delayData[_account][_actionId];
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    

    function getProposalDataHash(address _client, address _proposer, bytes4 _actionId) external view returns(bytes32) {
        Proposal memory p = proposalData[_client][_proposer][_actionId];
        return p.hash;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    function getProposalDataApproval(address _client, address _proposer, bytes4 _actionId) external view returns(address[] memory) {
        Proposal memory p = proposalData[_client][_proposer][_actionId];
        return p.approval;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function setProposalData(address payable _client, address _proposer, bytes4 _actionId, bytes32 _hash, address _approvedBackup)
        external
        allowAuthorizedLogicContractsCallsOnly(_client)
    {
        Proposal storage p = proposalData[_client][_proposer][_actionId];
        if (p.hash > 0) {
            if (p.hash == _hash) {
                for (uint256 i = 0; i < p.approval.length; i++) {
                    require(p.approval[i] != _approvedBackup, "backup already exists");
                }
                p.approval.push(_approvedBackup);
            } else {
                p.hash = _hash;
                p.approval.length = 0;
            }
        } else {
            p.hash = _hash;
            p.approval.push(_approvedBackup);
        }
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    function clearProposalData(address payable _client, address _proposer, bytes4 _actionId) external allowAuthorizedLogicContractsCallsOnly(_client) {
        delete proposalData[_client][_proposer][_actionId];
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }


    

    /**
     * @dev Write account data into storage.
     * @param _account The Account.
     * @param _keys The initial keys.
     * @param _backups The initial backups.
     */
    function initAccount(Account _account, address[] calldata _keys, address[] calldata _backups)
        external
        allowAccountCallsOnly(_account)
    {
        require(getKeyData(address(_account), 0) == address(0), "AccountStorage: account already initialized!");
        require(_keys.length > 0, "empty keys array");

        operationKeyCount[address(_account)] = _keys.length - 1;

        for (uint256 index = 0; index < _keys.length; index++) {
            address _key = _keys[index];
            require(_key != address(0), "_key cannot be 0x0");
            KeyItem storage item = keyData[address(_account)][index];
            item.pubKey = _key;
            item.status = 0;
        }

        
        
        if (_backups.length > 1) {
            address[] memory bkps = _backups;
            for (uint256 i = 0; i < _backups.length; i++) {
                for (uint256 j = 0; j < i; j++) {
                    require(bkps[j] != _backups[i], "duplicate backup");
                }
            }
        }

        for (uint256 index = 0; index < _backups.length; index++) {
            address _backup = _backups[index];
            require(_backup != address(0), "backup cannot be 0x0");
            require(_backup != address(_account), "cannot be backup of oneself");

            backupData[address(_account)][index] = BackupAccount(_backup, now, uint256(-1));
        }
    }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
}

or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, reverts on overflow.
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
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0); 
        uint256 c = a / b;
        

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }

    /**
    * @dev Returns ceil(a / b).
    */
    function ceil(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }
}


contract BaseLogic {

    bytes constant internal SIGN_HASH_PREFIX = "\x19Ethereum Signed Message:\n32";

    mapping (address => uint256) keyNonce;
    AccountStorage public accountStorage;

    modifier allowSelfCallsOnly() {
        require (msg.sender == address(this), "only internal call is allowed");
        _;
    }

    modifier allowAccountCallsOnly(Account _account) {
        require(msg.sender == address(_account), "caller must be account");
        _;
    }

    

    constructor(AccountStorage _accountStorage) public {
        accountStorage = _accountStorage;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    

    function initAccount(Account _account) external allowAccountCallsOnly(_account){
    }
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}

    

    function getKeyNonce(address _key) external view returns(uint256) {
        return keyNonce[_key];
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    

    function getSignHash(bytes memory _data, uint256 _nonce) internal view returns(bytes32) {
        
        
        bytes32 msgHash = keccak256(abi.encodePacked(byte(0x19), byte(0), address(this), _data, _nonce));
        bytes32 prefixedHash = keccak256(abi.encodePacked(SIGN_HASH_PREFIX, msgHash));
        return prefixedHash;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}

    function verifySig(address _signingKey, bytes memory _signature, bytes32 _signHash) internal pure {
        require(_signingKey != address(0), "invalid signing key");
        address recoveredAddr = recover(_signHash, _signature);
        require(recoveredAddr == _signingKey, "signature verification failed");
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

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
     * this is by receiving a hash of the original message (which may otherwise)
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
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    @dev Gets an address encoded as the first argument in transaction data
    * @param b The byte array that should have an address as first argument
    * @returns a The address retrieved from the array
    */
    function getSignerAddress(bytes memory _b) internal pure returns (address _a) {
        require(_b.length >= 36, "invalid bytes");
        
        assembly {
            let mask := 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            _a := and(mask, mload(add(_b, 36)))
            
            
            
            
        }
    }
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}

    
    function getMethodId(bytes memory _b) internal pure returns (bytes4 _a) {
        require(_b.length >= 4, "invalid data");
        
        assembly {
            
            _a := mload(add(_b, 32))
        }
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}

    function checkKeyStatus(address _account, uint256 _index) internal view {
        
        if (_index > 0) {
            require(accountStorage.getKeyStatus(_account, _index) != 1, "frozen key");
        }
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}

    
    function checkAndUpdateNonce(address _key, uint256 _nonce) internal {
        require(_nonce > keyNonce[_key], "nonce too small");
        require(SafeMath.div(_nonce, 1000000) <= now + 86400, "nonce too big"); 

        keyNonce[_key] = _nonce;
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}
}

contract AccountBaseLogic is BaseLogic {

    uint256 constant internal DELAY_CHANGE_ADMIN_KEY = 21 days;
    uint256 constant internal DELAY_CHANGE_OPERATION_KEY = 7 days;
    uint256 constant internal DELAY_UNFREEZE_KEY = 7 days;
    uint256 constant internal DELAY_CHANGE_BACKUP = 21 days;
    uint256 constant internal DELAY_CHANGE_ADMIN_KEY_BY_BACKUP = 30 days;

    uint256 constant internal MAX_DEFINED_BACKUP_INDEX = 5;

	
	bytes4 internal constant CHANGE_ADMIN_KEY = 0xd595d935;
	
	bytes4 internal constant CHANGE_ADMIN_KEY_BY_BACKUP = 0xfdd54ba1;
	
	bytes4 internal constant CHANGE_ADMIN_KEY_WITHOUT_DELAY = 0x441d2e50;
	
	bytes4 internal constant CHANGE_ALL_OPERATION_KEYS_WITHOUT_DELAY = 0x02064abc;
	
	bytes4 internal constant UNFREEZE_WITHOUT_DELAY = 0x69521650;
	
	bytes4 internal constant CHANGE_ALL_OPERATION_KEYS = 0xd3b9d4d6;
	
	bytes4 internal constant UNFREEZE = 0x45c8b1a6;

    

	constructor(AccountStorage _accountStorage)
		BaseLogic(_accountStorage)
		public
	{
	}
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    

    /**
    * @dev Check if a certain account is another's backup.
    */
    function checkRelation(address _client, address _backup) internal view {
        require(_backup != address(0), "backup cannot be 0x0");
        require(_client != address(0), "client cannot be 0x0");
        bool isBackup;
        for (uint256 i = 0; i <= MAX_DEFINED_BACKUP_INDEX; i++) {
            address backup = accountStorage.getBackupAddress(_client, i);
            uint256 effectiveDate = accountStorage.getBackupEffectiveDate(_client, i);
            uint256 expiryDate = accountStorage.getBackupExpiryDate(_client, i);
            
            if (_backup == backup && isEffectiveBackup(effectiveDate, expiryDate)) {
                isBackup = true;
                break;
            }
        }
        require(isBackup, "backup does not exist in list");
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    function isEffectiveBackup(uint256 _effectiveDate, uint256 _expiryDate) internal view returns(bool) {
        return (_effectiveDate <= now) && (_expiryDate > now);
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function clearRelatedProposalAfterAdminKeyChanged(address payable _client) internal {
        
        accountStorage.clearProposalData(_client, _client, CHANGE_ADMIN_KEY_WITHOUT_DELAY);
        accountStorage.clearProposalData(_client, _client, CHANGE_ALL_OPERATION_KEYS_WITHOUT_DELAY);
        accountStorage.clearProposalData(_client, _client, UNFREEZE_WITHOUT_DELAY);

        
        for (uint256 i = 0; i <= MAX_DEFINED_BACKUP_INDEX; i++) {
            address backup = accountStorage.getBackupAddress(_client, i);
            if (backup != address(0)) {
                accountStorage.clearProposalData(_client, backup, CHANGE_ADMIN_KEY_BY_BACKUP);
            }
        }
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

}

/**
* @title DualsigsLogic
*/
contract DualsigsLogic is AccountBaseLogic {

	
	bytes4 private constant ADD_BACKUP = 0x426b7407;
	
	bytes4 private constant PROPOSE_BY_BOTH = 0x7548cb94;

  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event DualsigsLogicEntered(bytes data, uint256 indexed clientNonce, uint256 backupNonce);function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

	event AddBackup(address indexed account, address indexed backup);bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

	event ProposeByBoth(address indexed client, address indexed backup, bytes functionData);

	

	constructor(AccountStorage _accountStorage)
		AccountBaseLogic(_accountStorage)
		public
	{
	}
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

	

    /**
    * @dev Entry method of DualsigsLogic.
    * DualsigsLogic has 2 actions called from 'enter':
        addBackup, proposeByBoth
    */
	function enter(
		bytes calldata _data, bytes calldata _clientSig, bytes calldata _backupSig, uint256 _clientNonce, uint256 _backupNonce
	)
		external
	{
        verifyClient(_data, _clientSig, _clientNonce);
        verifyBackup(_data, _backupSig, _backupNonce);
 
		
		(bool success,) = address(this).call(_data);
		require(success, "enterWithDualSigs failed");
		emit DualsigsLogicEntered(_data, _clientNonce, _backupNonce);
	}
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

	function verifyClient(bytes memory _data, bytes memory _clientSig, uint256 _clientNonce) internal {
		address client = getSignerAddress(_data);
		
		uint256 clientKeyIndex = 0;
		checkKeyStatus(client, clientKeyIndex);
		address signingKey = accountStorage.getKeyData(client, clientKeyIndex);
		if ((getMethodId(_data) == PROPOSE_BY_BOTH) && 
		    (getProposedMethodId(_data) == CHANGE_ADMIN_KEY_WITHOUT_DELAY)) {
			
			verifySig(signingKey, _clientSig, getSignHashWithoutNonce(_data));
		} else {
			checkAndUpdateNonce(signingKey, _clientNonce);
			verifySig(signingKey, _clientSig, getSignHash(_data, _clientNonce));
		}
	}
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function verifyBackup(bytes memory _data, bytes memory _backupSig, uint256 _backupNonce) internal {
		address backup = getSecondSignerAddress(_data);
		
		uint256 backupKeyIndex = 4;
		checkKeyStatus(backup, backupKeyIndex);
		address signingKey = accountStorage.getKeyData(backup, backupKeyIndex);
		checkAndUpdateNonce(signingKey, _backupNonce);
		verifySig(signingKey, _backupSig, getSignHash(_data, _backupNonce));
	}
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

	

    
	function addBackup(address payable _account, address _backup) external allowSelfCallsOnly {
		require(_account != _backup, "cannot be backup of oneself");
		uint256 index = findAvailableSlot(_account, _backup);
		require(index <= MAX_DEFINED_BACKUP_INDEX, "invalid or duplicate or no vacancy");
		accountStorage.setBackup(_account, index, _backup, now + DELAY_CHANGE_BACKUP, uint256(-1));
		emit AddBackup(_account, _backup);
	}
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    
    
	function findAvailableSlot(address _account, address _backup) public view returns(uint) {
		uint index = MAX_DEFINED_BACKUP_INDEX + 1;
		if (_backup == address(0)) {
			return index;
		}
		for (uint256 i = 0; i <= MAX_DEFINED_BACKUP_INDEX; i++) {
            address backup = accountStorage.getBackupAddress(_account, i);
            uint256 expiryDate = accountStorage.getBackupExpiryDate(_account, i);
			
			if ((backup == _backup) && (expiryDate > now)) {
				return MAX_DEFINED_BACKUP_INDEX + 1;
			}
			if (index > MAX_DEFINED_BACKUP_INDEX) {
				
				if ((backup == address(0)) || (expiryDate <= now)) {
	                index = i;
				}
			}
		}
		return index;
	}
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}

	

    /**
    * @dev Propose a proposal. The proposer is client.
	* called from 'enter'. Both _client's and _backup's sigs are checked in 'enter'.
    * @param _client client address
    * @param _backup backup address
	* @param _functionData The proposed action data.
    */
	function proposeByBoth(address payable _client, address _backup, bytes calldata _functionData) external allowSelfCallsOnly {
		require(getSignerAddress(_functionData) == _client, "invalid _client");
		
		bytes4 proposedActionId = getMethodId(_functionData);
		require(isFastAction(proposedActionId), "invalid proposal");
		checkRelation(_client, _backup);
		bytes32 functionHash = keccak256(_functionData);
		accountStorage.setProposalData(_client, _client, proposedActionId, functionHash, _backup);
		emit ProposeByBoth(_client, _backup, _functionData);
	}
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

	function isFastAction(bytes4 _actionId) internal pure returns(bool) {
		if ((_actionId == CHANGE_ADMIN_KEY_WITHOUT_DELAY) ||
			(_actionId == CHANGE_ALL_OPERATION_KEYS_WITHOUT_DELAY) ||
			(_actionId == UNFREEZE_WITHOUT_DELAY))
		{
			return true;
		}
		return false;
	}
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

	

	function getSecondSignerAddress(bytes memory _b) internal pure returns (address _a) {
		require(_b.length >= 68, "data length too short");
		
		assembly {
			
			let mask := 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
			_a := and(mask, mload(add(_b, 68)))
		}
	}
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    function getProposedMethodId(bytes memory _b) internal pure returns (bytes4 _a) {
		require(_b.length >= 164, "data length too short");
        
        assembly {
			/ method id
			000000000000000000000000b7055946345ad40f8cca3feb075dfadd9e2641b5    
			00000000000000000000000011390e32ccdfb3f85e92b949c72fe482d77838f3    
			0000000000000000000000000000000000000000000000000000000000000060    
			0000000000000000000000000000000000000000000000000000000000000044    
			441d2e50                                                            
			000000000000000000000000b7055946345ad40f8cca3feb075dfadd9e2641b5    
			00000000000000000000000013667a2711960c95fae074f90e0f739bc324d1ed    
			00000000000000000000000000000000000000000000000000000000            
			*/
            
			
			
			
			_a := mload(add(add(_b, 68), mload(add(_b, 100))))
        }
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function getSignHashWithoutNonce(bytes memory _data) internal view returns(bytes32) {
        
        
        bytes32 msgHash = keccak256(abi.encodePacked(byte(0x19), byte(0), address(this), _data));
        bytes32 prefixedHash = keccak256(abi.encodePacked(SIGN_HASH_PREFIX, msgHash));
        return prefixedHash;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

}