/**
 *Submitted for verification at Etherscan.io on 2020-02-25
*/

pragma solidity ^0.5.10;



pragma solidity ^0.5.9;

contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address _who) public view returns (uint256);
  function transfer(address _to, uint256 _value) public returns (bool);
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   
}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) internal balances;

  uint256 internal totalSupply_;

  /**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

}

contract BurnableToken is BasicToken {

function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event Burn(address indexed burner, uint256 value);

  /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burn(uint256 _value) public {
    _burn(msg.sender, _value);
  }

  function _burn(address _who, uint256 _value) internal {
    require(_value <= balances[_who]);
    
    

    balances[_who] = balances[_who].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    emit Burn(_who, _value);
    emit Transfer(_who, address(0), _value);
  }
}

contract ERC20 is ERC20Basic {
  function allowance(address _owner, address _spender)
    public view returns (uint256);

  function transferFrom(address _from, address _to, uint256 _value)
    public returns (bool);

  function approve(address _spender, uint256 _value) public returns (bool);
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   
}
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract DetailedERC20 is ERC20 {
  string public name;
  string public symbol;
  uint8 public decimals;

  constructor(string memory _name, string memory _symbol, uint8 _decimals) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
  }
}

contract Ownable {
  address public owner;


mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  
    balances_intou18[msg.sender] -= _value;  
    balances_intou18[_to] += _value;  
    return true;
  }
  event OwnershipRenounced(address indexed previousOwner);
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   
}
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

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    
    
    
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
    
    
    
    return _a / _b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
    assert(_b <= _a);
    return _a - _b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}

contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https:
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

contract MintableToken is StandardToken, Ownable {
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event Mint(address indexed to, uint256 amount);
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  event MintFinished();

  bool public mintingFinished = false;


  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  modifier hasMintPermission() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    public
    hasMintPermission
    canMint
    returns (bool)
  {
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }

  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() public onlyOwner canMint returns (bool) {
    mintingFinished = true;
    emit MintFinished();
    return true;
  }
}

contract CappedToken is MintableToken {

  uint256 public cap;

  constructor(uint256 _cap) public {
    require(_cap > 0);
    cap = _cap;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    public
    returns (bool)
  {
    require(totalSupply_.add(_amount) <= cap);

    return super.mint(_to, _amount);
  }

}

contract EraswapERC20 is DetailedERC20, BurnableToken, CappedToken {
  string private name = "Eraswap";
  string private symbol = "EST";
  uint8 private decimals = 18;
  uint256 private cap = 9100000000000000000000000000;

  /**
  * @dev Constructor
  */

  constructor() internal DetailedERC20("Eraswap", "EST", 18) CappedToken(cap){
    mint(msg.sender, 910000000000000000000000000);
  }

}

