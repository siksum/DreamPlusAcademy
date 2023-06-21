/**
 *Submitted for verification at Etherscan.io on 2020-02-27
*/

pragma solidity 0.5.11;


interface ERC20Interface {
  function balanceOf(address) external view returns (uint256);
  function approve(address, uint256) external returns (bool);
  function transfer(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
}


interface DTokenInterface {
  function mint(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);
  function redeemUnderlying(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);
  function balanceOfUnderlying(address) external view returns (uint256);
  function transfer(address, uint256) external returns (bool);
  function transferUnderlyingFrom(
    address sender, address recipient, uint256 underlyingEquivalentAmount
  ) external returns (bool success);
}


interface CurveInterface {
  function exchange_underlying(int128, int128, uint256, uint256, uint256) external;
  function get_dy_underlying(int128, int128, uint256) external view returns (uint256);
}


library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        require(c >= a, "SafeMath: addition overflow");
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b <= a, "SafeMath: subtraction overflow");
        c = a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) return 0;
        c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b > 0, "SafeMath: division by zero");
        c = a / b;
    }
}


contract CurveReserveTradeHelperV2 {
  using SafeMath for uint256;
 
  DTokenInterface internal constant _DDAI = DTokenInterface(
    0x00000000001876eB1444c986fD502e618c587430
  );
  
  ERC20Interface internal constant _DAI = ERC20Interface(
    0x6B175474E89094C44Da98b954EedeAC495271d0F
  );

  ERC20Interface internal constant _USDC = ERC20Interface(
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
  );
 
  CurveInterface internal constant _CURVE = CurveInterface(
    0x2e60CF74d81ac34eB21eEff58Db4D385920ef419
  );
  
  uint256 internal constant _SCALING_FACTOR = 1e18;
  
  constructor() public {
    require(_USDC.approve(address(_CURVE), uint256(-1)));
    require(_DAI.approve(address(_CURVE), uint256(-1)));
    require(_DAI.approve(address(_DDAI), uint256(-1)));
  }
  
  /// @param quotedDaiAmount uint256 The expected DAI amount,
  /// returned from the `getExpectedDai` view function .
  function tradeUSDCForDDai(
    uint256 usdcAmount, uint256 quotedDaiAmount
  ) external returns (uint256 dTokensMinted) {
    // Ensure caller has sufficient USDC balance.
    require(
      _USDC.balanceOf(msg.sender) >= usdcAmount,
      "Insufficient USDC balance."
    );
    
    // Use quoted Dai balance to derive required Dai.
    uint256 minimumDai = _getMinimumDai(quotedDaiAmount);
    
    // Transfer USDC from the caller to this contract (requires approval).
    require(_USDC.transferFrom(msg.sender, address(this), usdcAmount));
    
    // Exchange USDC for Dai using Curve.
    _CURVE.exchange_underlying(
      1, 0, usdcAmount, minimumDai, now + 1
    );
    
    // Get the received Dai and ensure it meets the requirement.
    uint256 daiBalance = _DAI.balanceOf(address(this));
    require(
      daiBalance >= minimumDai,
      "Realized exchange amount differs from quoted amount by over 1%."
    );
    
    // mint Dharma Dai using the received Dai.
    dTokensMinted = _DDAI.mint(daiBalance);
    
    // Transfer the dDai to the caller.
    require(_DDAI.transfer(msg.sender, dTokensMinted));
  }
  
  /// @param quotedUSDCAmount uint256 The expected USDC amount,
  /// returned from the `getExpectedUSDC` view function.
  function tradeDDaiForUSDC(
    uint256 daiEquivalentAmount, uint256 quotedUSDCAmount
  ) external returns (uint256 dTokensRedeemed) {
    // Ensure caller has sufficient dDai balance.
    require(
      _DDAI.balanceOfUnderlying(msg.sender) >= daiEquivalentAmount,
      "Insufficient Dharma Dai balance."
    );
    
    // Transfer dDai from the caller to this contract (requires approval).
    bool transferFromOK = _DDAI.transferUnderlyingFrom(
      msg.sender, address(this), daiEquivalentAmount
    );
    require(transferFromOK, "Dharma Dai transferFrom failed.");
    
    // Redeem dDai for Dai.
    dTokensRedeemed = _DDAI.redeemUnderlying(daiEquivalentAmount);

    // Use quoted USDC balance to derive required USDC.
    uint256 minimumUSDC = _getMinimumUSDC(quotedUSDCAmount);
    
    // Exchange Dai for USDC using Curve.
    _CURVE.exchange_underlying(
      0, 1, daiEquivalentAmount, minimumUSDC, now + 1
    );
    
    // Get the received USDC and ensure it meets the requirement.
    uint256 usdcBalance = _USDC.balanceOf(address(this));
    require(
      usdcBalance >= minimumUSDC,
      "Realized exchange amount differs from quoted amount by over 1%."
    );
    
    // Transfer the USDC to the caller.
    require(_USDC.transfer(msg.sender, usdcBalance));
  }

  function getExpectedDai(uint256 usdc) external view returns (
    uint256 dai
  ) {
    if (usdc == 0) {
      return 0;
    }

    dai = _CURVE.get_dy_underlying(1, 0, usdc);
  }

  function getExpectedUSDC(uint256 dai) external view returns (
    uint256 usdc
  ) {
    if (dai == 0) {
      return 0;
    }

    usdc = _CURVE.get_dy_underlying(0, 1, dai);
  }

  function _getMinimumDai(uint256 quotedDaiAmount) internal pure returns (
    uint256 minimumDai
  ) {
    minimumDai = (quotedDaiAmount.mul(99)).div(100);
  }

  function _getMinimumUSDC(uint256 quotedUSDCAmount) internal pure returns (
    uint256 minimumUSDC
  ) {
    minimumUSDC = (quotedUSDCAmount.mul(99)).div(100);
  }
}