                                                                 
















pragma solidity ^0.5.12;

contract LibNote {
    event LOGNOTE442(	
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE942 {	
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

contract Dai is LibNote {
    
    mapping (address => uint) public wards;
    function RELY355(address guy) external NOTE942 AUTH857 { wards[guy] = 1; }	
    function DENY79(address guy) external NOTE942 AUTH857 { wards[guy] = 0; }	
    modifier AUTH857 {	
        require(wards[msg.sender] == 1, "Mcr/not-authorized");
        _;
    }

    
    string  public constant name253     = "Mcr Stablecoin";	
    string  public constant symbol543   = "MCR";	
    string  public constant version70  = "1";	
    uint8   public constant decimals910 = 18;	
    uint256 public totalSupply;

    mapping (address => uint)                      public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;
    mapping (address => uint)                      public nonces;

    event APPROVAL21(address indexed src, address indexed guy, uint wad);	
    event TRANSFER690(address indexed src, address indexed dst, uint wad);	

    
    function ADD628(uint x, uint y) internal pure returns (uint z) {	
        require((z = x + y) >= x);
    }
    function SUB707(uint x, uint y) internal pure returns (uint z) {	
        require((z = x - y) <= x);
    }

    
    bytes32 public DOMAIN_SEPARATOR;
    
    bytes32 public constant permit_typehash476 = 0xea2aa0a1be11a07ed86d755c93467f4f82362b452371d1ba94d1715123511acb;	

    constructor(uint256 chainId_) public {
        wards[msg.sender] = 1;
        DOMAIN_SEPARATOR = keccak256(abi.encode(
            keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
            keccak256(bytes(name253)),
            keccak256(bytes(version70)),
            chainId_,
            address(this)
        ));
    }

    
    function TRANSFER778(address dst, uint wad) external returns (bool) {	
        return TRANSFERFROM228(msg.sender, dst, wad);
    }
    function TRANSFERFROM228(address src, address dst, uint wad)	
        public returns (bool)
    {
        require(balanceOf[src] >= wad, "Mcr/insufficient-balance");
        if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad, "Mcr/insufficient-allowance");
            allowance[src][msg.sender] = SUB707(allowance[src][msg.sender], wad);
        }
        balanceOf[src] = SUB707(balanceOf[src], wad);
        balanceOf[dst] = ADD628(balanceOf[dst], wad);
        emit TRANSFER690(src, dst, wad);
        return true;
    }
    function MINT778(address usr, uint wad) external AUTH857 {	
        balanceOf[usr] = ADD628(balanceOf[usr], wad);
        totalSupply    = ADD628(totalSupply, wad);
        emit TRANSFER690(address(0), usr, wad);
    }
    function BURN886(address usr, uint wad) external {	
        require(balanceOf[usr] >= wad, "Mcr/insufficient-balance");
        if (usr != msg.sender && allowance[usr][msg.sender] != uint(-1)) {
            require(allowance[usr][msg.sender] >= wad, "Mcr/insufficient-allowance");
            allowance[usr][msg.sender] = SUB707(allowance[usr][msg.sender], wad);
        }
        balanceOf[usr] = SUB707(balanceOf[usr], wad);
        totalSupply    = SUB707(totalSupply, wad);
        emit TRANSFER690(usr, address(0), wad);
    }
    function APPROVE232(address usr, uint wad) external returns (bool) {	
        allowance[msg.sender][usr] = wad;
        emit APPROVAL21(msg.sender, usr, wad);
        return true;
    }

    
    function PUSH70(address usr, uint wad) external {	
        TRANSFERFROM228(msg.sender, usr, wad);
    }
    function PULL293(address usr, uint wad) external {	
        TRANSFERFROM228(usr, msg.sender, wad);
    }
    function MOVE120(address src, address dst, uint wad) external {	
        TRANSFERFROM228(src, dst, wad);
    }

    
    function PERMIT523(address holder, address spender, uint256 nonce, uint256 expiry,	
                    bool allowed, uint8 v, bytes32 r, bytes32 s) external
    {
        bytes32 digest =
            keccak256(abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(permit_typehash476,
                                     holder,
                                     spender,
                                     nonce,
                                     expiry,
                                     allowed))
        ));

        require(holder != address(0), "Mcr/invalid-address-0");
        require(holder == ecrecover(digest, v, r, s), "Mcr/invalid-permit");
        require(expiry == 0 || now <= expiry, "Mcr/permit-expired");
        require(nonce == nonces[holder]++, "Mcr/invalid-nonce");
        uint wad = allowed ? uint(-1) : 0;
        allowance[holder][spender] = wad;
        emit APPROVAL21(holder, spender, wad);
    }
}