contract NRTManager is Ownable, EraswapERC20{

  using SafeMath for uint256;

  uint256 public LastNRTRelease;              
  uint256 public MonthlyNRTAmount;            
  uint256 public AnnualNRTAmount;             
  uint256 public MonthCount;                  
  uint256 public luckPoolBal;                 
  uint256 public burnTokenBal;                

  
  address public newTalentsAndPartnerships;
  address public platformMaintenance;
  address public marketingAndRNR;
  address public kmPards;
  address public contingencyFunds;
  address public researchAndDevelopment;
  address public buzzCafe;
  address public timeSwappers;                 
  address public TimeAlly;                     

  uint256 public newTalentsAndPartnershipsBal; 
  uint256 public platformMaintenanceBal;       
  uint256 public marketingAndRNRBal;           
  uint256 public kmPardsBal;                   
  uint256 public contingencyFundsBal;          
  uint256 public researchAndDevelopmentBal;    
  uint256 public buzzCafeNRT;                  
  uint256 public TimeAllyNRT;                   
  uint256 public timeSwappersNRT;              


    
    
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event NRTDistributed(uint256 NRTReleased);

    /**
    * Event to watch Transfer of NRT to different Pool
    * @param pool - The pool name
    * @param sendAddress - The address of pool
    * @param value - The value of NRT released
    **/
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  event NRTTransfer(string pool, address sendAddress, uint256 value);


    
    
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event TokensBurned(uint256 amount);



    /**
    * @dev Should burn tokens according to the total circulation
    * @return true if success
    */

    function burnTokens() internal returns (bool){
      if(burnTokenBal == 0){
        return true;
      }
      else{
        uint MaxAmount = ((totalSupply()).mul(2)).div(100);   
        if(MaxAmount >= burnTokenBal ){
          burn(burnTokenBal);
          burnTokenBal = 0;
        }
        else{
          burnTokenBal = burnTokenBal.sub(MaxAmount);
          burn(MaxAmount);
        }
        return true;
      }
    }

    /**
    * @dev To invoke monthly release
    * @return true if success
    */

    function MonthlyNRTRelease() external returns (bool) {
      require(now.sub(LastNRTRelease)> 2592000);
      uint256 NRTBal = MonthlyNRTAmount.add(luckPoolBal);        

      
      newTalentsAndPartnershipsBal = (NRTBal.mul(5)).div(100);
      platformMaintenanceBal = (NRTBal.mul(10)).div(100);
      marketingAndRNRBal = (NRTBal.mul(10)).div(100);
      kmPardsBal = (NRTBal.mul(10)).div(100);
      contingencyFundsBal = (NRTBal.mul(10)).div(100);
      researchAndDevelopmentBal = (NRTBal.mul(5)).div(100);
      buzzCafeNRT = (NRTBal.mul(25)).div(1000);
      TimeAllyNRT = (NRTBal.mul(15)).div(100);
      timeSwappersNRT = (NRTBal.mul(325)).div(1000);

      
      mint(newTalentsAndPartnerships,newTalentsAndPartnershipsBal);
      emit NRTTransfer("newTalentsAndPartnerships", newTalentsAndPartnerships, newTalentsAndPartnershipsBal);
      mint(platformMaintenance,platformMaintenanceBal);
      emit NRTTransfer("platformMaintenance", platformMaintenance, platformMaintenanceBal);
      mint(marketingAndRNR,marketingAndRNRBal);
      emit NRTTransfer("marketingAndRNR", marketingAndRNR, marketingAndRNRBal);
      mint(kmPards,kmPardsBal);
      emit NRTTransfer("kmPards", kmPards, kmPardsBal);
      mint(contingencyFunds,contingencyFundsBal);
      emit NRTTransfer("contingencyFunds", contingencyFunds, contingencyFundsBal);
      mint(researchAndDevelopment,researchAndDevelopmentBal);
      emit NRTTransfer("researchAndDevelopment", researchAndDevelopment, researchAndDevelopmentBal);
      mint(buzzCafe,buzzCafeNRT);
      emit NRTTransfer("buzzCafe", buzzCafe, buzzCafeNRT);
      mint(TimeAlly,TimeAllyNRT);
      emit NRTTransfer("stakingContract", TimeAlly, TimeAllyNRT);
      mint(timeSwappers,timeSwappersNRT);
      emit NRTTransfer("timeSwappers", timeSwappers, timeSwappersNRT);

      
      emit NRTDistributed(NRTBal);
      luckPoolBal = 0;
      LastNRTRelease = LastNRTRelease.add(30 days); 
      burnTokens();                                 
      emit TokensBurned(burnTokenBal);


      if(MonthCount == 11){
        MonthCount = 0;
        AnnualNRTAmount = (AnnualNRTAmount.mul(9)).div(10);
        MonthlyNRTAmount = MonthlyNRTAmount.div(12);
      }
      else{
        MonthCount = MonthCount.add(1);
      }
      return true;
    }


  /**
  * @dev Constructor
  */

  constructor() public{
    LastNRTRelease = now;
    AnnualNRTAmount = 819000000000000000000000000;
    MonthlyNRTAmount = AnnualNRTAmount.div(uint256(12));
    MonthCount = 0;
  }

}

contract PausableEraswap is NRTManager {

  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require((now.sub(LastNRTRelease))< 2592000);
    _;
  }


  function transfer(
    address _to,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.transfer(_to, _value);
  }

  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(
    address _spender,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.approve(_spender, _value);
  }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

  function increaseApproval(
    address _spender,
    uint _addedValue
  )
    public
    whenNotPaused
    returns (bool success)
  {
    return super.increaseApproval(_spender, _addedValue);
  }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   
}

  function decreaseApproval(
    address _spender,
    uint _subtractedValue
  )
    public
    whenNotPaused
    returns (bool success)
  {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   
}
}

