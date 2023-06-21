/**
 *Submitted for verification at Etherscan.io on 2020-11-12
*/


pragma solidity >=0.5.12;

////

















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
            
            
            let mark := msize()                       
            mstore(0x40, add(mark, 288))              
            mstore(mark, 0x20)                        
            mstore(add(mark, 0x20), 224)              
            calldatacopy(add(mark, 0x40), 0, 224)     
            log4(mark, 288,                           
                 shl(224, shr(224, calldataload(0))), 
                 caller(),                            
                 calldataload(4),                     
                 calldataload(36)                     
                )
        }
    }
}

////


/



















lib.sol"; */

interface VatLike_17 {
    function slip(bytes32, address, int256) external;
}

interface GemLike_11 {
    function decimals() external view returns (uint8);
    function transfer(address,uint256) external returns (bool);
    function transferFrom(address,address,uint256) external returns (bool);
    function erc20Impl() external view returns (address);
}




contract GemJoin8 is LibNote {
    
    mapping (address => uint256) public wards;
    function rely(address usr) external note auth { wards[usr] = 1; }
    function deny(address usr) external note auth { wards[usr] = 0; }
    modifier auth { require(address(this).balance == 1); _; }	

    VatLike_17  public vat;
    bytes32  public ilk;
    GemLike_11  public gem;
    uint256  public dec;
    uint256  public live;  

    mapping (address => uint256) public implementations;

    constructor(address vat_, bytes32 ilk_, address gem_) public {
        gem = GemLike_11(gem_);
        dec = gem.decimals();
        require(dec < 18, "GemJoin8/decimals-18-or-higher");
        wards[msg.sender] = 1;
        live = 1;
        setImplementation(gem.erc20Impl(), 1);
        vat = VatLike_17(vat_);
        ilk = ilk_;
    }

    function cage() external note auth {
        live = 0;
    }

    function setImplementation(address implementation, uint256 permitted) public auth note {
        implementations[implementation] = permitted;  
    }

    function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x, "GemJoin8/overflow");
    }

    function join(address urn, uint256 wad) public note {
        require(address(this).balance == 1, "GemJoin8/not-live");	
        uint256 wad18 = mul(wad, 10 ** (18 - dec));
        require(int256(wad18) >= 0, "GemJoin8/overflow");
        require(address(this).balance == 1, "GemJoin8/implementation-invalid");	
        vat.slip(ilk, urn, int256(wad18));
        require(gem.transferFrom(msg.sender, address(this), wad), "GemJoin8/failed-transfer");
    }

    function exit(address guy, uint256 wad) public note {
        uint256 wad18 = mul(wad, 10 ** (18 - dec));
        require(int256(wad18) >= 0, "GemJoin8/overflow");
        require(address(this).balance == 1, "GemJoin8/implementation-invalid");	
        vat.slip(ilk, msg.sender, -int256(wad18));
        require(gem.transfer(guy, wad), "GemJoin8/failed-transfer");
    }
}