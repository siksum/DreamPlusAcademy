pragma solidity 0.5.1;

/**
* @dev Base contract for teams
*/
contract Team {
    using SafeMath for uint256;

    
    address payable public DEEXFund = 0xA2A3aD8319D24f4620Fbe06D2bC57c045ECF0932;

    JackPot public JPContract;
    DEEX public DEEXContract;

    /**
    * @dev Payable function. 10% will send to DEEX fund and 90% will send to JackPot contract.
    * Also setting info about player.
    */
    function () external payable {	
        require(JPContract.getState() && msg.value >= 0.05 ether);

        JPContract.setInfo(msg.sender, msg.value.mul(90).div(100));

        DEEXFund.call.gas(2301).value(msg.value.mul(10).div(100))("");

        address(JPContract).call.gas(2301).value(msg.value.mul(90).div(100))("");
    }
}

@dev Dragons contract. To play game with Dragons send ETH to this contract
*/
contract Dragons is Team {

    @dev Approving JackPot contract for spending token from Dragons contract.
    * Also setting Dragons address in JackPot contract
    */
    constructor(address payable _jackPotAddress, address payable _DEEXAddress) public {
        JPContract = JackPot(_jackPotAddress);
        JPContract.setDragonsAddress(address(this));
        DEEXContract = DEEX(_DEEXAddress);
        DEEXContract.approve(_jackPotAddress, 9999999999999999999000000000000000000);
    }
}