contract EraswapToken is PausableEraswap {


    /**
    * Event to watch the addition of pool address
    * @param pool - The pool name
    * @param sendAddress - The address of pool
    **/
  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event PoolAddressAdded(string pool, address sendAddress);

    
    
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  
    balances_intou26[msg.sender] -= _value;  
    balances_intou26[_to] += _value;  
    return true;
  }
  event LuckPoolUpdated(uint256 luckPoolBal);

    
    
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
  event BurnTokenBalUpdated(uint256 burnTokenBal);

    /**
    * @dev Throws if caller is not TimeAlly
    */
    modifier OnlyTimeAlly() {
      require(msg.sender == TimeAlly);
      _;
    }


    /**
    * @dev To update pool addresses
    * @param  pool - A List of pool addresses
    * Updates if pool address is not already set and if given address is not zero
    * @return true if success
    */

    function UpdateAddresses (address[] memory pool) onlyOwner public returns(bool){

      if((pool[0] != address(0)) && (newTalentsAndPartnerships == address(0))){
        newTalentsAndPartnerships = pool[0];
        emit PoolAddressAdded( "NewTalentsAndPartnerships", newTalentsAndPartnerships);
      }
      if((pool[1] != address(0)) && (platformMaintenance == address(0))){
        platformMaintenance = pool[1];
        emit PoolAddressAdded( "PlatformMaintenance", platformMaintenance);
      }
      if((pool[2] != address(0)) && (marketingAndRNR == address(0))){
        marketingAndRNR = pool[2];
        emit PoolAddressAdded( "MarketingAndRNR", marketingAndRNR);
      }
      if((pool[3] != address(0)) && (kmPards == address(0))){
        kmPards = pool[3];
        emit PoolAddressAdded( "KmPards", kmPards);
      }
      if((pool[4] != address(0)) && (contingencyFunds == address(0))){
        contingencyFunds = pool[4];
        emit PoolAddressAdded( "ContingencyFunds", contingencyFunds);
      }
      if((pool[5] != address(0)) && (researchAndDevelopment == address(0))){
        researchAndDevelopment = pool[5];
        emit PoolAddressAdded( "ResearchAndDevelopment", researchAndDevelopment);
      }
      if((pool[6] != address(0)) && (buzzCafe == address(0))){
        buzzCafe = pool[6];
        emit PoolAddressAdded( "BuzzCafe", buzzCafe);
      }
      if((pool[7] != address(0)) && (timeSwappers == address(0))){
        timeSwappers = pool[7];
        emit PoolAddressAdded( "TimeSwapper", timeSwappers);
      }
      if((pool[8] != address(0)) && (TimeAlly == address(0))){
        TimeAlly = pool[8];
        emit PoolAddressAdded( "TimeAlly", TimeAlly);
      }

      return true;
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }


    /**
    * @dev Function to update luckpool balance
    * @param amount Amount to be updated
    */
    function UpdateLuckpool(uint256 amount) OnlyTimeAlly external returns(bool){
      require(allowance(msg.sender, address(this)) >= amount);
      require(transferFrom(msg.sender,address(this), amount));
      luckPoolBal = luckPoolBal.add(amount);
      emit LuckPoolUpdated(luckPoolBal);
      return true;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    /**
    * @dev Function to trigger to update  for burning of tokens
    * @param amount Amount to be updated
    */
    function UpdateBurnBal(uint256 amount) OnlyTimeAlly external returns(bool){
      require(allowance(msg.sender, address(this)) >= amount);
      require(transferFrom(msg.sender,address(this), amount));
      burnTokenBal = burnTokenBal.add(amount);
      emit BurnTokenBalUpdated(burnTokenBal);
      return true;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   
}

    /**
    * @dev Function to trigger balance update of a list of users
    * @param TokenTransferList - List of user addresses
    * @param TokenTransferBalance - Amount of token to be sent
    */
    function UpdateBalance(address[100] calldata TokenTransferList, uint256[100] calldata TokenTransferBalance) OnlyTimeAlly external returns(bool){
        for (uint256 i = 0; i < TokenTransferList.length; i++) {
      require(allowance(msg.sender, address(this)) >= TokenTransferBalance[i]);
      require(transferFrom(msg.sender, TokenTransferList[i], TokenTransferBalance[i]));
      }
      return true;
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }




}

