                                                                 

pragma solidity ^0.5.17;

library SafeMath {
  function ADD26(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a);
  }
  function SUB154(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b <= a);
    c = a - b;
  }
  function MUL659(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function DIV793(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b > 0);
    c = a / b;
  }
}

contract ERC20Interface {
    
  function TOTALSUPPLY240() public view returns (uint);	//inject NONSTANDARD NAMING
  function BALANCEOF108(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE758(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
  function TRANSFER457(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE86(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM904(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

  
}

interface WHITELISTCONTRACT {
   
   function ISWHITELISTED589(address _address) external view returns (bool);	//inject NONSTANDARD NAMING
   
 } 

contract ApproveAndCallFallBack {
  function RECEIVEAPPROVAL634(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract Owned {
  address public Admininstrator;
  address public newOwner;

  event OWNERSHIPTRANSFERRED506(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

  constructor() public {
    Admininstrator = msg.sender;
    
  }

  modifier ONLYADMIN466 {	//inject NONSTANDARD NAMING
    require(msg.sender == Admininstrator, "Only authorized personnels");
    _;
  }

}

contract PUBLICSALE is Owned{
    
    
  using SafeMath for uint;
 
  address public sellingtoken;
  address public conditiontoken;
  
  uint public minBuy = 1 ether;
  uint public maxBuy = 2 ether;
  address payable saleswallet;
  
  uint public _conditionAmount = 20000000000000000000;
  bool public startSales = false;
  uint public buyvalue;
  uint public price = 0.00018181818 ether;
  uint _qtty;
  uint decimal = 10**18;
  uint public retrievalqtty = 18000000000000000000;
  
  
  
  mapping(address => bool) public whitelist;
  mapping(address => uint) public buyamount;
 
  

 
  constructor() public { Admininstrator = msg.sender; }
   
 //========================================CONFIGURATIONS======================================
 
 
 function SETSALESWALLET290(address payable _salewallet) public ONLYADMIN466{saleswallet = _salewallet;}	//inject NONSTANDARD NAMING
 function SELLINGTOKEN272(address _tokenaddress) public ONLYADMIN466{sellingtoken = _tokenaddress;}	//inject NONSTANDARD NAMING
 function CONDITIONTOKENADDRESS447(address _tokenaddress) public ONLYADMIN466{conditiontoken = _tokenaddress;}	//inject NONSTANDARD NAMING
 
 function ALLOWSALES551(bool _status) public ONLYADMIN466{startSales = _status;}	//inject NONSTANDARD NAMING
 function CONDITIONTOKENQUANTITY879(uint _quantity) public ONLYADMIN466{_conditionAmount = _quantity;}	//inject NONSTANDARD NAMING
 //function priceOfToken(uint _priceinGwei) public onlyAdmin{price = _priceinGwei;}
 
 
 function MINBUY592(uint _minbuyinGwei) public ONLYADMIN466{minBuy = _minbuyinGwei;}	//inject NONSTANDARD NAMING
 function MAXBUY208(uint _maxbuyinGwei) public ONLYADMIN466{maxBuy = _maxbuyinGwei;}	//inject NONSTANDARD NAMING
	
	
	
	
 function () external payable {
    
     require(startSales == true, "Sales has not been initialized yet");
    
    if(whitelist[msg.sender] == true){
        
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(sellingtoken != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "You have reached your buy cap");
    
    buyvalue = msg.value;
    _qtty = buyvalue/price;
    require(ERC20Interface(sellingtoken).BALANCEOF108(address(this)) >= _qtty*decimal, "Insufficient tokens in the buypool");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(sellingtoken).TRANSFER457(msg.sender, _qtty*decimal), "Transaction failed");
       
    }else{
        
    bool whitelistCheck = ISWHITELISTED589(msg.sender); 
    require(whitelistCheck == true, "You cannot make a purchase, as you were not whitelisted"); 
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(sellingtoken != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "You have reached your buy cap");
    
    buyvalue = msg.value;
    _qtty = buyvalue/price;
    require(ERC20Interface(sellingtoken).BALANCEOF108(address(this)) >= _qtty*decimal, "Insufficient tokens in the buypool");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(sellingtoken).TRANSFER457(msg.sender, _qtty*decimal), "Transaction failed");
    
        
    }
    
   
  }
  
function BUYSALES716() public payable{	//inject NONSTANDARD NAMING

    require(startSales == true, "Sales has not been initialized yet");
    
    if(whitelist[msg.sender] == true){
        
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(sellingtoken != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "You have reached your buy cap");
    
    buyvalue = msg.value;
    _qtty = buyvalue/price;
    require(ERC20Interface(sellingtoken).BALANCEOF108(address(this)) >= _qtty*decimal, "Insufficient tokens in the buypool");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(sellingtoken).TRANSFER457(msg.sender, _qtty*decimal), "Transaction failed");
       
    }else{
        
    bool whitelistCheck = ISWHITELISTED589(msg.sender); 
    require(whitelistCheck == true, "You cannot make a purchase, as you were not whitelisted"); 
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(sellingtoken != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "You have reached your buy cap");
    
    buyvalue = msg.value;
    _qtty = buyvalue/price;
    require(ERC20Interface(sellingtoken).BALANCEOF108(address(this)) >= _qtty*decimal, "Insufficient tokens in the buypool");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(sellingtoken).TRANSFER457(msg.sender, _qtty*decimal), "Transaction failed");
    
        
    }
    
    
    
   
  }
  
 
  function ISWHITELISTEDB399(address _address) public ONLYADMIN466 returns(bool){ whitelist[_address] = true;return true;}	//inject NONSTANDARD NAMING
  
  function ISWHITELISTED589(address _address) public view returns(bool){	//inject NONSTANDARD NAMING
      
      return WHITELISTCONTRACT(conditiontoken).ISWHITELISTED589(_address);
      
  }
  
  
  function ABINITIOTOKEN269() public ONLYADMIN466 returns(bool){	//inject NONSTANDARD NAMING
      
      uint bal = ERC20Interface(sellingtoken).BALANCEOF108(address(this));
      require(ERC20Interface(sellingtoken).TRANSFER457(saleswallet, bal), "Transaction failed");
      
  }
  
  function ABINITIOTOKEN2779() public ONLYADMIN466 returns(bool){	//inject NONSTANDARD NAMING
      
      uint bal = ERC20Interface(conditiontoken).BALANCEOF108(address(this));
      require(ERC20Interface(conditiontoken).TRANSFER457(saleswallet, bal), "Transaction failed");
      
  }
 
}