@dev Hamsters contract. To play game with Hamsters send ETH to this contract
*/
contract Hamsters is Team {

    @dev Approving JackPot contract for spending token from Hamsters contract.
    * Also setting Hamsters address in JackPot contract
    */
    constructor(address payable _jackPotAddress, address payable _DEEXAddress) public {
        JPContract = JackPot(_jackPotAddress);
        JPContract.setHamstersAddress(address(this));
        DEEXContract = DEEX(_DEEXAddress);
        DEEXContract.approve(_jackPotAddress, 9999999999999999999000000000000000000);
    }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error. Latest version on 05.01.2019
 */
library SafeMath {
    int256 constant private INT256_MIN = -2**255;

    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Multiplies two signed integers, reverts on overflow.
    */
    function mul(int256 a, int256 b) internal pure returns (int256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == INT256_MIN)); 

        int256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

    /**
    * @dev Integer division of two signed integers truncating the quotient, reverts on division by zero.
    */
    function div(int256 a, int256 b) internal pure returns (int256) {
        require(b != 0); 
        require(!(b == -1 && a == INT256_MIN)); 

        int256 c = a / b;

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Subtracts two signed integers, reverts on overflow.
    */
    function sub(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Adds two signed integers, reverts on overflow.
    */
    function add(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));

        return c;
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

@title JackPot
* @dev Jackpot contract which contained all ETH from Dragons and Hamsters teams.
* When time in blockchain will be grater then current deadline or last deadline need call getWinner function
* then participants able get prizes.
*
* Last participant(last hero) win 10% from all bank
*
* - To get prize send 0 ETH to this contract
*/
contract JackPot {

    using SafeMath for uint256;

    mapping (address => uint256) public depositDragons;
    mapping (address => uint256) public depositHamsters;
    uint256 public currentDeadline;
    uint256 public lastDeadline = 1551978000; 
    uint256 public countOfDragons;
    uint256 public countOfHamsters;
    uint256 public totalSupplyOfHamsters;
    uint256 public totalSupplyOfDragons;
    uint256 public totalDEEXSupplyOfHamsters;
    uint256 public totalDEEXSupplyOfDragons;
    uint256 public probabilityOfHamsters;
    uint256 public probabilityOfDragons;
    address public lastHero;
    address public lastHeroHistory;
    uint256 public jackPot;
    uint256 public winner;
    bool public finished = false;

    Dragons public DragonsContract;
    Hamsters public HamstersContract;
    DEEX public DEEXContract;

    @dev Constructor create first deadline
    */
    constructor() public {
        currentDeadline = block.timestamp + 60 * 60 * 24 * 30 ; 
    }

    /**
    * @dev Setter the DEEX Token contract address. Address can be set at once.
    * @param _DEEXAddress Address of the DEEX Token contract
    */
    function setDEEXAddress(address payable _DEEXAddress) public {
        require(address(DEEXContract) == address(0x0));
        DEEXContract = DEEX(_DEEXAddress);
    }

    /**
    * @dev Setter the Dragons contract address. Address can be set at once.
    * @param _dragonsAddress Address of the Dragons contract
    */
    function setDragonsAddress(address payable _dragonsAddress) external {
        require(address(DragonsContract) == address(0x0));
        DragonsContract = Dragons(_dragonsAddress);
    }

    /**
    * @dev Setter the Hamsters contract address. Address can be set at once.
    * @param _hamstersAddress Address of the Hamsters contract
    */
    function setHamstersAddress(address payable _hamstersAddress) external {
        require(address(HamstersContract) == address(0x0));
        HamstersContract = Hamsters(_hamstersAddress);
    }

    /**
    * @dev Getting time from blockchain
    */
    function getNow() view public returns(uint){
        return block.timestamp;
    }

    /**
    * @dev Getting state of game. True - game continue, False - game stopped
    */
    function getState() view public returns(bool) {
        if (block.timestamp > currentDeadline) {
            return false;
        }
        return true;
    }

    /**
    * @dev Setting info about participant from Dragons or Hamsters contract
    * @param _lastHero Address of participant
    * @param _deposit Amount of deposit
    */
    function setInfo(address _lastHero, uint256 _deposit) public {
        require(address(DragonsContract) == msg.sender || address(HamstersContract) == msg.sender);

        if (address(DragonsContract) == msg.sender) {
            require(depositHamsters[_lastHero] == 0, "You are already in hamsters team");
            if (depositDragons[_lastHero] == 0)
                countOfDragons++;
            totalSupplyOfDragons = totalSupplyOfDragons.add(_deposit.mul(90).div(100));
            depositDragons[_lastHero] = depositDragons[_lastHero].add(_deposit.mul(90).div(100));
        }

        if (address(HamstersContract) == msg.sender) {
            require(depositDragons[_lastHero] == 0, "You are already in dragons team");
            if (depositHamsters[_lastHero] == 0)
                countOfHamsters++;
            totalSupplyOfHamsters = totalSupplyOfHamsters.add(_deposit.mul(90).div(100));
            depositHamsters[_lastHero] = depositHamsters[_lastHero].add(_deposit.mul(90).div(100));
        }

        lastHero = _lastHero;

        if (currentDeadline.add(120) <= lastDeadline) {
            currentDeadline = currentDeadline.add(120);
        } else {
            currentDeadline = lastDeadline;
        }

        jackPot = (address(this).balance.add(_deposit)).mul(10).div(100);

        calculateProbability();
    }

    /**
    * @dev Calculation probability for team's win
    */
    function calculateProbability() public {
        require(winner == 0 && getState());

        totalDEEXSupplyOfHamsters = DEEXContract.balanceOf(address(HamstersContract));
        totalDEEXSupplyOfDragons = DEEXContract.balanceOf(address(DragonsContract));
        uint256 percent = (totalSupplyOfHamsters.add(totalSupplyOfDragons)).div(100);

        if (totalDEEXSupplyOfHamsters < 1) {
            totalDEEXSupplyOfHamsters = 0;
        }

        if (totalDEEXSupplyOfDragons < 1) {
            totalDEEXSupplyOfDragons = 0;
        }

        if (totalDEEXSupplyOfHamsters <= totalDEEXSupplyOfDragons) {
            uint256 difference = (totalDEEXSupplyOfDragons.sub(totalDEEXSupplyOfHamsters)).mul(100);
            probabilityOfDragons = totalSupplyOfDragons.mul(100).div(percent).add(difference);

            if (probabilityOfDragons > 8000) {
                probabilityOfDragons = 8000;
            }
            if (probabilityOfDragons < 2000) {
                probabilityOfDragons = 2000;
            }
            probabilityOfHamsters = 10000 - probabilityOfDragons;
        } else {
            uint256 difference = (totalDEEXSupplyOfHamsters.sub(totalDEEXSupplyOfDragons)).mul(100);

            probabilityOfHamsters = totalSupplyOfHamsters.mul(100).div(percent).add(difference);

            if (probabilityOfHamsters > 8000) {
                probabilityOfHamsters = 8000;
            }
            if (probabilityOfHamsters < 2000) {
                probabilityOfHamsters = 2000;
            }
            probabilityOfDragons = 10000 - probabilityOfHamsters;
        }

        totalDEEXSupplyOfHamsters = DEEXContract.balanceOf(address(HamstersContract));
        totalDEEXSupplyOfDragons = DEEXContract.balanceOf(address(DragonsContract));
    }

    /**
    * @dev Getting winner team
    */
    function getWinners() public {
        require(winner == 0 && !getState());

        uint256 seed1 = address(this).balance;
        uint256 seed2 = totalSupplyOfHamsters;
        uint256 seed3 = totalSupplyOfDragons;
        uint256 seed4 = totalDEEXSupplyOfHamsters;
        uint256 seed5 = totalDEEXSupplyOfHamsters;
        uint256 seed6 = block.difficulty;
        uint256 seed7 = block.timestamp;

        bytes32 randomHash = keccak256(abi.encodePacked(seed1, seed2, seed3, seed4, seed5, seed6, seed7));
        uint randomNumber = uint(randomHash);

        if (randomNumber == 0){
            randomNumber = 1;
        }

        uint winningNumber = randomNumber % 10000;

        if (1 <= winningNumber && winningNumber <= probabilityOfDragons){
            winner = 1;
        }

        if (probabilityOfDragons < winningNumber && winningNumber <= 10000){
            winner = 2;
        }
    }

    /**
    * @dev Payable function for take prize
    */
    function () external payable {	
        if (msg.value == 0 &&  !getState() && winner > 0){
            require(depositDragons[msg.sender] > 0 || depositHamsters[msg.sender] > 0);

            uint payout = 0;
            uint payoutDEEX = 0;

            if (winner == 1 && depositDragons[msg.sender] > 0) {
                payout = calculateETHPrize(msg.sender);
            }
            if (winner == 2 && depositHamsters[msg.sender] > 0) {
                payout = calculateETHPrize(msg.sender);
            }

            if (payout > 0) {
                depositDragons[msg.sender] = 0;
                depositHamsters[msg.sender] = 0;
                msg.sender.call.gas(2301).value(payout)("");
            }

            if ((winner == 1 && depositDragons[msg.sender] == 0) || (winner == 2 && depositHamsters[msg.sender] == 0)) {
                payoutDEEX = calculateDEEXPrize(msg.sender);
                if (DEEXContract.balanceOf(address(HamstersContract)) > 0)
                    DEEXContract.transferFrom(
                        address(HamstersContract),
                        address(this),
                        DEEXContract.balanceOf(address(HamstersContract))
                    );
                if (DEEXContract.balanceOf(address(DragonsContract)) > 0)
                    DEEXContract.transferFrom(
                        address(DragonsContract),
                        address(this),
                        DEEXContract.balanceOf(address(DragonsContract))
                    );
                if (payoutDEEX > 0){
                    DEEXContract.transfer(msg.sender, payoutDEEX);
                }
            }

            if (msg.sender == lastHero) {
                lastHeroHistory = lastHero;
                lastHero = address(0x0);
                msg.sender.call.gas(2301).value(jackPot)("");
            }
        }
    }

    /**
    * @dev Getting ETH prize of participant
    * @param participant Address of participant
    */
    function calculateETHPrize(address participant) public view returns(uint) {
        uint payout = 0;

        uint256 totalSupply = totalSupplyOfDragons.add(totalSupplyOfHamsters);
        if (totalSupply > 0) {
            if (depositDragons[participant] > 0) {
                payout = totalSupply.mul(depositDragons[participant]).div(totalSupplyOfDragons);
            }

            if (depositHamsters[participant] > 0) {
                payout = totalSupply.mul(depositHamsters[participant]).div(totalSupplyOfHamsters);
            }
        }
        return payout;
    }

    /**
    * @dev Getting DEEX Token prize of participant
    * @param participant Address of participant
    */
    function calculateDEEXPrize(address participant) public view returns(uint) {
        uint payout = 0;

        if (totalDEEXSupplyOfDragons.add(totalDEEXSupplyOfHamsters) > 0){
            uint totalSupply = (totalDEEXSupplyOfDragons.add(totalDEEXSupplyOfHamsters)).mul(80).div(100);

            if (depositDragons[participant] > 0) {
                payout = totalSupply.mul(depositDragons[participant]).div(totalSupplyOfDragons);
            }

            if (depositHamsters[participant] > 0) {
                payout = totalSupply.mul(depositHamsters[participant]).div(totalSupplyOfHamsters);
            }

            return payout;
        }
        return payout;
    }
}

 deex.exchange pre-ICO tokens smart contract
*  implements [ERC-20 Token Standard](https:
*
*  Style
*  1) before start coding, run Python and type 'import this' in Python console.
*  2) we avoid using inheritance (contract B is A) as it makes code less clear for observer
*  ("Flat is better than nested", "Readability counts")
*  3) we avoid using -= ; =- ; +=; =+
*  see: https:
*  https:
*  4) always explicitly mark variables and functions visibility ("Explicit is better than implicit")
*  5) every function except constructor should trigger at leas one event.
*  6) smart contracts have to be audited and reviewed, comment your code.
*
*  Code is published on https:
*/








