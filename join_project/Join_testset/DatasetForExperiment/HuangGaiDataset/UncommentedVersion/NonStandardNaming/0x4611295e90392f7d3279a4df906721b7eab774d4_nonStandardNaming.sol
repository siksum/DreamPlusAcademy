                                                                 

pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER251() {	
    require(initializing || ISCONSTRUCTOR296() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR296() private view returns (bool) {	
    
    
    
    
    
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  
  uint256[50] private ______gap;
}

contract DfxToken is Initializable {
                                                
    string public constant name425 = "DeFireX";	

                                                  
    string public constant symbol368 = "DFX";	

                                                    
    uint8 public constant decimals789 = 18;	

                                                     
    uint public constant totalsupply627 = 10000000e18; 

                                                     
    mapping (address => mapping (address => uint96)) internal allowances;

                                                                  
    mapping (address => uint96) internal balances;

                                                  
    mapping (address => address) public delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint96 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash78 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	

                                                                                   
    bytes32 public constant delegation_typehash726 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	

                                                                      
    mapping (address => uint) public nonces;

                                                                           
    event DELEGATECHANGED395(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	

                                                                                     
    event DELEGATEVOTESCHANGED41(address indexed delegate, uint previousBalance, uint newBalance);	

                                                  
    event TRANSFER867(address indexed from, address indexed to, uint256 amount);	

                                                  
    event APPROVAL813(address indexed owner, address indexed spender, uint256 amount);	

                                                                                                                           
    function INITIALIZE403(address account) public INITIALIZER251 {	
        balances[account] = uint96(totalsupply627);
        emit TRANSFER867(address(0), account, totalsupply627);
    }

                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE572(address account, address spender) external view returns (uint) {	
        return allowances[account][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE299(address spender, uint rawAmount) external returns (bool) {	
        uint96 amount;
        if (rawAmount == uint(-1)) {
            amount = uint96(-1);
        } else {
            amount = SAFE96663(rawAmount, "approve: amount exceeds 96 bits");
        }

        allowances[msg.sender][spender] = amount;

        emit APPROVAL813(msg.sender, spender, amount);
        return true;
    }

                                                                                                                                                                                             
    function BALANCEOF407(address account) external view returns (uint) {	
        return balances[account];
    }

                                                                                                                                                                                                                                                         
    function TRANSFER679(address dst, uint rawAmount) external returns (bool) {	
        uint96 amount = SAFE96663(rawAmount, "transfer: amount exceeds 96 bits");
        _TRANSFERTOKENS223(msg.sender, dst, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                      
    function TRANSFERFROM397(address src, address dst, uint rawAmount) external returns (bool) {	
        address spender = msg.sender;
        uint96 spenderAllowance = allowances[src][spender];
        uint96 amount = SAFE96663(rawAmount, "approve: amount exceeds 96 bits");

        if (spender != src && spenderAllowance != uint96(-1)) {
            uint96 newAllowance = SUB96182(spenderAllowance, amount, "transferFrom: transfer amount exceeds spender allowance");
            allowances[src][spender] = newAllowance;

            emit APPROVAL813(src, spender, newAllowance);
        }

        _TRANSFERTOKENS223(src, dst, amount);
        return true;
    }

                                                                                                                                       
    function DELEGATE882(address delegatee) public {	
        return _DELEGATE121(msg.sender, delegatee);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DELEGATEBYSIG25(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) public {	
        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash78, keccak256(bytes(name425)), GETCHAINID566(), address(this)));
        bytes32 structHash = keccak256(abi.encode(delegation_typehash726, delegatee, nonce, expiry));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "delegateBySig: invalid nonce");
        require(now <= expiry, "delegateBySig: signature expired");
        return _DELEGATE121(signatory, delegatee);
    }

                                                                                                                                                                                           
    function GETCURRENTVOTES239(address account) external view returns (uint96) {	
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function GETPRIORVOTES326(address account, uint blockNumber) public view returns (uint96) {	
        require(blockNumber < block.number, "getPriorVotes: not yet determined");

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

    function _DELEGATE121(address delegator, address delegatee) internal {	
        address currentDelegate = delegates[delegator];
        uint96 delegatorBalance = balances[delegator];
        delegates[delegator] = delegatee;

        emit DELEGATECHANGED395(delegator, currentDelegate, delegatee);

        _MOVEDELEGATES672(currentDelegate, delegatee, delegatorBalance);
    }

    function _TRANSFERTOKENS223(address src, address dst, uint96 amount) internal {	
        require(src != address(0), "_transferTokens: cannot transfer from the zero address");
        require(dst != address(0), "_transferTokens: cannot transfer to the zero address");

        balances[src] = SUB96182(balances[src], amount, "_transferTokens: transfer amount exceeds balance");
        balances[dst] = ADD96545(balances[dst], amount, "_transferTokens: transfer amount overflows");
        emit TRANSFER867(src, dst, amount);

        _MOVEDELEGATES672(delegates[src], delegates[dst], amount);
    }

    function _MOVEDELEGATES672(address srcRep, address dstRep, uint96 amount) internal {	
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint96 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint96 srcRepNew = SUB96182(srcRepOld, amount, "_moveVotes: vote amount underflows");
                _WRITECHECKPOINT864(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint96 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint96 dstRepNew = ADD96545(dstRepOld, amount, "_moveVotes: vote amount overflows");
                _WRITECHECKPOINT864(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _WRITECHECKPOINT864(address delegatee, uint32 nCheckpoints, uint96 oldVotes, uint96 newVotes) internal {	
      uint32 blockNumber = SAFE32181(block.number, "_writeCheckpoint: block number exceeds 32 bits");

      if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
          checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
      } else {
          checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
          numCheckpoints[delegatee] = nCheckpoints + 1;
      }

      emit DELEGATEVOTESCHANGED41(delegatee, oldVotes, newVotes);
    }

    function SAFE32181(uint n, string memory errorMessage) internal pure returns (uint32) {	
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function SAFE96663(uint n, string memory errorMessage) internal pure returns (uint96) {	
        require(n < 2**96, errorMessage);
        return uint96(n);
    }

    function ADD96545(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	
        uint96 c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function SUB96182(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	
        require(b <= a, errorMessage);
        return a - b;
    }

    function GETCHAINID566() internal pure returns (uint) {	
        
        
        
        return 1;   
    }
}