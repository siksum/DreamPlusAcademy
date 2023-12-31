pragma solidity ^0.5.10;

/// @title Owned
/// @author Adri1 Massanet <adria@codecontext.io>
/// @notice The Owned contract has an owner address, and provides basic 
///  authorization control functions, this simplifies & the implementation of
///  user permissions; this contract has three work flows for a change in
///  ownership, the first requires the new owner to validate that they have the
///  ability to accept ownership, the second allows the ownership to be
///  directly transfered without requiring acceptance, and the third allows for
///  the ownership to be removed to allow for decentralization 
contract Owned {

    address public owner;
    address public newOwnerCandidate;

    event OwnershipRequested(address indexed by, address indexed to);
    event OwnershipTransferred(address indexed from, address indexed to);
    event OwnershipRemoved();

    /// @dev The constructor sets the `msg.sender` as the`owner` of the contract
    constructor() public {
        owner = msg.sender;
    }

    /// @dev `owner` is the only address that can call a function with this
    /// modifier
    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }
    
    /// @dev In this 1st option for ownership transfer `proposeOwnership()` must
    ///  be called first by the current `owner` then `acceptOwnership()` must be
    ///  called by the `newOwnerCandidate`
    /// @notice `onlyOwner` Proposes to transfer control of the contract to a
    ///  new owner
    /// @param _newOwnerCandidate The address being proposed as the new owner
    function proposeOwnership(address _newOwnerCandidate) public onlyOwner {
        newOwnerCandidate = _newOwnerCandidate;
        emit OwnershipRequested(msg.sender, newOwnerCandidate);
    }

    /// @notice Can only be called by the `newOwnerCandidate`, accepts the
    ///  transfer of ownership
    function acceptOwnership() public {
        require(msg.sender == newOwnerCandidate);

        address oldOwner = owner;
        owner = newOwnerCandidate;
        newOwnerCandidate = address(0);

        emit OwnershipTransferred(oldOwner, owner);
    }

    /// @dev In this 2nd option for ownership transfer `changeOwnership()` can
    ///  be called and it will immediately assign ownership to the `newOwner`
    /// @notice `owner` can step down and assign some other address to this role
    /// @param _newOwner The address of the new owner
    function changeOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0));

        address oldOwner = owner;
        owner = _newOwner;
        newOwnerCandidate = address(0);

        emit OwnershipTransferred(oldOwner, owner);
    }

    /// @dev In this 3rd option for ownership transfer `removeOwnership()` can
    ///  be called and it will immediately assign ownership to the 0x0 address;
    ///  it requires a 0xdece be input as a parameter to prevent accidental use
    /// @notice Decentralizes the contract, this operation cannot be undone 
    /// @param _dac `0xdac` has to be entered for this function to work
    function removeOwnership(address _dac) public onlyOwner {
        require(_dac == address(0xdAc0000000000000000000000000000000000000));
        owner = address(0);
        newOwnerCandidate = address(0);
        emit OwnershipRemoved();     
    }
} 

