/**
 *Submitted for verification at Etherscan.io on 2020-02-27
*/

pragma solidity 0.5.11; 


interface DharmaReserveManagerV2Interface {
  event RoleModified(Role indexed role, address account);
  event RolePaused(Role indexed role);
  event RoleUnpaused(Role indexed role);

  enum Role {
    DEPOSIT_MANAGER,
    ADJUSTER,
    PAUSER
  }

  struct RoleStatus {
    address account;
    bool paused;
  }

  function finalizeDaiDeposit(
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external;

  function finalizeDharmaDaiDeposit(
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external;

  function mint(uint256 daiAmount) external returns (uint256 dDaiMinted);
  
  function redeem(uint256 dDaiAmount) external returns (uint256 daiReceived);
  
  function tradeDDaiForUSDC(
    uint256 daiEquivalentAmount,
    uint256 quotedDaiToUSDCExchangeRate
  ) external returns (uint256 usdcReceived);
  
  function tradeUSDCForDDai(
    uint256 usdcAmount,
    uint256 quotedUSDCToDaiExchangeRate
  ) external returns (uint256 dDaiMinted);

  function withdrawUSDC(address recipient, uint256 usdcAmount) external;

  function withdrawDai(address recipient, uint256 daiAmount) external;

  function withdrawDharmaDai(address recipient, uint256 dDaiAmount) external;

  function withdraw(
    ERC20Interface token, address recipient, uint256 amount
  ) external returns (bool success);

  function call(
    address payable target, uint256 amount, bytes calldata data
  ) external returns (bool ok, bytes memory returnData);
  
  function setLimit(uint256 daiAmount) external;

  function setRole(Role role, address account) external;

  function removeRole(Role role) external;

  function pause(Role role) external;

  function unpause(Role role) external;

  function isPaused(Role role) external view returns (bool paused);

  function isRole(Role role) external view returns (bool hasRole);

  function isDharmaSmartWallet(
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet);

  function getDepositManager() external view returns (address operator);

  function getAdjuster() external view returns (address recoverer);

  function getPauser() external view returns (address pauser);
  
  function getReserves() external view returns (
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  );
  
  function getLimit() external view returns (
    uint256 daiAmount, uint256 dDaiAmount
  );
}

interface ERC20Interface {
  function balanceOf(address) external view returns (uint256);
  function approve(address, uint256) external returns (bool);
  function transfer(address, uint256) external returns (bool);
}

interface DTokenInterface {
  function mint(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);
  function redeem(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);
  function redeemUnderlying(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);
  function balanceOf(address) external view returns (uint256);
  function balanceOfUnderlying(address) external view returns (uint256);
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function exchangeRateCurrent() external view returns (uint256);
}

interface TradeHelperInterface {
  function tradeUSDCForDDai(uint256 amountUSDC, uint256 quotedExchangeRate) external returns (uint256 dDaiMinted);
  function tradeDDaiForUSDC(uint256 amountDai, uint256 quotedExchangeRate) external returns (uint256 usdcReceived);
  function getExchangeRateAndExpectedDai(uint256 usdc) external view returns (uint256 exchangeRate, uint256 exchangeRateUnderlying, uint256 dai);
  function getExchangeRateAndExpectedUSDC(uint256 dai) external view returns (uint256 exchangeRate, uint256 exchangeRateUnderlying, uint256 usdc);
}


library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) return 0;
    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0, "SafeMath: division by zero");
    return a / b;
  }
}


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be aplied to your functions to restrict their use to
 * the owner.
 *
 * In order to transfer ownership, a recipient must be specified, at which point
 * the specified recipient can call `acceptOwnership` and take ownership.
 */
contract TwoStepOwnable {
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address private _owner;

function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  address private _newPotentialOwner;

  /**
   * @dev Initialize contract by setting transaction submitter as initial owner.
   */
  constructor() internal {
    _owner = tx.origin;
    emit OwnershipTransferred(address(0), _owner);
  }
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}

  /**
   * @dev Allows a new account (`newOwner`) to accept ownership.
   * Can only be called by the current owner.
   */
  function transferOwnership(address newOwner) external onlyOwner {
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * @dev Cancel a transfer of ownership to a new account.
   * Can only be called by the current owner.
   */
  function cancelOwnershipTransfer() external onlyOwner {
    delete _newPotentialOwner;
  }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}

  /**
   * @dev Transfers ownership of the contract to the caller.
   * Can only be called by a new potential owner set by the current owner.
   */
  function acceptOwnership() external {
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OwnershipTransferred(_owner, msg.sender);

    _owner = msg.sender;
  }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

  /**
   * @dev Returns the address of the current owner.
   */
  function owner() external view returns (address) {
    return _owner;
  }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * @dev Returns true if the caller is the current owner.
   */
  function isOwner() public view returns (bool) {
    return msg.sender == _owner;
  }
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(isOwner(), "TwoStepOwnable: caller is not the owner.");
    _;
  }
}


