                                                                 

                                                                 

pragma solidity 0.5.17;


contract StableDarkGovernanceStorage {
                                                  
    mapping (address => address) internal _delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash909 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	

                                                                                   
    bytes32 public constant delegation_typehash69 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	

                                                                      
    mapping (address => uint) public nonces;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD918(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB297(uint256 a, uint256 b) internal pure returns (uint256) {	
        return SUB297(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB297(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL411(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV358(uint256 a, uint256 b) internal pure returns (uint256) {	
        return DIV358(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV358(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD828(uint256 a, uint256 b) internal pure returns (uint256) {	
        return MOD828(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD828(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract StableDarkTokenStorage {

    using SafeMath for uint256;

                                                                                     
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                         
    address public gov;

                                                                   
    address public pendingGov;

                                                                 
    address public rebaser;

                                                                     
    address public incentivizer;

                                                          
    uint256 internal _totalSupply;

                                                                              
    uint256 public constant internaldecimals598 = 10**24;	

                                                        
    uint256 public constant base686 = 10**18;	

                                                                              
    uint256 public stabledarksScalingFactor;

    mapping (address => uint256) internal _stabledarkBalances;

    mapping (address => mapping (address => uint256)) internal _allowedFragments;

    uint256 public initSupply;

}

contract StableDarkTokenInterface is StableDarkTokenStorage, StableDarkGovernanceStorage {

                                                                           
    event DELEGATECHANGED604(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	

                                                                                     
    event DELEGATEVOTESCHANGED160(address indexed delegate, uint previousBalance, uint newBalance);	

                                                                    
    event REBASE4(uint256 epoch, uint256 prevGrapsScalingFactor, uint256 newGrapsScalingFactor);	

                        

                                                                       
    event NEWPENDINGGOV864(address oldPendingGov, address newPendingGov);	

                                                                
    event NEWGOV124(address oldGov, address newGov);	

                                                        
    event NEWREBASER648(address oldRebaser, address newRebaser);	

                                                             
    event NEWINCENTIVIZER310(address oldIncentivizer, address newIncentivizer);	

                          

                                                   
    event TRANSFER213(address indexed from, address indexed to, uint amount);	

                                                   
    event APPROVAL375(address indexed owner, address indexed spender, uint amount);	

                          
                                                  
    event MINT615(address to, uint256 amount);	

    
    function TOTALSUPPLY391() external view returns (uint256);	
    function TRANSFER124(address to, uint256 value) external returns(bool);	
    function TRANSFERFROM842(address from, address to, uint256 value) external returns(bool);	
    function BALANCEOF751(address who) external view returns(uint256);	
    function BALANCEOFUNDERLYING721(address who) external view returns(uint256);	
    function ALLOWANCE262(address owner_, address spender) external view returns(uint256);	
    function APPROVE686(address spender, uint256 value) external returns (bool);	
    function INCREASEALLOWANCE784(address spender, uint256 addedValue) external returns (bool);	
    function DECREASEALLOWANCE429(address spender, uint256 subtractedValue) external returns (bool);	
    function MAXSCALINGFACTOR394() external view returns (uint256);	

                                  
    function GETPRIORVOTES778(address account, uint blockNumber) external view returns (uint256);	
    function DELEGATEBYSIG764(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) external;	
    function DELEGATE684(address delegatee) external;	
    function DELEGATES684(address delegator) external view returns (address);	
    function GETCURRENTVOTES477(address account) external view returns (uint256);	

                                               
    function MINT624(address to, uint256 amount) external returns (bool);	
    function REBASE966(uint256 epoch, uint256 indexDelta, bool positive) external returns (uint256);	
    function _SETREBASER93(address rebaser_) external;	
    function _SETINCENTIVIZER80(address incentivizer_) external;	
    function _SETPENDINGGOV987(address pendingGov_) external;	
    function _ACCEPTGOV51() external;	
}

contract StableDarkGovernanceToken is StableDarkTokenInterface {

                                                                             
    event DELEGATECHANGED604(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	

                                                                                     
    event DELEGATEVOTESCHANGED160(address indexed delegate, uint previousBalance, uint newBalance);	

                                                                                                                                       
    function DELEGATES684(address delegator)	
        external
        view
        returns (address)
    {
        return _delegates[delegator];
    }

                                                                                                                                   
    function DELEGATE684(address delegatee) external {	
        return _DELEGATE133(msg.sender, delegatee);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DELEGATEBYSIG764(	
        address delegatee,
        uint nonce,
        uint expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        external
    {
        bytes32 domainSeparator = keccak256(
            abi.encode(
                domain_typehash909,
                keccak256(bytes(name)),
                GETCHAINID762(),
                address(this)
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                delegation_typehash69,
                delegatee,
                nonce,
                expiry
            )
        );

        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                domainSeparator,
                structHash
            )
        );

        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "StableDark::delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "StableDark::delegateBySig: invalid nonce");
        require(now <= expiry, "StableDark::delegateBySig: signature expired");
        return _DELEGATE133(signatory, delegatee);
    }

                                                                                                                                                                                           
    function GETCURRENTVOTES477(address account)	
        external
        view
        returns (uint256)
    {
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function GETPRIORVOTES778(address account, uint blockNumber)	
        external
        view
        returns (uint256)
    {
        require(blockNumber < block.number, "StableDark::getPriorVotes: not yet determined");

        uint32 nCheckpoints = numCheckpoints[account];
        if (nCheckpoints == 0) {
            return 0;
        }

        
        if (checkpoints[account][nCheckpoints - 1].fromBlock <= blockNumber) {
            return checkpoints[account][nCheckpoints - 1].votes;
        }

        
        if (checkpoints[account][0].fromBlock > blockNumber) {
            return 0;
        }

        uint32 lower = 0;
        uint32 upper = nCheckpoints - 1;
        while (upper > lower) {
            uint32 center = upper - (upper - lower) / 2; 
            Checkpoint memory cp = checkpoints[account][center];
            if (cp.fromBlock == blockNumber) {
                return cp.votes;
            } else if (cp.fromBlock < blockNumber) {
                lower = center;
            } else {
                upper = center - 1;
            }
        }
        return checkpoints[account][lower].votes;
    }

    function _DELEGATE133(address delegator, address delegatee)	
        internal
    {
        address currentDelegate = _delegates[delegator];
        uint256 delegatorBalance = _stabledarkBalances[delegator]; 
        _delegates[delegator] = delegatee;

        emit DELEGATECHANGED604(delegator, currentDelegate, delegatee);

        _MOVEDELEGATES789(currentDelegate, delegatee, delegatorBalance);
    }

    function _MOVEDELEGATES789(address srcRep, address dstRep, uint256 amount) internal {	
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint256 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint256 srcRepNew = srcRepOld.SUB297(amount);
                _WRITECHECKPOINT658(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint256 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint256 dstRepNew = dstRepOld.ADD918(amount);
                _WRITECHECKPOINT658(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _WRITECHECKPOINT658(	
        address delegatee,
        uint32 nCheckpoints,
        uint256 oldVotes,
        uint256 newVotes
    )
        internal
    {
        uint32 blockNumber = SAFE32471(block.number, "StableDark::_writeCheckpoint: block number exceeds 32 bits");

        if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[delegatee] = nCheckpoints + 1;
        }

        emit DELEGATEVOTESCHANGED160(delegatee, oldVotes, newVotes);
    }

    function SAFE32471(uint n, string memory errorMessage) internal pure returns (uint32) {	
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function GETCHAINID762() internal pure returns (uint) {	
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}

                                              
contract StableDarkToken is StableDarkGovernanceToken {
    
    modifier ONLYGOV359() {	
        require(msg.sender == gov);
        _;
    }

    modifier ONLYREBASER686() {	
        require(msg.sender == rebaser);
        _;
    }

    modifier ONLYMINTER158() {	
        require(msg.sender == rebaser || msg.sender == incentivizer || msg.sender == gov, "not minter");
        _;
    }

    modifier VALIDRECIPIENT374(address to) {	
        require(to != address(0x0));
        require(to != address(this));
        _;
    }

    function INITIALIZE158(	
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    )
        public
    {
        require(stabledarksScalingFactor == 0, "already initialized");
        name = name_;
        symbol = symbol_;
        decimals = decimals_;
    }

                                                             
    function TOTALSUPPLY391()	
        external
        view
        returns (uint256)
    {
        return _totalSupply.DIV358(10**24/ (base686));
    }
    
                                                                    
    function MAXSCALINGFACTOR394()	
        external
        view
        returns (uint256)
    {
        return _MAXSCALINGFACTOR200();
    }

    function _MAXSCALINGFACTOR200()	
        internal
        view
        returns (uint256)
    {
        
        
        return uint256(-1) / initSupply;
    }

                                                                                                                                                 
    function MINT624(address to, uint256 amount)	
        external
        ONLYMINTER158
        returns (bool)
    {
        _MINT801(to, amount);
        return true;
    }

    function _MINT801(address to, uint256 amount)	
        internal
    {
      
      _totalSupply = _totalSupply.ADD918(amount.MUL411(10**24/ (base686)));

      
      uint256 stabledarkValue = amount.MUL411(internaldecimals598).DIV358(stabledarksScalingFactor);

      
      initSupply = initSupply.ADD918(stabledarkValue);

      
      require(stabledarksScalingFactor <= _MAXSCALINGFACTOR200(), "max scaling factor too low");

      
      _stabledarkBalances[to] = _stabledarkBalances[to].ADD918(stabledarkValue);
      emit TRANSFER213(address(0), to, amount);
    
      
      _MOVEDELEGATES789(address(0), _delegates[to], stabledarkValue);
      emit MINT615(to, amount);
    }

                                 

                                                                                                                                                                                                              
    function TRANSFER124(address to, uint256 value)	
        external
        VALIDRECIPIENT374(to)
        returns (bool)
    {
        

        
        

        
        uint256 stabledarkValue = value.MUL411(internaldecimals598).DIV358(stabledarksScalingFactor);

        
        _stabledarkBalances[msg.sender] = _stabledarkBalances[msg.sender].SUB297(stabledarkValue);

        
        _stabledarkBalances[to] = _stabledarkBalances[to].ADD918(stabledarkValue);
        emit TRANSFER213(msg.sender, to, value);

        _MOVEDELEGATES789(_delegates[msg.sender], _delegates[to], stabledarkValue);
        return true;
    }

                                                                                                                                                                                                                                                  
    function TRANSFERFROM842(address from, address to, uint256 value)	
        external
        VALIDRECIPIENT374(to)
        returns (bool)
    {
        
        _allowedFragments[from][msg.sender] = _allowedFragments[from][msg.sender].SUB297(value);

        
        uint256 stabledarkValue = value.MUL411(internaldecimals598).DIV358(stabledarksScalingFactor);

        
        _stabledarkBalances[from] = _stabledarkBalances[from].SUB297(stabledarkValue);
        _stabledarkBalances[to] = _stabledarkBalances[to].ADD918(stabledarkValue);
        emit TRANSFER213(from, to, value);

        _MOVEDELEGATES789(_delegates[from], _delegates[to], stabledarkValue);
        return true;
    }

                                                                                                         
    function BALANCEOF751(address who)	
      external
      view
      returns (uint256)
    {
      return _stabledarkBalances[who].MUL411(stabledarksScalingFactor).DIV358(internaldecimals598);
    }

                                                                                                                                                                          
    function BALANCEOFUNDERLYING721(address who)	
      external
      view
      returns (uint256)
    {
      return _stabledarkBalances[who];
    }

                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE262(address owner_, address spender)	
        external
        view
        returns (uint256)
    {
        return _allowedFragments[owner_][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE686(address spender, uint256 value)	
        external
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] = value;
        emit APPROVAL375(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                     
    function INCREASEALLOWANCE784(address spender, uint256 addedValue)	
        external
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] =
            _allowedFragments[msg.sender][spender].ADD918(addedValue);
        emit APPROVAL375(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                       
    function DECREASEALLOWANCE429(address spender, uint256 subtractedValue)	
        external
        returns (bool)
    {
        uint256 oldValue = _allowedFragments[msg.sender][spender];
        if (subtractedValue >= oldValue) {
            _allowedFragments[msg.sender][spender] = 0;
        } else {
            _allowedFragments[msg.sender][spender] = oldValue.SUB297(subtractedValue);
        }
        emit APPROVAL375(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }

                                  

                                                                                                                              
    function _SETREBASER93(address rebaser_)	
        external
        ONLYGOV359
    {
        address oldRebaser = rebaser;
        rebaser = rebaser_;
        emit NEWREBASER648(oldRebaser, rebaser_);
    }

                                                                                                                                        
    function _SETINCENTIVIZER80(address incentivizer_)	
        external
        ONLYGOV359
    {
        address oldIncentivizer = incentivizer;
        incentivizer = incentivizer_;
        emit NEWINCENTIVIZER310(oldIncentivizer, incentivizer_);
    }

                                                                                                                                    
    function _SETPENDINGGOV987(address pendingGov_)	
        external
        ONLYGOV359
    {
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NEWPENDINGGOV864(oldPendingGov, pendingGov_);
    }

                                                                
    function _ACCEPTGOV51()	
        external
    {
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NEWGOV124(oldGov, gov);
    }

                    

                                                                                                                                                                                                                                                                                                                                                            
    function REBASE966(	
        uint256 epoch,
        uint256 indexDelta,
        bool positive
    )
        external
        ONLYREBASER686
        returns (uint256)
    {
        if (indexDelta == 0) {
          emit REBASE4(epoch, stabledarksScalingFactor, stabledarksScalingFactor);
          return _totalSupply;
        }

        uint256 prevGrapsScalingFactor = stabledarksScalingFactor;

        if (!positive) {
           stabledarksScalingFactor = stabledarksScalingFactor.MUL411(base686.SUB297(indexDelta)).DIV358(base686);
        } else {
            uint256 newScalingFactor = stabledarksScalingFactor.MUL411(base686.ADD918(indexDelta)).DIV358(base686);
            if (newScalingFactor < _MAXSCALINGFACTOR200()) {
                stabledarksScalingFactor = newScalingFactor;
            } else {
              stabledarksScalingFactor = _MAXSCALINGFACTOR200();
            }
        }

        _totalSupply = initSupply.MUL411(stabledarksScalingFactor).DIV358(base686);
        emit REBASE4(epoch, prevGrapsScalingFactor, stabledarksScalingFactor);
        return _totalSupply;
    }
}

contract StableDark is StableDarkToken {
                                                                                                                                                                                                                             
    function INITIALIZE158(	
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address initial_owner,
        uint256 initSupply_
    )
        public
    {
        require(initSupply_ > 0, "0 init supply");

        super.INITIALIZE158(name_, symbol_, decimals_);

        initSupply = initSupply_.MUL411(10**24/ (base686));
        _totalSupply = initSupply;
        stabledarksScalingFactor = base686;
        _stabledarkBalances[initial_owner] = initSupply_.MUL411(10**24 / (base686));

        
        
        
    }
}

contract StableDarkDelegationStorage {
                                                                       
    address public implementation;
}

contract StableDarkDelegatorInterface is StableDarkDelegationStorage {
                                                                     
    event NEWIMPLEMENTATION46(address oldImplementation, address newImplementation);	

                                                                                                                                                                                                                                                                                                                                                                                                
    function _SETIMPLEMENTATION365(address implementation_, bool allowResign, bytes memory becomeImplementationData) public;	
}

contract StableDarkDelegateInterface is StableDarkDelegationStorage {
                                                                                                                                                                                                                                                
    function _BECOMEIMPLEMENTATION752(bytes memory data) public;	

                                                                                                  
    function _RESIGNIMPLEMENTATION643() public;	
}

contract StableDarkDelegate is StableDark, StableDarkDelegateInterface {
                                                          
    constructor() public {}

                                                                                                                                                               
    function _BECOMEIMPLEMENTATION752(bytes memory data) public {	
        
        data;

        
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == gov, "only the gov may call _becomeImplementation");
    }

                                                                                                  
    function _RESIGNIMPLEMENTATION643() public {	
        
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == gov, "only the gov may call _resignImplementation");
    }
}