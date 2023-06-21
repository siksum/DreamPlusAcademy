pragma solidity ^0.5.8;

/*
 * 1111 11
 * 1. 11
 *  111 111 1111 111 1111 111 1111 11 11.
 *  1111 1111 11111 111 11 1111, 111 1111 111 1111,
 *  11 111 1111 111 1 111, 1111 1 111 11 1111 11 1 111 11 111.
 * 2. 11 11
 *  Owner : 11111 111 11111 11
 *  Delegator : Owner1 Private Key1 11 111111 1111 111 111 1 11 111 111
 *              11 Owner 111 111 1 111 111 111
 *              11, 11111 111 111 1111 Delegator1 111 1 11 11 111 1111
 *              11111 111 1111, 1111 1111 11111 1111 111 11
 *  Holder : 111 111 1 11 Address1 111 11 11
 * 3. 11
 *  3.1. TokenContainer Structure
 *   3.1.1 Charge Amount
 *    Charge Amount1 Holder1 1111 111 111111.
 *    Owner1 1111 1111 111 111 111. 1, Total Supply1 1111.
 *   3.1.2 Unlock Amount
 *    11111 11 111 Lock 111 11 11 1111, Owner 11 Delegator1 Unlock 11 11 Balance1 11111.
 *    Unlock Amount1 Charge Amount 1 Unlock 1 111 11111.
 *    Unlock Amount1 Charge Amount 11 11 1 1111.
 *   3.1.3 Balance
 *    ERC201 Balance1 111, 111111 Charge Amount - Unlock Amount 111 11 11111.
 *    1111 111 11111 Balance1 1 111 111 1 1111.
 * 4. 11 -> 11 11 11
 *  4.1. Owner 1111 11111 111 111 11 11(lock())
 *  4.2. 111 1111 11 ExchangeContract1 11
 *  4.3. ExchangeContract1 Address1 Owner1 1111 Delegator1 11
 *  4.4. Holder1 ExchangeContract1 exchangeSYM()1 1111 111 ExchangeHolder11 11 11
 *  4.5. ExchangeHolder11 111 11
 *  4.6. 111 1111 1111 1111 1111 111 11
 *  4.7. ExchangeContract1 withdraw()1 1111 Owner1 11111 1111 111 1111 11
 */
 /*
  *  * Contract Overview 
 * 1. Purpose
 *  It is intended to operate for a limited time until mainnet launch.
 *  When the mainnet is launched, all transactions of the contract will be suspended from that day on forward and will initiate the token swap to the mainnet.
 * 2. Key Definitions
 *  Owner : An entity from which smart contract is created
 *  Delegator : The appointed agent is created to prevent from using the contract owner's private key for every transaction made, since it can cause a serious security issue.  
 *              In particular, it performs core functons at the time of the token swap event, such as executing a dedicated, Delegator-specific function while contract transaction is under suspension and
 *              withdraw contract's tokens. 
 *  Holder : An account in which tokens can be stored (also referrs to all users of the contract: Owner, Delegator, Spender, ICO buyers, ect.)
 * 3. Operation
 *  3.1. TokenContainer Structure
 *   3.1.1 Charge Amount
 *    Charge Amount is the charged token amount purcahsed by Holder.
 *    In case for the Owner, the total charged amount in the contract equates to the Total Supply.
 *   3.1.2 Unlock Amount
 *    Generally, all tokens are under a locked state by default and balance appears according to the amount that Owner or Delegator Unlocks.
 *    Unlock Amount only displays tokens that are unlocked from the Charge Amount.
 *    Unlock Amount cannot be greater than the Charge Amount.
 *   3.1.3 Balance
 *     Similiar to the ERC20 Balance; It starts from Charged Amount - Unlock Amount value.
 *     You can send & receive tokens at will and it will offset the Balance amount accordingly.
 * 4. Token Swap Process
 *  4.1. Completely suspend trading operations from the contract address with owner privileges (lock ()).
 *  4.2. Create an ExchangeContract contract to execute the exchange.
 *  4.3. Owner appoints the ExchangeContract address to the Delegator.
 *  4.4. The Holder executes an exchangeSYM() embedded in the ExchangeContract to transfer all the Balance to ExchangeHolder
 *  4.5. Verify ExchangeHolder's deposit amount. 
 *  4.6. Remit an appropriate amount into the mainnet account that corresponds to the request.  
 *  4.7. By using the ExchangeContract's withdraw(), the token swap process completes as the Owner makes the final withdrawal.
  */

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /*
     * 111 Owner 111 1111 1111 11 11 11 11111.
     */
    /*
     * The privilege change function is removed since the Owner change isn't used during the operation.
     */
    /* not used
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    */
}

