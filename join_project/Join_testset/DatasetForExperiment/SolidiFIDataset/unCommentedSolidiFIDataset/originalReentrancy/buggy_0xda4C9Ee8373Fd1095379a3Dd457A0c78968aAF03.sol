/**
 *Submitted for verification at Etherscan.io on 2020-05-24
*/

pragma solidity ^0.5.12;


library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0)
            return 0;
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


contract ERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;

  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);

    uint256 internal _totalSupply;

    /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return A uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param owner address The address which owns the funds.
    * @param spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    /**
    * @dev Transfer token to a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    * Beware that changing an allowance with this method brings the risk that someone may use both the old
    * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
    * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
    * https:
    * @param spender The address which will spend the funds.
    * @param value The amount of tokens to be spent.
    */
    function approve(address spender, uint256 value) public returns (bool) {
        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    /**
    * @dev Transfer tokens from one address to another.
    * Note that while this function emits an Approval event, this is not required as per the specification,
    * and other compliant implementations may not emit the event.
    * @param from address The address which you want to send tokens from
    * @param to address The address which you want to transfer to
    * @param value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _allowed[msg.sender][to] = _allowed[msg.sender][to].sub(value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));
        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

}

contract ERC20Mintable is ERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;

    function _mint(address to, uint256 amount) internal {
        _balances[to] = _balances[to].add(amount);
        _totalSupply = _totalSupply.add(amount);
        emit Transfer(address(0), to, amount);
    }

    function _burn(address from, uint256 amount) internal {
        _balances[from] = _balances[from].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(from, address(0), amount);
    }
}



contract ILendingPoolAddressesProvider {

    function getLendingPool() public view returns (address);
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
    function setLendingPoolImpl(address _pool) public;
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }

    function getLendingPoolCore() public view returns (address payable);
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        
        
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
    function setLendingPoolCoreImpl(address _lendingPoolCore) public;
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }

    function getLendingPoolConfigurator() public view returns (address);
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
    function setLendingPoolConfiguratorImpl(address _configurator) public;
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }

    function getLendingPoolDataProvider() public view returns (address);
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
    function setLendingPoolDataProviderImpl(address _provider) public;
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

    function getLendingPoolParametersProvider() public view returns (address);
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    function setLendingPoolParametersProviderImpl(address _parametersProvider) public;
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }

    function getTokenDistributor() public view returns (address);
bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
    function setTokenDistributor(address _tokenDistributor) public;
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }


    function getFeeProvider() public view returns (address);
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
    function setFeeProviderImpl(address _feeProvider) public;
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }

    function getLendingPoolLiquidationManager() public view returns (address);
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
    function setLendingPoolLiquidationManager(address _manager) public;
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }

    function getLendingPoolManager() public view returns (address);
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
    function setLendingPoolManager(address _lendingPoolManager) public;
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }

    function getPriceOracle() public view returns (address);
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
    function setPriceOracle(address _priceOracle) public;
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    function getLendingRateOracle() public view returns (address);
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    function setLendingRateOracle(address _lendingRateOracle) public;
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
}

interface ILendingPool {
    function addressesProvider() external view returns(address);
    function deposit(address _reserve, uint256 _amount, uint16 _referralCode) external payable;
    function redeemUnderlying(address _reserve, address _user, uint256 _amount) external;
    function borrow(address _reserve, uint256 _amount, uint256 _interestRateMode, uint16 _referralCode) external;
    function repay(address _reserve, uint256 _amount, address _onBehalfOf) external payable;
    function swapBorrowRateMode(address _reserve) external;
    function rebalanceFixedBorrowRate(address _reserve, address _user) external;
    function setUserUseReserveAsCollateral(address _reserve, bool _useAsCollateral) external;
    function liquidationCall(address _collateral, address _reserve, address _user, uint256 _purchaseAmount, bool _receiveAToken) external payable;
    function flashLoan(address _receiver, address _reserve, uint256 _amount, bytes calldata _params) external;
    function getReserveConfigurationData(address _reserve) external view returns(uint256 ltv, uint256 liquidationThreshold, uint256 liquidationDiscount, address interestRateStrategyAddress, bool usageAsCollateralEnabled, bool borrowingEnabled, bool fixedBorrowRateEnabled, bool isActive);
    function getReserveData(address _reserve) external view returns(uint256 totalLiquidity, uint256 availableLiquidity, uint256 totalBorrowsFixed, uint256 totalBorrowsVariable, uint256 liquidityRate, uint256 variableBorrowRate, uint256 fixedBorrowRate, uint256 averageFixedBorrowRate, uint256 utilizationRate, uint256 liquidityIndex, uint256 variableBorrowIndex, address aTokenAddress, uint40 lastUpdateTimestamp);
    function getUserAccountData(address _user) external view returns(uint256 totalLiquidityETH, uint256 totalCollateralETH, uint256 totalBorrowsETH, uint256 availableBorrowsETH, uint256 currentLiquidationThreshold, uint256 ltv, uint256 healthFactor);
    function getUserReserveData(address _reserve, address _user) external view returns(uint256 currentATokenBalance, uint256 currentBorrowBalance, uint256 principalBorrowBalance, uint256 borrowRateMode, uint256 borrowRate, uint256 liquidityRate, uint256 originationFee, uint256 variableBorrowIndex, uint256 lastUpdateTimestamp, bool usageAsCollateralEnabled);
    function getReserves() external view;
}

interface ILendingPoolCore {
    function getReserveATokenAddress(address _reserve) external view returns (address);
    function getReserveCurrentVariableBorrowRate(address _token) external view returns (uint256);
    function getReserveCurrentLiquidityRate(address _token) external view returns (uint256);
}

interface IAavePriceOracleGetter {
    function getAssetPrice(address _asset) external view returns (uint256);
    function getAssetsPrices(address[] calldata _assets) external view returns(uint256[] memory);
    function getSourceOfAsset(address _asset) external view returns(address);
    function getFallbackOracle() external view returns(address);
}

interface IAToken {
    function redirectInterestStream(address _to) external;
    function redirectInterestStreamOf(address _from, address _to) external;
    function allowInterestRedirectionTo(address _to) external;
    function redeem(uint256 _amount) external;
    function principalBalanceOf(address _user) external view returns(uint256);
    function isTransferAllowed(address _user, uint256 _amount) external view returns (bool);
    function getUserIndex(address _user) external view returns(uint256);
    function getInterestRedirectionAddress(address _user) external view returns(address);
    function getRedirectedBalance(address _user) external view returns(uint256);

    function totalSupply() external view returns (uint256 supply);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}

interface PriceOracle {
    function getUnderlyingPrice(address) external view returns (uint256);
}



interface CErc20 {

    function borrow(uint256) external returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function borrowBalanceCurrent(address) external returns (uint256);

    function repayBorrow(uint256) external returns (uint256);
}


interface CEth {
    function mint() external payable;

    function redeemUnderlying(uint redeemAmount) external returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);
}


interface Comptroller {
    function markets(address) external returns (bool, uint256);

    function enterMarkets(address[] calldata)
        external
        returns (uint256[] memory);

    function getAccountLiquidity(address)
        external
        view
        returns (uint256, uint256, uint256);

    function oracle() external view returns(address);
}



interface Exchange {
    function trade(
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId )external payable returns(uint);
}




contract tCDPConstants {
    uint256 constant dust = 1e6; 
    ERC20 constant Dai = ERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F); 

    
    Comptroller constant comptroller = Comptroller(0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B);
    CEth constant cEth = CEth(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    CErc20 constant cDai = CErc20(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643);

    
    ILendingPoolAddressesProvider constant addressesProvider = ILendingPoolAddressesProvider(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);
    uint16 constant REFERRAL = 47; 

    
    Exchange constant kyberNetwork = Exchange(0x818E6FECD516Ecc3849DAf6845e3EC868087B755);
    address constant etherAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address constant ref = 0xD0533664013a82c31584B7FFDB215139f38Ad77A;

    
    uint256 constant targetRatio = 0.4e18; 
    uint256 constant upperBound = 444444444444444444; 
    uint256 constant lowerBound = 363636363636363636; 
    uint256 constant bite = 0.025 * 1e18; 
}

contract tCDP is ERC20Mintable, tCDPConstants{
    using SafeMath for *;

    bool public isCompound;

  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  event Migration(uint8); 

    constructor() public {
        symbol = "tETH-DAI";
        name = "tokenized CDP ETH-DAI v1";
        decimals = 18;

        address lendingPoolCoreAddress = addressesProvider.getLendingPoolCore();
        Dai.approve(lendingPoolCoreAddress, uint256(-1));
        Dai.approve(address(cDai), uint256(-1));

        address[] memory cTokens = new address[](1);
        cTokens[0] = address(cEth);
        uint256[] memory errors = comptroller.enterMarkets(cTokens);
        require(errors[0] == 0, "Comptroller.enterMarkets failed.");

        Dai.approve(address(kyberNetwork), uint256(-1));
        isCompound = findBestRate();
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

    function initiate(uint256 amount) external payable {
        require(_totalSupply < dust, "initiated");
        require(msg.value > dust, "value too small");

        if(isCompound) {
            cEth.mint.value(msg.value)();
            _mint(msg.sender, msg.value);
            require(cDai.borrow(amount) == 0, "borrow failed");
            Dai.transfer(msg.sender, amount);
        }
        else {
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            lendingPool.deposit.value(msg.value)(etherAddr, msg.value, REFERRAL);

            _mint(msg.sender, msg.value);

            lendingPool.borrow(address(Dai), amount, 2, REFERRAL);
            Dai.transfer(msg.sender, amount);
        }
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        
        
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }

    function collateral() public returns(uint256) {
        if(isCompound) {
            return cEth.balanceOfUnderlying(address(this));
        }
        else {
            address lendingPoolCore = addressesProvider.getLendingPoolCore();
            address aETH = ILendingPoolCore(lendingPoolCore).getReserveATokenAddress(etherAddr);
            return IAToken(aETH).balanceOf(address(this));
        }
    }
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   
        redeemableEther_re_ent4[msg.sender] = 0;
    }

    function debt() public returns(uint256) {
        if(isCompound) {
            return cDai.borrowBalanceCurrent(address(this));
        }
        else {
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            (, uint256 borrowBalance,,,,,,,,) = lendingPool.getUserReserveData(address(Dai), address(this));
            return borrowBalance;
        }
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    function mint() external payable returns(uint256) {

        require(_totalSupply >= dust, "not initiated");
        uint256 amount = msg.value;
        uint256 tokenToMint = _totalSupply.mul(amount).div(collateral());
        uint256 tokenToBorrow = debt().mul(amount).div(collateral());
        _mint(msg.sender, tokenToMint);

        if(isCompound) {
            cEth.mint.value(amount)();
            require(cDai.borrow(tokenToBorrow) == 0, "borrow failed");
            Dai.transfer(msg.sender, tokenToBorrow);
        }
        else{
            
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            lendingPool.deposit.value(amount)(etherAddr, amount, REFERRAL);
            
            lendingPool.borrow(address(Dai), tokenToBorrow, 2, REFERRAL);
            
            Dai.transfer(msg.sender, tokenToBorrow);
        }

        return tokenToMint;
    }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

    function burn(uint256 amount) external {

        uint256 tokenToRepay = amount.mul(debt()).div(_totalSupply);
        uint256 tokenToDraw = amount.mul(collateral()).div(_totalSupply);
        _burn(msg.sender, amount);
        Dai.transferFrom(msg.sender, address(this), tokenToRepay);

        if(isCompound) {
            require(cDai.repayBorrow(tokenToRepay) == 0, "repay failed");
            require(cEth.redeemUnderlying(tokenToDraw) == 0, "redeem failed");
        }
        else {
            
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            address lendingPoolCoreAddress = addressesProvider.getLendingPoolCore();
            
            lendingPool.repay(address(Dai), tokenToRepay, address(this));
            
            IAToken aETH = IAToken(ILendingPoolCore(lendingPoolCoreAddress).getReserveATokenAddress(etherAddr));
            aETH.redeem(tokenToDraw);
        }

        (bool success, ) = msg.sender.call.value(tokenToDraw)("");
        require(success, "Failed to transfer ether to msg.sender");
    }
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   
        redeemableEther_re_ent18[msg.sender] = 0;
    }

    function() external payable{}
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

    
    function findBestRate() public view returns (bool) {
        return AaveDaiAPR().mul(targetRatio).div(1e18).add(CompoundEthAPR()) > CompoundDaiAPR().mul(targetRatio).div(1e18).add(AaveEthAPR());
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
    function CompoundDaiAPR() public view returns (uint256) {
        return cDai.borrowRatePerBlock().mul(2102400);
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    function CompoundEthAPR() public view returns (uint256) {
        return cEth.supplyRatePerBlock().mul(2102400);
    }
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
    function AaveDaiAPR() public view returns (uint256) {
        ILendingPoolCore core = ILendingPoolCore(addressesProvider.getLendingPoolCore());
        return core.getReserveCurrentVariableBorrowRate(address(Dai)).div(1e9);
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   
        redeemableEther_re_ent25[msg.sender] = 0;
    }
    function AaveEthAPR() public view returns (uint256) {
        ILendingPoolCore core = ILendingPoolCore(addressesProvider.getLendingPoolCore());
        return core.getReserveCurrentLiquidityRate(etherAddr).div(1e9);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

    function getUnderlyingPrice() public view returns(uint256) {
        uint256 price;

        if(isCompound) {
            address oracle = comptroller.oracle();
            PriceOracle priceOracle = PriceOracle(oracle);
            price = priceOracle.getUnderlyingPrice(address(cDai));
        }
        else {
            address oracleAddress = addressesProvider.getPriceOracle();
            IAavePriceOracleGetter priceOracle = IAavePriceOracleGetter(oracleAddress);
            price = priceOracle.getAssetPrice(address(Dai));
        }

        return price;
    }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }

    function debtRatio() public returns (uint256) {
        uint256 price = getUnderlyingPrice();
        uint256 ratio = debt().mul(price).div(collateral());
        return ratio;
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }

    function deleverage() external {
        require(_totalSupply >= dust, "not initiated");
        require(debtRatio() > upperBound, "debt ratio is good");
        uint256 amount = collateral().mul(bite).div(1e18);

        if(isCompound) {
            require(cEth.redeemUnderlying(amount) == 0, "redeem failed");
            uint256 income = kyberNetwork.trade.value(amount)(etherAddr, amount, address(Dai), address(this), 1e28, 1, ref);
            require(cDai.repayBorrow(income) == 0, "repay failed");
        }
        else {
            
            address lendingPoolCoreAddress = addressesProvider.getLendingPoolCore();
            IAToken aETH = IAToken(ILendingPoolCore(lendingPoolCoreAddress).getReserveATokenAddress(etherAddr));
            aETH.redeem(amount);
            uint256 income = kyberNetwork.trade.value(amount)(etherAddr, amount, address(Dai), address(this), 1e28, 1, ref);
            
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            
            lendingPool.repay(address(Dai), income, address(this));
        }
    }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   
        redeemableEther_re_ent39[msg.sender] = 0;
    }

    function leverage() external {
        require(_totalSupply >= dust, "not initiated");
        require(debtRatio() < lowerBound, "debt ratio is good");
        uint256 amount = debt().mul(bite).div(1e18);

        if(isCompound) {
            require(cDai.borrow(amount) == 0, "borrow failed");
            uint256 income = kyberNetwork.trade(address(Dai), amount, etherAddr, address(this), 1e28, 1, ref);
            cEth.mint.value(income)();
        }
        else {
            
            ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
            lendingPool.borrow(address(Dai), amount, 2, REFERRAL);
            uint256 income = kyberNetwork.trade(address(Dai), amount, etherAddr, address(this), 1e28, 1, ref);
            
            lendingPool.deposit.value(income)(etherAddr, income, REFERRAL);
        }
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }

    function migrate() external {
        if(findBestRate() != isCompound) {
            uint256 _debt = debt();
            uint256 _collateral = collateral();
            Dai.transferFrom(msg.sender, address(this), _debt);
            uint256 newBorrow = _debt.add(2);

            if(isCompound) {
                require(cDai.repayBorrow(_debt) == 0, "borrow failed");
                require(cEth.redeemUnderlying(_collateral) == 0, "redeem failed");

                ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
                lendingPool.deposit.value(_collateral)(etherAddr, _collateral, REFERRAL);
                lendingPool.borrow(address(Dai), newBorrow, 2, REFERRAL);

                isCompound = false;
                emit Migration(0x02);
            }
            else {
                ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
                address lendingPoolCoreAddress = addressesProvider.getLendingPoolCore();
                lendingPool.repay(address(Dai), _debt, address(this));
                IAToken aETH = IAToken(ILendingPoolCore(lendingPoolCoreAddress).getReserveATokenAddress(etherAddr));
                aETH.redeem(_collateral);

                cEth.mint.value(_collateral)();
                require(cDai.borrow(newBorrow) == 0, "borrow failed");

                isCompound = true;
                emit Migration(0x01);
            }

            Dai.transfer(msg.sender, newBorrow);
        }

    }
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }

}