contract allowanceRecipient {
    function receiveApproval(address _from, uint256 _value, address _inContract, bytes memory _extraData) public returns (bool success);
}




contract tokenRecipient {
    function tokenFallback(address _from, uint256 _value, bytes memory _extraData) public returns (bool success);
}


contract DEEX {

    

    

    

    
    
    string public name = "deex";

    
    
    string public symbol = "deex";

    
    
    uint8 public decimals = 0;

    
    
    
    uint256 public totalSupply;

    
    
    mapping (address => uint256) public balanceOf;

    
    
    mapping (address => mapping (address => uint256)) public allowance;

    

    uint256 public salesCounter = 0;

    uint256 public maxSalesAllowed;

    bool private transfersBetweenSalesAllowed;

    
    uint256 public tokenPriceInWei = 0;

    uint256 public saleStartUnixTime = 0; 
    uint256 public saleEndUnixTime = 0;  

    
    address public owner;

    
    address public priceSetter;

    
    uint256 private priceMaxWei = 0;
    
    uint256 private priceMinWei = 0;

    
    mapping (address => bool) public isPreferredTokensAccount;

    bool public contractInitialized = false;


    
    
    
    constructor () public {
        owner = msg.sender;

        
        
        maxSalesAllowed = 2;
        
        transfersBetweenSalesAllowed = true;
    }


    function initContract(address team, address advisers, address bounty) public onlyBy(owner) returns (bool){

        require(contractInitialized == false);
        contractInitialized = true;

        priceSetter = msg.sender;

        totalSupply = 100000000;

        
        balanceOf[address(this)] = 75000000;

        
        balanceOf[team] = balanceOf[team] + 15000000;
        isPreferredTokensAccount[team] = true;

        
        balanceOf[advisers] = balanceOf[advisers] + 7000000;
        isPreferredTokensAccount[advisers] = true;

        
        balanceOf[bounty] = balanceOf[bounty] + 3000000;
        isPreferredTokensAccount[bounty] = true;

    }

    

    
    

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(address indexed _owner, address indexed spender, uint256 value);

    
    event OwnerChanged(address indexed oldOwner, address indexed newOwner);

    

    event PriceChanged(uint256 indexed newTokenPriceInWei);

    event SaleStarted(uint256 startUnixTime, uint256 endUnixTime, uint256 indexed saleNumber);

    event NewTokensSold(uint256 numberOfTokens, address indexed purchasedBy, uint256 indexed priceInWei);

    event Withdrawal(address indexed to, uint sumInWei);

    
    event DataSentToAnotherContract(address indexed _from, address indexed _toContract, bytes _extraData);

    

    
    modifier onlyBy(address _account){
        require(msg.sender == _account);

        _;
    }

    
    

    
    function transfer(address _to, uint256 _value) public returns (bool){
        return transferFrom(msg.sender, _to, _value);
    }

    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){

        
        

        bool saleFinished = saleIsFinished();
        require(saleFinished || msg.sender == owner || isPreferredTokensAccount[msg.sender]);

        
        
        require(transfersBetweenSalesAllowed || salesCounter == maxSalesAllowed || msg.sender == owner || isPreferredTokensAccount[msg.sender]);

        
        require(_value >= 0);

        
        require(msg.sender == _from || _value <= allowance[_from][msg.sender]);

        
        require(_value <= balanceOf[_from]);

        
        balanceOf[_from] = balanceOf[_from] - _value;
        
        
        balanceOf[_to] = balanceOf[_to] + _value;

        
        if (_from != msg.sender) {
            allowance[_from][msg.sender] = allowance[_from][msg.sender] - _value;
        }

        
        emit Transfer(_from, _to, _value);

        return true;
    }

    
    
    
    
    
    function approve(address _spender, uint256 _value) public returns (bool success){

        require(_value >= 0);

        allowance[msg.sender][_spender] = _value;

        
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    

     (this function should be called by user itself)
    *  @param _spender another contract's address
    *  @param _value number of tokens
    *  @param _extraData Data that can be sent from user to another contract to be processed
    *  bytes - dynamically-sized byte array,
    *  see http:
    *  see possible attack information in comments to function 'approve'
    *  > this may be used to convert pre-ICO tokens to ICO tokens
    */
    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {

        approve(_spender, _value);

        
        allowanceRecipient spender = allowanceRecipient(_spender);

        
        
        
        if (spender.receiveApproval(msg.sender, _value, address(this), _extraData)) {
            emit DataSentToAnotherContract(msg.sender, _spender, _extraData);
            return true;
        }
        else return false;
    }

    function approveAllAndCall(address _spender, bytes memory _extraData) public returns (bool success) {
        return approveAndCall(_spender, balanceOf[msg.sender], _extraData);
    }

    /github.com/ethereum/EIPs/issues/677
    * transfer tokens with additional info to another smart contract, and calls its correspondent function
    * @param address _to - another smart contract address
    * @param uint256 _value - number of tokens
    * @param bytes _extraData - data to send to another contract
    * > this may be used to convert pre-ICO tokens to ICO tokens
    */
    function transferAndCall(address _to, uint256 _value, bytes memory _extraData) public returns (bool success){

        transferFrom(msg.sender, _to, _value);

        tokenRecipient receiver = tokenRecipient(_to);

        if (receiver.tokenFallback(msg.sender, _value, _extraData)) {
            emit DataSentToAnotherContract(msg.sender, _to, _extraData);
            return true;
        }
        else return false;
    }

    
    function transferAllAndCall(address _to, bytes memory _extraData) public returns (bool success){
        return transferAndCall(_to, balanceOf[msg.sender], _extraData);
    }

    

    function changeOwner(address _newOwner) public onlyBy(owner) returns (bool success){
        
        require(_newOwner != address(0));

        address oldOwner = owner;
        owner = _newOwner;

        emit OwnerChanged(oldOwner, _newOwner);

        return true;
    }

    

    time is integer representing block timestamp
    * in UNIX Time,
    * see: https:
    * @param uint256 startTime - time to start
    * @param uint256 endTime - time to end
    * should be taken into account that
    * "block.timestamp" can be influenced by miners to a certain degree.
    * That means that a miner can "choose" the block.timestamp, to a certain degree,
    * to change the outcome of a transaction in the mined block.
    * see:
    * http:
    */

    function startSale(uint256 _startUnixTime, uint256 _endUnixTime) public onlyBy(owner) returns (bool success){

        require(balanceOf[address(this)] > 0);
        require(salesCounter < maxSalesAllowed);

        
        
        
        require(
        (saleStartUnixTime == 0 && saleEndUnixTime == 0) || saleIsFinished()
        );
        
        require(_startUnixTime > now && _endUnixTime > now);
        
        require(_endUnixTime - _startUnixTime > 0);

        saleStartUnixTime = _startUnixTime;
        saleEndUnixTime = _endUnixTime;
        salesCounter = salesCounter + 1;

        emit SaleStarted(_startUnixTime, _endUnixTime, salesCounter);

        return true;
    }

    function saleIsRunning() public view returns (bool){

        if (balanceOf[address(this)] == 0) {
            return false;
        }

        if (saleStartUnixTime == 0 && saleEndUnixTime == 0) {
            return false;
        }

        if (now > saleStartUnixTime && now < saleEndUnixTime) {
            return true;
        }

        return false;
    }

    function saleIsFinished() public view returns (bool){

        if (balanceOf[address(this)] == 0) {
            return true;
        }

        else if (
        (saleStartUnixTime > 0 && saleEndUnixTime > 0)
        && now > saleEndUnixTime) {

            return true;
        }

        
        return true;
    }

    function changePriceSetter(address _priceSetter) public onlyBy(owner) returns (bool success) {
        priceSetter = _priceSetter;
        return true;
    }

    function setMinMaxPriceInWei(uint256 _priceMinWei, uint256 _priceMaxWei) public onlyBy(owner) returns (bool success){
        require(_priceMinWei >= 0 && _priceMaxWei >= 0);
        priceMinWei = _priceMinWei;
        priceMaxWei = _priceMaxWei;
        return true;
    }


    function setTokenPriceInWei(uint256 _priceInWei) public onlyBy(priceSetter) returns (bool success){

        require(_priceInWei >= 0);

        
        if (priceMinWei != 0 && _priceInWei < priceMinWei) {
            tokenPriceInWei = priceMinWei;
        }
        else if (priceMaxWei != 0 && _priceInWei > priceMaxWei) {
            tokenPriceInWei = priceMaxWei;
        }
        else {
            tokenPriceInWei = _priceInWei;
        }

        emit PriceChanged(tokenPriceInWei);

        return true;
    }

    
    
    
    
    
    function() external payable {
        buyTokens();
    }

    
    function buyTokens() public payable returns (bool success){

        if (saleIsRunning() && tokenPriceInWei > 0) {

            uint256 numberOfTokens = msg.value / tokenPriceInWei;

            if (numberOfTokens <= balanceOf[address(this)]) {

                balanceOf[msg.sender] = balanceOf[msg.sender] + numberOfTokens;
                balanceOf[address(this)] = balanceOf[address(this)] - numberOfTokens;

                emit NewTokensSold(numberOfTokens, msg.sender, tokenPriceInWei);

                return true;
            }
            else {
                
                revert();
            }
        }
        else {
            
            revert();
        }
    }

     (can be another contract or account)
    *  can withdraw all collected Ether
    */
    function withdrawAllToOwner() public onlyBy(owner) returns (bool) {

        
        require(saleIsFinished());
        uint256 sumInWei = address(this).balance;

        if (
        
        !msg.sender.send(address(this).balance)
        ) {
            return false;
        }
        else {
            
            emit Withdrawal(msg.sender, sumInWei);
            return true;
        }
    }

    

    
    
    
    mapping (bytes32 => bool) private isReferrer;

    uint256 private referralBonus = 0;

    uint256 private referrerBonus = 0;
    
    mapping (bytes32 => uint256) public referrerBalanceOf;

    mapping (bytes32 => uint) public referrerLinkedSales;

    function addReferrer(bytes32 _referrer) public onlyBy(owner) returns (bool success){
        isReferrer[_referrer] = true;
        return true;
    }

    function removeReferrer(bytes32 _referrer) public onlyBy(owner) returns (bool success){
        isReferrer[_referrer] = false;
        return true;
    }

    
    function setReferralBonuses(uint256 _referralBonus, uint256 _referrerBonus) public onlyBy(owner) returns (bool success){
        require(_referralBonus > 0 && _referrerBonus > 0);
        referralBonus = _referralBonus;
        referrerBonus = _referrerBonus;
        return true;
    }

    function buyTokensWithReferrerAddress(address _referrer) public payable returns (bool success){

        bytes32 referrer = keccak256(abi.encodePacked(_referrer));

        if (saleIsRunning() && tokenPriceInWei > 0) {

            if (isReferrer[referrer]) {

                uint256 numberOfTokens = msg.value / tokenPriceInWei;

                if (numberOfTokens <= balanceOf[address(this)]) {

                    referrerLinkedSales[referrer] = referrerLinkedSales[referrer] + numberOfTokens;

                    uint256 referralBonusTokens = (numberOfTokens * (100 + referralBonus) / 100) - numberOfTokens;
                    uint256 referrerBonusTokens = (numberOfTokens * (100 + referrerBonus) / 100) - numberOfTokens;

                    balanceOf[address(this)] = balanceOf[address(this)] - numberOfTokens - referralBonusTokens - referrerBonusTokens;

                    balanceOf[msg.sender] = balanceOf[msg.sender] + (numberOfTokens + referralBonusTokens);

                    referrerBalanceOf[referrer] = referrerBalanceOf[referrer] + referrerBonusTokens;

                    emit NewTokensSold(numberOfTokens + referralBonusTokens, msg.sender, tokenPriceInWei);

                    return true;
                }
                else {
                    
                    revert();
                }
            }
            else {
                
                buyTokens();
            }
        }
        else {
            
            revert();
        }
    }

    event ReferrerBonusTokensTaken(address referrer, uint256 bonusTokensValue);

    function getReferrerBonusTokens() public returns (bool success){
        require(saleIsFinished());
        uint256 bonusTokens = referrerBalanceOf[keccak256(abi.encodePacked(msg.sender))];
        balanceOf[msg.sender] = balanceOf[msg.sender] + bonusTokens;
        emit ReferrerBonusTokensTaken(msg.sender, bonusTokens);
        return true;
    }

}