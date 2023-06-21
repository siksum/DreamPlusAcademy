/**
 *Submitted for verification at Etherscan.io on 2019-12-27
*/

/*

 *-- SCAM-ALERT --*
 
SCAM-ALERT.INFO issues scam alert for possible fraud contracts. 

Attention. Do not transact with contracts marked with the ".SCAM-ALERT" token. 
These contracts were classified by independent auditors as fraud/scams.

If you are the owner or member of a contract marked as fraud/scams
and would like to request a review, please contact us at review@scam-alert.info 
or using this contract.

Interested in also being an independent auditor and helping us make Ethereum contracts safer,
please contact us at audit@scam-alert.info

Scam alert tokens will be highlighted in red in Block Explorer Platforms.

www.scam-alert.info
contact@scam-alert.info

*/


pragma solidity ^0.5.13;

/**
 * @notice Library of mathematical calculations for uit256
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @notice Audit control
 */
contract SysAudit {
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  event AuditsAdded(address addr);
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  event AuditsRemoved(address addr);
  address audit;
  mapping(address => bool) public audits;
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  mapping (uint => address) public auditsList;
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  address feeWallet;
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  address fraudWallet;
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  uint public NextAudits = 1;
  
  constructor() public {
    audit = msg.sender;
    feeWallet = 0x2762a54Da4d9a403A351E26b55D1D34c0e9b001C;   // Service Maintenance.
    fraudWallet = 0xd24f71512525Ae0C7eb772d02A90cFFf5cC4275A; // Fraud detect wallet
    addAddresToAudits(audit);
  }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  
  modifier onlyAudit() {
    require(msg.sender == audit, "Only for Audit manager");
    _;
  }
  
  modifier onlyAudits() {
    require(audits[msg.sender], "Only for Audit");
    _;
  }
  
  function setAudit(address _newAudit) public onlyAudit {
    audit = _newAudit;
  }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  
  function setWallet_fee(address _newWallet) public onlyAudit {
      feeWallet = _newWallet;
  }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    
  function setWallet_fraud(address _newWallet) public onlyAudit {
      fraudWallet = _newWallet;
  }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  
  function addAddresToAudits(address addr) public onlyAudit {
    if (!audits[addr]) {
      audits[addr] = true;
      auditsList[NextAudits] = addr;
      NextAudits++;
      emit AuditsAdded(addr);
    }
  }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  
  function removeAddresToAudits(address addr) public onlyAudit {
    if (audits[addr]) {
      audits[addr] = false;
      emit AuditsRemoved(addr);
    }
  }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  
}

/**
 * @notice Standard Token ERC20
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md for more details
 * Token to be used for future expansion, will soon be negotiated
 */