/// @dev `Escapable` is a base level contract built off of the `Owned`
///  contract; it creates an escape hatch function that can be called in an
///  emergency that will allow designated addresses to send any ether or tokens
///  held in the contract to an `escapeHatchDestination` as long as they were
///  not blacklisted
contract Escapable is Owned {
    address public escapeHatchCaller;
    address payable public escapeHatchDestination;
    mapping (address=>bool) private escapeBlacklist; // Token contract addresses

    /// @notice The Constructor assigns the `escapeHatchDestination` and the
    ///  `escapeHatchCaller`
    /// @param _escapeHatchCaller The address of a trusted account or contract
    ///  to call `escapeHatch()` to send the ether in this contract to the
    ///  `escapeHatchDestination` it would be ideal that `escapeHatchCaller`
    ///  cannot move funds out of `escapeHatchDestination`
    /// @param _escapeHatchDestination The address of a safe location (usu a
    ///  Multisig) to send the ether held in this contract; if a neutral address
    ///  is required, the WHG Multisig is an option:
    ///  0x8Ff920020c8AD673661c8117f2855C384758C572 
    constructor(address _escapeHatchCaller, address payable _escapeHatchDestination) public {
        escapeHatchCaller = _escapeHatchCaller;
        escapeHatchDestination = _escapeHatchDestination;
    }

    /// @dev The addresses preassigned as `escapeHatchCaller` or `owner`
    ///  are the only addresses that can call a function with this modifier
    modifier onlyEscapeHatchCallerOrOwner {
        require ((msg.sender == escapeHatchCaller)||(msg.sender == owner));
        _;
    }

    /// @notice Creates the blacklist of tokens that are not able to be taken
    ///  out of the contract; can only be done at the deployment, and the logic
    ///  to add to the blacklist will be in the constructor of a child contract
    /// @param _token the token contract address that is to be blacklisted 
    function blacklistEscapeToken(address _token) internal {
        escapeBlacklist[_token] = true;
        emit EscapeHatchBlackistedToken(_token);
    }

    /// @notice Checks to see if `_token` is in the blacklist of tokens
    /// @param _token the token address being queried
    /// @return False if `_token` is in the blacklist and can't be taken out of
    ///  the contract via the `escapeHatch()`
    function isTokenEscapable(address _token) view public returns (bool) {
        return !escapeBlacklist[_token];
    }

    /// @notice The `escapeHatch()` should only be called as a last resort if a
    /// security issue is uncovered or something unexpected happened
    /// @param _token to transfer, use 0x0 for ether
    function escapeHatch(address _token) public onlyEscapeHatchCallerOrOwner {   
        require(escapeBlacklist[_token]==false);

        uint256 balance;

        /// @dev Logic for ether
        if (_token == address(0)) {
            balance = address(this).balance;
            escapeHatchDestination.transfer(balance);
            emit EscapeHatchCalled(_token, balance);
            return;
        }
        /// @dev Logic for tokens
        ERC20 token = ERC20(_token);
        balance = token.balanceOf(address(this));
        require(token.transfer(escapeHatchDestination, balance));
        emit EscapeHatchCalled(_token, balance);
    }

    /// @notice Changes the address assigned to call `escapeHatch()`
    /// @param _newEscapeHatchCaller The address of a trusted account or
    ///  contract to call `escapeHatch()` to send the value in this contract to
    ///  the `escapeHatchDestination`; it would be ideal that `escapeHatchCaller`
    ///  cannot move funds out of `escapeHatchDestination`
    function changeHatchEscapeCaller(address _newEscapeHatchCaller) public onlyEscapeHatchCallerOrOwner {
        escapeHatchCaller = _newEscapeHatchCaller;
    }

    event EscapeHatchBlackistedToken(address token);
    event EscapeHatchCalled(address token, uint amount);
}


