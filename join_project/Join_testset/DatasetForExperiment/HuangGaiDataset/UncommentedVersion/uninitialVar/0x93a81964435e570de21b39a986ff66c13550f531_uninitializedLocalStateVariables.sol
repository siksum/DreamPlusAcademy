/**
 *Submitted for verification at Etherscan.io on 2020-06-26
*/

pragma solidity >=0.5.10;

contract LibNote {
    event LogNote(
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier note {
        _;
        assembly {
            
            
            let mark := msize                         
            mstore(0x40, add(mark, 288))              
            mstore(mark, 0x20)                        
            mstore(add(mark, 0x20), 224)              
            calldatacopy(add(mark, 0x40), 0, 224)     
            log4(mark, 288,                           
                 shl(224, shr(224, calldataload(0))), 
                 caller,                              
                 calldataload(4),                     
                 calldataload(36)                     
                )
        }
    }
}

contract Median is LibNote {

    
    mapping (address => uint) public wards;
    function rely(address usr) external note auth { wards[usr] = 1; }
    function deny(address usr) external note auth { wards[usr] = 0; }
    modifier auth {
        require(wards[msg.sender] == 1, "Median/not-authorized");
        _;
    }

    uint128        val;
    uint32  public age;
    bytes32 public constant wat = "ethusd"; 
    uint256 public bar ;	


    
    mapping (address => uint256) public orcl;

    
    mapping (address => uint256) public bud;

    
    mapping (uint8 => address) public slot;

    modifier toll { require(bud[msg.sender] == 1, "Median/contract-not-whitelisted"); _;}

    event LogMedianPrice(uint256 val, uint256 age);

    
    constructor() public {
        wards[msg.sender] = 1;
    }

    function read() external view toll returns (uint256) {
        require(val > 0, "Median/invalid-price-feed");
        return val;
    }

    function peek() external view toll returns (uint256,bool) {
        return (val, val > 0);
    }

    function recover(uint256 val_, uint256 age_, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        return ecrecover(
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(val_, age_, wat)))),
            v, r, s
        );
    }

    function poke(
        uint256[] calldata val_, uint256[] calldata age_,
        uint8[] calldata v, bytes32[] calldata r, bytes32[] calldata s) external
    {
        require(val_.length == bar, "Median/bar-too-low");

        uint256 bloom ;	

        uint256 last ;	

        uint256 zzz ;	


        for (uint i ; i < val_.length; i++) {	

            
            address signer ;	

            
            require(orcl[signer] == 1, "Median/invalid-oracle");
            
            require(age_[i] > zzz, "Median/stale-message");
            
            require(val_[i] >= last, "Median/messages-not-in-order");
            last = val_[i];
            
            uint8 sl ;	

            require((bloom >> sl) % 2 == 0, "Median/oracle-already-signed");
            bloom += uint256(2) ** sl;
        }

        val = uint128(val_[val_.length >> 1]);
        age = uint32(block.timestamp);

        emit LogMedianPrice(val, age);
    }

    function lift(address[] calldata a) external note auth {
        for (uint i ; i < a.length; i++) {	

            require(a[i] != address(0), "Median/no-oracle-0");
            uint8 s ;	

            require(slot[s] == address(0), "Median/signer-already-exists");
            orcl[a[i]] = 1;
            slot[s] = a[i];
        }
    }

    function drop(address[] calldata a) external note auth {
       for (uint i ; i < a.length; i++) {	

            orcl[a[i]] = 0;
            slot[uint8(uint256(a[i]) >> 152)] = address(0);
       }
    }

    function setBar(uint256 bar_) external note auth {
        require(bar_ > 0, "Median/quorum-is-zero");
        require(bar_ % 2 != 0, "Median/quorum-not-odd-number");
        bar = bar_;
    }

    function kiss(address a) external note auth {
        require(a != address(0), "Median/no-contract-0");
        bud[a] = 1;
    }

    function diss(address a) external note auth {
        bud[a] = 0;
    }

    function kiss(address[] calldata a) external note auth {
        for(uint i ; i < a.length; i++) {	

            require(a[i] != address(0), "Median/no-contract-0");
            bud[a[i]] = 1;
        }
    }

    function diss(address[] calldata a) external note auth {
        for(uint i ; i < a.length; i++) {	

            bud[a[i]] = 0;
        }
    }
}

contract MedianETHRUB is Median {
    bytes32 public constant wat = "ETHRUB";

    function recover(uint256 val_, uint256 age_, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        return ecrecover(
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(val_, age_, wat)))),
            v, r, s
        );
    }
}