/**
 *Submitted for verification at Etherscan.io on 2020-09-02
*/

pragma solidity 0.4.25;

// File: contracts/sogur/interfaces/ISGATokenManager.sol

/**
 * @title SGA Token Manager Interface.
 */
interface ISGATokenManager {
    /**
     * @dev Exchange ETH for SGA.
     * @param _sender The address of the sender.
     * @param _ethAmount The amount of ETH received.
     * @return The amount of SGA that the sender is entitled to.
     */
    function exchangeEthForSga(address _sender, uint256 _ethAmount) external returns (uint256);

    /**
     * @dev Exchange SGA for ETH.
     * @param _sender The address of the sender.
     * @param _sgaAmount The amount of SGA received.
     * @return The amount of ETH that the sender is entitled to.
     */
    function exchangeSgaForEth(address _sender, uint256 _sgaAmount) external returns (uint256);

    /**
     * @dev Handle direct SGA transfer.
     * @param _sender The address of the sender.
     * @param _to The address of the destination account.
     * @param _value The amount of SGA to be transferred.
     */
    function uponTransfer(address _sender, address _to, uint256 _value) external;

    /**
     * @dev Handle custodian SGA transfer.
     * @param _sender The address of the sender.
     * @param _from The address of the source account.
     * @param _to The address of the destination account.
     * @param _value The amount of SGA to be transferred.
     */
    function uponTransferFrom(address _sender, address _from, address _to, uint256 _value) external;

    /**
     * @dev Handle the operation of ETH deposit into the SGAToken contract.
     * @param _sender The address of the account which has issued the operation.
     * @param _balance The amount of ETH in the SGAToken contract.
     * @param _amount The deposited ETH amount.
     * @return The address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     */
    function uponDeposit(address _sender, uint256 _balance, uint256 _amount) external returns (address, uint256);

    /**
     * @dev Handle the operation of ETH withdrawal from the SGAToken contract.
     * @param _sender The address of the account which has issued the operation.
     * @param _balance The amount of ETH in the SGAToken contract prior the withdrawal.
     * @return The address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     */
    function uponWithdraw(address _sender, uint256 _balance) external returns (address, uint256);

    /**
     * @dev Upon SGA mint for SGN holders.
     * @param _value The amount of SGA to mint.
     */
    function uponMintSgaForSgnHolders(uint256 _value) external;

    /**
     * @dev Upon SGA transfer to an SGN holder.
     * @param _to The address of the SGN holder.
     * @param _value The amount of SGA to transfer.
     */
    function uponTransferSgaToSgnHolder(address _to, uint256 _value) external;

    /**
     * @dev Upon ETH transfer to an SGA holder.
     * @param _to The address of the SGA holder.
     * @param _value The amount of ETH to transfer.
     * @param _status The operation's completion-status.
     */
    function postTransferEthToSgaHolder(address _to, uint256 _value, bool _status) external;

    /**
     * @dev Get the address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     * @return The address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     */
    function getDepositParams() external view returns (address, uint256);

    /**
     * @dev Get the address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     * @return The address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     */
    function getWithdrawParams() external view returns (address, uint256);
}

// File: contracts/sogur/interfaces/IReserveManager.sol

/**
 * @title Reserve Manager Interface.
 */
interface IReserveManager {
    /**
     * @dev Get a deposit-recommendation.
     * @param _balance The balance of the token-contract.
     * @return The address of the wallet permitted to deposit ETH into the token-contract.
     * @return The amount that should be deposited in order for the balance to reach `mid` ETH.
     */
    function getDepositParams(uint256 _balance) external view returns (address, uint256);

    /**
     * @dev Get a withdraw-recommendation.
     * @param _balance The balance of the token-contract.
     * @return The address of the wallet permitted to withdraw ETH into the token-contract.
     * @return The amount that should be withdrawn in order for the balance to reach `mid` ETH.
     */
    function getWithdrawParams(uint256 _balance) external view returns (address, uint256);
}

