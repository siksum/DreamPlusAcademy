pragma solidity ^0.4.18;

import "SafeMath.sol";
import "Token.sol";
import "Ownable.sol";


contract Gateway is Ownable{
    using SafeMath for uint;
    address public feeAccount1 = 0x468bAC3718E5dCE7844EfD641B91ed85Ef8f4C32; //the account1 that will receive fees
    address public feeAccount2 = 0x468bAC3718E5dCE7844EfD641B91ed85Ef8f4C32; //the account2 that will receive fees
    address public feeAccountToken = 0x468bAC3718E5dCE7844EfD641B91ed85Ef8f4C32;//the account that will receive fees tokens
    
    struct BuyInfo {
      address buyerAddress; 
      address sellerAddress;
      uint value;
      address currency;
    }
    
    mapping(address => mapping(uint => BuyInfo)) public payment;
   
    uint balanceFee;
    uint public feePercent;
    uint public maxFee;
    constructor() public{
       feePercent = 1500000; // decimals 6. 1,5% fee by default
       maxFee = 3000000; // fee can not exceed 3%
    }
    
    
    function getBuyerAddressPayment(address _sellerAddress, uint _orderId) public constant returns(address){
      return  payment[_sellerAddress][_orderId].buyerAddress;
    }    
    function getSellerAddressPayment(address _sellerAddress, uint _orderId) public constant returns(address){
      return  payment[_sellerAddress][_orderId].sellerAddress;
    }    
    
    function getValuePayment(address _sellerAddress, uint _orderId) public constant returns(uint){
      return  payment[_sellerAddress][_orderId].value;
    }    
    
    function getCurrencyPayment(address _sellerAddress, uint _orderId) public constant returns(address){
      return  payment[_sellerAddress][_orderId].currency;
    }
    
    
    function setFeeAccount1(address _feeAccount1) onlyOwner public{
      feeAccount1 = _feeAccount1;  
    }
    function setFeeAccount2(address _feeAccount2) onlyOwner public{
      feeAccount2 = _feeAccount2;  
    }
    function setFeeAccountToken(address _feeAccountToken) onlyOwner public{
      feeAccountToken = _feeAccountToken;  
    }    
    function setFeePercent(uint _feePercent) onlyOwner public{
      require(_feePercent <= maxFee);
      feePercent = _feePercent;  
    }    
    function payToken(address _tokenAddress, address _sellerAddress, uint _orderId,  uint _value) public returns (bool success){
      require(_tokenAddress != address(0));
      require(_sellerAddress != address(0)); 
      require(_value > 0);
      Token token = Token(_tokenAddress);
      require(token.allowance(msg.sender, this) >= _value);
      token.transferFrom(msg.sender, feeAccountToken, _value.mul(feePercent).div(100000000));
      token.transferFrom(msg.sender, _sellerAddress, _value.sub(_value.mul(feePercent).div(100000000)));
      payment[_sellerAddress][_orderId] = BuyInfo(msg.sender, _sellerAddress, _value, _tokenAddress);
      success = true;
    }
    function payEth(address _sellerAddress, uint _orderId, uint _value) internal returns  (bool success){
      require(_sellerAddress != address(0)); 
      require(_value > 0);
      uint fee = _value.mul(feePercent).div(100000000);
      _sellerAddress.transfer(_value.sub(fee));
      balanceFee = balanceFee.add(fee);
      payment[_sellerAddress][_orderId] = BuyInfo(msg.sender, _sellerAddress, _value, 0x0000000000000000000000000000000000000001);    
      success = true;
    }
    function transferFee() onlyOwner public{
      uint valfee1 = balanceFee.div(2);
      feeAccount1.transfer(valfee1);
      balanceFee = balanceFee.sub(valfee1);
      feeAccount2.transfer(balanceFee);
      balanceFee = 0;
    }
    function balanceOfToken(address _tokenAddress, address _Address) public constant returns (uint) {
      Token token = Token(_tokenAddress);
      return token.balanceOf(_Address);
    }
    function balanceOfEthFee() public constant returns (uint) {
      return balanceFee;
    }
    function bytesToAddress(bytes source) internal pure returns(address) {
      uint result;
      uint mul = 1;
      for(uint i = 20; i > 0; i--) {
        result += uint8(source[i-1])*mul;
        mul = mul*256;
      }
      return address(result);
    }
    function() external payable {
      require(msg.data.length == 20); 
      require(msg.value > 99999999999);
      address sellerAddress = bytesToAddress(bytes(msg.data));
      uint value = msg.value.div(10000000000).mul(10000000000);
      uint orderId = msg.value.sub(value);
      balanceFee = balanceFee.add(orderId);
      payEth(sellerAddress, orderId, value);
  }
}