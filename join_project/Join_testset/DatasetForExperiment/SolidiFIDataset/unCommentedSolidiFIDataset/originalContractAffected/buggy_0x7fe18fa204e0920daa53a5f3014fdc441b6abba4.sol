pragma solidity 0.5.9;


library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
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

/

contract Ownable {
    address payable public owner;
  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () public {
        owner = msg.sender;
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp40); 
        pastBlockTime_tmstmp40 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
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
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(address payable _newOwner) external onlyOwner {
        require(_newOwner != address(0));
        owner = _newOwner;
        emit OwnershipTransferred(owner, _newOwner);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 _amount, address _token, bytes calldata  _data) external;
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

/
contract WINSToken is Ownable {

    string public name;                
    uint8 public decimals;             
    string public symbol;              

    /
    /
    /
    struct  Checkpoint {

        
        uint128 fromBlock;

        
        uint128 value;
    }

    
    uint public creationBlock;

    
    bool public transfersEnabled;

    
    
    
    mapping (address => Checkpoint[]) balances;

    
    mapping (address => mapping (address => uint256)) allowed;

    
    Checkpoint[] totalSupplyHistory;
    Checkpoint[] totalSupplyHolders;
    mapping (address => bool) public holders;
    uint public minHolderAmount = 20000 ether;

    //////////////
    
    //////////////
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp32); 
        pastBlockTime_tmstmp32 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  event ClaimedTokens(address indexed _token, address indexed _owner, uint _amount);
  uint256 bugv_tmstmp2 = block.timestamp;
  event Transfer(address indexed _from, address indexed _to, uint256 _amount);
  uint256 bugv_tmstmp5 = block.timestamp;
  event Approval(address indexed _owner, address indexed _spender, uint256 _amount);


    modifier whenTransfersEnabled() {
        require(transfersEnabled);
        _;
    }

    //////////////
    
    //////////////


    constructor () public {
        name = "WINS LIVE";
        symbol = "WL";
        decimals = 18;
        creationBlock = block.number;
        transfersEnabled = true;

        
        uint _amount = 77777777 * (10 ** uint256(decimals));
        updateValueAtNow(totalSupplyHistory, _amount);
        updateValueAtNow(balances[msg.sender], _amount);

        holders[msg.sender] = true;
        updateValueAtNow(totalSupplyHolders, _amount);
        emit Transfer(address(0), msg.sender, _amount);
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp12); 
        pastBlockTime_tmstmp12 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }


    /
    function () external payable {}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /////////////////
    
    /////////////////

    /
    /
    /
    /
    function transfer(address _to, uint256 _amount) whenTransfersEnabled external returns (bool) {
        doTransfer(msg.sender, _to, _amount);
        return true;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

    /
    /
    /
    /
    /
    /
    function transferFrom(address _from, address _to, uint256 _amount) whenTransfersEnabled external returns (bool) {
        
        require(allowed[_from][msg.sender] >= _amount);
        allowed[_from][msg.sender] -= _amount;
        doTransfer(_from, _to, _amount);
        return true;
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    /
    /
    /
    /
    /
    /
    function doTransfer(address _from, address _to, uint _amount) internal {

        if (_amount == 0) {
            emit Transfer(_from, _to, _amount);    
            return;
        }

        
        require((_to != address(0)) && (_to != address(this)));

        
        
        uint previousBalanceFrom = balanceOfAt(_from, block.number);

        require(previousBalanceFrom >= _amount);

        
        
        updateValueAtNow(balances[_from], previousBalanceFrom - _amount);

        
        
        uint previousBalanceTo = balanceOfAt(_to, block.number);
        require(previousBalanceTo + _amount >= previousBalanceTo); 
        updateValueAtNow(balances[_to], previousBalanceTo + _amount);

        
        emit Transfer(_from, _to, _amount);


        uint curTotalSupplyHolders = totalSupplyHoldersAt(block.number);

        if (holders[_from]) {
            if (previousBalanceFrom - _amount < minHolderAmount) {
                delete holders[_from];
                require(curTotalSupplyHolders >= previousBalanceFrom);
                curTotalSupplyHolders = curTotalSupplyHolders - previousBalanceFrom;
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders);
            } else {
                require(curTotalSupplyHolders >= _amount);
                curTotalSupplyHolders = curTotalSupplyHolders - _amount;
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders);
            }
        }

        if (previousBalanceTo + _amount >= minHolderAmount) {
            if (holders[_to]) {
                require(curTotalSupplyHolders + _amount >= curTotalSupplyHolders); 
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders + _amount);
            }

            if (!holders[_to]) {
                holders[_to] = true;
                require(curTotalSupplyHolders + previousBalanceTo + _amount >= curTotalSupplyHolders); 
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders + previousBalanceTo + _amount);
            }
        }


    }
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}

    /
    /
    function balanceOf(address _owner) external view returns (uint256 balance) {
        return balanceOfAt(_owner, block.number);
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

    /
    /
    /
    /
    /
    /
    function approve(address _spender, uint256 _amount) whenTransfersEnabled public returns (bool) {
        
        
        
        
        require((_amount == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp28); 
        pastBlockTime_tmstmp28 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     *
     * approve should be called when allowance[_spender] == 0. To increment
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * @param _spender The address which will spend the funds.
     * @param _addedAmount The amount of tokens to increase the allowance by.
     */
    function increaseApproval(address _spender, uint _addedAmount) external returns (bool) {
        require(allowed[msg.sender][_spender] + _addedAmount >= allowed[msg.sender][_spender]); 
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender] + _addedAmount;
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     *
     * approve should be called when allowance[_spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * @param _spender The address which will spend the funds.
     * @param _subtractedAmount The amount of tokens to decrease the allowance by.
     */
    function decreaseApproval(address _spender, uint _subtractedAmount) external returns (bool)
    {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedAmount >= oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue - _subtractedAmount;
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp24); 
        pastBlockTime_tmstmp24 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }


    /
    /
    /
    /
    /
    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

    /
    /
    /
    /
    /
    /
    /
    function approveAndCall(address _spender, uint256 _amount, bytes calldata _extraData) external returns (bool) {
        require(approve(_spender, _amount));

        ApproveAndCallFallBack(_spender).receiveApproval(
            msg.sender,
            _amount,
            address(this),
            _extraData
        );

        return true;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    /
    /
    function totalSupply() external view returns (uint) {
        return totalSupplyAt(block.number);
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

    function currentTotalSupplyHolders() external view returns (uint) {
        return totalSupplyHoldersAt(block.number);
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    //////////////
    
    //////////////

    /
    /
    /
    /
    function balanceOfAt(address _owner, uint _blockNumber) public view returns (uint) {
        if ((balances[_owner].length == 0) || (balances[_owner][0].fromBlock > _blockNumber)) {
            return 0;
            
        } else {
            return getValueAt(balances[_owner], _blockNumber);
        }
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp36); 
        pastBlockTime_tmstmp36 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    /
    /
    /
    function totalSupplyAt(uint _blockNumber) public view returns(uint) {
        if ((totalSupplyHistory.length == 0) || (totalSupplyHistory[0].fromBlock > _blockNumber)) {
            return 0;
            
        } else {
            return getValueAt(totalSupplyHistory, _blockNumber);
        }
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function totalSupplyHoldersAt(uint _blockNumber) public view returns(uint) {
        if ((totalSupplyHolders.length == 0) || (totalSupplyHolders[0].fromBlock > _blockNumber)) {
            return 0;
            
        } else {
            return getValueAt(totalSupplyHolders, _blockNumber);
        }
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    function isHolder(address _holder) external view returns(bool) {
        return holders[_holder];
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}


    function destroyTokens(uint _amount) onlyOwner public returns (bool) {
        uint curTotalSupply = totalSupplyAt(block.number);
        require(curTotalSupply >= _amount);
        uint previousBalanceFrom = balanceOfAt(msg.sender, block.number);

        require(previousBalanceFrom >= _amount);
        updateValueAtNow(totalSupplyHistory, curTotalSupply - _amount);
        updateValueAtNow(balances[msg.sender], previousBalanceFrom - _amount);
        emit Transfer(msg.sender, address(0), _amount);

        uint curTotalSupplyHolders = totalSupplyHoldersAt(block.number);
        if (holders[msg.sender]) {
            if (previousBalanceFrom - _amount < minHolderAmount) {
                delete holders[msg.sender];
                require(curTotalSupplyHolders >= previousBalanceFrom);
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders - previousBalanceFrom);
            } else {
                require(curTotalSupplyHolders >= _amount);
                updateValueAtNow(totalSupplyHolders, curTotalSupplyHolders - _amount);
            }
        }
        return true;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}


    //////////////
    
    //////////////


    /
    /
    function enableTransfers(bool _transfersEnabled) public onlyOwner {
        transfersEnabled = _transfersEnabled;
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp4); 
        pastBlockTime_tmstmp4 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    //////////////
    
    //////////////

    /
    /
    /
    /
    function getValueAt(Checkpoint[] storage checkpoints, uint _block) view internal returns (uint) {
        if (checkpoints.length == 0) return 0;

        
        if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            return checkpoints[checkpoints.length-1].value;
        if (_block < checkpoints[0].fromBlock) return 0;

        
        uint min = 0;
        uint max = checkpoints.length-1;
        while (max > min) {
            uint mid = (max + min + 1)/ 2;
            if (checkpoints[mid].fromBlock<=_block) {
                min = mid;
            } else {
                max = mid-1;
            }
        }
        return checkpoints[min].value;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /
    /
    /
    /
    function updateValueAtNow(Checkpoint[] storage checkpoints, uint _value) internal  {
        if ((checkpoints.length == 0)
            || (checkpoints[checkpoints.length -1].fromBlock < block.number)) {
            Checkpoint storage newCheckPoint = checkpoints[ checkpoints.length++ ];
            newCheckPoint.fromBlock =  uint128(block.number);
            newCheckPoint.value = uint128(_value);
        } else {
            Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length-1];
            oldCheckPoint.value = uint128(_value);
        }
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp20); 
        pastBlockTime_tmstmp20 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }


    /
    function min(uint a, uint b) pure internal returns (uint) {
        return a < b ? a : b;
    }



    ////////
    
    ////////

    /
    /
    /
    /
    function claimTokens(address payable _token) external onlyOwner {
        if (_token == address(0)) {
            owner.transfer(address(this).balance);
            return;
        }

        WINSToken token = WINSToken(_token);
        uint balance = token.balanceOf(address(this));
        token.transfer(owner, balance);
        emit ClaimedTokens(_token, owner, balance);
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}


    function setMinHolderAmount(uint _minHolderAmount) external onlyOwner {
        minHolderAmount = _minHolderAmount;
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp8); 
        pastBlockTime_tmstmp8 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
}


contract DividendManager is Ownable {
    using SafeMath for uint;

  uint256 bugv_tmstmp1 = block.timestamp;
  event DividendDeposited(address indexed _depositor, uint256 _blockNumber, uint256 _amount, uint256 _totalSupply, uint256 _dividendIndex);
  uint256 bugv_tmstmp4 = block.timestamp;
  event DividendClaimed(address indexed _claimer, uint256 _dividendIndex, uint256 _claim);
  uint256 bugv_tmstmp3 = block.timestamp;
  event DividendRecycled(address indexed _recycler, uint256 _blockNumber, uint256 _amount, uint256 _totalSupply, uint256 _dividendIndex);

    WINSToken public token;

    uint256 public RECYCLE_TIME = 365 days;
    uint public minHolderAmount = 20000 ether;

    struct Dividend {
        uint256 blockNumber;
        uint256 timestamp;
        uint256 amount;
        uint256 claimedAmount;
        uint256 totalSupply;
        bool recycled;
        mapping (address => bool) claimed;
    }

    Dividend[] public dividends;

    mapping (address => uint256) dividendsClaimed;

    struct NotClaimed {
        uint listIndex;
        bool exists;
    }

  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => NotClaimed) public notClaimed;
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp16); 
        pastBlockTime_tmstmp16 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  address[] public notClaimedList;

    modifier validDividendIndex(uint256 _dividendIndex) {
        require(_dividendIndex < dividends.length);
        _;
    }

    constructor(address payable _token) public {
        token = WINSToken(_token);
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

    function depositDividend() payable public {
        uint256 currentSupply = token.totalSupplyHoldersAt(block.number);

        uint i;
        for( i = 0; i < notClaimedList.length; i++) {
            if (token.isHolder(notClaimedList[i])) {
                currentSupply = currentSupply.sub(token.balanceOf(notClaimedList[i]));
            }
        }

        uint256 dividendIndex = dividends.length;
        uint256 blockNumber = SafeMath.sub(block.number, 1);
        dividends.push(
            Dividend(
                blockNumber,
                getNow(),
                msg.value,
                0,
                currentSupply,
                false
            )
        );
        emit DividendDeposited(msg.sender, blockNumber, msg.value, currentSupply, dividendIndex);
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function claimDividend(uint256 _dividendIndex) public validDividendIndex(_dividendIndex)
    {
        require(!notClaimed[msg.sender].exists);

        Dividend storage dividend = dividends[_dividendIndex];

        require(dividend.claimed[msg.sender] == false);
        require(dividend.recycled == false);

        uint256 balance = token.balanceOfAt(msg.sender, dividend.blockNumber);
        require(balance >= minHolderAmount);

        uint256 claim = balance.mul(dividend.amount).div(dividend.totalSupply);
        dividend.claimed[msg.sender] = true;
        dividend.claimedAmount = SafeMath.add(dividend.claimedAmount, claim);

        if (claim > 0) {
            msg.sender.transfer(claim);
            emit DividendClaimed(msg.sender, _dividendIndex, claim);
        }
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    function claimDividendAll() public {
        require(dividendsClaimed[msg.sender] < dividends.length);
        for (uint i = dividendsClaimed[msg.sender]; i < dividends.length; i++) {
            if ((dividends[i].claimed[msg.sender] == false) && (dividends[i].recycled == false)) {
                dividendsClaimed[msg.sender] = SafeMath.add(i, 1);
                claimDividend(i);
            }
        }
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function recycleDividend(uint256 _dividendIndex) public
    onlyOwner
    validDividendIndex(_dividendIndex)
    {
        Dividend storage dividend = dividends[_dividendIndex];
        require(dividend.recycled == false);
        require(dividend.timestamp < SafeMath.sub(getNow(), RECYCLE_TIME));
        dividends[_dividendIndex].recycled = true;
        uint256 currentSupply = token.totalSupplyAt(block.number);
        uint256 remainingAmount = SafeMath.sub(dividend.amount, dividend.claimedAmount);
        uint256 dividendIndex = dividends.length;
        uint256 blockNumber = SafeMath.sub(block.number, 1);
        dividends.push(
            Dividend(
                blockNumber,
                getNow(),
                remainingAmount,
                0,
                currentSupply,
                false
            )
        );
        emit DividendRecycled(msg.sender, blockNumber, remainingAmount, currentSupply, dividendIndex);
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    
    function getNow() internal view returns (uint256) {
        return now;
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function dividendsCount() external view returns (uint) {
        return dividends.length;
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}


    function registerNotClaimed(address _notClaimed) onlyOwner public {
        require(_notClaimed != address(0));
        if (!notClaimed[_notClaimed].exists) {
            notClaimed[_notClaimed] = NotClaimed({
                listIndex: notClaimedList.length,
                exists: true
                });
            notClaimedList.push(_notClaimed);
        }
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}


    function unregisterNotClaimed(address _notClaimed) onlyOwner public {
        require(notClaimed[_notClaimed].exists && notClaimedList.length > 0);
        uint lastIdx = notClaimedList.length - 1;
        notClaimed[notClaimedList[lastIdx]].listIndex = notClaimed[_notClaimed].listIndex;
        notClaimedList[notClaimed[_notClaimed].listIndex] = notClaimedList[lastIdx];
        notClaimedList.length--;
        delete notClaimed[_notClaimed];
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /
    /
    /
    /
    function claimTokens(address payable _token) external onlyOwner {
        
        
        
        

        WINSToken claimToken = WINSToken(_token);
        uint balance = claimToken.balanceOf(address(this));
        claimToken.transfer(owner, balance);
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
}