// File: contracts/contract_address_locator/interfaces/IContractAddressLocator.sol

/**
 * @title Contract Address Locator Interface.
 */
interface IContractAddressLocator {
    /**
     * @dev Get the contract address mapped to a given identifier.
     * @param _identifier The identifier.
     * @return The contract address.
     */
    function getContractAddress(bytes32 _identifier) external view returns (address);

    /**
     * @dev Determine whether or not a contract address relates to one of the identifiers.
     * @param _contractAddress The contract address to look for.
     * @param _identifiers The identifiers.
     * @return A boolean indicating if the contract address relates to one of the identifiers.
     */
    function isContractAddressRelates(address _contractAddress, bytes32[] _identifiers) external view returns (bool);
}

// File: contracts/contract_address_locator/ContractAddressLocatorHolder.sol

/**
 * @title Contract Address Locator Holder.
 * @dev Hold a contract address locator, which maps a unique identifier to every contract address in the system.
 * @dev Any contract which inherits from this contract can retrieve the address of any contract in the system.
 * @dev Thus, any contract can remain "oblivious" to the replacement of any other contract in the system.
 * @dev In addition to that, any function in any contract can be restricted to a specific caller.
 */
contract ContractAddressLocatorHolder {
    bytes32 internal constant _IAuthorizationDataSource_ = "IAuthorizationDataSource";
    bytes32 internal constant _ISGNConversionManager_    = "ISGNConversionManager"      ;
    bytes32 internal constant _IModelDataSource_         = "IModelDataSource"        ;
    bytes32 internal constant _IPaymentHandler_          = "IPaymentHandler"            ;
    bytes32 internal constant _IPaymentManager_          = "IPaymentManager"            ;
    bytes32 internal constant _IPaymentQueue_            = "IPaymentQueue"              ;
    bytes32 internal constant _IReconciliationAdjuster_  = "IReconciliationAdjuster"      ;
    bytes32 internal constant _IIntervalIterator_        = "IIntervalIterator"       ;
    bytes32 internal constant _IMintHandler_             = "IMintHandler"            ;
    bytes32 internal constant _IMintListener_            = "IMintListener"           ;
    bytes32 internal constant _IMintManager_             = "IMintManager"            ;
    bytes32 internal constant _IPriceBandCalculator_     = "IPriceBandCalculator"       ;
    bytes32 internal constant _IModelCalculator_         = "IModelCalculator"        ;
    bytes32 internal constant _IRedButton_               = "IRedButton"              ;
    bytes32 internal constant _IReserveManager_          = "IReserveManager"         ;
    bytes32 internal constant _ISagaExchanger_           = "ISagaExchanger"          ;
    bytes32 internal constant _ISogurExchanger_           = "ISogurExchanger"          ;
    bytes32 internal constant _SgnToSgrExchangeInitiator_ = "SgnToSgrExchangeInitiator"          ;
    bytes32 internal constant _IMonetaryModel_               = "IMonetaryModel"              ;
    bytes32 internal constant _IMonetaryModelState_          = "IMonetaryModelState"         ;
    bytes32 internal constant _ISGRAuthorizationManager_ = "ISGRAuthorizationManager";
    bytes32 internal constant _ISGRToken_                = "ISGRToken"               ;
    bytes32 internal constant _ISGRTokenManager_         = "ISGRTokenManager"        ;
    bytes32 internal constant _ISGRTokenInfo_         = "ISGRTokenInfo"        ;
    bytes32 internal constant _ISGNAuthorizationManager_ = "ISGNAuthorizationManager";
    bytes32 internal constant _ISGNToken_                = "ISGNToken"               ;
    bytes32 internal constant _ISGNTokenManager_         = "ISGNTokenManager"        ;
    bytes32 internal constant _IMintingPointTimersManager_             = "IMintingPointTimersManager"            ;
    bytes32 internal constant _ITradingClasses_          = "ITradingClasses"         ;
    bytes32 internal constant _IWalletsTradingLimiterValueConverter_        = "IWalletsTLValueConverter"       ;
    bytes32 internal constant _BuyWalletsTradingDataSource_       = "BuyWalletsTradingDataSource"      ;
    bytes32 internal constant _SellWalletsTradingDataSource_       = "SellWalletsTradingDataSource"      ;
    bytes32 internal constant _WalletsTradingLimiter_SGNTokenManager_          = "WalletsTLSGNTokenManager"         ;
    bytes32 internal constant _BuyWalletsTradingLimiter_SGRTokenManager_          = "BuyWalletsTLSGRTokenManager"         ;
    bytes32 internal constant _SellWalletsTradingLimiter_SGRTokenManager_          = "SellWalletsTLSGRTokenManager"         ;
    bytes32 internal constant _IETHConverter_             = "IETHConverter"   ;
    bytes32 internal constant _ITransactionLimiter_      = "ITransactionLimiter"     ;
    bytes32 internal constant _ITransactionManager_      = "ITransactionManager"     ;
    bytes32 internal constant _IRateApprover_      = "IRateApprover"     ;
    bytes32 internal constant _SGAToSGRInitializer_      = "SGAToSGRInitializer"     ;

    IContractAddressLocator private contractAddressLocator;

    /**
     * @dev Create the contract.
     * @param _contractAddressLocator The contract address locator.
     */
    constructor(IContractAddressLocator _contractAddressLocator) internal {
        require(_contractAddressLocator != address(0), "locator is illegal");
        contractAddressLocator = _contractAddressLocator;
    }

    /**
     * @dev Get the contract address locator.
     * @return The contract address locator.
     */
    function getContractAddressLocator() external view returns (IContractAddressLocator) {
        return contractAddressLocator;
    }

    /**
     * @dev Get the contract address mapped to a given identifier.
     * @param _identifier The identifier.
     * @return The contract address.
     */
    function getContractAddress(bytes32 _identifier) internal view returns (address) {
        return contractAddressLocator.getContractAddress(_identifier);
    }



    /**
     * @dev Determine whether or not the sender relates to one of the identifiers.
     * @param _identifiers The identifiers.
     * @return A boolean indicating if the sender relates to one of the identifiers.
     */
    function isSenderAddressRelates(bytes32[] _identifiers) internal view returns (bool) {
        return contractAddressLocator.isContractAddressRelates(msg.sender, _identifiers);
    }

    /**
     * @dev Verify that the caller is mapped to a given identifier.
     * @param _identifier The identifier.
     */
    modifier only(bytes32 _identifier) {
        require(msg.sender == getContractAddress(_identifier), "caller is illegal");
        _;
    }

}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, reverts on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b);

    return c;
  }

  /**
  * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0); // Solidity only automatically asserts when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
  * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

  /**
  * @dev Adds two numbers, reverts on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

  /**
  * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
  * reverts when dividing by zero.
  */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b != 0);
    return a % b;
  }
}

