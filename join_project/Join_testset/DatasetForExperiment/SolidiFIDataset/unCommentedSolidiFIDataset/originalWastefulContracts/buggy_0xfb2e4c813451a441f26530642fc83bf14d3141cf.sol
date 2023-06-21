pragma solidity 0.5.7;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  address payable public owner;


function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipRenounced(address indexed previousOwner);
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address payable _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address payable _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, reverts on overflow.
  */
  function mul(uint256 _a, uint256 _b) internal pure returns (uint256) {
    
    
    
    if (_a == 0) {
      return 0;
    }

    uint256 c = _a * _b;
    require(c / _a == _b);

    return c;
  }

  /**
  * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
  */
  function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
    require(_b > 0); 
    uint256 c = _a / _b;
    

    return c;
  }

  /**
  * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
    require(_b <= _a);
    uint256 c = _a - _b;

    return c;
  }

  /**
  * @dev Adds two numbers, reverts on overflow.
  */
  function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
    uint256 c = _a + _b;
    require(c >= _a);

    return c;
  }

  /**
  * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
  * reverts when dividing by zero.
  */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b != 0);
    return a % b;
  }
}

/**
 * @title ERC20 interface
 * @dev see https:
 */
contract ERC20 {
  function totalSupply() public view returns (uint256);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

  function balanceOf(address _who) public view returns (uint256);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  function allowance(address _owner, address _spender)
    public view returns (uint256);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

  function transfer(address _to, uint256 _value) public returns (bool);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function approve(address _spender, uint256 _value)
    public returns (bool);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  function transferFrom(address _from, address _to, uint256 _value)
    public returns (bool);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

  function decimals() public view returns (uint256);
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library ERC20SafeTransfer {
    function safeTransfer(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {
        (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
        require(success, "Transfer failed");

        return fetchReturnData();
    }

    function safeTransferFrom(address _tokenAddress, address _from, address _to, uint256 _value) internal returns (bool success) {
        (success,) = _tokenAddress.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", _from, _to, _value));
        require(success, "Transfer From failed");

        return fetchReturnData();
    }

    function safeApprove(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {
        (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
        require(success,  "Approve failed");

        return fetchReturnData();
    }

    function fetchReturnData() internal pure returns (bool success){
        assembly {
            switch returndatasize()
            case 0 {
                success := 1
            }
            case 32 {
                returndatacopy(0, 0, 32)
                success := mload(0)
            }
            default {
                revert(0, 0)
            }
        }
    }

}



library Utils {

    uint256 constant internal PRECISION = (10**18);
    uint256 constant internal MAX_QTY   = (10**28); 
    uint256 constant internal MAX_RATE  = (PRECISION * 10**6); 
    uint256 constant internal MAX_DECIMALS = 18;
    uint256 constant internal ETH_DECIMALS = 18;
    uint256 constant internal MAX_UINT = 2**256-1;
    address constant internal ETH_ADDRESS = address(0x0);

    
    function precision() internal pure returns (uint256) { return PRECISION; }
    function max_qty() internal pure returns (uint256) { return MAX_QTY; }
    function max_rate() internal pure returns (uint256) { return MAX_RATE; }
    function max_decimals() internal pure returns (uint256) { return MAX_DECIMALS; }
    function eth_decimals() internal pure returns (uint256) { return ETH_DECIMALS; }
    function max_uint() internal pure returns (uint256) { return MAX_UINT; }
    function eth_address() internal pure returns (address) { return ETH_ADDRESS; }

    /
    /
    /
    /
    /
    function getDecimals(address token)
        internal
        returns (uint256 decimals)
    {
        bytes4 functionSig = bytes4(keccak256("decimals()"));

        /
        /
        assembly {
            
            let ptr := mload(0x40)
            
            mstore(ptr,functionSig)
            let functionSigLength := 0x04
            let wordLength := 0x20

            let success := call(
                                5000, 
                                token, 
                                0, 
                                ptr, 
                                functionSigLength, 
                                ptr, 
                                wordLength 
                               )

            switch success
            case 0 {
                decimals := 0 
            }
            case 1 {
                decimals := mload(ptr) 
            }
            mstore(0x40,add(ptr,0x04)) 
        }
    }

    /
    /
    /
    /
    /
    /
    function tokenAllowanceAndBalanceSet(
        address tokenOwner,
        address tokenAddress,
        uint256 tokenAmount,
        address addressToAllow
    )
        internal
        view
        returns (bool)
    {
        return (
            ERC20(tokenAddress).allowance(tokenOwner, addressToAllow) >= tokenAmount &&
            ERC20(tokenAddress).balanceOf(tokenOwner) >= tokenAmount
        );
    }

    function calcDstQty(uint srcQty, uint srcDecimals, uint dstDecimals, uint rate) internal pure returns (uint) {
        if (dstDecimals >= srcDecimals) {
            require((dstDecimals - srcDecimals) <= MAX_DECIMALS);
            return (srcQty * rate * (10**(dstDecimals - srcDecimals))) / PRECISION;
        } else {
            require((srcDecimals - dstDecimals) <= MAX_DECIMALS);
            return (srcQty * rate) / (PRECISION * (10**(srcDecimals - dstDecimals)));
        }
    }

    function calcSrcQty(uint dstQty, uint srcDecimals, uint dstDecimals, uint rate) internal pure returns (uint) {

        
        uint numerator;
        uint denominator;
        if (srcDecimals >= dstDecimals) {
            require((srcDecimals - dstDecimals) <= MAX_DECIMALS);
            numerator = (PRECISION * dstQty * (10**(srcDecimals - dstDecimals)));
            denominator = rate;
        } else {
            require((dstDecimals - srcDecimals) <= MAX_DECIMALS);
            numerator = (PRECISION * dstQty);
            denominator = (rate * (10**(dstDecimals - srcDecimals)));
        }
        return (numerator + denominator - 1) / denominator; 
    }

    function calcDestAmount(ERC20 src, ERC20 dest, uint srcAmount, uint rate) internal returns (uint) {
        return calcDstQty(srcAmount, getDecimals(address(src)), getDecimals(address(dest)), rate);
    }

    function calcSrcAmount(ERC20 src, ERC20 dest, uint destAmount, uint rate) internal returns (uint) {
        return calcSrcQty(destAmount, getDecimals(address(src)), getDecimals(address(dest)), rate);
    }

    function calcRateFromQty(uint srcAmount, uint destAmount, uint srcDecimals, uint dstDecimals)
        internal pure returns (uint)
    {
        require(srcAmount <= MAX_QTY);
        require(destAmount <= MAX_QTY);

        if (dstDecimals >= srcDecimals) {
            require((dstDecimals - srcDecimals) <= MAX_DECIMALS);
            return (destAmount * PRECISION / ((10 ** (dstDecimals - srcDecimals)) * srcAmount));
        } else {
            require((srcDecimals - dstDecimals) <= MAX_DECIMALS);
            return (destAmount * PRECISION * (10 ** (srcDecimals - dstDecimals)) / srcAmount);
        }
    }

    /
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }
}

contract Partner {

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address payable public partnerBeneficiary;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public partnerPercentage; 

    uint256 public companyPercentage;
    address payable public companyBeneficiary;

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event LogPayout(
        address token,
        uint256 partnerAmount,
        uint256 companyAmount
    );

    function init(
        address payable _companyBeneficiary,
        uint256 _companyPercentage,
        address payable _partnerBeneficiary,
        uint256 _partnerPercentage
    ) public {
        require(companyBeneficiary == address(0x0) && partnerBeneficiary == address(0x0));
        companyBeneficiary = _companyBeneficiary;
        companyPercentage = _companyPercentage;
        partnerBeneficiary = _partnerBeneficiary;
        partnerPercentage = _partnerPercentage;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function payout(
        address[] memory tokens
    ) public {
        
        for(uint256 index = 0; index<tokens.length; index++){
            uint256 balance = tokens[index] == Utils.eth_address()? address(this).balance : ERC20(tokens[index]).balanceOf(address(this));
            uint256 partnerAmount = SafeMath.div(SafeMath.mul(balance, partnerPercentage), getTotalFeePercentage());
            uint256 companyAmount = balance - partnerAmount;
            if(tokens[index] == Utils.eth_address()){
                partnerBeneficiary.transfer(partnerAmount);
                companyBeneficiary.transfer(companyAmount);
            } else {
                ERC20SafeTransfer.safeTransfer(tokens[index], partnerBeneficiary, partnerAmount);
                ERC20SafeTransfer.safeTransfer(tokens[index], companyBeneficiary, companyAmount);
            }
        }
    }

    function getTotalFeePercentage() public view returns (uint256){
        return partnerPercentage + companyPercentage;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function() external payable {

    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract PartnerRegistry is Ownable {

  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  address target;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bool) partnerContracts;
    address payable public companyBeneficiary;
    uint256 public companyPercentage;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event PartnerRegistered(address indexed creator, address indexed beneficiary, address partnerContract);


    constructor(address _target, address payable _companyBeneficiary, uint256 _companyPercentage) public {
        target = _target;
        companyBeneficiary = _companyBeneficiary;
        companyPercentage = _companyPercentage;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function registerPartner(address payable partnerBeneficiary, uint256 partnerPercentage) external {
        Partner newPartner = Partner(createClone());
        newPartner.init(companyBeneficiary, companyPercentage, partnerBeneficiary, partnerPercentage);
        partnerContracts[address(newPartner)] = true;
        emit PartnerRegistered(address(msg.sender), partnerBeneficiary, address(newPartner));
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function overrideRegisterPartner(
        address payable _companyBeneficiary,
        uint256 _companyPercentage,
        address payable partnerBeneficiary,
        uint256 partnerPercentage
    ) external onlyOwner {
        Partner newPartner = Partner(createClone());
        newPartner.init(_companyBeneficiary, _companyPercentage, partnerBeneficiary, partnerPercentage);
        partnerContracts[address(newPartner)] = true;
        emit PartnerRegistered(address(msg.sender), partnerBeneficiary, address(newPartner));
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function deletePartner(address _partnerAddress) public onlyOwner {
        partnerContracts[_partnerAddress] = false;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function createClone() internal returns (address payable result) {
        bytes20 targetBytes = bytes20(target);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), targetBytes)
            mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
            result := create(0, clone, 0x37)
        }
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function isValidPartner(address partnerContract) public view returns(bool) {
        return partnerContracts[partnerContract];
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function updateCompanyInfo(address payable newCompanyBeneficiary, uint256 newCompanyPercentage) public onlyOwner {
        companyBeneficiary = newCompanyBeneficiary;
        companyPercentage = newCompanyPercentage;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}