                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg
// WARNING - `executeActionWithAtomicBatchCalls` has a `bytes[]` argument that
// requires ABIEncoderV2. Exercise caution when calling that specific function.
pragma experimental ABIEncoderV2;


interface DharmaSmartWalletImplementationV0Interface {
  // Fires when a new user signing key is set on the smart wallet.
  event NEWUSERSIGNINGKEY471(address userSigningKey);	//inject NONSTANDARD NAMING

  // Fires when an error occurs as part of an attempted action.
  event EXTERNALERROR983(address indexed source, string revertReason);	//inject NONSTANDARD NAMING

  // The smart wallet recognizes DAI, USDC, ETH, and SAI as supported assets.
  enum AssetType {
    DAI,
    USDC,
    ETH,
    SAI
  }

  // Actions, or protected methods (i.e. not deposits) each have an action type.
  enum ActionType {
    Cancel,
    SetUserSigningKey,
    Generic,
    GenericAtomicBatch,
    SAIWithdrawal,
    USDCWithdrawal,
    ETHWithdrawal,
    SetEscapeHatch,
    RemoveEscapeHatch,
    DisableEscapeHatch,
    DAIWithdrawal,
    DAIBorrow,
    USDCBorrow
  }

  function INITIALIZE884(address userSigningKey) external;	//inject NONSTANDARD NAMING

