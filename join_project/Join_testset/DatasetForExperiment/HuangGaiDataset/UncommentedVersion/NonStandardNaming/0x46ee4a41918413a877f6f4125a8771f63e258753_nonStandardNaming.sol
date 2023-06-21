                                                                 

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function PERFORMSWAPCOLLECTION542(	
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
    bool isSourceAmount; 
    Order[] orders;
  }

  struct Swap {
    Trade[] trades;
    uint256 minimumExchangeRate;
    uint256 minimumDestinationAmount;
    uint256 sourceAmount;
    uint256 tradeToTakeFeeFrom;
    bool takeFeeFromSource; 
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

contract DSMath {
    uint constant wad866 = 10 ** 18;	

    function ADD900(uint x, uint y) internal pure returns (uint z) {	
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB167(uint x, uint y) internal pure returns (uint z) {	
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL971(uint x, uint y) internal pure returns (uint z) {	
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    function WMUL627(uint x, uint y) internal pure returns (uint z) {	
        z = ADD900(MUL971(x, y), wad866 / 2) / wad866;
    }

    function WDIV2(uint x, uint y) internal pure returns (uint z) {	
        z = ADD900(MUL971(x, wad866), y / 2) / y;
    }
}

                                                                                        
contract ERC20 {
  event TRANSFER103(	
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL630(	
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function TOTALSUPPLY396() public view returns (uint256);	

  function BALANCEOF767(address _who) public view returns (uint256);	

  function ALLOWANCE190(address _owner, address _spender) public view returns (uint256);	

  function TRANSFER660(address _to, uint256 _value) public returns (bool);	

  function APPROVE575(address _spender, uint256 _value) public returns (bool);	

  function TRANSFERFROM594(address _from, address _to, uint256 _value) public returns (bool);	

  function DECIMALS390() public view returns (uint256);	

  
  function DEPOSIT208() external payable;	
  function WITHDRAW937(uint) external;	
}

interface DepositManagerInterface {
  function DEPOSITERC20FORUSER801(address _token, address _user, uint256 _amount) external;	
  function DEPOSITETHERFORUSER149(address _user) external payable;	
}

interface RegistryInterface {
  function ROOTTOCHILDTOKEN163(address rootToken) external returns (address childToken);	
  function GETWETHTOKENADDRESS654() external view returns (address);	
  function GETDEPOSITMANAGERADDRESS36() external view returns (address);	
}

contract Swapper {
  address public constant maticregistry795 = 0x56B082d0a590A7ce5d170402D6f7f88B58F71988;	

  function SWAP678(	
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.PERFORMSWAPCOLLECTION542.value(address(this).balance)(swapCollection);
  }

  function FETCHRETURNDATA623() internal pure returns (bool success) {	
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

  function GETBALANCE150(address token) public view returns (uint256) {	
    return token == address(0)
      ? address(this).balance
      : ERC20(token).BALANCEOF767(address(this));
  }

  function CLAIM441(address payable user, address token) public {	
    CLAIM441(user, token, GETBALANCE150(token));
  }

  function CLAIM441(address payable user, address token, uint amount) public {	
    require(amount > 0, 'Claim amount must be positive');

    uint balance = GETBALANCE150(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      SAFETRANSFER527(token, user, amount);
    }
  }

  function DEPOSITMATICMAX945(address payable user, address token) public {	
    DEPOSITMATIC304(user, token, GETBALANCE150(token));
  }

  function DEPOSITMATIC304(address payable user, address token, uint amount) public {	
    require(amount > 0, 'Deposit amount must be positive');
    RegistryInterface maticRegistryContract = RegistryInterface(maticregistry795);

    uint balance = GETBALANCE150(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? maticRegistryContract.GETWETHTOKENADDRESS654() : token;
    address childToken = maticRegistryContract.ROOTTOCHILDTOKEN163(_token);
    require(childToken != address(0), "Child token not registered");

    address maticDepositManager = maticRegistryContract.GETDEPOSITMANAGERADDRESS36();
    if (token == address(0)) {
      ERC20(_token).DEPOSIT208.value(_amount)();
      APPROVE575(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER801(_token, user, _amount);
    } else {
      APPROVE575(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER801(_token, user, _amount);
    }
  }

  function SAFETRANSFER527(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {	
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return FETCHRETURNDATA623();
  }

  function APPROVE575(address token, address spender) public {	
    SAFEAPPROVE606(token, spender, GETBALANCE150(token));
  }

  function SAFEAPPROVE606(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {	
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return FETCHRETURNDATA623();
  }

  function DESTROY945(address payable user) external {	
    selfdestruct(user);
  }

  function() external payable {

  }
}

contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
  uint public maxCommission;

  event SWAPPERFORMED559(	
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event MATICSWAPPERFORMED16(	
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event TRANSFERPERFORMED71(	
    address indexed user,
    address token,
    string uniqueId
  );

  event MATICTRANSFERPERFORMED855(	
    address indexed user,
    address token,
    string uniqueId
  );

  modifier ONLYADMIN18() {	
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
    maxCommission = 5*10**16;
  }

  function PERFORMSWAP919(	
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN18() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = CREATECLONE979(user, srcToken, dstToken, uniqueId);
    TAKECOMMISSION17(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE150(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE575(srcToken, tokenTransferProxy);
    }

    swapper.SWAP678(primary, swapCollection);
    swapper.DESTROY945(user);

    emit SWAPPERFORMED559(user, srcToken, dstToken, uniqueId);
  }

  function MATICSWAP389(	
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN18() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');

    Swapper swapper = CREATECLONE979(user, srcToken, dstToken, uniqueId);
    require(
      swapCollection.swaps[0].redirectAddress == user ||
      swapCollection.swaps[0].redirectAddress == address(swapper),
      'User address does not match swap redirect address');
    TAKECOMMISSION17(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE150(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE575(srcToken, tokenTransferProxy);
    }

    swapper.SWAP678(primary, swapCollection);
    swapper.DEPOSITMATICMAX945(user, dstToken);
    swapper.DESTROY945(user);

    emit MATICSWAPPERFORMED16(user, srcToken, dstToken, uniqueId);
  }

  function PERFORMTRANSFER948(	
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN18() {
    Swapper swapper = CREATECLONE979(user, token, token, uniqueId);
    TAKECOMMISSION17(swapper, token, commission);
    swapper.CLAIM441(user, token);
    swapper.DESTROY945(user);

    emit TRANSFERPERFORMED71(user, token, uniqueId);
  }

  function MATICTRANSFER197(	
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN18() {
    Swapper swapper = CREATECLONE979(user, token, token, uniqueId);
    TAKECOMMISSION17(swapper, token, commission);
    swapper.DEPOSITMATICMAX945(user, token);
    swapper.DESTROY945(user);

    emit MATICTRANSFERPERFORMED855(user, token, uniqueId);
  }

  function TAKECOMMISSION17(	
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal ONLYADMIN18() {
    CHECKCOMMISSION733(swapper, token, commission);
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.GETBALANCE150(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.CLAIM441(commission[i].destination, token, commission[i].amount);
    }
  }

  function CHECKCOMMISSION733(	
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal view ONLYADMIN18() {
    uint _totalBal = swapper.GETBALANCE150(token);
    uint _commissionAmt;
    if(_totalBal == 0) return;
    for (uint i = 0; i < commission.length; i++) {
      _commissionAmt += commission[i].amount;
    }
    uint _maxCommissionAmt = WMUL627(_totalBal, maxCommission);
    require(_maxCommissionAmt >= _commissionAmt, "Over commission");
  }

  function CLAIMBALANCE430(	
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public ONLYADMIN18() {
    Swapper swapper = CREATECLONE979(user, srcToken, dstToken, uniqueId);
    swapper.CLAIM441(user, token);
    swapper.DESTROY945(user);
  }

  function CREATECLONE979(	
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private ONLYADMIN18() returns (Swapper) {
    bytes32 salt = COMPUTECLONESALT952(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = GETCLONEBYTECODE433();

    address payable cloneAddress = COMPUTEADDRESS598(salt);
    if (!ISCONTRACT574(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }

  function GETCLONEBYTECODE433() public view returns (bytes memory) {	
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }

  function ISCONTRACT574(address _address) public view returns (bool) {	
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }

  function COMPUTECLONESALT952(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {	
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }

  function COMPUTEADDRESS598(bytes32 salt) public view returns (address payable) {	
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(GETCLONEBYTECODE433())));
    return address(bytes20(data << 96));
  }
}