// File: contracts/sogur/TransferOnlySGATokenManager.sol

/**
 * Details of usage of licenced software see here: https://www.saga.org/software/readme_v1
 */

/**
 * @title Transfer Only SGA Token Manager.
 */
contract TransferOnlySGATokenManager is ISGATokenManager, ContractAddressLocatorHolder {
    string public constant VERSION = "1.0.0";
    using SafeMath for uint256;

    event WithdrawCompleted(address indexed _sender, uint256 _balance, uint256 _amount);

    /**
    * @dev Create the contract.
    * @param _contractAddressLocator The contract address locator.
    */
    constructor(IContractAddressLocator _contractAddressLocator) ContractAddressLocatorHolder(_contractAddressLocator) public {}

    
      /**
     * @dev Return the contract which implements the IReserveManager interface.
     */
    function getReserveManager() public view returns (IReserveManager) {
        return IReserveManager(getContractAddress(_IReserveManager_));
    }
    
    /**
     * @dev Exchange ETH for SGA.
     * @param _sender The address of the sender.
     * @param _ethAmount The amount of ETH received.
     * @return The amount of SGA that the sender is entitled to.
     */
    function exchangeEthForSga(address _sender, uint256 _ethAmount) external returns (uint256) {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _sender;
        _ethAmount;
        return 0;
    }

    /**
     * @dev Exchange SGA for ETH.
     * @param _sender The address of the sender.
     * @param _sgaAmount The amount of SGA received.
     * @return The amount of ETH that the sender is entitled to.
     */
    function exchangeSgaForEth(address _sender, uint256 _sgaAmount) external returns (uint256) {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _sender;
        _sgaAmount;
        return 0;
    }

    /**
     * @dev Handle direct SGA transfer.
     * @dev Any authorization not required.
     * @param _sender The address of the sender.
     * @param _to The address of the destination account.
     * @param _value The amount of SGA to be transferred.
     */
    function uponTransfer(address _sender, address _to, uint256 _value) external {
        _sender;
        _to;
        _value;
    }

    /**
     * @dev Handle custodian SGA transfer.
     * @dev Any authorization not required.
     * @param _sender The address of the sender.
     * @param _from The address of the source account.
     * @param _to The address of the destination account.
     * @param _value The amount of SGA to be transferred.
     */
    function uponTransferFrom(address _sender, address _from, address _to, uint256 _value) external {
        _sender;
        _from;
        _to;
        _value;
    }

    /**
     * @dev Handle the operation of ETH deposit into the SGAToken contract.
     * @param _sender The address of the account which has issued the operation.
     * @param _balance The amount of ETH in the SGAToken contract.
     * @param _amount The deposited ETH amount.
     * @return The address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     */
    function uponDeposit(address _sender, uint256 _balance, uint256 _amount) external returns (address, uint256) {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _sender;
        _balance;
        _amount;
        return (address(0), 0);

    }

    /**
     * @dev Handle the operation of ETH withdrawal from the SGAToken contract.
     * @param _sender The address of the account which has issued the operation.
     * @param _balance The amount of ETH in the SGAToken contract prior the withdrawal.
     * @return The address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     */
    function uponWithdraw(address _sender, uint256 _balance) external returns (address, uint256) {
        (address wallet, uint256 amount) = getReserveManager().getWithdrawParams(_balance);
        require(wallet != address(0), "caller is illegal");
        emit WithdrawCompleted(_sender, _balance, amount);
        return (wallet, _balance);
    }

    /**
     * @dev Upon SGA mint for SGN holders.
     * @param _value The amount of SGA to mint.
     */
    function uponMintSgaForSgnHolders(uint256 _value) external {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _value;
    }

    /**
     * @dev Upon SGA transfer to an SGN holder.
     * @param _to The address of the SGN holder.
     * @param _value The amount of SGA to transfer.
     */
    function uponTransferSgaToSgnHolder(address _to, uint256 _value) external {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _to;
        _value;
    }

    /**
     * @dev Upon ETH transfer to an SGA holder.
     * @param _to The address of the SGA holder.
     * @param _value The amount of ETH to transfer.
     * @param _status The operation's completion-status.
     */
    function postTransferEthToSgaHolder(address _to, uint256 _value, bool _status) external {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        _to;
        _value;
        _status;
    }

    /**
     * @dev Get the address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     * @return The address of the reserve-wallet and the deficient amount of ETH in the SGAToken contract.
     */
    function getDepositParams() external view returns (address, uint256) {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        return (address(0), 0);
    }

    /**
     * @dev Get the address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     * @return The address of the reserve-wallet and the excessive amount of ETH in the SGAToken contract.
     */
    function getWithdrawParams() external view returns (address, uint256) {
        require(false, "SGA token has been deprecated. Use SGR token instead");
        return (address(0), 0);
    }
}