/
/
/
/
contract BetDeEx {
    using SafeMath for uint256;

    address[] public bets; /
    address public superManager; /

    EraswapToken esTokenContract;

    mapping(address => uint256) public betBalanceInExaEs; /
    mapping(address => bool) public isBetValid; /
    mapping(address => bool) public isManager; /

  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event NewBetContract (
        address indexed _deployer,
        address _contractAddress,
        uint8 indexed _category,
        uint8 indexed _subCategory,
        string _description
    );

  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  
    balances_intou14[msg.sender] -= _value;  
    balances_intou14[_to] += _value;  
    return true;
  }
  event NewBetting (
        address indexed _betAddress,
        address indexed _bettorAddress,
        uint8 indexed _choice,
        uint256 _betTokensInExaEs
    );

  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  
    balances_intou38[msg.sender] -= _value;  
    balances_intou38[_to] += _value;  
    return true;
  }
  event EndBetContract (
        address indexed _ender,
        address indexed _contractAddress,
        uint8 _result,
        uint256 _prizePool,
        uint256 _platformFee
    );

    /
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   
}
  event TransferES (
        address indexed _betContract,
        address indexed _to,
        uint256 _tokensInExaEs
    );

    modifier onlySuperManager() {
        require(msg.sender == superManager, "only superManager can call");
        _;
    }

    modifier onlyManager() {
        require(isManager[msg.sender], "only manager can call");
        _;
    }

    modifier onlyBetContract() {
        require(isBetValid[msg.sender], "only bet contract can call");
        _;
    }

    /
    /
    constructor(address _esTokenContractAddress) public {
        superManager = msg.sender;
        isManager[msg.sender] = true;
        esTokenContract = EraswapToken(_esTokenContractAddress);
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /
    /
    /
    /
    /
    /
    /
    /
    /
    function createBet(
        string memory _description,
        uint8 _category,
        uint8 _subCategory,
        uint256 _minimumBetInExaEs,
        uint256 _prizePercentPerThousand,
        bool _isDrawPossible,
        uint256 _pauseTimestamp
    ) public onlyManager returns (address) {
        Bet _newBet = new Bet(
          _description,
          _category,
          _subCategory,
          _minimumBetInExaEs,
          _prizePercentPerThousand,
          _isDrawPossible,
          _pauseTimestamp
        );
        bets.push(address(_newBet));
        isBetValid[address(_newBet)] = true;

        emit NewBetContract(
          msg.sender,
          address(_newBet),
          _category,
          _subCategory,
          _description
        );

        return address(_newBet);
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /
    /
    function getNumberOfBets() public view returns (uint256) {
        return bets.length;
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  
    balances_intou6[msg.sender] -= _value;  
    balances_intou6[_to] += _value;  
    return true;
  }







    /
    /
    function addManager(address _manager) public onlySuperManager {
        isManager[_manager] = true;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  
    balances_intou2[msg.sender] -= _value;  
    balances_intou2[_to] += _value;  
    return true;
  }

    /
    /
    function removeManager(address _manager) public onlySuperManager {
        isManager[_manager] = false;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   
}

    /
    function emitNewBettingEvent(address _bettorAddress, uint8 _choice, uint256 _betTokensInExaEs) public onlyBetContract {
        emit NewBetting(msg.sender, _bettorAddress, _choice, _betTokensInExaEs);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /
    function emitEndEvent(address _ender, uint8 _result, uint256 _gasFee) public onlyBetContract {
        emit EndBetContract(_ender, msg.sender, _result, betBalanceInExaEs[msg.sender], _gasFee);
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   
}

    /
    function collectBettorTokens(address _from, uint256 _betTokensInExaEs) public onlyBetContract returns (bool) {
        require(esTokenContract.transferFrom(_from, address(this), _betTokensInExaEs), "tokens should be collected from user");
        betBalanceInExaEs[msg.sender] = betBalanceInExaEs[msg.sender].add(_betTokensInExaEs);
        return true;
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  
    balances_intou22[msg.sender] -= _value;  
    balances_intou22[_to] += _value;  
    return true;
  }

    /
    function sendTokensToAddress(address _to, uint256 _tokensInExaEs) public onlyBetContract returns (bool) {
        betBalanceInExaEs[msg.sender] = betBalanceInExaEs[msg.sender].sub(_tokensInExaEs);
        require(esTokenContract.transfer(_to, _tokensInExaEs), "tokens should be sent");

        emit TransferES(msg.sender, _to, _tokensInExaEs);
        return true;
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  
    balances_intou10[msg.sender] -= _value;  
    balances_intou10[_to] += _value;  
    return true;
  }

    /
    function collectPlatformFee(uint256 _platformFee) public onlyBetContract returns (bool) {
        require(esTokenContract.transfer(superManager, _platformFee), "platform fee should be collected");
        return true;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  
    balances_intou34[msg.sender] -= _value;  
    balances_intou34[_to] += _value;  
    return true;
  }

}

/
/
/
contract Bet {
    using SafeMath for uint256;

    BetDeEx betDeEx;

    string public description; /
    bool public isDrawPossible; /
    uint8 public category; /
    uint8 public subCategory; /

    uint8 public finalResult; /
    address public endedBy; /

    uint256 public creationTimestamp; /
    uint256 public pauseTimestamp; /
    uint256 public endTimestamp; /

    uint256 public minimumBetInExaEs; /
    uint256 public prizePercentPerThousand; /
    uint256[3] public totalBetTokensInExaEsByChoice = [0, 0, 0]; /
    uint256[3] public getNumberOfChoiceBettors = [0, 0, 0]; /

    uint256 public totalPrize; /

    mapping(address => uint256[3]) public bettorBetAmountInExaEsByChoice; /
    mapping(address => bool) public bettorHasClaimed; /

    modifier onlyManager() {
        require(betDeEx.isManager(msg.sender), "only manager can call");
        _;
    }

    /
    /
    /
    /
    /
    /
    /
    /
    constructor(string memory _description, uint8 _category, uint8 _subCategory, uint256 _minimumBetInExaEs, uint256 _prizePercentPerThousand, bool _isDrawPossible, uint256 _pauseTimestamp) public {
        description = _description;
        isDrawPossible = _isDrawPossible;
        category = _category;
        subCategory = _subCategory;
        minimumBetInExaEs = _minimumBetInExaEs;
        prizePercentPerThousand = _prizePercentPerThousand;
        betDeEx = BetDeEx(msg.sender);
        creationTimestamp = now;
        pauseTimestamp = _pauseTimestamp;
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }

    /
    function betBalanceInExaEs() public view returns (uint256) {
        return betDeEx.betBalanceInExaEs(address(this));
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   
}

    /
    /
    /
    function enterBet(uint8 _choice, uint256 _betTokensInExaEs) public {
        require(now < pauseTimestamp, "cannot enter after pause time");
        require(_betTokensInExaEs >= minimumBetInExaEs, "betting tokens should be more than minimum");

        /
        require(betDeEx.collectBettorTokens(msg.sender, _betTokensInExaEs), "betting tokens should be collected");

        
        if (_choice > 2 || (_choice == 2 && !isDrawPossible) ) {
            require(false, "this choice is not available");
        }

        getNumberOfChoiceBettors[_choice] = getNumberOfChoiceBettors[_choice].add(1);
        totalBetTokensInExaEsByChoice[_choice] = totalBetTokensInExaEsByChoice[_choice].add(_betTokensInExaEs);

        bettorBetAmountInExaEsByChoice[msg.sender][_choice] = bettorBetAmountInExaEsByChoice[msg.sender][_choice].add(_betTokensInExaEs);

        betDeEx.emitNewBettingEvent(msg.sender, _choice, _betTokensInExaEs);
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

    /
    /
    function endBet(uint8 _choice) public onlyManager {
        require(now >= pauseTimestamp, "cannot end bet before pause time");
        require(endedBy == address(0), "Bet Already Ended");

        
        if(_choice < 2  || (_choice == 2 && isDrawPossible)) {
            finalResult = _choice;
        } else {
            require(false, "this choice is not available");
        }

        endedBy = msg.sender;
        endTimestamp = now;

        /
        totalPrize = betBalanceInExaEs().mul(prizePercentPerThousand).div(1000);

        /
        uint256 _platformFee = betBalanceInExaEs().sub(totalPrize);

        /
        require(betDeEx.collectPlatformFee(_platformFee), "platform fee should be collected");

        betDeEx.emitEndEvent(endedBy, _choice, _platformFee);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  
    balances_intou30[msg.sender] -= _value;  
    balances_intou30[_to] += _value;  
    return true;
  }

    /
    /
    /
    function seeWinnerPrize(address _bettorAddress) public view returns (uint256) {
        require(endTimestamp > 0, "cannot see prize before bet ends");

        return bettorBetAmountInExaEsByChoice[_bettorAddress][finalResult].mul(totalPrize).div(totalBetTokensInExaEsByChoice[finalResult]);
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}

    /
    function withdrawPrize() public {
        require(endTimestamp > 0, "cannot withdraw before end time");
        require(!bettorHasClaimed[msg.sender], "cannot claim again");
        require(bettorBetAmountInExaEsByChoice[msg.sender][finalResult] > minimumBetInExaEs, "caller should have a betting"); /
        uint256 _winningAmount = bettorBetAmountInExaEsByChoice[msg.sender][finalResult].mul(totalPrize).div(totalBetTokensInExaEsByChoice[finalResult]);
        bettorHasClaimed[msg.sender] = true;
        betDeEx.sendTokensToAddress(
            msg.sender,
            _winningAmount
        );
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   
}
}