/*
    Copyright 2018, Eduardo Antu1a

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/// @title DAppNodePackageDirectory Contract
/// @author Eduardo Antu1a
/// @dev The goal of this smartcontrat is to keep a list of available packages 
///  to install in the DAppNode

contract DAppNodePackageDirectory is Owned,Escapable {

    /// @param position Indicates the position of the package. position integers
    /// do not have to be consecutive. The biggest integer will be shown first.
    /// @param status - 0: Deleted, 1: Active, 2: Developing, +
    /// @param name ENS name of the package
    struct DAppNodePackage {
        uint128 position;
        uint128 status;
        string name;
    }

    bytes32 public featured;
    DAppNodePackage[] DAppNodePackages;

    event PackageAdded(uint indexed idPackage, string name);
    event PackageUpdated(uint indexed idPackage, string name);
    event StatusChanged(uint idPackage, uint128 newStatus);
    event PositionChanged(uint idPackage, uint128 newPosition);
    event FeaturedChanged(bytes32 newFeatured);

    /// @notice The Constructor assigns the `escapeHatchDestination` and the
    ///  `escapeHatchCaller`
    /// @param _escapeHatchCaller The address of a trusted account or contract
    ///  to call `escapeHatch()` to send the ether in this contract to the
    ///  `escapeHatchDestination` it would be ideal that `escapeHatchCaller`
    ///  cannot move funds out of `escapeHatchDestination`
    /// @param _escapeHatchDestination The address of a safe location (usu a
    ///  Multisig) to send the ether held in this contract; if a neutral address
    ///  is required, the WHG Multisig is an option:
    ///  0x8Ff920020c8AD673661c8117f2855C384758C572 
    constructor(
        address _escapeHatchCaller,
        address payable _escapeHatchDestination
    ) 
        Escapable(_escapeHatchCaller, _escapeHatchDestination)
        public
    {
    }

    /// @notice Add a new DAppNode package
    /// @param name the ENS name of the package
    /// @param status status of the package
    /// @param position to order the packages in the UI
    /// @return the idPackage of the new package
    function addPackage (
        string memory name,
        uint128 status,
        uint128 position
    ) public onlyOwner returns(uint idPackage) {
        idPackage = DAppNodePackages.length++;
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.name = name;
        if (position == 0) {
            c.position = uint128(1000 * (idPackage + 1));
        } else {
            c.position = position;
        }
        c.status = status;
        // An event to notify that a new package has been added
        emit PackageAdded(idPackage, name);
    }

    /// @notice Update a DAppNode package
    /// @param idPackage the id of the package to be changed
    /// @param name the new ENS name of the package
    /// @param status status of the package
    /// @param position to order the packages in the UI
    function updatePackage (
        uint idPackage,
        string memory name,
        uint128 status,
        uint128 position
    ) public onlyOwner {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.name = name;
        c.position = position;
        c.status = status;
        // An event to notify that a package has been updated
        emit PackageUpdated(idPackage, name);
    }

    /// @notice Change the status of a DAppNode package
    /// @param idPackage the id of the package to be changed
    /// @param newStatus the new status of the package
    function changeStatus(
        uint idPackage,
        uint128 newStatus
    ) public onlyOwner {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.status = newStatus;
        emit StatusChanged(idPackage, newStatus);
    }

    /// @notice Change the status of a DAppNode package
    /// @param idPackage the id of the package to be changed
    /// @param newPosition position to order the packages in the UI
    function changePosition(
        uint idPackage,
        uint128 newPosition
    ) public onlyOwner {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.position = newPosition;
        emit PositionChanged(idPackage, newPosition);
    }
    
    
    /// @notice Switch the positio of two DAppNode packages
    /// @param idPackage1 the id of the package to be switched
    /// @param idPackage2 the id of the package to be switched
    function switchPosition(
        uint idPackage1,
        uint idPackage2
    ) public onlyOwner {
        require(idPackage1 < DAppNodePackages.length);
        require(idPackage2 < DAppNodePackages.length);

        DAppNodePackage storage p1 = DAppNodePackages[idPackage1];
        DAppNodePackage storage p2 = DAppNodePackages[idPackage2];
        
        uint128 tmp = p1.position;
        p1.position = p2.position;
        p2.position = tmp;
        emit PositionChanged(idPackage1, p1.position);
        emit PositionChanged(idPackage2, p2.position);

    }

    /// @notice Change the list of featured packages
    /// @param _featured List of the ids of the featured packages
    /// if needed ids [5,43]: _featured = 0x052b0000000000000...
    function changeFeatured(
        bytes32 _featured
    ) public onlyOwner {
        featured = _featured;
        emit FeaturedChanged(_featured);
    }

    /// @notice Returns the information of a DAppNode package
    /// @param idPackage the id of the package to be changed
    /// @return name the new name of the package
    /// @return status the status of the package
    function getPackage(uint idPackage) public view returns (
        string memory name,
        uint128 status,
        uint128 position
    ) {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        name = c.name;
        status = c.status;
        position = c.position;
    }

    /// @notice its goal is to return the total number of DAppNode packages
    /// @return the total number of DAppNode packages
    function numberOfDAppNodePackages() view public returns (uint) {
        return DAppNodePackages.length;
    }
}

/*
    Copyright 2016, Jordi Baylina
    Contributor: Adri1 Massanet <adria@codecontext.io>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/








/**
 * @title ERC20
 * @dev A standard interface for tokens.
 * @dev https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
 */
contract ERC20 {
  
    /// @dev Returns the total token supply
    function totalSupply() public view returns (uint256 supply);

    /// @dev Returns the account balance of the account with address _owner
    function balanceOf(address _owner) public view returns (uint256 balance);

    /// @dev Transfers _value number of tokens to address _to
    function transfer(address _to, uint256 _value) public returns (bool success);

    /// @dev Transfers _value number of tokens from address _from to address _to
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

    /// @dev Allows _spender to withdraw from the msg.sender's account up to the _value amount
    function approve(address _spender, uint256 _value) public returns (bool success);

    /// @dev Returns the amount which _spender is still allowed to withdraw from _owner
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}