/**
 * @title DharmaReserveManagerV2
 * @author 0age
 * @notice This contract is owned by the Dharma Reserve Manager multisig and
 * manages Dharma's reserves. It designates a collection of "roles" - these are
 * dedicated accounts that can be modified by the owner, and that can trigger
 * specific functionality on the manager. These roles are:
 *  - depositManager (0): initiates token transfers to smart wallets
 *  - adjuster (1): mints / redeems Dai, and swaps USDC, for dDai
 *  - pauser (2): pauses any role (only the owner is then able to unpause it)
 *
 * When finalizing deposits, the deposit manager must adhere to two constraints:
 *  - it must provide "proof" that the recipient is a smart wallet by including
 *    the initial user signing key used to derive the smart wallet address
 *  - it must not attempt to transfer more Dai, or more than the Dai-equivalent
 *    value of Dharma Dai, than the current "limit" set by the owner.
 *
 * Reserves can be retrieved via `getReserves`, the current limit can be
 * retrieved via `getLimit`, and "proofs" can be validated via `isSmartWallet`.
 */
contract DharmaReserveManagerV2 is DharmaReserveManagerV2Interface, TwoStepOwnable {
  using SafeMath for uint256;

  
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(uint256 => RoleStatus) private _roles;
  
  
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256 private _limit;

  
  ERC20Interface internal constant _USDC = ERC20Interface(
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 
  );

  ERC20Interface internal constant _DAI = ERC20Interface(
    0x6B175474E89094C44Da98b954EedeAC495271d0F 
  );

  DTokenInterface internal constant _DDAI = DTokenInterface(
    0x00000000001876eB1444c986fD502e618c587430
  );
  
  TradeHelperInterface internal constant _TRADE_HELPER = TradeHelperInterface(
    0xb5f23a203F02D2e595BBC96F5a499814CD8cA186
  );

  
  bytes21 internal constant _CREATE2_HEADER = bytes21(
    0xfffc00c80b0000007f73004edb00094cad80626d8d 
  );
  
  
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  bytes internal constant _WALLET_CREATION_CODE_HEADER = hex"60806040526040516104423803806104428339818101604052602081101561002657600080fd5b810190808051604051939291908464010000000082111561004657600080fd5b90830190602082018581111561005b57600080fd5b825164010000000081118282018810171561007557600080fd5b82525081516020918201929091019080838360005b838110156100a257818101518382015260200161008a565b50505050905090810190601f1680156100cf5780820380516001836020036101000a031916815260200191505b5060405250505060006100e661019e60201b60201c565b6001600160a01b0316826040518082805190602001908083835b6020831061011f5780518252601f199092019160209182019101610100565b6001836020036101000a038019825116818451168082178552505050505050905001915050600060405180830381855af49150503d806000811461017f576040519150601f19603f3d011682016040523d82523d6000602084013e610184565b606091505b5050905080610197573d6000803e3d6000fd5b50506102be565b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d80600081146101f0576040519150601f19603f3d011682016040523d82523d6000602084013e6101f5565b606091505b509150915081819061029f576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b8381101561026457818101518382015260200161024c565b50505050905090810190601f1680156102915780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b508080602001905160208110156102b557600080fd5b50519392505050565b610175806102cd6000396000f3fe608060405261001461000f610016565b61011c565b005b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d8060008114610068576040519150601f19603f3d011682016040523d82523d6000602084013e61006d565b606091505b50915091508181906100fd5760405162461bcd60e51b81526004018080602001828103825283818151815260200191508051906020019080838360005b838110156100c25781810151838201526020016100aa565b50505050905090810190601f1680156100ef5780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5080806020019051602081101561011357600080fd5b50519392505050565b3660008037600080366000845af43d6000803e80801561013b573d6000f35b3d6000fdfea265627a7a7231582020202020202055706772616465426561636f6e50726f7879563120202020202064736f6c634300050b003200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000024c4d66de8000000000000000000000000";
  bytes28 internal constant _WALLET_CREATION_CODE_FOOTER = bytes28(
    0x00000000000000000000000000000000000000000000000000000000
  );

  /**
   * @notice In the constructor, set the initial owner to the transaction
   * submitter and initial minimum timelock interval and default timelock
   * expiration values.
   */
  constructor() public {
    
    require(_DAI.approve(address(_DDAI), uint256(-1)));
    
    
    require(_USDC.approve(address(_TRADE_HELPER), uint256(-1)));
  
    
    require(_DDAI.approve(address(_TRADE_HELPER), uint256(-1)));  
    
    
    _limit = 300 * 1e18;
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}

  /**
   * @notice Transfer `daiAmount` Dai to `smartWallet`, providing the initial
   * user signing key `initialUserSigningKey` as proof that the specified smart
   * wallet is indeed a Dharma Smart Wallet - this assumes that the address is
   * derived and deployed using the Dharma Smart Wallet Factory V1. In addition,
   * the specified amount must be less than the configured limit amount. Only
   * the owner or the designated deposit manager role may call this function.
   * @param smartWallet address The smart wallet to transfer Dai to.
   * @param initialUserSigningKey address The initial user signing key supplied
   * when deriving the smart wallet address - this could be an EOA or a Dharma
   * key ring address.
   * @param daiAmount uint256 The amount of Dai to transfer - this must be less
   * than the current limit.
   */
  function finalizeDaiDeposit(
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external onlyOwnerOr(Role.DEPOSIT_MANAGER) {
    
    require(
      _isSmartWallet(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );
    
    
    require(daiAmount < _limit, "Transfer size exceeds the limit.");
    
    
    require(_DAI.transfer(smartWallet, daiAmount), "Dai transfer failed.");
  }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}

  /**
   * @notice Transfer `dDaiAmount` Dharma Dai to `smartWallet`, providing the
   * initial user signing key `initialUserSigningKey` as proof that the
   * specified smart wallet is indeed a Dharma Smart Wallet - this assumes that
   * the address is derived and deployed using the Dharma Smart Wallet Factory
   * V1. In addition, the Dai equivalent value of the specified dDai amount must
   * be less than the configured limit amount. Only the owner or the designated
   * deposit manager role may call this function.
   * @param smartWallet address The smart wallet to transfer Dai to.
   * @param initialUserSigningKey address The initial user signing key supplied
   * when deriving the smart wallet address - this could be an EOA or a Dharma
   * key ring address.
   * @param dDaiAmount uint256 The amount of Dharma Dai to transfer - the Dai
   * equivalent amount must be less than the current limit.
   */
  function finalizeDharmaDaiDeposit(
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external onlyOwnerOr(Role.DEPOSIT_MANAGER) {
    
    require(
      _isSmartWallet(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );
    
    
    uint256 exchangeRate = _DDAI.exchangeRateCurrent();

    
    require(exchangeRate != 0, "Could not retrieve dDai exchange rate.");
    
    
    uint256 daiEquivalent = (dDaiAmount.mul(exchangeRate)) / 1e18;
    
    
    require(daiEquivalent < _limit, "Transfer size exceeds the limit.");

    
    require(_DDAI.transfer(smartWallet, dDaiAmount), "dDai transfer failed.");
  }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}

  /**
   * @notice Use `daiAmount` Dai mint Dharma Dai. Only the owner or the
   * designated adjuster role may call this function.
   * @param daiAmount uint256 The amount of Dai to supply when minting Dharma
   * Dai.
   * @return The amount of Dharma Dai minted.
   */
  function mint(
    uint256 daiAmount
  ) external onlyOwnerOr(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    
    dDaiMinted = _DDAI.mint(daiAmount);
  }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * @notice Redeem `dDaiAmount` Dharma Dai for Dai. Only the owner or the
   * designated adjuster role may call this function.
   * @param dDaiAmount uint256 The amount of Dharma Dai to supply when redeeming
   * for Dai.
   * @return The amount of Dai received.
   */ 
  function redeem(
    uint256 dDaiAmount
  ) external onlyOwnerOr(Role.ADJUSTER) returns (uint256 daiReceived) {
    
    daiReceived = _DDAI.redeem(dDaiAmount);
  }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  
  /**
   * @notice tradeUSDCForDDai `usdcAmount` USDC for Dharma Dai. Only the owner or the
   * designated adjuster role may call this function.
   * @param usdcAmount uint256 The amount of USDC to supply when trading for Dharma Dai.
   * @param quotedUSDCToDaiExchangeRate uint256 The expected DAI/USDC exchange
   * rate, scaled up by 10^18 - this value is returned from the
   * `getExchangeRateAndExpectedDai` view function on the trade helper as
   * `exchangeRate`.
   * @return The amount of dDai received.
   */ 
  function tradeUSDCForDDai(
    uint256 usdcAmount,
    uint256 quotedUSDCToDaiExchangeRate
  ) external onlyOwnerOr(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    dDaiMinted = _TRADE_HELPER.tradeUSDCForDDai(
       usdcAmount, quotedUSDCToDaiExchangeRate
    );
  }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * @notice tradeDDaiForUSDC `daiEquivalentAmount` Dai amount to trade in Dharma Dai
   * for USDC. Only the owner or the designated adjuster role may call this function.
   * @param daiEquivalentAmount uint256 The Dai equivalent amount to supply in Dharma
   * Dai when trading for USDC.
   * @param quotedDaiToUSDCExchangeRate uint256 The expected USDC/DAI exchange
   * rate, scaled up by 10^18 - this value is returned from the
   * `getExchangeRateAndExpectedUSDC` view function on the trade helper as
   * `exchangeRate`.
   * @return The amount of USDC received.
   */ 
  function tradeDDaiForUSDC(
    uint256 daiEquivalentAmount,
    uint256 quotedDaiToUSDCExchangeRate
  ) external onlyOwnerOr(Role.ADJUSTER) returns (uint256 usdcReceived) {
    usdcReceived = _TRADE_HELPER.tradeDDaiForUSDC(
       daiEquivalentAmount, quotedDaiToUSDCExchangeRate
    );
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

  /**
   * @notice Transfer `usdcAmount` USDC to `recipient`. Only the owner may call
   * this function.
   * @param recipient address The account to transfer USDC to.
   * @param usdcAmount uint256 The amount of USDC to transfer.
   */
  function withdrawUSDC(
    address recipient, uint256 usdcAmount
  ) external onlyOwner {
    
    require(_USDC.transfer(recipient, usdcAmount), "USDC transfer failed.");
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

  /**
   * @notice Transfer `daiAmount` Dai to `recipient`. Only the owner may call
   * this function.
   * @param recipient address The account to transfer Dai to.
   * @param daiAmount uint256 The amount of Dai to transfer.
   */
  function withdrawDai(
    address recipient, uint256 daiAmount
  ) external onlyOwner {
    
    require(_DAI.transfer(recipient, daiAmount), "Dai transfer failed.");
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  /**
   * @notice Transfer `dDaiAmount` Dharma Dai to `recipient`. Only the owner may
   * call this function.
   * @param recipient address The account to transfer Dharma Dai to.
   * @param dDaiAmount uint256 The amount of Dharma Dai to transfer.
   */
  function withdrawDharmaDai(
    address recipient, uint256 dDaiAmount
  ) external onlyOwner {
    
    require(_DDAI.transfer(recipient, dDaiAmount), "dDai transfer failed.");
  }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

  /**
   * @notice Transfer `amount` of ERC20 token `token` to `recipient`. Only the
   * owner may call this function.
   * @param token ERC20Interface The ERC20 token to transfer.
   * @param recipient address The account to transfer the tokens to.
   * @param amount uint256 The amount of tokens to transfer.
   * @return A boolean to indicate if the transfer was successful - note that
   * unsuccessful ERC20 transfers will usually revert.
   */
  function withdraw(
    ERC20Interface token, address recipient, uint256 amount
  ) external onlyOwner returns (bool success) {
    
    success = token.transfer(recipient, amount);
  }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

  /**
   * @notice Call account `target`, supplying value `amount` and data `data`.
   * Only the owner may call this function.
   * @param target address The account to call.
   * @param amount uint256 The amount of ether to include as an endowment.
   * @param data bytes The data to include along with the call.
   * @return A boolean to indicate if the call was successful, as well as the
   * returned data or revert reason.
   */
  function call(
    address payable target, uint256 amount, bytes calldata data
  ) external onlyOwner returns (bool ok, bytes memory returnData) {
    
    (ok, returnData) = target.call.value(amount)(data);
  }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

  /**
   * @notice Set `daiAmount` as the new limit on the size of finalized deposits.
   * Only the owner may call this function.
   * @param daiAmount uint256 The new limit on the size of finalized deposits.
   */
  function setLimit(uint256 daiAmount) external onlyOwner {
    
    _limit = daiAmount;
  }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}

  /**
   * @notice Pause a currently unpaused role and emit a `RolePaused` event. Only
   * the owner or the designated pauser may call this function. Also, bear in
   * mind that only the owner may unpause a role once paused.
   * @param role The role to pause. Permitted roles are deposit manager (0),
   * adjuster (1), and pauser (2).
   */
  function pause(Role role) external onlyOwnerOr(Role.PAUSER) {
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(!storedRoleStatus.paused, "Role in question is already paused.");
    storedRoleStatus.paused = true;
    emit RolePaused(role);
  }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

  /**
   * @notice Unpause a currently paused role and emit a `RoleUnpaused` event.
   * Only the owner may call this function.
   * @param role The role to pause. Permitted roles are deposit manager (0),
   * adjuster (1), and pauser (2).
   */
  function unpause(Role role) external onlyOwner {
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(storedRoleStatus.paused, "Role in question is already unpaused.");
    storedRoleStatus.paused = false;
    emit RoleUnpaused(role);
  }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

  /**
   * @notice Set a new account on a given role and emit a `RoleModified` event
   * if the role holder has changed. Only the owner may call this function.
   * @param role The role that the account will be set for. Permitted roles are
   * deposit manager (0), adjuster (1), and pauser (2).
   * @param account The account to set as the designated role bearer.
   */
  function setRole(Role role, address account) external onlyOwner {
    require(account != address(0), "Must supply an account.");
    _setRole(role, account);
  }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

  /**
   * @notice Remove any current role bearer for a given role and emit a
   * `RoleModified` event if a role holder was previously set. Only the owner
   * may call this function.
   * @param role The role that the account will be removed from. Permitted roles
   * are deposit manager (0), adjuster (1), and pauser (2).
   */
  function removeRole(Role role) external onlyOwner {
    _setRole(role, address(0));
  }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

  /**
   * @notice External view function to check whether or not the functionality
   * associated with a given role is currently paused or not. The owner or the
   * pauser may pause any given role (including the pauser itself), but only the
   * owner may unpause functionality. Additionally, the owner may call paused
   * functions directly.
   * @param role The role to check the pause status on. Permitted roles are
   * deposit manager (0), adjuster (1), and pauser (2).
   * @return A boolean to indicate if the functionality associated with the role
   * in question is currently paused.
   */
  function isPaused(Role role) external view returns (bool paused) {
    paused = _isPaused(role);
  }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

  /**
   * @notice External view function to check whether the caller is the current
   * role holder.
   * @param role The role to check for. Permitted roles are deposit manager (0),
   * adjuster (1), and pauser (2).
   * @return A boolean indicating if the caller has the specified role.
   */
  function isRole(Role role) external view returns (bool hasRole) {
    hasRole = _isRole(role);
  }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

  /**
   * @notice External view function to check whether a "proof" that a given
   * smart wallet is actually a Dharma Smart Wallet, based on the initial user
   * signing key, is valid or not. This proof only works when the Dharma Smart
   * Wallet in question is derived using V1 of the Dharma Smart Wallet Factory.
   * @param smartWallet address The smart wallet to check.
   * @param initialUserSigningKey address The initial user signing key supplied
   * when deriving the smart wallet address - this could be an EOA or a Dharma
   * key ring address.
   * @return A boolean indicating if the specified smart wallet account is
   * indeed a smart wallet based on the specified initial user signing key.
   */
  function isDharmaSmartWallet(
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet) {
    dharmaSmartWallet = _isSmartWallet(smartWallet, initialUserSigningKey);
  }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

  /**
   * @notice External view function to check the account currently holding the
   * deposit manager role. The deposit manager can process standard deposit
   * finalization via `finalizeDaiDeposit` and `finalizeDharmaDaiDeposit`, but
   * must prove that the recipient is a Dharma Smart Wallet and adhere to the
   * current deposit size limit.
   * @return The address of the current deposit manager, or the null address if
   * none is set.
   */
  function getDepositManager() external view returns (address depositManager) {
    depositManager = _roles[uint256(Role.DEPOSIT_MANAGER)].account;
  }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

  /**
   * @notice External view function to check the account currently holding the
   * adjuster role. The adjuster can exchange Dai in reserves for Dharma Dai and
   * vice-versa via minting or redeeming.
   * @return The address of the current adjuster, or the null address if none is
   * set.
   */
  function getAdjuster() external view returns (address adjuster) {
    adjuster = _roles[uint256(Role.ADJUSTER)].account;
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  /**
   * @notice External view function to check the account currently holding the
   * pauser role. The pauser can pause any role from taking its standard action,
   * though the owner will still be able to call the associated function in the
   * interim and is the only entity able to unpause the given role once paused.
   * @return The address of the current pauser, or the null address if none is
   * set.
   */
  function getPauser() external view returns (address pauser) {
    pauser = _roles[uint256(Role.PAUSER)].account;
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

  /**
   * @notice External view function to check the current reserves held by this
   * contract.
   * @return The Dai and Dharma Dai reserves held by this contract, as well as
   * the Dai-equivalent value of the Dharma Dai reserves.
   */ 
  function getReserves() external view returns (
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  ) {
    dai = _DAI.balanceOf(address(this));
    dDai = _DDAI.balanceOf(address(this));
    dDaiUnderlying = _DDAI.balanceOfUnderlying(address(this));
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * @notice External view function to check the current limit on deposit amount
   * enforced for the deposit manager when finalizing deposits, expressed in Dai
   * and in Dharma Dai.
   * @return The Dai and Dharma Dai limit on deposit finalization amount.
   */  
  function getLimit() external view returns (
    uint256 daiAmount, uint256 dDaiAmount
  ) {
    daiAmount = _limit;
    dDaiAmount = (daiAmount.mul(1e18)).div(_DDAI.exchangeRateCurrent());   
  }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

  /**
   * @notice Internal function to set a new account on a given role and emit a
   * `RoleModified` event if the role holder has changed.
   * @param role The role that the account will be set for. Permitted roles are
   * deposit manager (0), adjuster (1), and pauser (2).
   * @param account The account to set as the designated role bearer.
   */
  function _setRole(Role role, address account) internal {
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];

    if (account != storedRoleStatus.account) {
      storedRoleStatus.account = account;
      emit RoleModified(role, account);
    }
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

  /**
   * @notice Internal view function to check whether the caller is the current
   * role holder.
   * @param role The role to check for. Permitted roles are deposit manager (0),
   * adjuster (1), and pauser (2).
   * @return A boolean indicating if the caller has the specified role.
   */
  function _isRole(Role role) internal view returns (bool hasRole) {
    hasRole = msg.sender == _roles[uint256(role)].account;
  }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }

  /**
   * @notice Internal view function to check whether the given role is paused or
   * not.
   * @param role The role to check for. Permitted roles are deposit manager (0),
   * adjuster (1), and pauser (2).
   * @return A boolean indicating if the specified role is paused or not.
   */
  function _isPaused(Role role) internal view returns (bool paused) {
    paused = _roles[uint256(role)].paused;
  }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * @notice Internal view function to enforce that the given initial user signing
   * key resolves to the given smart wallet when deployed through the Dharma Smart
   * Wallet Factory V1.
   * @param smartWallet address The smart wallet.
   * @param initialUserSigningKey address The initial user signing key.
   */
  function _isSmartWallet(
    address smartWallet, address initialUserSigningKey
  ) internal pure returns (bool) {
    
    bytes32 initCodeHash = keccak256(
      abi.encodePacked(
        _WALLET_CREATION_CODE_HEADER,
        initialUserSigningKey,
        _WALLET_CREATION_CODE_FOOTER
      )
    );

    
    address target;
    for (uint256 nonce = 0; nonce < 10; nonce++) {
      target = address(          
        uint160(                 
          uint256(               
            keccak256(           
              abi.encodePacked(  
                _CREATE2_HEADER, 
                nonce,           
                initCodeHash     
              )
            )
          )
        )
      );

      
      if (target == smartWallet) {
        return true;
      }

      
      nonce++;
    }

    
    return false;
  }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * @notice Modifier that throws if called by any account other than the owner
   * or the supplied role, or if the caller is not the owner and the role in
   * question is paused.
   * @param role The role to require unless the caller is the owner. Permitted
   * roles are deposit manager (0), adjuster (1), and pauser (2).
   */
  modifier onlyOwnerOr(Role role) {
    if (!isOwner()) {
      require(_isRole(role), "Caller does not have a required role.");
      require(!_isPaused(role), "Role in question is currently paused.");
    }
    _;
  }
}