/*
 * Owner1 11 1 111 11 111 1 111 1111 11/11 1 1 11 111111 1111 11.
 */
 /*
 * It defines an interface where the Owner can appoint / dismiss an agent that can partially excercize privileges in lieu of the Owner's 
 */
contract Delegable is Ownable {
    address private _delegator;
    
    event DelegateAppointed(address indexed previousDelegator, address indexed newDelegator);
    
    constructor () internal {
        _delegator = address(0);
    }
    
    /*
     * delegator1 111
     */
    /*
     * Call-up Delegator
     */
    function delegator() public view returns (address) {
        return _delegator;
    }
    
    /*
     * delegator1 11 11111 1111 11 11
     */
    /*
     * Access restriction in which only appointed delegator is executable
     */
    modifier onlyDelegator() {
        require(isDelegator());
        _;
    }
    
    /*
     * owner 11 delegator1 11 11111 1111 11 11
     */
    /*
     * Access restriction in which only appointed delegator or Owner are executable
     */
    modifier ownerOrDelegator() {
        require(isOwner() || isDelegator());
        _;
    }
    
    function isDelegator() public view returns (bool) {
        return msg.sender == _delegator;
    }
    
    /*
     * delegator1 11
     */
    /*
     * Appoint the delegator
     */
    function appointDelegator(address delegator) public onlyOwner returns (bool) {
        require(delegator != address(0));
        require(delegator != owner());
        return _appointDelegator(delegator);
    }
    
    /*
     * 111 delegator1 11
     */
    /*
     * Dimiss the appointed delegator
     */
    function dissmissDelegator() public onlyOwner returns (bool) {
        require(_delegator != address(0));
        return _appointDelegator(address(0));
    }
    
    /*
     * delegator1 1111 11 11
     */
    /*
     * An internal function that allows delegator changes 
     */
    function _appointDelegator(address delegator) private returns (bool) {
        require(_delegator != delegator);
        emit DelegateAppointed(_delegator, delegator);
        _delegator = delegator;
        return true;
    }
}

/*
 * ERC201 11 111111 1111 1111 11 111 11111,
 * 11 11 11 111 1111 11 Struct 1 111 1111 1111.
 * 11, 11 -> 11 111 11 Delegator 111 Owner1 11 111 11111 111 1111 111
 * 1111 111 111 1111 11 111 111 1111.
 * 11, exchange() 111 111 ExchangeContract11 Holder1 11 exchangeSYM() 111
 * 111 11 1111 11 111 111 1111 11 111 111 111 1 1111.
 */
 /*
 * The basic interface of ERC20 is remained untouched therefore basic functions like token transactions will be available. 
 * On top of that, Structs and functions have been added to implement some additional management functions.
 * In particular, we created an additional Delegator agent to initiate the token swap so that the swap is performed by the delegator but directly from the Owner's contract address.
 * By implementing an additional agent, it has built a difficult structure to acquire rights arbitrarily from the outside.
 * In addition, the execution of exchange() cannot be taken by any other Holders' because the exchangeSYM() is triggered directly by the Holder's execution 
 */
