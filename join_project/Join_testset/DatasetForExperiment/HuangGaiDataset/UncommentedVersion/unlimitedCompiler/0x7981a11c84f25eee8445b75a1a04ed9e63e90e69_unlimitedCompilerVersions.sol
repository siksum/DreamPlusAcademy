/**
 *Submitted for verification at Etherscan.io on 2020-09-05
*/

pragma solidity ^0.5.16;	

contract SGCDEXETHSwap {

  using SafeMath for uint;

  address public owner;
  address payable exchangeFeeAddress;
  uint256 exchangeFee;
  uint256 SafeTime = 2 hours; 

  struct Swap {
    address payable targetWallet;
    bytes32 secret;
    bytes20 secretHash;
    uint256 createdAt;
    uint256 balance;
  }

  
  mapping(address => mapping(address => Swap)) public swaps;
  mapping(address => mapping(address => uint)) public participantSigns;

  constructor () public {
    owner = msg.sender;
    exchangeFee = 1000;
    exchangeFeeAddress = 0x264Ea0F0edCf7D471b41c12540183bc38236Aec6;
  }

  function updateExchangeFeeAddress (address payable newAddress) public returns (bool status) {
    require(owner == msg.sender);
    exchangeFeeAddress = newAddress;
    return true;
  }

  function updateExchangeFee (uint256 newExchangeFee) public returns (bool status) {
    require(owner == msg.sender);
    exchangeFee = newExchangeFee;
    return true;
  }

  event CreateSwap(address _buyer, address _seller, uint256 _value, bytes20 _secretHash, uint256 createdAt);

  
  
  function createSwap(bytes20 _secretHash, address payable _participantAddress) public payable {
    require(msg.value > 0);
    require(swaps[msg.sender][_participantAddress].balance == uint256(0));

    swaps[msg.sender][_participantAddress] = Swap(
      _participantAddress,
      bytes32(0),
      _secretHash,
      now,
      msg.value
    );

    emit CreateSwap(_participantAddress, msg.sender, msg.value, _secretHash, now);
  }

  
  
  function createSwapTarget(bytes20 _secretHash, address payable _participantAddress, address payable _targetWallet) public payable {
    require(msg.value > 0);
    require(swaps[msg.sender][_participantAddress].balance == uint256(0));

    swaps[msg.sender][_participantAddress] = Swap(
      _targetWallet,
      bytes32(0),
      _secretHash,
      now,
      msg.value
    );

    emit CreateSwap(_participantAddress, msg.sender, msg.value, _secretHash, now);
  }

  function getBalance(address _ownerAddress) public view returns (uint256) {
    return swaps[_ownerAddress][msg.sender].balance;
  }

  
  function getTargetWallet(address _ownerAddress) public view returns (address) {
      return swaps[_ownerAddress][msg.sender].targetWallet;
  }

  event Withdraw(address _buyer, address _seller, bytes20 _secretHash, uint256 withdrawnAt);

  
  
  function withdraw(bytes32 _secret, address _ownerAddress) public {
    Swap memory swap = swaps[_ownerAddress][msg.sender];

    require(swap.secretHash == ripemd160(abi.encodePacked(_secret)));
    require(swap.balance > uint256(0));
    require(swap.createdAt.add(SafeTime) > now);

    uint256 actualValue = swap.balance;
    uint256 tradeFee = actualValue.div(exchangeFee);
    uint256 balanceAfterDeduction = actualValue.sub(tradeFee);

    swap.targetWallet.transfer(balanceAfterDeduction);
    exchangeFeeAddress.transfer(tradeFee);

    swaps[_ownerAddress][msg.sender].balance = 0;
    swaps[_ownerAddress][msg.sender].secret = _secret;

    emit Withdraw(msg.sender, _ownerAddress, swap.secretHash, now);
  }
  
  
  function withdrawNoMoney(bytes32 _secret, address participantAddress) public {
    Swap memory swap = swaps[msg.sender][participantAddress];

    require(swap.secretHash == ripemd160(abi.encodePacked(_secret)));
    require(swap.balance > uint256(0));
    require(swap.createdAt.add(SafeTime) > now);

    uint256 actualValue = swap.balance;
    uint256 tradeFee = actualValue.div(10**2).mul(exchangeFee);
    uint256 balanceAfterDeduction = actualValue.sub(tradeFee);

    swap.targetWallet.transfer(balanceAfterDeduction);
    exchangeFeeAddress.transfer(tradeFee);

    swaps[msg.sender][participantAddress].balance = 0;
    swaps[msg.sender][participantAddress].secret = _secret;

    emit Withdraw(participantAddress, msg.sender, swap.secretHash, now);
  }
  
  
  function withdrawOther(bytes32 _secret, address _ownerAddress, address participantAddress) public {
    Swap memory swap = swaps[_ownerAddress][participantAddress];

    require(swap.secretHash == ripemd160(abi.encodePacked(_secret)));
    require(swap.balance > uint256(0));
    require(swap.createdAt.add(SafeTime) > now);

    uint256 actualValue = swap.balance;
    
    uint256 tradeFee = actualValue.div(exchangeFee);
    uint256 balanceAfterDeduction = actualValue.sub(tradeFee);

    swap.targetWallet.transfer(balanceAfterDeduction);
    exchangeFeeAddress.transfer(tradeFee);

    swaps[_ownerAddress][participantAddress].balance = 0;
    swaps[_ownerAddress][participantAddress].secret = _secret;

    emit Withdraw(participantAddress, _ownerAddress, swap.secretHash, now);
  }

  
  function getSecret(address _participantAddress) public view returns (bytes32) {
    return swaps[msg.sender][_participantAddress].secret;
  }

  event Close(address _buyer, address _seller);



  event Refund(address _buyer, address _seller, bytes20 _secretHash);

  
  
  function refund(address _participantAddress) public {
    Swap memory swap = swaps[msg.sender][_participantAddress];

    require(swap.balance > uint256(0));
    require(swap.createdAt.add(SafeTime) < now);

    msg.sender.transfer(swap.balance);

    clean(msg.sender, _participantAddress);

    emit Refund(_participantAddress, msg.sender, swap.secretHash);
  }

  function clean(address _ownerAddress, address _participantAddress) internal {
    delete swaps[_ownerAddress][_participantAddress];
    delete participantSigns[_ownerAddress][_participantAddress];
  }
}

library SafeMath {
    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
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
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}