                                                                 

// Copyright (C) 2017, 2018, 2019 dbrock, rain, mrchico

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.5.12;

contract LibNote {
    event LOGNOTE442(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE942 {	//inject NONSTANDARD NAMING
        _;
        assembly {
            // log an 'anonymous' event with a constant 6 words of calldata
            // and four indexed topics: selector, caller, arg1 and arg2
            let mark := msize                         // end of memory ensures zero
            mstore(0x40, add(mark, 288))              // update free memory pointer
            mstore(mark, 0x20)                        // bytes type data offset
            mstore(add(mark, 0x20), 224)              // bytes size (padded)
            calldatacopy(add(mark, 0x40), 0, 224)     // bytes payload
            log4(mark, 288,                           // calldata
                 shl(224, shr(224, calldataload(0))), // msg.sig
                 caller,                              // msg.sender
                 calldataload(4),                     // arg1
                 calldataload(36)                     // arg2
                )
        }
    }
}

contract Dai is LibNote {
    // --- Auth ---
    mapping (address => uint) public wards;
    function RELY355(address guy) external NOTE942 AUTH857 { wards[guy] = 1; }	//inject NONSTANDARD NAMING
    function DENY79(address guy) external NOTE942 AUTH857 { wards[guy] = 0; }	//inject NONSTANDARD NAMING
    modifier AUTH857 {	//inject NONSTANDARD NAMING
        require(wards[msg.sender] == 1, "Mcr/not-authorized");
        _;
    }

    // --- ERC20 Data ---
    string  public constant name253     = "Mcr Stablecoin";	//inject NONSTANDARD NAMING
    string  public constant symbol543   = "MCR";	//inject NONSTANDARD NAMING
    string  public constant version70  = "1";	//inject NONSTANDARD NAMING
    uint8   public constant decimals910 = 18;	//inject NONSTANDARD NAMING
    uint256 public totalSupply;

    mapping (address => uint)                      public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;
    mapping (address => uint)                      public nonces;

    event APPROVAL21(address indexed src, address indexed guy, uint wad);	//inject NONSTANDARD NAMING
    event TRANSFER690(address indexed src, address indexed dst, uint wad);	//inject NONSTANDARD NAMING

    // --- Math ---
    function ADD628(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function SUB707(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }

    // --- EIP712 niceties ---
    bytes32 public DOMAIN_SEPARATOR;
    // bytes32 public constant PERMIT_TYPEHASH = keccak256("Permit(address holder,address spender,uint256 nonce,uint256 expiry,bool allowed)");
    bytes32 public constant permit_typehash476 = 0xea2aa0a1be11a07ed86d755c93467f4f82362b452371d1ba94d1715123511acb;	//inject NONSTANDARD NAMING

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

    // --- Token ---
    function TRANSFER778(address dst, uint wad) external returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM228(msg.sender, dst, wad);
    }
    function TRANSFERFROM228(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
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
    function MINT778(address usr, uint wad) external AUTH857 {	//inject NONSTANDARD NAMING
        balanceOf[usr] = ADD628(balanceOf[usr], wad);
        totalSupply    = ADD628(totalSupply, wad);
        emit TRANSFER690(address(0), usr, wad);
    }
    function BURN886(address usr, uint wad) external {	//inject NONSTANDARD NAMING
        require(balanceOf[usr] >= wad, "Mcr/insufficient-balance");
        if (usr != msg.sender && allowance[usr][msg.sender] != uint(-1)) {
            require(allowance[usr][msg.sender] >= wad, "Mcr/insufficient-allowance");
            allowance[usr][msg.sender] = SUB707(allowance[usr][msg.sender], wad);
        }
        balanceOf[usr] = SUB707(balanceOf[usr], wad);
        totalSupply    = SUB707(totalSupply, wad);
        emit TRANSFER690(usr, address(0), wad);
    }
    function APPROVE232(address usr, uint wad) external returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][usr] = wad;
        emit APPROVAL21(msg.sender, usr, wad);
        return true;
    }

    // --- Alias ---
    function PUSH70(address usr, uint wad) external {	//inject NONSTANDARD NAMING
        TRANSFERFROM228(msg.sender, usr, wad);
    }
    function PULL293(address usr, uint wad) external {	//inject NONSTANDARD NAMING
        TRANSFERFROM228(usr, msg.sender, wad);
    }
    function MOVE120(address src, address dst, uint wad) external {	//inject NONSTANDARD NAMING
        TRANSFERFROM228(src, dst, wad);
    }

    // --- Approve by signature ---
    function PERMIT523(address holder, address spender, uint256 nonce, uint256 expiry,	//inject NONSTANDARD NAMING
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