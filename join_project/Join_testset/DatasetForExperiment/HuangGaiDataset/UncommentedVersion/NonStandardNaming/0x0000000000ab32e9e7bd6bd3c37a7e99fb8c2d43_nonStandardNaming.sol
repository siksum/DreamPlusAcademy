                                                                 

pragma solidity 0.5.11; 


pragma experimental ABIEncoderV2;


interface DharmaSmartWalletImplementationV0Interface {
  
  event NEWUSERSIGNINGKEY471(address userSigningKey);	

  
  event EXTERNALERROR983(address indexed source, string revertReason);	

  
  enum AssetType {
    DAI,
    USDC,
    ETH,
    SAI
  }

  
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

  function INITIALIZE884(address userSigningKey) external;	

  function REPAYANDDEPOSIT415() external;	

  function WITHDRAWDAI448(	
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function WITHDRAWUSDC96(	
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function CANCEL884(	
    uint256 minimumActionGas,
    bytes calldata signature
  ) external;

  function SETUSERSIGNINGKEY345(	
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function GETBALANCES116() external returns (	
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 cDaiUnderlyingDaiBalance,
    uint256 cUSDCUnderlyingUSDCBalance,
    uint256 cEtherUnderlyingEtherBalance
  );

  function GETUSERSIGNINGKEY485() external view returns (address userSigningKey);	

  function GETNONCE302() external view returns (uint256 nonce);	

  function GETNEXTCUSTOMACTIONID877(	
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETCUSTOMACTIONID417(	
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETVERSION234() external pure returns (uint256 version);	
}


interface DharmaSmartWalletImplementationV1Interface {
  event CALLSUCCESS522(	
    bytes32 actionID,
    bool rolledBack,
    uint256 nonce,
    address to,
    bytes data,
    bytes returnData
  );

  event CALLFAILURE949(	
    bytes32 actionID,
    uint256 nonce,
    address to,
    bytes data,
    string revertReason
  );

  
  struct Call {
    address to;
    bytes data;
  }

  
  struct CallReturn {
    bool ok;
    bytes returnData;
  }

  function WITHDRAWETHER831(	
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function EXECUTEACTION767(	
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData);

  function RECOVER508(address newUserSigningKey) external;	

  function EXECUTEACTIONWITHATOMICBATCHCALLS836(	
    Call[] calldata calls,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool[] memory ok, bytes[] memory returnData);

  function GETNEXTGENERICACTIONID70(	
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICACTIONID876(	
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETNEXTGENERICATOMICBATCHACTIONID251(	
    Call[] calldata calls,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICATOMICBATCHACTIONID805(	
    Call[] calldata calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);
}


interface DharmaSmartWalletImplementationV3Interface {
  event CANCEL450(uint256 cancelledNonce);	
  event ETHWITHDRAWAL270(uint256 amount, address recipient);	
}


interface DharmaSmartWalletImplementationV4Interface {
  event ESCAPED929();	

  function SETESCAPEHATCH701(	
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function REMOVEESCAPEHATCH484(	
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function PERMANENTLYDISABLEESCAPEHATCH115(	
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function ESCAPE278() external;	
}


interface DharmaSmartWalletImplementationV6Interface {
  function MIGRATESAITODAI570() external;	
  function MIGRATECSAITOCDAI380() external;	
}


interface CTokenInterface {
  function MINT754(uint256 mintAmount) external returns (uint256 err);	
  function REDEEM71(uint256 redeemAmount) external returns (uint256 err);	
  function REDEEMUNDERLYING524(uint256 redeemAmount) external returns (uint256 err);	
  function BALANCEOF524(address account) external returns (uint256 balance);	
  function BALANCEOFUNDERLYING231(address account) external returns (uint256 balance);	
}


interface USDCV1Interface {
  function ISBLACKLISTED773(address _account) external view returns (bool);	
  function PAUSED275() external view returns (bool);	
}


interface DharmaKeyRegistryInterface {
  event NEWGLOBALKEY852(address oldGlobalKey, address newGlobalKey);	
  event NEWSPECIFICKEY387(	
    address indexed account, address oldSpecificKey, address newSpecificKey
  );

  function SETGLOBALKEY653(address globalKey, bytes calldata signature) external;	
  function SETSPECIFICKEY781(address account, address specificKey) external;	
  function GETKEY28() external view returns (address key);	
  function GETKEYFORUSER768(address account) external view returns (address key);	
  function GETGLOBALKEY550() external view returns (address globalKey);	
  function GETSPECIFICKEY391(address account) external view returns (address specificKey);	
}


interface DharmaEscapeHatchRegistryInterface {
  
  event ESCAPEHATCHMODIFIED924(	
    address indexed smartWallet, address oldEscapeHatch, address newEscapeHatch
  );

  
  event ESCAPEHATCHDISABLED313(address smartWallet);	

  
  
  struct EscapeHatch {
    address escapeHatch;
    bool disabled;
  }

  function SETESCAPEHATCH701(address newEscapeHatch) external;	

  function REMOVEESCAPEHATCH484() external;	

  function PERMANENTLYDISABLEESCAPEHATCH115() external;	

  function GETESCAPEHATCH363() external view returns (	
    bool exists, address escapeHatch
  );

  function GETESCAPEHATCHFORSMARTWALLET489(	
    address smartWallet
  ) external view returns (bool exists, address escapeHatch);

  function HASDISABLEDESCAPEHATCHFORSMARTWALLET92(	
    address smartWallet
  ) external view returns (bool disabled);
}


interface IERC20 {
  function BALANCEOF524(address account) external view returns (uint256);	
  function TRANSFER431(address recipient, uint256 amount) external returns (bool);	
  function ALLOWANCE863(address owner, address spender) external view returns (uint256);	
  function APPROVE791(address spender, uint256 amount) external returns (bool);	
}


interface ERC1271 {
  function ISVALIDSIGNATURE229(	
    bytes calldata data, bytes calldata signature
  ) external view returns (bytes4 magicValue);
}


interface SaiToDaiMigratorInterface {
  function SWAPSAITODAI843(uint256 balance) external;	
}


library Address {
    function ISCONTRACT624(address account) internal view returns (bool) {	
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


library ECDSA {
  function RECOVER508(bytes32 hash, bytes memory signature) internal pure returns (address) {	
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

  function TOETHSIGNEDMESSAGEHASH691(bytes32 hash) internal pure returns (bytes32) {	
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
  

  
  
  address private _userSigningKey;

  
  
  
  uint256 private _nonce;

  
  
  
  
  
  bytes4 internal _selfCallContext;

  

  
  uint256 internal constant _dharma_smart_wallet_version38 = 6;	

  
  DharmaKeyRegistryInterface internal constant _dharma_key_registry65 = (	
    DharmaKeyRegistryInterface(0x000000000D38df53b45C5733c7b34000dE0BDF52)
  );

  
  
  address internal constant _account_recovery_manager424 = address(	
    0x0000000000DfEd903aD76996FC07BF89C0127B1E
  );

  
  
  DharmaEscapeHatchRegistryInterface internal constant _escape_hatch_registry15 = (	
    DharmaEscapeHatchRegistryInterface(0x00000000005280B515004B998a944630B6C663f8)
  );

  
  CTokenInterface internal constant _csai847 = CTokenInterface(	
    0xF5DCe57282A584D2746FaF1593d3121Fcac444dC 
  );

  CTokenInterface internal constant _cdai935 = CTokenInterface(	
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643 
  );

  CTokenInterface internal constant _cusdc425 = CTokenInterface(	
    0x39AA39c021dfbaE8faC545936693aC917d5E7563 
  );

  IERC20 internal constant _sai44 = IERC20(	
    0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359 
  );

  IERC20 internal constant _dai127 = IERC20(	
    0x6B175474E89094C44Da98b954EedeAC495271d0F 
  );

  IERC20 internal constant _usdc839 = IERC20(	
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 
  );

  SaiToDaiMigratorInterface internal constant _migrator723 = SaiToDaiMigratorInterface(	
    0xc73e0383F3Aff3215E6f04B0331D58CeCf0Ab849 
  );

  USDCV1Interface internal constant _usdc_naughty871 = USDCV1Interface(	
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 
  );

  
  uint256 internal constant _compound_success773 = 0;	

  
  bytes4 internal constant _erc_1271_magic_value605 = bytes4(0x20c13b0b);	

  
  uint256 private constant _just_under_one_1000th_dai126 = 999999999999999;	
  uint256 private constant _just_under_one_1000th_usdc691 = 999;	

  
  uint256 private constant _eth_transfer_gas177 = 4999;	

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function INITIALIZE884(address userSigningKey) external {	
    
    assembly { if extcodesize(address) { revert(0, 0) } }

    
    _SETUSERSIGNINGKEY185(userSigningKey);

    
    if (_SETFULLAPPROVAL335(AssetType.DAI)) {
      
      uint256 daiBalance = _dai127.BALANCEOF524(address(this));

      
      _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
    }

    
    if (_SETFULLAPPROVAL335(AssetType.USDC)) {
      
      uint256 usdcBalance = _usdc839.BALANCEOF524(address(this));

      
      _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function REPAYANDDEPOSIT415() external {	
    
    uint256 daiBalance = _dai127.BALANCEOF524(address(this));

    
    if (daiBalance > 0) {
      uint256 daiAllowance = _dai127.ALLOWANCE863(address(this), address(_cdai935));
      
      if (daiAllowance < daiBalance) {
        if (_SETFULLAPPROVAL335(AssetType.DAI)) {
          
          _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
        }
      
      } else {
        
        _DEPOSITONCOMPOUND537(AssetType.DAI, daiBalance);
      }
    }

    
    uint256 usdcBalance = _usdc839.BALANCEOF524(address(this));

    
    if (usdcBalance > 0) {
      uint256 usdcAllowance = _usdc839.ALLOWANCE863(address(this), address(_cusdc425));
      
      if (usdcAllowance < usdcBalance) {
        if (_SETFULLAPPROVAL335(AssetType.USDC)) {
          
          _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
        }
      
      } else {
        
        _DEPOSITONCOMPOUND537(AssetType.USDC, usdcBalance);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function WITHDRAWDAI448(	
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.DAIWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    require(amount > _just_under_one_1000th_dai126, "Insufficient Dai supplied.");

    
    require(recipient != address(0), "No recipient supplied.");

    
    _selfCallContext = this.WITHDRAWDAI448.selector;

    
    
    
    
    
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWDAIATOMIC144.selector, amount, recipient
    ));

    
    if (!ok) {
      emit EXTERNALERROR983(address(_dai127), "Could not transfer Dai.");
    } else {
      
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function _WITHDRAWDAIATOMIC144(	
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    
    _ENFORCESELFCALLFROM832(this.WITHDRAWDAI448.selector);

    
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      
      _WITHDRAWMAXFROMCOMPOUND520(AssetType.DAI);

      
      require(_TRANSFERMAX712(_dai127, recipient, false));
      success = true;
    } else {
      
      if (_WITHDRAWFROMCOMPOUND660(AssetType.DAI, amount)) {
        
        require(_dai127.TRANSFER431(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function WITHDRAWUSDC96(	
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.USDCWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    require(amount > _just_under_one_1000th_usdc691, "Insufficient USDC supplied.");

    
    require(recipient != address(0), "No recipient supplied.");

    
    _selfCallContext = this.WITHDRAWUSDC96.selector;

    
    
    
    
    
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWUSDCATOMIC330.selector, amount, recipient
    ));
    if (!ok) {
      
      _DIAGNOSEANDEMITUSDCSPECIFICERROR52(_usdc839.TRANSFER431.selector);
    } else {
      
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _WITHDRAWUSDCATOMIC330(	
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    
    _ENFORCESELFCALLFROM832(this.WITHDRAWUSDC96.selector);

    
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      
      _WITHDRAWMAXFROMCOMPOUND520(AssetType.USDC);

      
      require(_TRANSFERMAX712(_usdc839, recipient, false));
      success = true;
    } else {
      
      if (_WITHDRAWFROMCOMPOUND660(AssetType.USDC, amount)) {
        
        require(_usdc839.TRANSFER431(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function WITHDRAWETHER831(	
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.ETHWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    require(amount > 0, "Must supply a non-zero amount of Ether.");

    
    require(recipient != address(0), "No recipient supplied.");

    
    ok = _TRANSFERETH635(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function CANCEL884(	
    uint256 minimumActionGas,
    bytes calldata signature
  ) external {
    
    uint256 nonceToCancel = _nonce;

    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.Cancel,
      abi.encode(),
      minimumActionGas,
      signature,
      signature
    );

    
    emit CANCEL450(nonceToCancel);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function EXECUTEACTION767(	
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData) {
    
    _ENSUREVALIDGENERICCALLTARGET44(to);

    
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.Generic,
      abi.encode(to, data),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    
    
    

    
    (ok, returnData) = to.call(data);

    
    if (ok) {
      
      
      emit CALLSUCCESS522(actionID, false, nonce, to, data, returnData);
    } else {
      
      
      emit CALLFAILURE949(actionID, nonce, to, data, string(returnData));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function SETUSERSIGNINGKEY345(	
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.SetUserSigningKey,
      abi.encode(userSigningKey),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    _SETUSERSIGNINGKEY185(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function SETESCAPEHATCH701(	
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.SetEscapeHatch,
      abi.encode(account),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    require(account != address(0), "Must supply an escape hatch account.");

    
    _escape_hatch_registry15.SETESCAPEHATCH701(account);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function REMOVEESCAPEHATCH484(	
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.RemoveEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    _escape_hatch_registry15.REMOVEESCAPEHATCH484();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function PERMANENTLYDISABLEESCAPEHATCH115(	
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    
    _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.DisableEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    _escape_hatch_registry15.PERMANENTLYDISABLEESCAPEHATCH115();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function ESCAPE278() external {	
    
    (bool exists, address escapeHatch) = _escape_hatch_registry15.GETESCAPEHATCH363();

    
    require(exists, "No escape hatch is currently set for this smart wallet.");

    
    require(
      msg.sender == escapeHatch,
      "Only the escape hatch account may call this function."
    );

    
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.SAI);

    
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.DAI);

    
    _WITHDRAWMAXFROMCOMPOUND520(AssetType.USDC);

    
    _TRANSFERMAX712(_sai44, msg.sender, true);

    
    _TRANSFERMAX712(_dai127, msg.sender, true);

    
    _TRANSFERMAX712(_usdc839, msg.sender, true);

    
    _TRANSFERMAX712(IERC20(address(_csai847)), msg.sender, true);

    
    _TRANSFERMAX712(IERC20(address(_cdai935)), msg.sender, true);

    
    _TRANSFERMAX712(IERC20(address(_cusdc425)), msg.sender, true);

    
    uint256 balance = address(this).balance;
    if (balance > 0) {
      
      _TRANSFERETH635(msg.sender, balance);
    }

    
    emit ESCAPED929();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function RECOVER508(address newUserSigningKey) external {	
    require(
      msg.sender == _account_recovery_manager424,
      "Only the account recovery manager may call this function."
    );

    
    _nonce++;

    
    _SETUSERSIGNINGKEY185(newUserSigningKey);
  }

                                                                                                                                                                                                                                 
  function MIGRATESAITODAI570() external {	
    
    _SWAPSAIFORDAI811(_sai44.BALANCEOF524(address(this)));
  }

                                                                                                                                                                                                                                                                                                            
  function MIGRATECSAITOCDAI380() external {	
    
    uint256 redeemAmount = _csai847.BALANCEOF524(address(this));

    
    if (redeemAmount > 0) {
      
      uint256 currentSaiBalance = _sai44.BALANCEOF524(address(this));

      
      require(
        _csai847.REDEEM71(redeemAmount) == _compound_success773, "cSai redeem failed."
      );

      
      uint256 saiBalance = _sai44.BALANCEOF524(address(this)) - currentSaiBalance;

      
      uint256 daiBalance = _SWAPSAIFORDAI811(saiBalance);
      
      
      if (_dai127.ALLOWANCE863(address(this), address(_cdai935)) < daiBalance) {
        require(
          _dai127.APPROVE791(address(_cdai935), uint256(-1)), "Dai approval failed."
        );
      }
      
      
      require(_cdai935.MINT754(daiBalance) == _compound_success773, "cDai mint failed.");
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function GETBALANCES116() external returns (	
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance, 
    uint256 cDaiUnderlyingDaiBalance,
    uint256 cUsdcUnderlyingUsdcBalance,
    uint256 cEtherUnderlyingEtherBalance 
  ) {
    daiBalance = _dai127.BALANCEOF524(address(this));
    usdcBalance = _usdc839.BALANCEOF524(address(this));
    cDaiUnderlyingDaiBalance = _cdai935.BALANCEOFUNDERLYING231(address(this));
    cUsdcUnderlyingUsdcBalance = _cusdc425.BALANCEOFUNDERLYING231(address(this));
  }

                                                                                                                                                     
  function GETUSERSIGNINGKEY485() external view returns (address userSigningKey) {	
    userSigningKey = _userSigningKey;
  }

                                                                                                                                                                                                                                             
  function GETNONCE302() external view returns (uint256 nonce) {	
    nonce = _nonce;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETNEXTCUSTOMACTIONID877(	
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(action, amount, recipient),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETCUSTOMACTIONID417(	
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(action, amount, recipient),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function GETNEXTGENERICACTIONID70(	
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      ActionType.Generic,
      abi.encode(to, data),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETGENERICACTIONID876(	
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      ActionType.Generic,
      abi.encode(to, data),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                 
  function GETVERSION234() external pure returns (uint256 version) {	
    version = _dharma_smart_wallet_version38;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function EXECUTEACTIONWITHATOMICBATCHCALLS836(	
    Call[] memory calls,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) public returns (bool[] memory ok, bytes[] memory returnData) {
    
    for (uint256 i = 0; i < calls.length; i++) {
      _ENSUREVALIDGENERICCALLTARGET44(calls[i].to);
    }

    
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE896(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    
    
    
    

    
    ok = new bool[](calls.length);
    returnData = new bytes[](calls.length);

    
    _selfCallContext = this.EXECUTEACTIONWITHATOMICBATCHCALLS836.selector;

    
    
    (bool externalOk, bytes memory rawCallResults) = address(this).call(
      abi.encodeWithSelector(
        this._EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC441.selector, calls
      )
    );

    
    CallReturn[] memory callResults = abi.decode(rawCallResults, (CallReturn[]));
    for (uint256 i = 0; i < callResults.length; i++) {
      Call memory currentCall = calls[i];

      
      ok[i] = callResults[i].ok;
      returnData[i] = callResults[i].returnData;

      
      if (callResults[i].ok) {
        
        
        emit CALLSUCCESS522(
          actionID,
          !externalOk, 
          nonce,
          currentCall.to,
          currentCall.data,
          callResults[i].returnData
        );
      } else {
        
        
        emit CALLFAILURE949(
          actionID,
          nonce,
          currentCall.to,
          currentCall.data,
          string(callResults[i].returnData)
        );

        
        break;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC441(	
    Call[] memory calls
  ) public returns (CallReturn[] memory callResults) {
    
    _ENFORCESELFCALLFROM832(this.EXECUTEACTIONWITHATOMICBATCHCALLS836.selector);

    bool rollBack = false;
    callResults = new CallReturn[](calls.length);

    for (uint256 i = 0; i < calls.length; i++) {
      
      (bool ok, bytes memory returnData) = calls[i].to.call(calls[i].data);
      callResults[i] = CallReturn({ok: ok, returnData: returnData});
      if (!ok) {
        
        rollBack = true;
        break;
      }
    }

    if (rollBack) {
      
      bytes memory callResultsBytes = abi.encode(callResults);
      assembly { revert(add(32, callResultsBytes), mload(callResultsBytes)) }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function GETNEXTGENERICATOMICBATCHACTIONID251(	
    Call[] memory calls,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function GETGENERICATOMICBATCHACTIONID805(	
    Call[] memory calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    
    actionID = _GETACTIONID433(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY287()
    );
  }

                                                                                                                                                                                                                                                                                                                                       
  function _SETUSERSIGNINGKEY185(address userSigningKey) internal {	
    
    require(userSigningKey != address(0), "No user signing key provided.");

    _userSigningKey = userSigningKey;
    emit NEWUSERSIGNINGKEY471(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                  
  function _SWAPSAIFORDAI811(uint256 saiToSwap) internal returns (uint256 dai) {	
    
    if (saiToSwap > 0) {
      uint256 allowance = _sai44.ALLOWANCE863(address(this), address(_migrator723));
      
      
      if (saiToSwap > allowance) {
        
        require(
          _sai44.APPROVE791(address(_migrator723), uint256(-1)), "Sai approval failed."
        );
      }

      
      uint256 currentDaiBalance = _dai127.BALANCEOF524(address(this));

      
      _migrator723.SWAPSAITODAI843(saiToSwap);

      
      dai = _dai127.BALANCEOF524(address(this)) - currentDaiBalance;

      
      require(dai >= saiToSwap, "Exchange rate cannot be below 1:1.");
    } else {
      
      dai = 0;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                     
  function _SETFULLAPPROVAL335(AssetType asset) internal returns (bool ok) {	
    
    address token;
    address cToken;
    if (asset == AssetType.DAI) {
      token = address(_dai127);
      cToken = address(_cdai935);
    } else {
      token = address(_usdc839);
      cToken = address(_cusdc425);
    }

    
    (ok, ) = address(token).call(abi.encodeWithSelector(
      
      _dai127.APPROVE791.selector, cToken, uint256(-1)
    ));

    
    if (!ok) {
      if (asset == AssetType.DAI) {
        emit EXTERNALERROR983(address(_dai127), "DAI contract reverted on approval.");
      } else {
        
        _DIAGNOSEANDEMITUSDCSPECIFICERROR52(_usdc839.APPROVE791.selector);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _DEPOSITONCOMPOUND537(AssetType asset, uint256 balance) internal {	
    
    if (
      asset == AssetType.DAI && balance > _just_under_one_1000th_dai126 ||
      asset == AssetType.USDC && balance > _just_under_one_1000th_usdc691
    ) {
      
      address cToken = asset == AssetType.DAI ? address(_cdai935) : address(_cusdc425);

      
      (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
        
        _cdai935.MINT754.selector, balance
      ));

      
      _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
        asset, _cdai935.MINT754.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function _WITHDRAWFROMCOMPOUND660(	
    AssetType asset,
    uint256 balance
  ) internal returns (bool success) {
    
    address cToken = asset == AssetType.DAI ? address(_cdai935) : address(_cusdc425);

    
    (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
      
      _cdai935.REDEEMUNDERLYING524.selector, balance
    ));

    
    success = _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
      asset, _cdai935.REDEEMUNDERLYING524.selector, ok, data
    );
  }

                                                                                                                                                                                                                                                                                                                                                
  function _WITHDRAWMAXFROMCOMPOUND520(AssetType asset) internal {	
    
    address cToken = (
      asset == AssetType.DAI ? address(_cdai935) : (
        asset == AssetType.USDC ? address(_cusdc425) : address(_csai847)
      )
    );

    
    uint256 redeemAmount = IERC20(cToken).BALANCEOF524(address(this));

    
    if (redeemAmount > 0) {
      
      (bool ok, bytes memory data) = cToken.call(abi.encodeWithSelector(
        
        _cdai935.REDEEM71.selector, redeemAmount
      ));

      
      _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(
        asset, _cdai935.REDEEM71.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _TRANSFERMAX712(	
    IERC20 token, address recipient, bool suppressRevert
  ) internal returns (bool success) {
    
    uint256 transferAmount = token.BALANCEOF524(address(this));

    
    if (transferAmount > 0) {
      if (!suppressRevert) {
        
        success = token.TRANSFER431(recipient, transferAmount);
      } else {
        
        (success, ) = address(token).call.gas(gasleft() / 2)(
          abi.encodeWithSelector(
            token.TRANSFER431.selector, recipient, transferAmount
          )
        );
      }
    } else {
      
      success = true;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _TRANSFERETH635(	
    address payable recipient, uint256 amount
  ) internal returns (bool success) {
    
    (success, ) = recipient.call.gas(_eth_transfer_gas177).value(amount)("");
    if (!success) {
      emit EXTERNALERROR983(recipient, "Recipient rejected ether transfer.");
    } else {
      emit ETHWITHDRAWAL270(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function _VALIDATEACTIONANDINCREMENTNONCE896(	
    ActionType action,
    bytes memory arguments,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) internal returns (bytes32 actionID, uint256 actionNonce) {
    
    
    
    
    
    
    if (minimumActionGas != 0) {
      require(
        gasleft() >= minimumActionGas,
        "Invalid action - insufficient gas supplied by transaction submitter."
      );
    }

    
    actionNonce = _nonce;

    
    address userSigningKey = _userSigningKey;

    
    address dharmaSigningKey = _GETDHARMASIGNINGKEY287();

    
    actionID = _GETACTIONID433(
      action,
      arguments,
      actionNonce,
      minimumActionGas,
      userSigningKey,
      dharmaSigningKey
    );

    
    bytes32 messageHash = actionID.TOETHSIGNEDMESSAGEHASH691();

    
    if (action != ActionType.Cancel) {
      
      if (msg.sender != userSigningKey) {
        require(
          _VALIDATEUSERSIGNATURE878(
            messageHash, action, arguments, userSigningKey, userSignature
          ),
          "Invalid action - invalid user signature."
        );
      }

      
      if (msg.sender != dharmaSigningKey) {
        require(
          dharmaSigningKey == messageHash.RECOVER508(dharmaSignature),
          "Invalid action - invalid Dharma signature."
        );
      }
    } else {
      
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

    
    _nonce++;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function _CHECKCOMPOUNDINTERACTIONANDLOGANYERRORS464(	
    AssetType asset,
    bytes4 functionSelector,
    bool ok,
    bytes memory data
  ) internal returns (bool success) {
    
    if (ok) {
      uint256 compoundError = abi.decode(data, (uint256));
      if (compoundError != _compound_success773) {
        
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
      
      (address account, string memory name, string memory functionName) = (
        _GETCTOKENDETAILS203(asset, functionSelector)
      );

      
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

                                                                                                                                                                                                                                                                                                                                                                                       
  function _DIAGNOSEANDEMITUSDCSPECIFICERROR52(bytes4 functionSelector) internal {	
    
    string memory functionName;
    if (functionSelector == _usdc839.TRANSFER431.selector) {
      functionName = "transfer";
    } else {
      functionName = "approve";
    }

    
    if (_usdc_naughty871.ISBLACKLISTED773(address(this))) {
      emit EXTERNALERROR983(
        address(_usdc839),
        string(
          abi.encodePacked(
            functionName, " failed - USDC has blacklisted this user."
          )
        )
      );
    } else { 
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function _ENFORCESELFCALLFROM832(bytes4 selfCallContext) internal {	
    
    require(
      msg.sender == address(this) &&
      _selfCallContext == selfCallContext,
      "External accounts or unapproved internal functions cannot call this."
    );

    
    delete _selfCallContext;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _VALIDATEUSERSIGNATURE878(	
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

                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMASIGNINGKEY287() internal view returns (	
    address dharmaSigningKey
  ) {
    dharmaSigningKey = _dharma_key_registry65.GETKEY28();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function _GETACTIONID433(	
    ActionType action,
    bytes memory arguments,
    uint256 nonce,
    uint256 minimumActionGas,
    address userSigningKey,
    address dharmaSigningKey
  ) internal view returns (bytes32 actionID) {
    
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _GETCTOKENDETAILS203(	
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

    
    if (functionSelector == _cdai935.MINT754.selector) {
      functionName = "mint";
    } else {
      functionName = string(abi.encodePacked(
        "redeem",
        functionSelector == _cdai935.REDEEMUNDERLYING524.selector ? "Underlying" : ""
      ));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _ENSUREVALIDGENERICCALLTARGET44(address to) internal view {	
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS864(	
    ActionType action, uint256 amount, address recipient
  ) internal pure returns (bytes memory arguments) {
    
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

    
    if (
      action == ActionType.Cancel ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch
    ) {
      
      arguments = abi.encode();
    } else if (
      action == ActionType.SetUserSigningKey ||
      action == ActionType.SetEscapeHatch
    ) {
      
      arguments = abi.encode(recipient);
    } else {
      
      arguments = abi.encode(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON390(	
    bytes memory revertData
  ) internal pure returns (string memory revertReason) {
    
    if (
      revertData.length > 68 && 
      revertData[0] == byte(0x08) &&
      revertData[1] == byte(0xc3) &&
      revertData[2] == byte(0x79) &&
      revertData[3] == byte(0xa0)
    ) {
      
      bytes memory revertReasonBytes = new bytes(revertData.length - 4);
      for (uint256 i = 4; i < revertData.length; i++) {
        revertReasonBytes[i - 4] = revertData[i];
      }

      
      revertReason = abi.decode(revertReasonBytes, (string));
    } else {
      
      revertReason = "(no revert reason)";
    }
  }
}