contract AlertToken is SysAudit {
    /* This generates a public event on the blockchain that will notify clients */
  function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 value);

    /* Public variables of the token */
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  string public name;
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  string public symbol;
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  uint8 public decimals;
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  uint256 public totalSupply;

    /* This creates an array with all balances */
  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  mapping (address => uint256) public balanceOf;
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => mapping (address => uint256)) public allowance;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor() public {
        uint256 initialSupply = 100000000000000;
        string memory tokenName = ".SCAM-ALERT";
        uint8 decimalUnits = 0;
        string memory tokenSymbol = "%";
        balanceOf[fraudWallet] = initialSupply;             // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        decimals = decimalUnits;                            // Amount of decimals for display purposes
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

   /** 
    * @notice Send `_value` tokens to `_to` from your account
    * @param _to The address of the recipient
    * @param _value the amount to send
    */
    function transfer(address _to, uint256 _value) public {
       if(_value >0){
         revert('Only an auditor can remove this alert.');  
       } else {
         _transfer(msg.sender, _to, _value);
       }
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal {
        require (_to != address(0x0),"Prevent transfer to 0x0 address");
        require (balanceOf[_from] >= _value,"Insufficient balance");
        require (balanceOf[_to] + _value > balanceOf[_to],"overflows");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
}
/*
 * Fraud Alert tracking
 *
 */
contract ScamAlert is AlertToken {
    // Using SafeMath for uint256;
    // Events
  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event evt_audit(uint id,address indexed contract_audited, bytes32 reason,address indexed audit, uint fraud,uint pct);
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event evt_review(uint id,address indexed contract_audited, bytes32 reason,address indexed audit, uint fraud,uint pct);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event evt_getreview(uint id,address indexed contract_audited, bytes32 name, bytes32 reason,address indexed user, uint mode);

    // Fees of services
  function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  uint public feeReview = 0.00 ether;
  function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  uint public feeReviewExpress = 0.10 ether;
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  uint public feeReviewNow = 0.50 ether;
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  uint public auditID = 1;
    
    enum FraudInfo {
        NO_FRAUD,
        IN_REVISION,
        DARK_CONTRACT,
        POPULAR_SCAMMER,
        TAX_FRAUD,
        INSUFFICIENT_SHORTFALL,
        INSUFFICIENT_LIQUIDITY,
        PONZI_SCHEME_WITHOUT_PAYMENT,
        FINANCIAL_FUND_WITHOUT_PAYMENT,
        FAKE_GAME,
        FAKE_TRANSACTIONS,
        FAKE_FUND,
        FAKE_TOKEN,
        FAKE_DAPP,
        FAKE_WEBSITE,
        CONTRACT_ERROR,
        OTHERS
    }
  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  FraudInfo fraudInfo;

    struct AuditedStruct {
        uint id;
        bytes32 reason;
        bytes32 name;
        address audit;
        uint fraud;
        uint date_audited;
    }
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => AuditedStruct) public audited;
  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  mapping (uint => address) public auditedList;

    // Start Contract
    constructor() public {}
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    
   /**
     * @notice Get review
     */
    function () external payable {
        address _ref;
        if(msg.data.length > 0){                                        
            _ref = b2A(msg.data);
        }
        getReview(_ref, '','',99);
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

   /**
     * @notice Add audit for contract address
     */
    function addAudit(address _contract_audited, bytes32 _name, uint _fraud, bytes32 _reason, uint _pct) public onlyAudits {
        if(audited[_contract_audited].id > 0) {
            revert('This contract already has a fraud review');
        }
        if(_pct > 100){
          revert('Percent cannot be greater than 100%');  
        }
        AuditedStruct memory auditedStruct;                                
        auditedStruct = AuditedStruct({
            id : auditID,
            reason: _reason,
            name: _name,
            audit: msg.sender,
            fraud: uint(_fraud),
            date_audited: block.timestamp
        });
        audited[_contract_audited] = auditedStruct;
        auditedList[auditID] = _contract_audited;
        emit evt_audit(auditID,_contract_audited, _reason, msg.sender, _fraud, _pct);
        auditID++;
        _transfer(fraudWallet, _contract_audited, _pct);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    /**
     * @notice Review audit for contract address
     */
    function reviewAudit(address _contract_audited, bytes32 _name, uint _fraud, bytes32 _reason, uint _pct) public onlyAudits {
        if(audited[_contract_audited].id < 1) {
            revert('This contract not exist for review');
        }
        if(_pct > 100){
          revert('Percent cannot be greater than 100%');  
        }
        audited[_contract_audited].reason = _reason;
        audited[_contract_audited].name = _name;
        audited[_contract_audited].audit = msg.sender;
        audited[_contract_audited].fraud = _fraud;
        audited[_contract_audited].date_audited = block.timestamp;
        emit evt_review(audited[_contract_audited].id,_contract_audited, _reason, msg.sender, _fraud, _pct);
        
        if(balanceOf[_contract_audited] > _pct) {
           _transfer(_contract_audited, fraudWallet, balanceOf[_contract_audited] - _pct); 
        } else {
           _transfer(fraudWallet, _contract_audited, _pct - balanceOf[_contract_audited]); 
        }
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    /**
     * @notice Audit Request
     */
    function getReview(address _contract_audited, bytes32 _name, bytes32 _reason, uint _fraud) public payable{
        uint  _mode = 0;
        if(msg.value < feeReview){                                   
            revert('Lower minimum value to review contract');
        }
        if(msg.value >= feeReviewExpress){ 
            _mode = 1;
        }
        if(msg.value >= feeReviewNow){ 
            _mode = 2;
        }
        emit evt_getreview(audited[_contract_audited].id, _contract_audited, _name, _reason, msg.sender, _fraud);
        address(uint160(feeWallet)).transfer(address(this).balance); 
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    function setFees(uint _feeReview, uint _feeReviewExpress, uint _feeReviewNow) public onlyAudit {
        feeReview = _feeReview;
        feeReviewExpress = _feeReviewExpress;
        feeReviewNow = _feeReviewNow;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  
   /**
    * @notice Bytes to anddress
    * @param _inBytes bytes to convert in Ethereum address
    */
    function b2A(bytes memory _inBytes) private pure returns (address outAddress) {
        assembly{
            outAddress := mload(add(_inBytes, 20))
        }
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    function kill() public onlyAudit {
        selfdestruct(msg.sender);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
}