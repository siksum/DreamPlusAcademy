pragma solidity ^0.5.7;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {

    address internal _owner;

  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(address initialOwner) internal {
        _owner = initialOwner;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner() {
        require(isOwner(), "Caller is not the owner");
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

}

/**
 * @title ERC20 interface
 * @dev see https://eips.ethereum.org/EIPS/eip-20
 */
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

/**
 * @title PriceReceiver interface
 * @dev Inherit from PriceReceiver to use the PriceProvider contract.
 */
contract PriceReceiver {

    address public ethPriceProvider;

    modifier onlyEthPriceProvider() {
        require(msg.sender == ethPriceProvider);
        _;
    }

    function receiveEthPrice(uint256 newPrice) external;
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function setEthPriceProvider(address provider) external;
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

}

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 */
contract ReentrancyGuard {
    uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

/**
 * @title Crowdsale contract
 * @author https://grox.solutions
 */
contract Crowdsale is ReentrancyGuard, PriceReceiver, Ownable {
    using SafeMath for uint256;

    // The token being sold
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  IERC20 private _token;

    // Address where funds are collected
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address payable private _wallet;

    // Amount of wei raised
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _weiRaised;

    // Price of 1 ether in USD Cents
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _currentETHPrice;

    // How many token units a buyer gets per 1 USD Cent
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _rate;

    // Minimum amount of wei to invest
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _minimum = 0.5 ether;

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event NewETHPrice(uint256 oldValue, uint256 newValue);

    /**
     * @param rate Number of token units a buyer gets per wei
     * @param initialETHPrice Price of Ether in USD Cents
     * @param wallet Address where collected funds will be forwarded to
     * @param token Address of the token being sold
     */
    constructor (uint256 rate, uint256 initialETHPrice, address payable wallet, IERC20 token, address initialOwner) public Ownable(initialOwner) {
        require(rate != 0, "Rate is 0");
        require(initialETHPrice != 0, "Initial ETH price is 0");
        require(wallet != address(0), "Wallet is the zero address");
        require(address(token) != address(0), "Token is the zero address");

        _rate = rate;
        _wallet = wallet;
        _token = token;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev fallback function
     */
    function() external payable {
        buyTokens(msg.sender);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev low level token purchase
     * This function has a non-reentrancy guard
     * @param beneficiary Recipient of the token purchase
     */
    function buyTokens(address beneficiary) public nonReentrant payable {
        require(beneficiary != address(0), "Beneficiary is the zero address");
        require(msg.value >= _minimum, "Wei amount is less than 0.5 ether");

        uint256 weiAmount = msg.value;

        uint256 tokens = getTokenAmount(weiAmount);

        _weiRaised = _weiRaised.add(weiAmount);

        _wallet.transfer(weiAmount);

        _token.transfer(beneficiary, tokens);

        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Calculate amount of tokens to recieve for a given amount of wei
     * @param weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function getTokenAmount(uint256 weiAmount) public view returns(uint256) {
        return weiAmount.mul(_currentETHPrice).div(1 ether).mul(_rate);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Function to change the rate.
     * Available only to the owner.
     * @param newRate new value.
     */
    function setRate(uint256 newRate) external onlyOwner {
        require(newRate != 0, "New rate is 0");

        _rate = newRate;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Function to change the PriceProvider address.
     * Available only to the owner.
     * @param provider new address.
     */
    function setEthPriceProvider(address provider) external onlyOwner {
        require(provider != address(0), "Provider is the zero address");

        ethPriceProvider = provider;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Function to change the address to receive ether.
     * Available only to the owner.
     * @param newWallet new address.
     */
    function setWallet(address payable newWallet) external onlyOwner {
        require(newWallet != address(0), "New wallet is the zero address");

        _wallet = newWallet;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Function to change the ETH Price.
     * Available only to the owner and to the PriceProvider.
     * @param newPrice amount of USD Cents for 1 ether.
     */
    function receiveEthPrice(uint256 newPrice) external {
        require(newPrice != 0, "New price is 0");
        require(msg.sender == ethPriceProvider || msg.sender == _owner, "Sender has no permission");

        emit NewETHPrice(_currentETHPrice, newPrice);
        _currentETHPrice = newPrice;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Allows to any owner of the contract withdraw needed ERC20 token from this contract (promo or bounties for example).
    * @param ERC20Token Address of ERC20 token.
    * @param recipient Account to receive tokens.
    */
    function withdrawERC20(address ERC20Token, address recipient) external onlyOwner {

        uint256 amount = IERC20(ERC20Token).balanceOf(address(this));
        IERC20(ERC20Token).transfer(recipient, amount);

    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the token being sold.
     */
    function token() public view returns (IERC20) {
        return _token;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address where funds are collected.
     */
    function wallet() public view returns (address payable) {
        return _wallet;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the number of token units a buyer gets per wei.
     */
    function rate() public view returns (uint256) {
        return _rate;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the price of 1 ether in USD Cents.
     */
    function currentETHPrice() public view returns (uint256) {
        return _currentETHPrice;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return minimum amount of wei to invest.
     */
    function minimum() public view returns (uint256) {
        return _minimum;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the amount of wei raised.
     */
    function weiRaised() public view returns (uint256) {
        return _weiRaised;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

}