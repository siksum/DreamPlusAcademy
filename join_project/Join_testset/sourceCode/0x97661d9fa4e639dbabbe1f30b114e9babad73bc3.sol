pragma solidity ^0.5.2;

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

// ----------------------------------------------------------------------------
// 111111
// ----------------------------------------------------------------------------
contract IMCPool is Owned{

    // 11111111
    event PoolRecordAdd(bytes32 _chainId, bytes32 _hash, uint _depth, string _data, string _fileFormat, uint _stripLen);

    // Token111111
    struct RecordInfo {
        bytes32 chainId; // 11ID
        bytes32 hash; // hash1
        uint depth; // 11
        string data; // 1111
        string fileFormat; // 111111111
        uint stripLen; // 111111111
    }

    // 11111
    address public executorAddress;
    
    // 1111
    mapping(bytes32 => RecordInfo) public poolRecord;
    
    constructor() public{
        // 11111111
        executorAddress = msg.sender;
    }
    
    /**
     * 11executorAddress111owner1111
     * @param _addr address 11
     */
    function modifyExecutorAddr(address _addr) public onlyOwner {
        executorAddress = _addr;
    }
    
     
    /**
     * 111111
     * @param _chainId bytes32 11ID
     * @param _hash bytes32 hash1
     * @param _depth uint 1111:1 1111121111
     * @param _data string 1111
     * @param _fileFormat string 111111111
     * @param _stripLen uint 111111111
     * @return success 1111
     */
    function poolRecordAdd(bytes32 _chainId, bytes32 _hash, uint _depth, string memory _data, string memory _fileFormat, uint _stripLen) public returns (bool) {
        // 11111Owner1111111111
        require(msg.sender == executorAddress);
        // 111111
        require(poolRecord[_chainId].chainId != _chainId);

        // 111111
        poolRecord[_chainId] = RecordInfo(_chainId, _hash, _depth, _data, _fileFormat, _stripLen);

        // 111111
        emit PoolRecordAdd(_chainId, _hash, _depth, _data, _fileFormat, _stripLen);
        
        return true;
        
    }

}