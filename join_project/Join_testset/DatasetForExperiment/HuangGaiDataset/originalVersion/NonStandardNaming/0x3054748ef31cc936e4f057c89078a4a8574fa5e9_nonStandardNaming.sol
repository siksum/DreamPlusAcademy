pragma solidity ^0.5.8;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

library SafeMath {
    function MUL838(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV892(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function SUB169(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function ADD567(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    function MOD479(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function TRANSFER694(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE412(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM91(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY64() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF630(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE318(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER458(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL282(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED723(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED723(address(0), _owner);
    }

    function OWNER101() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    modifier ONLYOWNER120() {	//inject NONSTANDARD NAMING
        require(ISOWNER101());
        _;
    }

    function ISOWNER101() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                             
                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
}

                                                                        
                                                                                                                                                 
contract Delegable is Ownable {
    address private _delegator;
    
    event DELEGATEAPPOINTED698(address indexed previousDelegator, address indexed newDelegator);	//inject NONSTANDARD NAMING
    
    constructor () internal {
        _delegator = address(0);
    }
    
                                    
                                       
    function DELEGATOR828() public view returns (address) {	//inject NONSTANDARD NAMING
        return _delegator;
    }
    
                                                    
                                                                                        
    modifier ONLYDELEGATOR902() {	//inject NONSTANDARD NAMING
        require(ISDELEGATOR457());
        _;
    }
    
                                                             
                                                                                                  
    modifier OWNERORDELEGATOR214() {	//inject NONSTANDARD NAMING
        require(ISOWNER101() || ISDELEGATOR457());
        _;
    }
    
    function ISDELEGATOR457() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _delegator;
    }
    
                                   
                                           
    function APPOINTDELEGATOR7(address delegator) public ONLYOWNER120 returns (bool) {	//inject NONSTANDARD NAMING
        require(delegator != address(0));
        require(delegator != OWNER101());
        return _APPOINTDELEGATOR215(delegator);
    }
    
                                       
                                                    
    function DISSMISSDELEGATOR373() public ONLYOWNER120 returns (bool) {	//inject NONSTANDARD NAMING
        require(_delegator != address(0));
        return _APPOINTDELEGATOR215(address(0));
    }
    
                                           
                                                                         
    function _APPOINTDELEGATOR215(address delegator) private returns (bool) {	//inject NONSTANDARD NAMING
        require(_delegator != delegator);
        emit DELEGATEAPPOINTED698(_delegator, delegator);
        _delegator = delegator;
        return true;
    }
}

                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20Like is IERC20, Delegable {
    using SafeMath for uint256;

    uint256 internal _totalSupply;  // 1 111 // Total Supply
    bool isLock = false;  // 11 11 111 // Contract Lock Flag

                                                                  
                                                                                                                      
    struct TokenContainer {
        uint256 chargeAmount; // 111 // charge amount
        uint256 unlockAmount; // 111 // unlock amount
        uint256 balance;  // 1111 // available balance
        mapping (address => uint256) allowed; // Spender
    }

    mapping (address => TokenContainer) internal _tokenContainers;
    
    event CHANGECIRCULATION165(uint256 circulationAmount);	//inject NONSTANDARD NAMING
    event CHARGE670(address indexed holder, uint256 chargeAmount, uint256 unlockAmount);	//inject NONSTANDARD NAMING
    event INCREASEUNLOCKAMOUNT635(address indexed holder, uint256 unlockAmount);	//inject NONSTANDARD NAMING
    event DECREASEUNLOCKAMOUNT709(address indexed holder, uint256 unlockAmount);	//inject NONSTANDARD NAMING
    event EXCHANGE776(address indexed holder, address indexed exchangeHolder, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAW366(address indexed holder, uint256 amount);	//inject NONSTANDARD NAMING

    // 1 111 
    // Total token supply 
    function TOTALSUPPLY64() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    // 1111 1111
    // Call-up available balance
    function BALANCEOF630(address holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[holder].balance;
    }

    // Spender1 11 11 1111
    // Call-up Spender's remaining balance
    function ALLOWANCE318(address holder, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[holder].allowed[spender];
    }

    // 1111
    // Transfer token
    function TRANSFER694(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER381(msg.sender, to, value);
        return true;
    }

    // Spender 11 1 11 11
    // Appoint a Spender and set an amount 
    function APPROVE412(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE0(msg.sender, spender, value);
        return true;
    }

    // Spender 1111
    // Transfer token via Spender 
    function TRANSFERFROM91(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER381(from, to, value);
        _APPROVE0(from, msg.sender, _tokenContainers[from].allowed[msg.sender].SUB169(value));
        return true;
    }

    // Spender1 11 11 1 11
    // Increase a Spender amount alloted by the Owner/Delegator
    function INCREASEALLOWANCE144(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(!isLock);
        uint256 value = _tokenContainers[msg.sender].allowed[spender].ADD567(addedValue);
        if (msg.sender == OWNER101()) {  // Sender1 11 1111 11 11 111 11
            require(_tokenContainers[msg.sender].chargeAmount >= _tokenContainers[msg.sender].unlockAmount.ADD567(addedValue));
            _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.ADD567(addedValue);
            _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.ADD567(addedValue);
        }
        _APPROVE0(msg.sender, spender, value);
        return true;
    }

    // Spender1 11 11 1 11
    // Decrease a Spender amount alloted by the Owner/Delegator
    function DECREASEALLOWANCE479(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(!isLock);
        // 111 111 111 1111 1 11 111 1111 11 11 1111 01 111 11
                                                                                                                                       
        if (_tokenContainers[msg.sender].allowed[spender] < subtractedValue) {
            subtractedValue = _tokenContainers[msg.sender].allowed[spender];
        }
        
        uint256 value = _tokenContainers[msg.sender].allowed[spender].SUB169(subtractedValue);
        if (msg.sender == OWNER101()) {  // Sender1 11 1111 11 11 111 11 // // Adjust the total circulation amount if the Sender equals the contract owner
            _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.SUB169(subtractedValue);
            _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.SUB169(subtractedValue);
        }
        _APPROVE0(msg.sender, spender, value);
        return true;
    }

    // 1111 11 11 11 
    // An internal execution function for troken transfer
    function _TRANSFER381(address from, address to, uint256 value) private {	//inject NONSTANDARD NAMING
        require(!isLock);
        // 3.1. Known vulnerabilities of ERC-20 token
        // 11 111111 111 1 111 11 11 // Exceptions were added to not allow deposits to be made in the current contract . 
        require(to != address(this));
        require(to != address(0));

        _tokenContainers[from].balance = _tokenContainers[from].balance.SUB169(value);
        _tokenContainers[to].balance = _tokenContainers[to].balance.ADD567(value);
        emit TRANSFER458(from, to, value);
    }

    // Spender 11 11 11 11
    // Internal execution function for assigning a Spender
    function _APPROVE0(address holder, address spender, uint256 value) private {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(spender != address(0));
        require(holder != address(0));

        _tokenContainers[holder].allowed[spender] = value;
        emit APPROVAL282(holder, spender, value);
    }

                   
                           
                                     
    function CHARGEAMOUNTOF688(address holder) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[holder].chargeAmount;
    }

                          
                                    
    function UNLOCKAMOUNTOF18(address holder) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[holder].unlockAmount;
    }

                           
                                                      
    function AVAILABLEBALANCEOF623(address holder) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[holder].balance;
    }

                                                   
                                                                                  
    function RECEIPTACCOUNTOF177(address holder) external view returns (string memory) {	//inject NONSTANDARD NAMING
        bytes memory blockStart = bytes("{");
        bytes memory chargeLabel = bytes("\"chargeAmount\" : \"");
        bytes memory charge = bytes(UINT2STR427(_tokenContainers[holder].chargeAmount));
        bytes memory unlockLabel = bytes("\", \"unlockAmount\" : \"");
        bytes memory unlock = bytes(UINT2STR427(_tokenContainers[holder].unlockAmount));
        bytes memory balanceLabel = bytes("\", \"availableBalance\" : \"");
        bytes memory balance = bytes(UINT2STR427(_tokenContainers[holder].balance));
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
    function UINT2STR427(uint _i) internal pure returns (string memory _uintAsString) {	//inject NONSTANDARD NAMING
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
    function CIRCULATIONAMOUNT728() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _tokenContainers[OWNER101()].unlockAmount;
    }

    // 11 111 11
    // Increase the token's total circulation supply 
                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                             
    function INCREASECIRCULATION115(uint256 amount) external ONLYOWNER120 returns (uint256) {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(_tokenContainers[msg.sender].chargeAmount >= _tokenContainers[msg.sender].unlockAmount.ADD567(amount));
        _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.ADD567(amount);
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.ADD567(amount);
        emit CHANGECIRCULATION165(_tokenContainers[msg.sender].unlockAmount);
        return _tokenContainers[msg.sender].unlockAmount;
    }

    // 11 111 11
    // Reduction of the token's total supply
                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                             
    function DECREASECIRCULATION849(uint256 amount) external ONLYOWNER120 returns (uint256) {	//inject NONSTANDARD NAMING
        require(!isLock);
        _tokenContainers[msg.sender].unlockAmount = _tokenContainers[msg.sender].unlockAmount.SUB169(amount);
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.SUB169(amount);
        emit CHANGECIRCULATION165(_tokenContainers[msg.sender].unlockAmount);
        return _tokenContainers[msg.sender].unlockAmount;
    }

                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                     
    function CHARGE472(address holder, uint256 chargeAmount, uint256 unlockAmount) external OWNERORDELEGATOR214 {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(holder != address(0));
        require(holder != OWNER101());
        require(chargeAmount > 0);
        require(chargeAmount >= unlockAmount);
        require(_tokenContainers[OWNER101()].balance >= chargeAmount);

        _tokenContainers[OWNER101()].balance = _tokenContainers[OWNER101()].balance.SUB169(chargeAmount);

        _tokenContainers[holder].chargeAmount = _tokenContainers[holder].chargeAmount.ADD567(chargeAmount);
        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.ADD567(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.ADD567(unlockAmount);
        
        emit CHARGE670(holder, chargeAmount, unlockAmount);
    }
    
                                                                                                                                                 
                                                                                                                                                                                                                                                                
    function INCREASEUNLOCKAMOUNT719(address holder, uint256 unlockAmount) external OWNERORDELEGATOR214 {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(holder != address(0));
        require(holder != OWNER101());
        require(_tokenContainers[holder].chargeAmount >= _tokenContainers[holder].unlockAmount.ADD567(unlockAmount));

        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.ADD567(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.ADD567(unlockAmount);
        
        emit INCREASEUNLOCKAMOUNT635(holder, unlockAmount);
    }
    
                                                                                                                                                    
                                                                                                                                                                                                                                                                      
    function DECREASEUNLOCKAMOUNT680(address holder, uint256 lockAmount) external OWNERORDELEGATOR214 {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(holder != address(0));
        require(holder != OWNER101());
        require(_tokenContainers[holder].balance >= lockAmount);

        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.SUB169(lockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.SUB169(lockAmount);
        
        emit DECREASEUNLOCKAMOUNT709(holder, lockAmount);
    }

                                                                                                                                            
                                                                                                                                                                                                                                                
    function UNLOCKAMOUNTALL583(address holder) external OWNERORDELEGATOR214 {	//inject NONSTANDARD NAMING
        require(!isLock);
        require(holder != address(0));
        require(holder != OWNER101());

        uint256 unlockAmount = _tokenContainers[holder].chargeAmount.SUB169(_tokenContainers[holder].unlockAmount);

        require(unlockAmount > 0);
        
        _tokenContainers[holder].unlockAmount = _tokenContainers[holder].unlockAmount.ADD567(unlockAmount);
        _tokenContainers[holder].balance = _tokenContainers[holder].balance.ADD567(unlockAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function LOCK620() external ONLYOWNER120 returns (bool) {	//inject NONSTANDARD NAMING
        isLock = true;
        return isLock;
    }

                                                        
                                                                                                                       
    function UNLOCK285() external ONLYOWNER120 returns (bool) {	//inject NONSTANDARD NAMING
        isLock = false;
        return isLock;
    }
    
                                                                                                                                          
                                                                                                                                                                                                                                                                                                              
    function EXCHANGE439(address holder) external ONLYDELEGATOR902 returns (bool) {	//inject NONSTANDARD NAMING
        require(isLock);    // lock state only
        require((DELEGATOR828() == msg.sender) && ISCONTRACT899(msg.sender));    // contract delegator only
        
        uint256 balance = _tokenContainers[holder].balance;
        _tokenContainers[holder].balance = 0;
        _tokenContainers[msg.sender].balance = _tokenContainers[msg.sender].balance.ADD567(balance);
        
        emit EXCHANGE776(holder, msg.sender, balance);
        return true;
    }
    
                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                         
    function WITHDRAW388() external ONLYDELEGATOR902 returns (bool) {	//inject NONSTANDARD NAMING
        require(isLock);    // lock state only
        require((DELEGATOR828() == msg.sender) && ISCONTRACT899(msg.sender));    // contract delegator only
        
        uint256 balance = _tokenContainers[msg.sender].balance;
        _tokenContainers[msg.sender].balance = 0;
        _tokenContainers[OWNER101()].balance = _tokenContainers[OWNER101()].balance.ADD567(balance);
        
        emit WITHDRAW366(msg.sender, balance);
    }
    
                                                                                                                                              
                                                                                                                                                                                                                                                                                          
    function ISCONTRACT899(address addr) private returns (bool) {	//inject NONSTANDARD NAMING
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
        emit CHARGE670(msg.sender, _tokenContainers[msg.sender].chargeAmount, _tokenContainers[msg.sender].unlockAmount);
    }
}