contract ERC20Like is IERC20, Delegable {
    using SafeMath for uint256;

    uint256 internal _totalSupply;  // 1 111 // Total Supply
    bool isLock = false;  // 11 11 111 // Contract Lock Flag

    /*
     * 11 11(111, 111, 1111) 1 Spender 111 1111 111
     */
    /*
     * Structure that stores token information (charge, unlock, balance) as well as Spender information
     */
    struct TokenContainer {
        uint256 chargeAmount; // 111 // charge amount
        uint256 unlockAmount; // 111 // unlock amount
        uint256 balance;  // 1111 // available balance
        mapping (address => uint256) allowed; // Spender
    }

    mapping (address => TokenContainer) internal _tokenContainers;
    
    event ChangeCirculation(uint256 circulationAmount);
    event Charge(address indexed holder, uint256 chargeAmount, uint256 unlockAmount);
    event IncreaseUnlockAmount(address indexed holder, uint256 unlockAmount);
    event DecreaseUnlockAmount(address indexed holder, uint256 unlockAmount);
    event Exchange(address indexed holder, address indexed exchangeHolder, uint256 amount);
    event Withdraw(address indexed holder, uint256 amount);

    // 1 111 
    // Total token supply 
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    // 1111 1111
    // Call-up available balance
    function balanceOf(address holder) public view returns (uint256) {
        return _tokenContainers[holder].balance;
    }

    // Spender1 11 11 1111
    // Call-up Spender's remaining balance
    function allowance(address holder, address spender) public view returns (uint256) {
        return _tokenContainers[holder].allowed[spender];
    }

    // 1111
    // Transfer token
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    // Spender 11 1 11 11
    // Appoint a Spender and set an amount 
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    // Spender 1111
    // Transfer token via Spender 
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _approve(from, msg.sender, _tokenContainers[from].allowed[msg.sender].sub(value));
        return true;
    }

    // Spender1 11 11 1 11
    // Increase a Spender amount alloted by the Owner/Delegator
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(!isLock);
        uint256 value = _tokenContainers[msg.sender].allowed[spender].add(addedValue);
        if (msg.sender == owner()) {  // Sender1 11 1111 11 11 111 11
            require(_tokenContainers[msg.sender].chargeAmount >= _tokenContainers[msg.sender].unlockAmount.add(addedValue));
            _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.add(addedValue);
            _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.add(addedValue);
        }
        _approve(msg.sender, spender, value);
        return true;
    }

    // Spender1 11 11 1 11
    // Decrease a Spender amount alloted by the Owner/Delegator
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(!isLock);
        // 111 111 111 1111 1 11 111 1111 11 11 1111 01 111 11
        //// If you reduce more than the alloted amount in the balance, we made sure the alloted amount is set to zero instead of minus
        if (_tokenContainers[msg.sender].allowed[spender] < subtractedValue) {
            subtractedValue = _tokenContainers[msg.sender].allowed[spender];
        }
        
        uint256 value = _tokenContainers[msg.sender].allowed[spender].sub(subtractedValue);
        if (msg.sender == owner()) {  // Sender1 11 1111 11 11 111 11 // // Adjust the total circulation amount if the Sender equals the contract owner
            _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.sub(subtractedValue);
            _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.sub(subtractedValue);
        }
        _approve(msg.sender, spender, value);
        return true;
    }

    // 1111 11 11 11 
    // An internal execution function for troken transfer
    function _transfer(address from, address to, uint256 value) private {
        require(!isLock);
        // 3.1. Known vulnerabilities of ERC-20 token
        // 11 111111 111 1 111 11 11 // Exceptions were added to not allow deposits to be made in the current contract . 
        require(to != address(this));
        require(to != address(0));

        _tokenContainers[from].balance = _tokenContainers[from].balance.sub(value);
        _tokenContainers[to].balance = _tokenContainers[to].balance.add(value);
        emit Transfer(from, to, value);
    }

    // Spender 11 11 11 11
    // Internal execution function for assigning a Spender
    function _approve(address holder, address spender, uint256 value) private {
        require(!isLock);
        require(spender != address(0));
        require(holder != address(0));

        _tokenContainers[holder].allowed[spender] = value;
        emit Approval(holder, spender, value);
    }

    /* extension */
    /**
     * 111 
     */
    /**
     * Charge Amount 
     */
    function chargeAmountOf(address holder) external view returns (uint256) {
        return _tokenContainers[holder].chargeAmount;
    }

    /**
     * 111
     */
    /**
     * Unlock Amount
     */
    function unlockAmountOf(address holder) external view returns (uint256) {
        return _tokenContainers[holder].unlockAmount;
    }

    /**
     * 1111
     */
    /**
     * Available amount in the balance
     */
    function availableBalanceOf(address holder) external view returns (uint256) {
        return _tokenContainers[holder].balance;
    }

    /**
     * Holder1 11 11 11 11(JSON 11)
     */
    /**
     * An output of Holder's account balance summary (JSON format)
     */
    function receiptAccountOf(address holder) external view returns (string memory) {
        bytes memory blockStart = bytes("{");
        bytes memory chargeLabel = bytes("\"chargeAmount\" : \"");
        bytes memory charge = bytes(uint2str(_tokenContainers[holder].chargeAmount));
        bytes memory unlockLabel = bytes("\", \"unlockAmount\" : \"");
        bytes memory unlock = bytes(uint2str(_tokenContainers[holder].unlockAmount));
        bytes memory balanceLabel = bytes("\", \"availableBalance\" : \"");
        bytes memory balance = bytes(uint2str(_tokenContainers[holder].balance));
        bytes memory blockEnd = bytes("\"}");

        string memory receipt = new string(blockStart.length + chargeLabel.length + charge.length + unlockLabel.length + unlock.length + balanceLabel.length + balance.length + blockEnd.length);
        bytes memory receiptBytes = bytes(receipt);

        uint readIndex = 0;
        uint writeIndex = 0;

        for (readIndex = 0; readIndex < blockStart.length; readIndex++) {
            receiptBytes[writeIndex++] = blockStart[readIndex];
        }
        for (readIndex = 0; readIndex < chargeLabel.length; readIndex++) {
            receiptBytes[writeIndex++] = chargeLabel[readIndex];
        }
        for (readIndex = 0; readIndex < charge.length; readIndex++) {
            receiptBytes[writeIndex++] = charge[readIndex];
        }
        for (readIndex = 0; readIndex < unlockLabel.length; readIndex++) {
            receiptBytes[writeIndex++] = unlockLabel[readIndex];
        }
        for (readIndex = 0; readIndex < unlock.length; readIndex++) {
            receiptBytes[writeIndex++] = unlock[readIndex];
        }
        for (readIndex = 0; readIndex < balanceLabel.length; readIndex++) {
            receiptBytes[writeIndex++] = balanceLabel[readIndex];
        }
        for (readIndex = 0; readIndex < balance.length; readIndex++) {
            receiptBytes[writeIndex++] = balance[readIndex];
        }
        for (readIndex = 0; readIndex < blockEnd.length; readIndex++) {
            receiptBytes[writeIndex++] = blockEnd[readIndex];
        }

        return string(receiptBytes);
    }

    // uint 11 string 11 1111 11 11
    // An internal function that converts an uint value to a string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }

    // 11 111 - Owner1 unlockAmount
    // Total circulation supply, or the unlockAmount of the Owner's
    function circulationAmount() external view returns (uint256) {
        return _tokenContainers[owner()].unlockAmount;
    }

    // 11 111 11
    // Increase the token's total circulation supply 
    /*
     * 1111 11 1111 1111 11 1111.
     * Owner1 111 11 11111 Unlock 1 1 111 11 111111,
     * Unlock Amount1 Balance 1 1111, Charge Amount1 1111 1111.
     */
    /*
     * This function increases the amount of circulated tokens that are distributed on the contract.
     * The circulated token is referring to the Unlock tokens out of the contract Owner's total supply, so the Charge Amount is not affected (refer back to the Balance definition above).
     * This function increases in the Unlock Amount as well as in the Balance.
     */
    function increaseCirculation(uint256 amount) external onlyOwner returns (uint256) {
        require(!isLock);
        require(_tokenContainers[msg.sender].chargeAmount >= _tokenContainers[msg.sender].unlockAmount.add(amount));
        _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.add(amount);
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.add(amount);
        emit ChangeCirculation(_tokenContainers[msg.sender].unlockAmount);
        return _tokenContainers[msg.sender].unlockAmount;
    }

    // 11 111 11
    // Reduction of the token's total supply
    /*
     * 1111 11 1111 1111 11 1111.
     * Owner1 111 11 11111 Unlock 1 1 111 11 111111,
     * Unlock Amount1 Balance 1 1111, Charge Amount1 1111 1111.
     * Owner1 111 1 111, 1111 111 111 11111111 011 1111 11 1111 11 111 11111.
     */
    /*
     * This function decreases the amount of circulated tokens that are distributed on the contract.
     * The circulated token is referring to the Unlock tokens out of the contract Owner's total supply, so the Charge Amount is not affected (refer back to the Balance definition above).
     * This function decreases in the Unlock Amount as well as in the Balance.
     */
    function decreaseCirculation(uint256 amount) external onlyOwner returns (uint256) {
        require(!isLock);
        _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.sub(amount);
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.sub(amount);
        emit ChangeCirculation(_tokenContainers[msg.sender].unlockAmount);
        return _tokenContainers[msg.sender].unlockAmount;
    }

    /*
     * 11 111(ICO, PreSale 111)1 111 11 111 1111 11 111 1 11111.
     * 1111 1 111 1111 111 11111, Owner1 Balance1 1111 111 11111.
     * 111 111 lock1 111 1111, charge() 111 111 111 Unlock11 11 1111
     * increaseUnlockAmount() 111 11 111 11 1 11.
     */
    /*
     * This function is used to directly input the token amount that is purchased by particular Holders (ICO, Pre-sale buyers). It can be performed by the Owner or the Delegator.
     * Since the contract operates in concurrent to the tokens in circulation, the function will fail to execute when Owner's balance is insuffient. 
     * All charged tokens are locked amount. 
     */
    function charge(address holder, uint256 chargeAmount, uint256 unlockAmount) external ownerOrDelegator {
        require(!isLock);
        require(holder != address(0));
        require(holder != owner());
        require(chargeAmount > 0);
        require(chargeAmount >= unlockAmount);
        require(_tokenContainers[owner()].balance >= chargeAmount);

        _tokenContainers[owner()].balance = _tokenContainers[owner()].balance.sub(chargeAmount);

        _tokenContainers[holder].chargeAmount = _tokenContainers[holder].chargeAmount.add(chargeAmount);
        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.add(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.add(unlockAmount);
        
        emit Charge(holder, chargeAmount, unlockAmount);
    }
    
    /*
     * 11 111(ICO, PreSale 111)1 111 11 111 1111 111 1 11111.
     * 1 111 111 111 11111 Unlock Amount1 Charge Amount11 11 1 1111.
     */
    /*
     * This function is used to change the Unlock Amount of tokens that is purchased by particular Holders (ICO, Pre-sale buyers).
     * Unlock Amount cannot be larger than Charge Amount because changes occur within the total charge amount.
     */
    function increaseUnlockAmount(address holder, uint256 unlockAmount) external ownerOrDelegator {
        require(!isLock);
        require(holder != address(0));
        require(holder != owner());
        require(_tokenContainers[holder].chargeAmount >= _tokenContainers[holder].unlockAmount.add(unlockAmount));

        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.add(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.add(unlockAmount);
        
        emit IncreaseUnlockAmount(holder, unlockAmount);
    }
    
    /*
     * 11 111(ICO, PreSale 111)1 111 11 111 1111 111 1 11111.
     * Balance1 Lock 111 1111 1111 Lock Amount1 11 Balance11 11 1 1111.
     */
    /*
     * This function is used to change the Unlock Amount of tokens that is purchased by particular Holders (ICO, Pre-sale buyers).
     * Since the Balance starts from a locked state, the number of locked tokens cannot be greater than the Balance.
     */
    function decreaseUnlockAmount(address holder, uint256 lockAmount) external ownerOrDelegator {
        require(!isLock);
        require(holder != address(0));
        require(holder != owner());
        require(_tokenContainers[holder].balance >= lockAmount);

        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.sub(lockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.sub(lockAmount);
        
        emit DecreaseUnlockAmount(holder, lockAmount);
    }

    /*
     * 11 111(ICO, PreSale 111)1 111 11 111 111 111 1 11111.
     * Charge Amount 1 Unlock Amount 11 111 111 111 11111 11111.
     */
    /*
     * This function is used to change the Unlock Amount of tokens that is purchased by particular Holders (ICO, Pre-sale buyers).
     * It unlocks all locked tokens in the Charge Amount, other than tokens already unlocked. 
     */
    function unlockAmountAll(address holder) external ownerOrDelegator {
        require(!isLock);
        require(holder != address(0));
        require(holder != owner());

        uint256 unlockAmount = _tokenContainers[holder].chargeAmount.sub(_tokenContainers[holder].unlockAmount);

        require(unlockAmount > 0);
        
        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.add(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.add(unlockAmount);
    }

    /*
     * 11 11
     * 111 111 11111 111 111 111 11,
     * 111 111 11111 Owner1 Delegator1 111 11 Holder1 111 1 1 11 11.
     * 11 111 111 1111 11 Holder1 111 1111 11 11 11
     * 11 -> 11 11 111 1111 1111.
     * 1, 1 11111 Exchange Contract1 Owner1 11 Delegator1 1111
     * Holder1 111 11111 11, 111 11 -> 11 11111 11 exchange(), withdraw() 11 111 111 11.
     */
    /*
     * Contract lock
     * If the contract is locked, all transactions will be suspended.
     * All Holders including Owner and Delegator will not be able to make transaction during suspension.
     * After all transactions have been stopped and all Holders have not changed their status
     * This function is created primarily for the token swap event. 
     * In this process, it's important to note that the Owner of the Exchange contract should directly appoint a delegator when handling Holders' requests.
     * Only the exchange () and withdraw () are allowed to be executed for token swap.
     */
    function lock() external onlyOwner returns (bool) {
        isLock = true;
        return isLock;
    }

    /*
     * 11 11 11
     * 11 111 111 1 1111.
     */
    /*
     * Release contract lock
     * The function is used to revert a locked contract to a normal state. 
     */
    function unlock() external onlyOwner returns (bool) {
        isLock = false;
        return isLock;
    }
    
    /*
     * 11 11 111 11 11 11
     * 11 111 11 111 1(11 11 1 11 11),
     * 11111 11 1111, Delegator111 Contract1 1111 11 1111.
     */
    /*
     * It is an external call function for token exchange processing
     * This function is used when the entire contract is locked (contract lock during the token swap),
     * It can be called only externally. Also, it can be only called when the agent is both Delegator and Contract.
     */
    function exchange(address holder) external onlyDelegator returns (bool) {
        require(isLock);    // lock state only
        require((delegator() == msg.sender) && isContract(msg.sender));    // contract delegator only
        
        uint256 balance = _tokenContainers[holder].balance;
        _tokenContainers[holder].balance = 0;
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.add(balance);
        
        emit Exchange(holder, msg.sender, balance);
        return true;
    }
    
    /*
     * 11 11 11 1 111 111 Owner11 1111 11
     * 11 111 11 111 1(11 11 1 11 11),
     * 11111 11 1111, Delegator111 Contract1 1111 11 1111.
     */
    /*
     * This is a function in which the Delegator returns tokens to the Owner after the token swap process
     * This function is used when the entire contract is locked (contract lock during the token swap),
     * It can be called only externally. Also, it can be only called when the agent is both Delegator and Contract Owner.
     */
    function withdraw() external onlyDelegator returns (bool) {
        require(isLock);    // lock state only
        require((delegator() == msg.sender) && isContract(msg.sender));    // contract delegator only
        
        uint256 balance = _tokenContainers[msg.sender].balance;
        _tokenContainers[msg.sender].balance = 0;
        _tokenContainers[owner()].balance = _tokenContainers[owner()].balance.add(balance);
        
        emit Withdraw(msg.sender, balance);
    }
    
    /*
     * 111 111 1111 1111 11 111 111 1111 111111 1111 11
     * 11111 1111 111 111 111 11111 111 111 11111
     * 11111 111 111.
     */
    /*
     * This is a tool used for confirming a contract. It determines the size of code that the current address occupies within the blockchain network.
     * Since the size of a stored code exists only in the case of a contract, it is can be used as a validation tool.
     */
    function isContract(address addr) private returns (bool) {
      uint size;
      assembly { size := extcodesize(addr) }
      return size > 0;
    }
}

contract SymToken is ERC20Like {
    string public name = "SymVerse";
    string public symbol = "SYM";
    uint256 public decimals = 18;

    constructor () public {
        _totalSupply = 900000000 * (10 ** decimals);
        _tokenContainers[msg.sender].chargeAmount = _totalSupply;
        emit Charge(msg.sender, _tokenContainers[msg.sender].chargeAmount, _tokenContainers[msg.sender].unlockAmount);
    }
}