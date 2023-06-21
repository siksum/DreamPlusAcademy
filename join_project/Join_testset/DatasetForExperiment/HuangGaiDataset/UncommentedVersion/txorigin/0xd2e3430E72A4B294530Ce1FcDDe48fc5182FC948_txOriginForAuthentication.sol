/**
 *Submitted for verification at Etherscan.io on 2020-09-03
*/

/// FlipperMom -- governance interface for the Flipper
















pragma solidity ^0.5.12;

contract FlipLike {
    function wards(address) public returns (uint);
    function rely(address) external;
    function deny(address) external;
}

contract AuthorityLike {
    function canCall(address src, address dst, bytes4 sig) public view returns (bool);
}

contract FlipperMom {
    address public owner;
    modifier onlyOwner { require(tx.origin == owner, "flipper-mom/only-owner"); _;}	

    address public authority;
    modifier auth {
        require(isAuthorized(msg.sender, msg.sig), "flipper-mom/not-authorized");
        _;
    }
    function isAuthorized(address src, bytes4 sig) internal view returns (bool) {
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == address(0)) {
            return false;
        } else {
            return AuthorityLike(authority).canCall(src, address(this), sig);
        }
    }

    
    address public cat;

    constructor(address cat_) public {
        owner = msg.sender;
        cat = cat_;
    }

    event SetOwner(address oldOwner, address newOwner);
    function setOwner(address owner_) external onlyOwner {
        emit SetOwner(owner, owner_);
        owner = owner_;
    }

    event SetAuthority(address oldAuthority, address newAuthority);
    function setAuthority(address authority_) external onlyOwner {
        emit SetAuthority(authority, authority_);
        authority = authority_;
    }

    event Rely(address flip, address usr);
    function rely(address flip) external auth {
        emit Rely(flip, cat);
        FlipLike(flip).rely(cat);
    }

    event Deny(address flip, address cat);
    function deny(address flip) external auth {
        emit Deny(flip, cat);
        FlipLike(flip).deny(cat);
    }
}