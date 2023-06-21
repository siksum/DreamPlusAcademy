pragma solidity 0.5.2;

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/cryptography/ECDSA.sol

                                                                                                                                                                                                                                                                                

library ECDSA {
                                                                                                                                                                                                                                                                                                 
    function RECOVER788(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        bytes32 r;
        bytes32 s;
        uint8 v;

        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
            v += 27;
        }

        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return (address(0));
        } else {
            return ecrecover(hash, v, r, s);
        }
    }

                                                                                                                                               
    function TOETHSIGNEDMESSAGEHASH682(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED565(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED565(address(0), _owner);
    }

                                                        
    function OWNER858() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER733() {	//inject NONSTANDARD NAMING
        require(ISOWNER99());
        _;
    }

                                                                                 
    function ISOWNER99() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP879() public ONLYOWNER733 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED565(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP361(address newOwner) public ONLYOWNER733 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP918(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP918(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED565(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD714(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS944(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE722(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS944(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS944(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/access/roles/PauserRole.sol

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED63(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED27(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER701(msg.sender);
    }

    modifier ONLYPAUSER69() {	//inject NONSTANDARD NAMING
        require(ISPAUSER735(msg.sender));
        _;
    }

    function ISPAUSER735(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS944(account);
    }

    function ADDPAUSER370(address account) public ONLYPAUSER69 {	//inject NONSTANDARD NAMING
        _ADDPAUSER701(account);
    }

    function RENOUNCEPAUSER58() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER880(msg.sender);
    }

    function _ADDPAUSER701(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD714(account);
        emit PAUSERADDED63(account);
    }

    function _REMOVEPAUSER880(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE722(account);
        emit PAUSERREMOVED27(account);
    }
}

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is PauserRole {
    event PAUSED967(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED795(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED871() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED99() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED990() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE497() public ONLYPAUSER69 WHENNOTPAUSED99 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED967(msg.sender);
    }

                                                                                   
    function UNPAUSE591() public ONLYPAUSER69 WHENPAUSED990 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED795(msg.sender);
    }
}

// File: ../mch-dailyaction/contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL238(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV400(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB338(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD714(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD973(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: ../mch-dailyaction/contracts/DailyAction.sol

contract DailyAction is Ownable, Pausable {
    using SafeMath for uint256;

    uint256 public term;
    address public validater;
    mapping(address => mapping(address => uint256)) public counter;
    mapping(address => uint256) public latestActionTime;

    event ACTION110(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed referrer,
        uint256 at
    );
    
    constructor() public {
        term = 86400 - 600;
    }
    
    function WITHDRAWETHER817() external ONLYOWNER733() {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }

    function SETVALIDATER330(address _varidater) external ONLYOWNER733() {	//inject NONSTANDARD NAMING
        validater = _varidater;
    }

    function UPDATETERM949(uint256 _term) external ONLYOWNER733() {	//inject NONSTANDARD NAMING
        term = _term;
    }

    function REQUESTDAILYACTIONREWARD136(bytes calldata _signature, address _referrer) external WHENNOTPAUSED99() {	//inject NONSTANDARD NAMING
        require(!ISINTERM321(msg.sender), "this sender got daily reward within term");
        uint256 count = GETCOUNT734(msg.sender);
        require(VALIDATESIG669(_signature, count), "invalid signature");
        emit ACTION110(
            msg.sender,
            _referrer,
            block.timestamp
        );
        SETCOUNT518(msg.sender, count + 1);
        latestActionTime[msg.sender] = block.timestamp;
    }

    function ISINTERM321(address _sender) public view returns (bool) {	//inject NONSTANDARD NAMING
        if (latestActionTime[_sender] == 0) {
            return false;
        } else if (block.timestamp >= latestActionTime[_sender].ADD714(term)) {
            return false;
        }
        return true;
    }

    function GETCOUNT734(address _sender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (counter[validater][_sender] == 0) {
            return 1;
        }
        return counter[validater][_sender];
    }

    function SETCOUNT518(address _sender, uint256 _count) private {	//inject NONSTANDARD NAMING
        counter[validater][_sender] = _count;
    }

    function VALIDATESIG669(bytes memory _signature, uint256 _count) private view returns (bool) {	//inject NONSTANDARD NAMING
        require(validater != address(0));
        uint256 hash = uint256(msg.sender) * _count;
        address signer = ECDSA.RECOVER788(ECDSA.TOETHSIGNEDMESSAGEHASH682(bytes32(hash)), _signature);
        return (signer == validater);
    }

                                                                                                   
                                                                                  
           

}