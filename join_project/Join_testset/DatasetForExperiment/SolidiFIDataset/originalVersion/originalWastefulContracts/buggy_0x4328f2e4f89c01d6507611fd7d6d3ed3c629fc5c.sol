pragma solidity ^0.5.7;

// wesion Airdrop Fund
//   Keep your ETH balance > (...)
//      See https://wesion.io/en/latest/token/airdrop_via_contract.html
//
//   And call this contract (send 0 ETH here),
//   and you will receive 100-200 VNET Tokens immediately.

/**
 * @title Ownable
 */
contract Ownable {
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  address internal _owner;

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract
     * to the sender account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0));
        address __previousOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(__previousOwner, newOwner);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Rescue compatible ERC20 Token
     *
     * @param tokenAddr ERC20 The address of the ERC20 token contract
     * @param receiver The address of the receiver
     * @param amount uint256
     */
    function rescueTokens(address tokenAddr, address receiver, uint256 amount) external onlyOwner {
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.balanceOf(address(this));

        require(balance >= amount);
        assert(_token.transfer(receiver, amount));
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Withdraw Ether
     */
    function withdrawEther(address payable to, uint256 amount) external onlyOwner {
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
}


/**
 * @title ERC20 interface
 * @dev see https://eips.ethereum.org/EIPS/eip-20
 */
interface IERC20{
    function balanceOf(address owner) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}


/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {
    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient,
     * reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
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


/**
 * @title wesion Airdrop
 */
contract WesionAirdrop is Ownable {
    using SafeMath for uint256;

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  IERC20 public wesion;

  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _wei_min;

  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bool) public _airdopped;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Donate(address indexed account, uint256 amount);

    /**
     * @dev Wei Min
     */
    function wei_min() public view returns (uint256) {
        return _wei_min;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev constructor
     */
    constructor() public {
        wesion = IERC20(0x2c1564A74F07757765642ACef62a583B38d5A213);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev receive ETH and send wesions
     */
    function () external payable {
        require(_airdopped[msg.sender] != true);
        require(msg.sender.balance >= _wei_min);

        uint256 balance = wesion.balanceOf(address(this));
        require(balance > 0);

        uint256 wesionAmount = 100;
        wesionAmount = wesionAmount.add(uint256(keccak256(abi.encode(now, msg.sender, now))) % 100).mul(10 ** 6);

        if (wesionAmount <= balance) {
            assert(wesion.transfer(msg.sender, wesionAmount));
        } else {
            assert(wesion.transfer(msg.sender, balance));
        }

        if (msg.value > 0) {
            emit Donate(msg.sender, msg.value);
        }
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev set wei min
     */
    function setWeiMin(uint256 value) external onlyOwner {
        _wei_min = value;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev set Wesion Address
     */
    function setWesionAddress(address _WesionAddr) public onlyOwner {
        wesion = IERC20(_WesionAddr);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}