/**
 *Submitted for verification at Etherscan.io on 2020-02-03
*/

pragma solidity ^0.5.8;
/*
  This file is part of The Colony Network.

  The Colony Network is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  The Colony Network is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with The Colony Network. If not, see <http://www.gnu.org/licenses/>.
*/



// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.



contract DSAuthority {
    function canCall(
        address src, address dst, bytes4 sig
    ) public view returns (bool);
}

contract DSAuthEvents {
    event LogSetAuthority (address indexed authority);
    event LogSetOwner     (address indexed owner);
}

contract DSAuth is DSAuthEvents {
    DSAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LogSetOwner(msg.sender);
    }

    function setOwner(address owner_)
        public
        auth
    {
        owner = owner_;
        emit LogSetOwner(owner);
    }

    function setAuthority(DSAuthority authority_)
        public
        auth
    {
        authority = authority_;
        emit LogSetAuthority(address(authority));
    }

    modifier auth {
        require(isAuthorized(msg.sender, msg.sig), "ds-auth-unauthorized");
        _;
    }

    function isAuthorized(address src, bytes4 sig) internal view returns (bool) {
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == DSAuthority(0)) {
            return false;
        } else {
            return authority.canCall(src, address(this), sig);
        }
    }
}


contract TokenAuthority is DSAuthority {
  address public token;
  mapping(address => mapping(bytes4 => bool)) authorizations;

  bytes4 constant BURN_FUNC_SIG = bytes4(keccak256("burn(uint256)"));
  bytes4 constant BURN_OVERLOAD_FUNC_SIG = bytes4(keccak256("burn(address,uint256)"));

  constructor(address _token, address _colony, address[] memory allowedToTransfer) public {
    token = _token;
    bytes4 transferSig = bytes4(keccak256("transfer(address,uint256)"));
    bytes4 transferFromSig = bytes4(keccak256("transferFrom(address,address,uint256)"));
    bytes4 mintSig = bytes4(keccak256("mint(uint256)"));
    bytes4 mintSigOverload = bytes4(keccak256("mint(address,uint256)"));

    authorizations[_colony][transferSig] = true;
    authorizations[_colony][mintSig] = true;
    authorizations[_colony][mintSigOverload] = true;

    for (uint i = 0; i < allowedToTransfer.length; i++) {
      authorizations[allowedToTransfer[i]][transferSig] = true;
      authorizations[allowedToTransfer[i]][transferFromSig] = true;
    }
  }

  function canCall(address src, address dst, bytes4 sig) public view returns (bool) {
    if (sig == BURN_FUNC_SIG || sig == BURN_OVERLOAD_FUNC_SIG) {
      // We allow anyone to burn their own tokens even when the token is still locked
      return true;
    }

    if (dst != token) {
      return false;
    }

    return authorizations[src][sig];
  }
}