  function REPAYANDDEPOSIT415() external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI448(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function WITHDRAWUSDC96(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function CANCEL884(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external;

  function SETUSERSIGNINGKEY345(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function GETBALANCES116() external returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 cDaiUnderlyingDaiBalance,
    uint256 cUSDCUnderlyingUSDCBalance,
    uint256 cEtherUnderlyingEtherBalance
  );

  function GETUSERSIGNINGKEY485() external view returns (address userSigningKey);	//inject NONSTANDARD NAMING

  function GETNONCE302() external view returns (uint256 nonce);	//inject NONSTANDARD NAMING

  function GETNEXTCUSTOMACTIONID877(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETCUSTOMACTIONID417(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETVERSION234() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV1Interface {
  event CALLSUCCESS522(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    bool rolledBack,
    uint256 nonce,
    address to,
    bytes data,
    bytes returnData
  );

  event CALLFAILURE949(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    uint256 nonce,
    address to,
    bytes data,
    string revertReason
  );

  // ABIEncoderV2 uses an array of Calls for executing generic batch calls.
  struct Call {
    address to;
    bytes data;
  }

  // ABIEncoderV2 uses an array of CallReturns for handling generic batch calls.
  struct CallReturn {
    bool ok;
    bytes returnData;
  }

  function WITHDRAWETHER831(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function EXECUTEACTION767(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData);

  function RECOVER508(address newUserSigningKey) external;	//inject NONSTANDARD NAMING

  function EXECUTEACTIONWITHATOMICBATCHCALLS836(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool[] memory ok, bytes[] memory returnData);

  function GETNEXTGENERICACTIONID70(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICACTIONID876(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETNEXTGENERICATOMICBATCHACTIONID251(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICATOMICBATCHACTIONID805(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);
}


interface DharmaSmartWalletImplementationV3Interface {
  event CANCEL450(uint256 cancelledNonce);	//inject NONSTANDARD NAMING
  event ETHWITHDRAWAL270(uint256 amount, address recipient);	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV4Interface {
  event ESCAPED929();	//inject NONSTANDARD NAMING

  function SETESCAPEHATCH701(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function REMOVEESCAPEHATCH484(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function PERMANENTLYDISABLEESCAPEHATCH115(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function ESCAPE278() external;	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV6Interface {
  function MIGRATESAITODAI570() external;	//inject NONSTANDARD NAMING
  function MIGRATECSAITOCDAI380() external;	//inject NONSTANDARD NAMING
}


interface CTokenInterface {
  function MINT754(uint256 mintAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEM71(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING524(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function BALANCEOF524(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING231(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING
}


interface USDCV1Interface {
  function ISBLACKLISTED773(address _account) external view returns (bool);	//inject NONSTANDARD NAMING
  function PAUSED275() external view returns (bool);	//inject NONSTANDARD NAMING
}


interface DharmaKeyRegistryInterface {
  event NEWGLOBALKEY852(address oldGlobalKey, address newGlobalKey);	//inject NONSTANDARD NAMING
  event NEWSPECIFICKEY387(	//inject NONSTANDARD NAMING
    address indexed account, address oldSpecificKey, address newSpecificKey
  );

  function SETGLOBALKEY653(address globalKey, bytes calldata signature) external;	//inject NONSTANDARD NAMING
  function SETSPECIFICKEY781(address account, address specificKey) external;	//inject NONSTANDARD NAMING
  function GETKEY28() external view returns (address key);	//inject NONSTANDARD NAMING
  function GETKEYFORUSER768(address account) external view returns (address key);	//inject NONSTANDARD NAMING
  function GETGLOBALKEY550() external view returns (address globalKey);	//inject NONSTANDARD NAMING
  function GETSPECIFICKEY391(address account) external view returns (address specificKey);	//inject NONSTANDARD NAMING
}


interface DharmaEscapeHatchRegistryInterface {
  // Fire an event when an escape hatch is set or removed.
  event ESCAPEHATCHMODIFIED924(	//inject NONSTANDARD NAMING
    address indexed smartWallet, address oldEscapeHatch, address newEscapeHatch
  );

  // Fire an event when an escape hatch is permanently disabled.
  event ESCAPEHATCHDISABLED313(address smartWallet);	//inject NONSTANDARD NAMING

  // Store the escape hatch account, as well as a flag indicating if the escape
  // hatch has been disabled, for each smart wallet that elects to set one.
  struct EscapeHatch {
    address escapeHatch;
    bool disabled;
  }

  function SETESCAPEHATCH701(address newEscapeHatch) external;	//inject NONSTANDARD NAMING

  function REMOVEESCAPEHATCH484() external;	//inject NONSTANDARD NAMING

  function PERMANENTLYDISABLEESCAPEHATCH115() external;	//inject NONSTANDARD NAMING

  function GETESCAPEHATCH363() external view returns (	//inject NONSTANDARD NAMING
    bool exists, address escapeHatch
  );

  function GETESCAPEHATCHFORSMARTWALLET489(	//inject NONSTANDARD NAMING
    address smartWallet
  ) external view returns (bool exists, address escapeHatch);

  function HASDISABLEDESCAPEHATCHFORSMARTWALLET92(	//inject NONSTANDARD NAMING
    address smartWallet
  ) external view returns (bool disabled);
}


interface IERC20 {
  function BALANCEOF524(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER431(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE863(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE791(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
}


interface ERC1271 {
  function ISVALIDSIGNATURE229(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signature
  ) external view returns (bytes4 magicValue);
}


interface SaiToDaiMigratorInterface {
  function SWAPSAITODAI843(uint256 balance) external;	//inject NONSTANDARD NAMING
}


library Address {
    function ISCONTRACT624(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


library ECDSA {
  function RECOVER508(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
    if (signature.length != 65) {
      return (address(0));
    }

    bytes32 r;
    bytes32 s;
    uint8 v;

    assembly {
      r := mload(add(signature, 0x20))
      s := mload(add(signature, 0x40))
      v := byte(0, mload(add(signature, 0x60)))
    }

    if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
      return address(0);
    }

    if (v != 27 && v != 28) {
      return address(0);
    }

    return ecrecover(hash, v, r, s);
  }

  function TOETHSIGNEDMESSAGEHASH691(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract DharmaSmartWalletImplementationV6 is
  DharmaSmartWalletImplementationV0Interface,
  DharmaSmartWalletImplementationV1Interface,
  DharmaSmartWalletImplementationV3Interface,
  DharmaSmartWalletImplementationV4Interface,
  DharmaSmartWalletImplementationV6Interface {
  using Address for address;
  using ECDSA for bytes32;
  // WARNING: DO NOT REMOVE OR REORDER STORAGE WHEN WRITING NEW IMPLEMENTATIONS!

  // The user signing key associated with this account is in storage slot 0.
  // It is the core differentiator when it comes to the account in question.
  address private _userSigningKey;

  // The nonce associated with this account is in storage slot 1. Every time a
  // signature is submitted, it must have the appropriate nonce, and once it has
  // been accepted the nonce will be incremented.
  uint256 private _nonce;

  // The self-call context flag is in storage slot 2. Some protected functions
  // may only be called externally from calls originating from other methods on
  // this contract, which enables appropriate exception handling on reverts.
  // Any storage should only be set immediately preceding a self-call and should
  // be cleared upon entering the protected function being called.
  bytes4 internal _selfCallContext;

  // END STORAGE DECLARATIONS - DO NOT REMOVE OR REORDER STORAGE ABOVE HERE!

  // The smart wallet version will be used when constructing valid signatures.
  uint256 internal constant _dharma_smart_wallet_version38 = 6;	//inject NONSTANDARD NAMING

  // DharmaKeyRegistryV2 holds a public key for verifying meta-transactions.
  DharmaKeyRegistryInterface internal constant _dharma_key_registry65 = (	//inject NONSTANDARD NAMING
    DharmaKeyRegistryInterface(0x000000000D38df53b45C5733c7b34000dE0BDF52)
  );

  // Account recovery is facilitated using a hard-coded recovery manager,
  // controlled by Dharma and implementing appropriate timelocks.
  address internal constant _account_recovery_manager424 = address(	//inject NONSTANDARD NAMING
    0x0000000000DfEd903aD76996FC07BF89C0127B1E
  );

  // Users can designate an "escape hatch" account with the ability to sweep all
  // funds from their smart wallet by using the Dharma Escape Hatch Registry.
  DharmaEscapeHatchRegistryInterface internal constant _escape_hatch_registry15 = (	//inject NONSTANDARD NAMING
    DharmaEscapeHatchRegistryInterface(0x00000000005280B515004B998a944630B6C663f8)
  );

  // Interface with Sai, Dai, USDC, related CompoundV2 contracts, and migrator.
  CTokenInterface internal constant _csai847 = CTokenInterface(	//inject NONSTANDARD NAMING
    0xF5DCe57282A584D2746FaF1593d3121Fcac444dC // mainnet
  );

  CTokenInterface internal constant _cdai935 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643 // mainnet
  );

  CTokenInterface internal constant _cusdc425 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x39AA39c021dfbaE8faC545936693aC917d5E7563 // mainnet
  );

  IERC20 internal constant _sai44 = IERC20(	//inject NONSTANDARD NAMING
    0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359 // mainnet
  );

  IERC20 internal constant _dai127 = IERC20(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  IERC20 internal constant _usdc839 = IERC20(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  SaiToDaiMigratorInterface internal constant _migrator723 = SaiToDaiMigratorInterface(	//inject NONSTANDARD NAMING
    0xc73e0383F3Aff3215E6f04B0331D58CeCf0Ab849 // mainnet
  );

  USDCV1Interface internal constant _usdc_naughty871 = USDCV1Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  // Compound returns a value of 0 to indicate success, or lack of an error.
  uint256 internal constant _compound_success773 = 0;	//inject NONSTANDARD NAMING

  // ERC-1271 must return this magic value when `isValidSignature` is called.
  bytes4 internal constant _erc_1271_magic_value605 = bytes4(0x20c13b0b);	//inject NONSTANDARD NAMING

  // Minimum supported deposit & non-maximum withdrawal size is .001 underlying.
  uint256 private constant _just_under_one_1000th_dai126 = 999999999999999;	//inject NONSTANDARD NAMING
  uint256 private constant _just_under_one_1000th_usdc691 = 999;	//inject NONSTANDARD NAMING

  // Specify the amount of gas to supply when making Ether transfers.
  uint256 private constant _eth_transfer_gas177 = 4999;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function INITIALIZE884(address userSigningKey) external {	//inject NONSTANDARD NAMING
    // Ensure that this function is only callable during contract construction.
    assembly { if extcodesize(address) { revert(0, 0) } }

    // Set up the user's signing key and emit a corresponding event.
    _SETUSERSIGNINGKEY185(userSigningKey);

    // Approve the cDAI contract to transfer Dai on behalf of this contract.
    if (_SETFULLAPPROVAL335(AssetType.DAI)) {
      // Get the current Dai balance on this contract.
      uint256 daiBalance = _dai127.BALANCEOF524(address(this));

      // Try to deposit the full Dai balance on Compound.
      _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
    }

    // Approve the cUSDC contract to transfer USDC on behalf of this contract.
    if (_SETFULLAPPROVAL335(AssetType.USDC)) {
      // Get the current USDC balance on this contract.
      uint256 usdcBalance = _usdc839.BALANCEOF524(address(this));

      // Try to deposit the full USDC balance on Compound.
      _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function REPAYANDDEPOSIT415() external {	//inject NONSTANDARD NAMING
    // Get the current Dai balance on this contract.
    uint256 daiBalance = _dai127.BALANCEOF524(address(this));

    // If there is any Dai balance, check for adequate approval for cDai.
    if (daiBalance > 0) {
      uint256 daiAllowance = _dai127.ALLOWANCE863(address(this), address(_cdai935));
      // If allowance is insufficient, try to set it before depositing.
      if (daiAllowance < daiBalance) {
        if (_SETFULLAPPROVAL335(AssetType.DAI)) {
          // Deposit the full available Dai balance on Compound.
          _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
        }
      // Otherwise, just go ahead and try the Dai deposit.
      } else {
        // Deposit the full available Dai balance on Compound.
        _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
      }
    }

    // Get the current USDC balance on this contract.
    uint256 usdcBalance = _usdc839.BALANCEOF524(address(this));

    // If there is any USDC balance, check for adequate approval for cUSDC.
    if (usdcBalance > 0) {
      uint256 usdcAllowance = _usdc839.ALLOWANCE863(address(this), address(_cusdc425));
      // If allowance is insufficient, try to set it before depositing.
      if (usdcAllowance < usdcBalance) {
        if (_SETFULLAPPROVAL335(AssetType.USDC)) {
          // Deposit the full available USDC balance on Compound.
          _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
        }
      // Otherwise, just go ahead and try the USDC deposit.
      } else {
        // Deposit the full available USDC balance on Compound.
        _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function WITHDRAWDAI448(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.DAIWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an amount of at least 0.001 Dai has been supplied.
    require(amount > _just_under_one_1000th_dai126, "Insufficient Dai supplied.");

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), "No recipient supplied.");

    // Set the self-call context in order to call _withdrawDaiAtomic.
    _selfCallContext = this.WITHDRAWDAI448.selector;

    // Make the atomic self-call - if redeemUnderlying fails on cDAI, it will
    // succeed but nothing will happen except firing an ExternalError event. If
    // the second part of the self-call (the Dai transfer) fails, it will revert
    // and roll back the first part of the call as well as fire an ExternalError
    // event after returning from the failed call.
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWDAIATOMIC144.selector, amount, recipient
    ));

    // If the atomic call failed, emit an event signifying a transfer failure.
    if (!ok) {
      emit EXTERNALERROR983(address(_dai127), "Could not transfer Dai.");
    } else {
      // Set ok to false if the call succeeded but the withdrawal failed.
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function _WITHDRAWDAIATOMIC144(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM832(this.WITHDRAWDAI448.selector);

    // If amount = 0xfff...fff, withdraw the maximum amount possible.
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      // First attempt to redeem all cDai from Compound if there is a balance.
      _WITHDRAWMAXFROMCOMPOUND520(AssetType.DAI);

      // Then transfer all Dai to recipient if there is a balance.
      require(_TRANSFERMAX712(_dai127, recipient, false));
      success = true;
    } else {
      // Attempt to withdraw specified Dai from Compound before proceeding.
      if (_WITHDRAWFROMCOMPOUND660(AssetType.DAI, amount)) {
        // At this point Dai transfer should never fail - wrap it just in case.
        require(_dai127.TRANSFER431(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function WITHDRAWUSDC96(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.USDCWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an amount of at least 0.001 USDC has been supplied.
    require(amount > _just_under_one_1000th_usdc691, "Insufficient USDC supplied.");

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), "No recipient supplied.");

    // Set the self-call context in order to call _withdrawUSDCAtomic.
    _selfCallContext = this.WITHDRAWUSDC96.selector;

    // Make the atomic self-call - if redeemUnderlying fails on cUSDC, it will
    // succeed but nothing will happen except firing an ExternalError event. If
    // the second part of the self-call (USDC transfer) fails, it will revert
    // and roll back the first part of the call as well as fire an ExternalError
    // event after returning from the failed call.
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWUSDCATOMIC330.selector, amount, recipient
    ));
    if (!ok) {
      // Find out why USDC transfer reverted (doesn't give revert reasons).
      _DIAGNOSEANDEMITUSDCSPECIFICERROR52(_usdc839.TRANSFER431.selector);
    } else {
      // Set ok to false if the call succeeded but the withdrawal failed.
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _WITHDRAWUSDCATOMIC330(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM832(this.WITHDRAWUSDC96.selector);

    // If amount = 0xfff...fff, withdraw the maximum amount possible.
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      // First attempt to redeem all cUSDC from Compound if there is a balance.
      _WITHDRAWMAXFROMCOMPOUND520(AssetType.USDC);

      // Then transfer all USDC to recipient if there is a balance.
      require(_TRANSFERMAX712(_usdc839, recipient, false));
      success = true;
    } else {
      // Attempt to withdraw specified USDC from Compound before proceeding.
      if (_WITHDRAWFROMCOMPOUND660(AssetType.USDC, amount)) {
        // Ensure that the USDC transfer does not fail.
        require(_usdc839.TRANSFER431(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function WITHDRAWETHER831(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.ETHWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that a non-zero amount of Ether has been supplied.
    require(amount > 0, "Must supply a non-zero amount of Ether.");

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), "No recipient supplied.");

    // Attempt to transfer Ether to the recipient and emit an appropriate event.
    ok = _TRANSFERETH635(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function CANCEL884(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external {
    // Get the current nonce.
    uint256 nonceToCancel = _nonce;

    // Ensure the caller or the supplied signature is valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.Cancel,
      abi.encode(),
      minimumActionGas,
      signature,
      signature
    );

    // Emit an event to validate that the nonce is no longer valid.
    emit CANCEL450(nonceToCancel);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function EXECUTEACTION767(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData) {
    // Ensure that the `to` address is a contract and is not this contract.
    _ENSUREVALIDGENERICCALLTARGET44(to);

    // Ensure caller and/or supplied signatures are valid and increment nonce.
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.Generic,
      abi.encode(to, data),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Note: from this point on, there are no reverts (apart from out-of-gas or
    // call-depth-exceeded) originating from this action. However, the call
    // itself may revert, in which case the function will return `false`, along
    // with the revert reason encoded as bytes, and fire an CallFailure event.

    // Perform the action via low-level call and set return values using result.
    (ok, returnData) = to.call(data);

    // Emit a CallSuccess or CallFailure event based on the outcome of the call.
    if (ok) {
      // Note: while the call succeeded, the action may still have "failed"
      // (for example, successful calls to Compound can still return an error).
      emit CALLSUCCESS522(actionID, false, nonce, to, data, returnData);
    } else {
      // Note: while the call failed, the nonce will still be incremented, which
      // will invalidate all supplied signatures.
      emit CALLFAILURE949(actionID, nonce, to, data, string(returnData));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function SETUSERSIGNINGKEY345(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.SetUserSigningKey,
      abi.encode(userSigningKey),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Set new user signing key on smart wallet and emit a corresponding event.
    _SETUSERSIGNINGKEY185(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function SETESCAPEHATCH701(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.SetEscapeHatch,
      abi.encode(account),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an escape hatch account has been provided.
    require(account != address(0), "Must supply an escape hatch account.");

    // Set a new escape hatch for the smart wallet unless it has been disabled.
    _escape_hatch_registry15.SETESCAPEHATCH701(account);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function REMOVEESCAPEHATCH484(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.RemoveEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Remove the escape hatch for the smart wallet if one is currently set.
    _escape_hatch_registry15.REMOVEESCAPEHATCH484();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function PERMANENTLYDISABLEESCAPEHATCH115(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.DisableEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Permanently disable the escape hatch mechanism for this smart wallet.
    _escape_hatch_registry15.PERMANENTLYDISABLEESCAPEHATCH115();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function ESCAPE278() external {	//inject NONSTANDARD NAMING
    // Get the escape hatch account, if one exists, for this account.
    (bool exists, address escapeHatch) = _escape_hatch_registry15.GETESCAPEHATCH363();

    // Ensure that an escape hatch is currently set for this smart wallet.
    require(exists, "No escape hatch is currently set for this smart wallet.");

    // Ensure that the escape hatch account is the caller.
    require(
      msg.sender == escapeHatch,
      "Only the escape hatch account may call this function."
    );

    // Attempt to redeem all cSAI for Sai on Compound.
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.SAI);

    // Attempt to redeem all cDAI for Dai on Compound.
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.DAI);

    // Attempt to redeem all cUSDC for USDC on Compound.
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.USDC);

    // Attempt to transfer the total Sai balance to the caller.
    _TRANSFERMAX712(_sai44, msg.sender, true);

    // Attempt to transfer the total Dai balance to the caller.
    _TRANSFERMAX712(_dai127, msg.sender, true);

    // Attempt to transfer the total USDC balance to the caller.
    _TRANSFERMAX712(_usdc839, msg.sender, true);

    // Attempt to transfer any residual cSAI to the caller.
    _TRANSFERMAX712(IERC20(address(_csai847)), msg.sender, true);

    // Attempt to transfer any residual cDAI to the caller.
    _TRANSFERMAX712(IERC20(address(_cdai935)), msg.sender, true);

    // Attempt to transfer any residual cUSDC to the caller.
    _TRANSFERMAX712(IERC20(address(_cusdc425)), msg.sender, true);

    // Determine if there is Ether at this address that should be transferred.
    uint256 balance = address(this).balance;
    if (balance > 0) {
      // Attempt to transfer any Ether to caller and emit an appropriate event.
      _TRANSFERETH635(msg.sender, balance);
    }

    // Emit an `Escaped` event.
    emit ESCAPED929();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function RECOVER508(address newUserSigningKey) external {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _account_recovery_manager424,
      "Only the account recovery manager may call this function."
    );

    // Increment nonce to prevent signature reuse should original key be reset.
    _nonce++;

    // Set up the user's new dharma key and emit a corresponding event.
    _SETUSERSIGNINGKEY185(newUserSigningKey);
  }

                                                                                                                                                                                                                                 
  function MIGRATESAITODAI570() external {	//inject NONSTANDARD NAMING
    // Swap the current Sai balance on this contract for Dai.
    _SWAPSAIFORDAI811(_sai44.BALANCEOF524(address(this)));
  }

                                                                                                                                                                                                                                                                                                            
  function MIGRATECSAITOCDAI380() external {	//inject NONSTANDARD NAMING
    // Get the current cSai balance for this account.
    uint256 redeemAmount = _csai847.BALANCEOF524(address(this));

    // Only perform the call to redeem if there is a non-zero balance.
    if (redeemAmount > 0) {
      // Get the current Sai balance on this contract.
      uint256 currentSaiBalance = _sai44.BALANCEOF524(address(this));

      // Redeem underlying balance from cSai and revert if unsuccessful.
      require(
        _csai847.REDEEM71(redeemAmount) == _compound_success773, "cSai redeem failed."
      );

      // Calculate difference between pre-redeem and post-redeem Sai balances.
      uint256 saiBalance = _sai44.BALANCEOF524(address(this)) - currentSaiBalance;

      // Swap any Sai for Dai and get the newly-swapped Dai balance.
      uint256 daiBalance = _SWAPSAIFORDAI811(saiBalance);
      
      // If the cDai allowance is insufficient, set it before depositing.
      if (_dai127.ALLOWANCE863(address(this), address(_cdai935)) < daiBalance) {
        require(
          _dai127.APPROVE791(address(_cdai935), uint256(-1)), "Dai approval failed."
        );
      }
      
      // Deposit the new Dai balance on Compound.
      require(_cdai935.MINT754(daiBalance) == _compound_success773, "cDai mint failed.");
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function GETBALANCES116() external returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance, // always returns 0
    uint256 cDaiUnderlyingDaiBalance,
    uint256 cUsdcUnderlyingUsdcBalance,
    uint256 cEtherUnderlyingEtherBalance // always returns 0
  ) {
    daiBalance = _dai127.BALANCEOF524(address(this));
    usdcBalance = _usdc839.BALANCEOF524(address(this));
    cDaiUnderlyingDaiBalance = _cdai935.BALANCEOFUNDERLYING231(address(this));
    cUsdcUnderlyingUsdcBalance = _cusdc425.BALANCEOFUNDERLYING231(address(this));
  }

                                                                                                                                                     
  function GETUSERSIGNINGKEY485() external view returns (address userSigningKey) {	//inject NONSTANDARD NAMING
    userSigningKey = _userSigningKey;
  }

                                                                                                                                                                                                                                             
  function GETNONCE302() external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
    nonce = _nonce;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETNEXTCUSTOMACTIONID877(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(action, amount, recipient),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETCUSTOMACTIONID417(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(action, amount, recipient),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function GETNEXTGENERICACTIONID70(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      ActionType.Generic,
      abi.encode(to, data),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETGENERICACTIONID876(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      ActionType.Generic,
      abi.encode(to, data),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                 
  function GETVERSION234() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dharma_smart_wallet_version38;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function EXECUTEACTIONWITHATOMICBATCHCALLS836(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) public returns (bool[] memory ok, bytes[] memory returnData) {
    // Ensure that each `to` address is a contract and is not this contract.
    for (uint256 i = 0; i < calls.length; i++) {
      _ENSUREVALIDGENERICCALLTARGET44(calls[i].to);
    }

    // Ensure caller and/or supplied signatures are valid and increment nonce.
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Note: from this point on, there are no reverts (apart from out-of-gas or
    // call-depth-exceeded) originating from this contract. However, one of the
    // calls may revert, in which case the function will return `false`, along
    // with the revert reason encoded as bytes, and fire an CallFailure event.

    // Specify length of returned values in order to work with them in memory.
    ok = new bool[](calls.length);
    returnData = new bytes[](calls.length);

    // Set self-call context to call _executeActionWithAtomicBatchCallsAtomic.
    _selfCallContext = this.EXECUTEACTIONWITHATOMICBATCHCALLS836.selector;

    // Make the atomic self-call - if any call fails, calls that preceded it
    // will be rolled back and calls that follow it will not be made.
    (bool externalOk, bytes memory rawCallResults) = address(this).call(
      abi.encodeWithSelector(
        this._EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC441.selector, calls
      )
    );

    // Parse data returned from self-call into each call result and store / log.
    CallReturn[] memory callResults = abi.decode(rawCallResults, (CallReturn[]));
    for (uint256 i = 0; i < callResults.length; i++) {
      Call memory currentCall = calls[i];

      // Set the status and the return data / revert reason from the call.
      ok[i] = callResults[i].ok;
      returnData[i] = callResults[i].returnData;

      // Emit CallSuccess or CallFailure event based on the outcome of the call.
      if (callResults[i].ok) {
        // Note: while the call succeeded, the action may still have "failed"
        // (i.e. a successful calls to Compound can still return an error).
        emit CALLSUCCESS522(
          actionID,
          !externalOk, // if another call failed this will have been rolled back
          nonce,
          currentCall.to,
          currentCall.data,
          callResults[i].returnData
        );
      } else {
        // Note: while the call failed, the nonce will still be incremented,
        // which will invalidate all supplied signatures.
        emit CALLFAILURE949(
          actionID,
          nonce,
          currentCall.to,
          currentCall.data,
          string(callResults[i].returnData)
        );

        // exit early - any calls after the first failed call will not execute.
        break;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC441(	//inject NONSTANDARD NAMING
    Call[] memory calls
  ) public returns (CallReturn[] memory callResults) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM832(this.EXECUTEACTIONWITHATOMICBATCHCALLS836.selector);

    bool rollBack = false;
    callResults = new CallReturn[](calls.length);

    for (uint256 i = 0; i < calls.length; i++) {
      // Perform low-level call and set return values using result.
      (bool ok, bytes memory returnData) = calls[i].to.call(calls[i].data);
      callResults[i] = CallReturn({ok: ok, returnData: returnData});
      if (!ok) {
        // Exit early - any calls after the first failed call will not execute.
        rollBack = true;
        break;
      }
    }

    if (rollBack) {
      // Wrap in length encoding and revert (provide data instead of a string).
      bytes memory callResultsBytes = abi.encode(callResults);
      assembly { revert(add(32, callResultsBytes), mload(callResultsBytes)) }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function GETNEXTGENERICATOMICBATCHACTIONID251(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function GETGENERICATOMICBATCHACTIONID805(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID433(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                       
  function _SETUSERSIGNINGKEY185(address userSigningKey) internal {	//inject NONSTANDARD NAMING
    // Ensure that a user signing key is set on this smart wallet.
    require(userSigningKey != address(0), "No user signing key provided.");

    _userSigningKey = userSigningKey;
    emit NEWUSERSIGNINGKEY471(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                  
  function _SWAPSAIFORDAI811(uint256 saiToSwap) internal returns (uint256 dai) {	//inject NONSTANDARD NAMING
    // If the balance is non-zero, check if migrator has adequate approval.
    if (saiToSwap > 0) {
      uint256 allowance = _sai44.ALLOWANCE863(address(this), address(_migrator723));
      
      // Ensure that allowance is sufficient before calling the migrator.
      if (saiToSwap > allowance) {
        // Approve migrator contract to transfer Sai on behalf of this wallet.
        require(
          _sai44.APPROVE791(address(_migrator723), uint256(-1)), "Sai approval failed."
        );
      }

      // Get the current Dai balance on this contract.
      uint256 currentDaiBalance = _dai127.BALANCEOF524(address(this));

      // Call migrator contract to swap the supplied Sai balance for Dai.
      _migrator723.SWAPSAITODAI843(saiToSwap);

      // Return the difference between the pre-swap and post-swap Dai balances.
      dai = _dai127.BALANCEOF524(address(this)) - currentDaiBalance;

      // Ensure that the Sai-to-Dai exchange rate was at least 1-to-1.
      require(dai >= saiToSwap, "Exchange rate cannot be below 1:1.");
    } else {
      // Explicitly specify a change in balance of zero if no swap occurred.
      dai = 0;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                     
  function _SETFULLAPPROVAL335(AssetType asset) internal returns (bool ok) {	//inject NONSTANDARD NAMING
    // Get asset's underlying token address and corresponding cToken address.
    address token;
    address cToken;
    if (asset == AssetType.DAI) {
      token = address(_dai127);
      cToken = address(_cdai935);
    } else {
      token = address(_usdc839);
      cToken = address(_cusdc425);
    }

    // Approve cToken contract to transfer underlying on behalf of this wallet.
    (ok, ) = address(token).call(abi.encodeWithSelector(
      // Note: since both cTokens have the same interface, just use cDAI's.
      _dai127.APPROVE791.selector, cToken, uint256(-1)
    ));

    // Emit a corresponding event if the approval failed.
    if (!ok) {
      if (asset == AssetType.DAI) {
        emit EXTERNALERROR983(address(_dai127), "DAI contract reverted on approval.");
      } else {
        // Find out why USDC transfer reverted (it doesn't give revert reasons).
        _DIAGNOSEANDEMITUSDCSPECIFICERROR52(_usdc839.APPROVE791.selector);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _DEPOSITONCOMPOUND537(AssetType asset, uint256 balance) internal {	//inject NONSTANDARD NAMING
    // Only perform a deposit if the balance is at least .001 Dai or USDC.
    if (
      asset == AssetType.DAI && balance > _just_under_one_1000th_dai126 ||
      asset == AssetType.USDC && balance > _just_under_one_1000th_usdc691
    ) {
      // Get cToken address for the asset type.
      address cToken = asset == AssetType.DAI ? address(_cdai935) : address(_cusdc425);

      // Attempt to mint the balance on the cToken contract.
      (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
        // Note: since both cTokens have the same interface, just use cDAI's.
        _cdai935.MINT754.selector, balance
      ));

      // Log an external error if something went wrong with the attempt.
      _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
        asset, _cdai935.MINT754.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function _WITHDRAWFROMCOMPOUND660(	//inject NONSTANDARD NAMING
    AssetType asset,
    uint256 balance
  ) internal returns (bool success) {
    // Get cToken address for the asset type. (No custom ETH withdrawal action.)
    address cToken = asset == AssetType.DAI ? address(_cdai935) : address(_cusdc425);

    // Attempt to redeem the underlying balance from the cToken contract.
    (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
      // Note: function selector is the same for each cToken so just use cDAI's.
      _cdai935.REDEEMUNDERLYING524.selector, balance
    ));

    // Log an external error if something went wrong with the attempt.
    success = _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
      asset, _cdai935.REDEEMUNDERLYING524.selector, ok, data
    );
  }

                                                                                                                                                                                                                                                                                                                                                
  function _WITHDRAWMAXFROMCOMPOUND520(AssetType asset) internal {	//inject NONSTANDARD NAMING
    // Get cToken address for the asset type. (No custom ETH withdrawal action.)
    address cToken = (
      asset == AssetType.DAI ? address(_cdai935) : (
        asset == AssetType.USDC ? address(_cusdc425) : address(_csai847)
      )
    );

    // Get the current cToken balance for this account.
    uint256 redeemAmount = IERC20(cToken).BALANCEOF524(address(this));

    // Only perform the call to redeem if there is a non-zero balance.
    if (redeemAmount > 0) {
      // Attempt to redeem the underlying balance from the cToken contract.
      (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
        // Function selector is the same for all cTokens, so just use cDAI's.
        _cdai935.REDEEM71.selector, redeemAmount
      ));

      // Log an external error if something went wrong with the attempt.
      _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
        asset, _cdai935.REDEEM71.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _TRANSFERMAX712(	//inject NONSTANDARD NAMING
    IERC20 token, address recipient, bool suppressRevert
  ) internal returns (bool success) {
    // Get the current balance on the smart wallet for the supplied ERC20 token.
    uint256 transferAmount = token.BALANCEOF524(address(this));

    // Only perform the call to transfer if there is a non-zero balance.
    if (transferAmount > 0) {
      if (!suppressRevert) {
        // Perform the transfer and pass along the returned boolean (or revert).
        success = token.TRANSFER431(recipient, transferAmount);
      } else {
        // Attempt transfer with 1/2 gas, allow reverts, and return call status.
        (success, ) = address(token).call.gas(gasleft() / 2)(
          abi.encodeWithSelector(
            token.TRANSFER431.selector, recipient, transferAmount
          )
        );
      }
    } else {
      // Skip the transfer and return true.
      success = true;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _TRANSFERETH635(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 amount
  ) internal returns (bool success) {
    // Attempt to transfer any Ether to caller and emit an event if it fails.
    (success, ) = recipient.call.gas(_eth_transfer_gas177).value(amount)("");
    if (!success) {
      emit EXTERNALERROR983(recipient, "Recipient rejected ether transfer.");
    } else {
      emit ETHWITHDRAWAL270(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function _VALIDATEACTIONANDINCREMENTNONCE896(	//inject NONSTANDARD NAMING
    ActionType action,
    bytes memory arguments,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) internal returns (bytes32 actionID, uint256 actionNonce) {
    // Ensure that the current gas exceeds the minimum required action gas.
    // This prevents griefing attacks where an attacker can invalidate a
    // signature without providing enough gas for the action to succeed. Also
    // note that some gas will be spent before this check is reached - supplying
    // ~30,000 additional gas should suffice when submitting transactions. To
    // skip this requirement, supply zero for the minimumActionGas argument.
    if (minimumActionGas != 0) {
      require(
        gasleft() >= minimumActionGas,
        "Invalid action - insufficient gas supplied by transaction submitter."
      );
    }

    // Get the current nonce for the action to be performed.
    actionNonce = _nonce;

    // Get the user signing key that will be used to verify their signature.
    address userSigningKey = _userSigningKey;

    // Get the Dharma signing key that will be used to verify their signature.
    address dharmaSigningKey = _GETDHARMASIGNINGKEY287();

    // Determine the actionID - this serves as the signature hash.
    actionID = _GETACTIONID433(
      action,
      arguments,
      actionNonce,
      minimumActionGas,
      userSigningKey,
      dharmaSigningKey
    );

    // Compute the message hash - the hashed, EIP-191-0x45-prefixed action ID.
    bytes32 messageHash = actionID.TOETHSIGNEDMESSAGEHASH691();

    // Actions other than Cancel require both signatures; Cancel only needs one.
    if (action != ActionType.Cancel) {
      // Validate user signing key signature unless it is `msg.sender`.
      if (msg.sender != userSigningKey) {
        require(
          _VALIDATEUSERSIGNATURE878(
            messageHash, action, arguments, userSigningKey, userSignature
          ),
          "Invalid action - invalid user signature."
        );
      }

      // Validate Dharma signing key signature unless it is `msg.sender`.
      if (msg.sender != dharmaSigningKey) {
        require(
          dharmaSigningKey == messageHash.RECOVER508(dharmaSignature),
          "Invalid action - invalid Dharma signature."
        );
      }
    } else {
      // Validate signing key signature unless user or Dharma is `msg.sender`.
      if (msg.sender != userSigningKey && msg.sender != dharmaSigningKey) {
        require(
          dharmaSigningKey == messageHash.RECOVER508(dharmaSignature) ||
          _VALIDATEUSERSIGNATURE878(
            messageHash, action, arguments, userSigningKey, userSignature
          ),
          "Invalid action - invalid signature."
        );
      }
    }

    // Increment nonce in order to prevent reuse of signatures after the call.
    _nonce++;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(	//inject NONSTANDARD NAMING
    AssetType asset,
    bytes4 functionSelector,
    bool ok,
    bytes memory data
  ) internal returns (bool success) {
    // Log an external error if something went wrong with the attempt.
    if (ok) {
      uint256 compoundError = abi.decode(data, (uint256));
      if (compoundError != _compound_success773) {
        // Get called contract address, name of contract, and function name.
        (address account, string memory name, string memory functionName) = (
          _GETCTOKENDETAILS203(asset, functionSelector)
        );

        emit EXTERNALERROR983(
          account,
          string(
            abi.encodePacked(
              "Compound ",
              name,
              " contract returned error code ",
              uint8((compoundError / 10) + 48),
              uint8((compoundError % 10) + 48),
              " while attempting to call ",
              functionName,
              "."
            )
          )
        );
      } else {
        success = true;
      }
    } else {
      // Get called contract address, name of contract, and function name.
      (address account, string memory name, string memory functionName) = (
        _GETCTOKENDETAILS203(asset, functionSelector)
      );

      // Decode the revert reason in the event one was returned.
      string memory revertReason = _DECODEREVERTREASON390(data);

      emit EXTERNALERROR983(
        account,
        string(
          abi.encodePacked(
            "Compound ",
            name,
            " contract reverted while attempting to call ",
            functionName,
            ": ",
            revertReason
          )
        )
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                       
  function _DIAGNOSEANDEMITUSDCSPECIFICERROR52(bytes4 functionSelector) internal {	//inject NONSTANDARD NAMING
    // Determine the name of the function that was called on USDC.
    string memory functionName;
    if (functionSelector == _usdc839.TRANSFER431.selector) {
      functionName = "transfer";
    } else {
      functionName = "approve";
    }

    // Find out why USDC transfer reverted (it doesn't give revert reasons).
    if (_usdc_naughty871.ISBLACKLISTED773(address(this))) {
      emit EXTERNALERROR983(
        address(_usdc839),
        string(
          abi.encodePacked(
            functionName, " failed - USDC has blacklisted this user."
          )
        )
      );
    } else { // Note: `else if` breaks coverage.
      if (_usdc_naughty871.PAUSED275()) {
        emit EXTERNALERROR983(
          address(_usdc839),
          string(
            abi.encodePacked(
              functionName, " failed - USDC contract is currently paused."
            )
          )
        );
      } else {
        emit EXTERNALERROR983(
          address(_usdc839),
          string(
            abi.encodePacked(
              "USDC contract reverted on ", functionName, "."
            )
          )
        );
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function _ENFORCESELFCALLFROM832(bytes4 selfCallContext) internal {	//inject NONSTANDARD NAMING
    // Ensure caller is this contract and self-call context is correctly set.
    require(
      msg.sender == address(this) &&
      _selfCallContext == selfCallContext,
      "External accounts or unapproved internal functions cannot call this."
    );

    // Clear the self-call context.
    delete _selfCallContext;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _VALIDATEUSERSIGNATURE878(	//inject NONSTANDARD NAMING
    bytes32 messageHash,
    ActionType action,
    bytes memory arguments,
    address userSigningKey,
    bytes memory userSignature
  ) internal view returns (bool valid) {
    if (!userSigningKey.ISCONTRACT624()) {
      valid = userSigningKey == messageHash.RECOVER508(userSignature);
    } else {
      bytes memory data = abi.encode(messageHash, action, arguments);
      valid = (
        ERC1271(userSigningKey).ISVALIDSIGNATURE229(
          data, userSignature
        ) == _erc_1271_magic_value605
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMASIGNINGKEY287() internal view returns (	//inject NONSTANDARD NAMING
    address dharmaSigningKey
  ) {
    dharmaSigningKey = _dharma_key_registry65.GETKEY28();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function _GETACTIONID433(	//inject NONSTANDARD NAMING
    ActionType action,
    bytes memory arguments,
    uint256 nonce,
    uint256 minimumActionGas,
    address userSigningKey,
    address dharmaSigningKey
  ) internal view returns (bytes32 actionID) {
    // actionID is constructed according to EIP-191-0x45 to prevent replays.
    actionID = keccak256(
      abi.encodePacked(
        address(this),
        _dharma_smart_wallet_version38,
        userSigningKey,
        dharmaSigningKey,
        nonce,
        minimumActionGas,
        action,
        arguments
      )
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _GETCTOKENDETAILS203(	//inject NONSTANDARD NAMING
    AssetType asset,
    bytes4 functionSelector
  ) internal pure returns (
    address account,
    string memory name,
    string memory functionName
  ) {
    if (asset == AssetType.DAI) {
      account = address(_cdai935);
      name = "cDAI";
    } else {
      account = address(_cusdc425);
      name = "cUSDC";
    }

    // Note: since both cTokens have the same interface, just use cDAI's.
    if (functionSelector == _cdai935.MINT754.selector) {
      functionName = "mint";
    } else {
      functionName = string(abi.encodePacked(
        "redeem",
        functionSelector == _cdai935.REDEEMUNDERLYING524.selector ? "Underlying" : ""
      ));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _ENSUREVALIDGENERICCALLTARGET44(address to) internal view {	//inject NONSTANDARD NAMING
    require(
      to.ISCONTRACT624(),
      "Invalid `to` parameter - must supply a contract address containing code."
    );

    require(
      to != address(this),
      "Invalid `to` parameter - cannot supply the address of this contract."
    );

    require(
      to != address(_escape_hatch_registry15),
      "Invalid `to` parameter - cannot supply the Dharma Escape Hatch Registry."
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(	//inject NONSTANDARD NAMING
    ActionType action, uint256 amount, address recipient
  ) internal pure returns (bytes memory arguments) {
    // Ensure that the action type is a valid custom action type.
    require(
      action == ActionType.Cancel ||
      action == ActionType.SetUserSigningKey ||
      action == ActionType.DAIWithdrawal ||
      action == ActionType.USDCWithdrawal ||
      action == ActionType.ETHWithdrawal ||
      action == ActionType.SetEscapeHatch ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch,
      "Invalid custom action type."
    );

    // Use action type to determine parameters to include in returned arguments.
    if (
      action == ActionType.Cancel ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch
    ) {
      // Ignore parameters for Cancel, RemoveEscapeHatch, or DisableEscapeHatch.
      arguments = abi.encode();
    } else if (
      action == ActionType.SetUserSigningKey ||
      action == ActionType.SetEscapeHatch
    ) {
      // Ignore `amount` parameter for other, non-withdrawal actions.
      arguments = abi.encode(recipient);
    } else {
      // Use both `amount` and `recipient` parameters for withdrawals.
      arguments = abi.encode(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON390(	//inject NONSTANDARD NAMING
    bytes memory revertData
  ) internal pure returns (string memory revertReason) {
    // Solidity prefixes revert reason with 0x08c379a0 -> Error(string) selector
    if (
      revertData.length > 68 && // prefix (4) + position (32) + length (32)
      revertData[0] == byte(0x08) &&
      revertData[1] == byte(0xc3) &&
      revertData[2] == byte(0x79) &&
      revertData[3] == byte(0xa0)
    ) {
      // Get the revert reason without the prefix from the revert data.
      bytes memory revertReasonBytes = new bytes(revertData.length - 4);
      for (uint256 i = 4; i < revertData.length; i++) {
        revertReasonBytes[i - 4] = revertData[i];
      }

      // Decode the resultant revert reason as a string.
      revertReason = abi.decode(revertReasonBytes, (string));
    } else {
      // Simply return the default, with no revert reason.
      revertReason = "(no revert reason)";
    }
  }
}