/**
 *Submitted for verification at Etherscan.io on 2020-07-07
*/

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function performSwapCollection(
    TotlePrimaryUtils.SwapCollection calldata swaps
  ) external payable {

  }
}

library TotlePrimaryUtils {
  struct Order {
    address payable exchangeHandler;
    bytes encodedPayload;
    uint256 minSourceAmount;
    uint256 maxSourceAmount;
  }

  struct Trade {
    address sourceToken;
    address destinationToken;
    uint256 amount;
    bool isSourceAmount; //true if amount is sourceToken, false if it's destinationToken
    Order[] orders;
  }

  struct Swap {
    Trade[] trades;
    uint256 minimumExchangeRate;
    uint256 minimumDestinationAmount;
    uint256 sourceAmount;
    uint256 tradeToTakeFeeFrom;
    bool takeFeeFromSource; //Takes the fee before the trade if true, takes it after if false
    address payable redirectAddress;
    bool required;
  }

  struct SwapCollection {
    Swap[] swaps;
    address payable partnerContract;
    uint256 expirationBlock;
    bytes32 id;
    uint256 maxGasPrice;
    uint8 v;
    bytes32 r;
    bytes32 s;
  }
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function totalSupply() public view returns (uint256);

  function balanceOf(address _who) public view returns (uint256);

  function allowance(address _owner, address _spender) public view returns (uint256);

  function transfer(address _to, uint256 _value) public returns (bool);

  function approve(address _spender, uint256 _value) public returns (bool);

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);

  function decimals() public view returns (uint256);

  //For WETH
  function deposit() external payable;
  function withdraw(uint) external;
}

interface DepositManagerInterface {
  function depositERC20ForUser(address _token, address _user, uint256 _amount) external;
  function depositEtherForUser(address _user) external payable;
}

interface RegistryInterface {
  function rootToChildToken(address rootToken) external returns (address childToken);
}

contract Swapper {

  address public constant maticDepositManager = 0x401F6c983eA34274ec46f84D70b31C151321188b;
  address public constant maticRegistry = 0x33a02E6cC863D393d6Bf231B697b82F6e499cA71;
  address public constant weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

  function swap(
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.performSwapCollection.value(address(this).balance)(swapCollection);
  }

  function fetchReturnData() internal pure returns (bool success) {
    assembly {
      switch returndatasize()
      case 0 {
        success := 1
      }
      case 32 {
        returndatacopy(0, 0, 32)
        success := mload(0)
      }
      default {
        revert(0, 0)
      }
    }
  }

  function getBalance(address token) public view returns (uint256) {
    return token == address(0)
      ? address(this).balance
      : ERC20(token).balanceOf(address(this));
  }

  function claim(address payable user, address token) public {
    claim(user, token, getBalance(token));
  }

  function claim(address payable user, address token, uint amount) public {
    require(amount > 0, 'Claim amount must be positive');

    uint balance = getBalance(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      safeTransfer(token, user, amount);
    }
  }

  function depositMaticMax(address payable user, address token) public {
    depositMatic(user, token, getBalance(token));
  }

  function depositMatic(address payable user, address token, uint amount) public {
    require(amount > 0, 'Deposit amount must be positive');

    uint balance = getBalance(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? weth : token;
    address childToken = RegistryInterface(maticRegistry).rootToChildToken(_token);
    require(childToken != address(0), "Child token not registered");

    if (token == address(0)) {
      ERC20(weth).deposit.value(_amount)();
      approve(weth, maticDepositManager);
      DepositManagerInterface(maticDepositManager).depositERC20ForUser(weth, user, _amount);
      // DepositManagerInterface(maticDepositManager).depositEtherForUser.value(_amount)(user);
    } else {
      approve(token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).depositERC20ForUser(token, user, _amount);
    }
  }

  function safeTransfer(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return fetchReturnData();
  }

  function approve(address token, address spender) public {
    safeApprove(token, spender, getBalance(token));
  }

  function safeApprove(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return fetchReturnData();
  }

  function destroy(address payable user) external {
    selfdestruct(user);
  }

  function() external payable {

  }
}

contract SwapperFactory {
  address public admin;
  address public swapperLibrary;

  event SwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event MaticSwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event TransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

  event MaticTransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

  modifier onlyAdmin() {
    require(msg.sender == admin, 'Only the admin address can call this function.');
    _;
  }

  struct Commission {
    uint amount;
    address payable destination;
  }

  constructor(address _swapperLibrary) public {
    admin = msg.sender;
    swapperLibrary = _swapperLibrary;
  }

  function performSwap(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public onlyAdmin() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    takeCommission(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.getBalance(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.approve(srcToken, tokenTransferProxy);
    }

    swapper.swap(primary, swapCollection);
    swapper.destroy(user);

    emit SwapPerformed(user, srcToken, dstToken, uniqueId);
  }

  function maticSwap(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public onlyAdmin() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    takeCommission(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.getBalance(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.approve(srcToken, tokenTransferProxy);
    }

    swapper.swap(primary, swapCollection);
    swapper.depositMaticMax(user, dstToken);
    swapper.destroy(user);

    emit MaticSwapPerformed(user, srcToken, dstToken, uniqueId);
  }

  function performTransfer(
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, token, token, uniqueId);
    takeCommission(swapper, token, commission);
    swapper.claim(user, token);
    swapper.destroy(user);

    emit TransferPerformed(user, token, uniqueId);
  }

  function maticTransfer(
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, token, token, uniqueId);
    takeCommission(swapper, token, commission);
    swapper.depositMaticMax(user, token);
    swapper.destroy(user);

    emit MaticTransferPerformed(user, token, uniqueId);
  }

  function takeCommission(
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal onlyAdmin() {
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.getBalance(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.claim(commission[i].destination, token, commission[i].amount);
    }
  }

  function claimBalance(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    swapper.claim(user, token);
    swapper.destroy(user);
  }

  function createClone(
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private onlyAdmin() returns (Swapper) {
    bytes32 salt = computeCloneSalt(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = getCloneBytecode();

    address payable cloneAddress = computeAddress(salt);
    if (!isContract(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }

  function getCloneBytecode() public view returns (bytes memory) {
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }

  function isContract(address _address) public view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }

  function computeCloneSalt(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }

  function computeAddress(bytes32 salt) public view returns (address payable) {
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(getCloneBytecode())));
    return address(bytes20(data << 96));
  }

  function changeAddr(address _swapper) public onlyAdmin() {
    swapperLibrary = _swapper;
  }
}