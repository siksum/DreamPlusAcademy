pragma solidity ^0.5.7;

// Wesion Business Fund

/**
 * @title Ownable
 */
contract Ownable {
  function bug_unchk_send19() payable public{
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
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
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
 * @title Wesion Business Fund
 */
contract WesionBusinessFund is Ownable{
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  IERC20 public Wesion;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Donate(address indexed account, uint256 amount);

    /**
     * @dev constructor
     */
    constructor() public {
        Wesion = IERC20(0x2c1564A74F07757765642ACef62a583B38d5A213);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev donate
     */
    function () external payable {
        emit Donate(msg.sender, msg.value);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev transfer Wesion
     */
    function transferWesion(address to, uint256 amount) external onlyOwner {
        assert(Wesion.transfer(to, amount));
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev batch transfer
     */
    function batchTransfer(address[] memory accounts, uint256[] memory values) public onlyOwner {
        require(accounts.length == values.length);
        for (uint256 i = 0; i < accounts.length; i++) {
            assert(Wesion.transfer(accounts[i], values[i]));
        }
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev set Wesion Address
     */
    function setWesionAddress(address _WesionAddr) public onlyOwner {
        Wesion = IERC20(_WesionAddr);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}