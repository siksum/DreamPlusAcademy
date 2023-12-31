/**
 * Source Code first verified at https://etherscan.io on Wednesday, May 15, 2019
 (UTC) */

/**
 * Source Code first verified at https://etherscan.io on Wednesday, May 15, 2019
 (UTC) */

pragma solidity ^0.5.8;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;


  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

}

contract IERC721 {
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) public view returns (uint256 balance);

    function ownerOf(uint256 tokenId) public view returns (address owner);

    function approve(address to, uint256 tokenId) public;

    function getApproved(uint256 tokenId) public view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) public;

    function isApprovedForAll(address owner, address operator) public view returns (bool);

    function transferFrom(address from, address to, uint256 tokenId) public;
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function safeTransferFrom(address from, address to, uint256 tokenId) public;
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
}
/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20BasicInterface {
    function totalSupply() public view returns (uint256);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address who) public view returns (uint256);
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);

    uint8 public decimals;
}

contract Bussiness is Ownable {
    address public ceoAddress = address(0xFce92D4163AA532AA096DE8a3C4fEf9f875Bc55F);
    IERC721 public erc721Address = IERC721(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d);
    ERC20BasicInterface public hbwalletToken = ERC20BasicInterface(0xEc7ba74789694d0d03D458965370Dc7cF2FE75Ba);
    uint256 public ETHFee = 25; // 25 = 2,5 %
    uint256 public Percen = 1000;
    uint256 public HBWALLETExchange = 21;
    // cong thuc hbFee = ETHFee / Percen * HBWALLETExchange / 2
    uint256 public limitETHFee = 2000000000000000;
    uint256 public limitHBWALLETFee = 2;
    uint256 public hightLightFee = 30000000000000000;
    constructor() public {}
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        bool isHightlight;
    }

    uint[] public arrayTokenIdSale;
    mapping(uint256 => Price) public prices;

    /**
     * @dev Throws if called by any account other than the ceo address.
     */
    modifier onlyCeoAddress() {
        require(msg.sender == ceoAddress);
        _;
    }

    // Move the last element to the deleted spot.
    // Delete the last element, then correct the length.
    function _burnArrayTokenIdSale(uint index)  internal {
        if (index >= arrayTokenIdSale.length) return;

        for (uint i = index; i<arrayTokenIdSale.length-1; i++){
            arrayTokenIdSale[i] = arrayTokenIdSale[i+1];
        }
        delete arrayTokenIdSale[arrayTokenIdSale.length-1];
        arrayTokenIdSale.length--;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function _burnArrayTokenIdSaleByArr(uint[] memory arr) internal {
        for(uint i; i<arr.length; i++){
            _burnArrayTokenIdSale(i);
        }
       
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function ownerOf(uint256 _tokenId) public view returns (address){
        return erc721Address.ownerOf(_tokenId);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf() public view returns (uint256){
        return address(this).balance;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function getApproved(uint256 _tokenId) public view returns (address){
        return erc721Address.getApproved(_tokenId);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function setPrice(uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint256 _hbfee, bool _isHightLight) internal {
        prices[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight);
        arrayTokenIdSale.push(_tokenId);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function calPriceFeeEth(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns(uint256, uint256) {
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 ethNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || prices[_tokenId].isHightlight == false)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = (_ethPrice - prices[_tokenId].price) * ETHFee / Percen;
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    ethNeed = ethfee + _hightLightFee;
                } else {
                    ethNeed = limitETHFee + _hightLightFee;
                }
            }
            
        }
        return (ethNeed, _hightLightFee);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function setPriceFeeEth(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public payable {
        require(erc721Address.ownerOf(_tokenId) == msg.sender && prices[_tokenId].price != _ethPrice);
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || prices[_tokenId].isHightlight == false)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = (_ethPrice - prices[_tokenId].price) * ETHFee / Percen;
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    require(msg.value == ethfee + _hightLightFee);
                } else {
                    require(msg.value == limitETHFee + _hightLightFee);
                    ethfee = limitETHFee;
                }
            }
            ethfee += prices[_tokenId].fee;
        } else ethfee = _ethPrice * ETHFee / Percen;

        setPrice(_tokenId, _ethPrice, ethfee, 0, _isHightLight == 1 ? true : false);
    }
    function calPriceFeeHBWALLET(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns (uint256){
        uint256 fee;
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 hbNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || prices[_tokenId].isHightlight == false)) {
            _hightLightFee = hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = (_ethPrice - prices[_tokenId].price) * ETHFee / Percen;
            fee = ethfee * HBWALLETExchange / 2 / (10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    hbNeed = fee + _hightLightFee;
                } else {
                    hbNeed = limitHBWALLETFee + _hightLightFee;
                }
            }
        }
        return hbNeed;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function setPriceFeeHBWALLET(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public returns (bool){
        require(erc721Address.ownerOf(_tokenId) == msg.sender && prices[_tokenId].price != _ethPrice);
        uint256 fee;
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || prices[_tokenId].isHightlight == false)) {
            _hightLightFee = hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = (_ethPrice - prices[_tokenId].price) * ETHFee / Percen;
            fee = ethfee * HBWALLETExchange / 2 / (10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    require(hbwalletToken.transferFrom(msg.sender, address(this), fee + _hightLightFee));
                } else {
                    require(hbwalletToken.transferFrom(msg.sender, address(this), limitHBWALLETFee + _hightLightFee));
                    fee = limitHBWALLETFee;
                }
            }
            fee += prices[_tokenId].hbfee;
        } else {
            ethfee = _ethPrice * ETHFee / Percen;
            fee = ethfee * HBWALLETExchange / 2 / (10 ** 16);
        }

        setPrice(_tokenId, _ethPrice, 0, fee, _isHightLight == 1 ? true : false);
        return true;
    }

    function removePrice(uint256 tokenId) public returns (uint256){
        require(erc721Address.ownerOf(tokenId) == msg.sender);
        if (prices[tokenId].fee > 0) msg.sender.transfer(prices[tokenId].fee);
        else if (prices[tokenId].hbfee > 0) hbwalletToken.transfer(msg.sender, prices[tokenId].hbfee);
        resetPrice(tokenId);
        return prices[tokenId].price;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function setFee(uint256 _ethFee, uint256 _HBWALLETExchange, uint256 _hightLightFee) public onlyOwner returns (uint256, uint256, uint256){
        require(_ethFee >= 0 && _HBWALLETExchange >= 1 && _hightLightFee >= 0);
        ETHFee = _ethFee;
        HBWALLETExchange = _HBWALLETExchange;
        hightLightFee = _hightLightFee;
        return (ETHFee, HBWALLETExchange, hightLightFee);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function setLimitFee(uint256 _ethlimitFee, uint256 _hbWalletlimitFee) public onlyOwner returns (uint256, uint256){
        require(_ethlimitFee >= 0 && _hbWalletlimitFee >= 0);
        limitETHFee = _ethlimitFee;
        limitHBWALLETFee = _hbWalletlimitFee;
        return (limitETHFee, limitHBWALLETFee);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    /**
     * @dev Withdraw the amount of eth that is remaining in this contract.
     * @param _address The address of EOA that can receive token from this contract.
     */
    function _withdraw(address payable _address, uint256 amount, uint256 _amountHB) internal {
        require(_address != address(0) && amount >= 0 && address(this).balance >= amount && _amountHB >= 0 && hbwalletToken.balanceOf(address(this)) >= _amountHB);
        if(amount > 0) {
            _address.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.transferFrom(address(this), _address, _amountHB);
        }
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function withdraw(address payable _address, uint256 amount, uint256 _amountHB) public onlyCeoAddress {
        _withdraw(_address, amount, _amountHB);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function cancelBussiness() public onlyCeoAddress {
        for (uint i = 0; i < arrayTokenIdSale.length; i++) {
            if (prices[arrayTokenIdSale[i]].tokenOwner == erc721Address.ownerOf(arrayTokenIdSale[i])) {
                if (prices[arrayTokenIdSale[i]].fee > 0) {
                    uint256 eth = prices[arrayTokenIdSale[i]].fee;
                    if(prices[arrayTokenIdSale[i]].isHightlight == true) eth += hightLightFee;
                    if(address(this).balance >= eth) {
                        prices[arrayTokenIdSale[i]].tokenOwner.transfer(eth);
                    } 
                }
                else if (prices[arrayTokenIdSale[i]].hbfee > 0) {
                    uint256 hb = prices[arrayTokenIdSale[i]].hbfee;
                    if(prices[arrayTokenIdSale[i]].isHightlight == true) hb += hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
                    if(hbwalletToken.balanceOf(address(this)) >= hb) {
                        hbwalletToken.transfer(prices[arrayTokenIdSale[i]].tokenOwner, hb);
                    }
                }
            }
        }
        _withdraw(msg.sender, address(this).balance, hbwalletToken.balanceOf(address(this)));
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    
    function revenue() public view returns (uint256, uint256){
        uint256 ethfee = 0;
        uint256 hbfee = 0;
        for (uint256 i = 0; i < arrayTokenIdSale.length; i++) {
            if (prices[arrayTokenIdSale[i]].tokenOwner == erc721Address.ownerOf(arrayTokenIdSale[i])) {
                if (prices[arrayTokenIdSale[i]].fee > 0) {
                    ethfee += prices[arrayTokenIdSale[i]].fee;
                }
                else if (prices[arrayTokenIdSale[i]].hbfee > 0) {
                    hbfee += prices[arrayTokenIdSale[i]].hbfee;
                }
            }
        }
        uint256 eth = address(this).balance - ethfee;
        uint256 hb = hbwalletToken.balanceOf(address(this)) - hbfee;
        return (eth, hb);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeCeo(address _address) public onlyCeoAddress {
        require(_address != address(0));
        ceoAddress = _address;

    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function buy(uint256 tokenId) public payable {
        require(getApproved(tokenId) == address(this));
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function buyWithoutCheckApproved(uint256 tokenId) public payable {
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function resetPrice(uint256 tokenId) private {
        prices[tokenId] = Price(address(0), 0, 0, 0, false);
        for (uint256 i = 0; i < arrayTokenIdSale.length; i++) {
            if (arrayTokenIdSale[i] == tokenId) {
                _burnArrayTokenIdSale(i);
            }
        }
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}