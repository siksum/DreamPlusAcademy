pragma solidity 0.5.9;


                                                                                                   
library SafeMath {
                                                                                  
    function MUL41(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV827(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        require(b > 0);
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                              
    function SUB841(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD354(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD715(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0);
        return a % b;
    }
}

                                                                                   
interface IERC20 {
    function TRANSFER106(address to, uint256 value) external returns (bool);	

    function APPROVE323(address spender, uint256 value) external returns (bool);	

    function TRANSFERFROM712(address from, address to, uint256 value) external returns (bool);	

    function TOTALSUPPLY757() external view returns (uint256);	

    function BALANCEOF794(address who) external view returns (uint256);	

    function ALLOWANCE688(address owner, address spender) external view returns (uint256);	

    event TRANSFER887(address indexed from, address indexed to, uint256 value);	

    event APPROVAL332(address indexed owner, address indexed spender, uint256 value);	
}



                                                                                                                                                     
contract Claimable {
    address public owner;
    address public pendingOwner;

    event OWNERSHIPTRANSFERRED364(	
        address indexed previousOwner,
        address indexed newOwner
    );

                                                                                                                          
    constructor() public {
        owner = msg.sender;
    }

                                                                               
    modifier ONLYOWNER497() {	
        require(msg.sender == owner);
        _;
    }

                                                                                               
    modifier ONLYPENDINGOWNER482() {	
        require(msg.sender == pendingOwner);
        _;
    }

                                                                                                                                               
    function TRANSFEROWNERSHIP634(address newOwner) public ONLYOWNER497 {	
        pendingOwner = newOwner;
    }

                                                                                   
    function CLAIMOWNERSHIP623() public ONLYPENDINGOWNER482 {	
        emit OWNERSHIPTRANSFERRED364(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract Keeper is Claimable {
    using SafeMath for uint256;
    IERC20 public token;
    
    uint256 public unFreezeStartDate;
    
    uint256 public totalUnFreezeDate;
    
    mapping(address => uint256) public balances;
    
    mapping(address => uint256) public withdrawnBalances;
    
    uint256 public totalBalance;

    constructor(
        IERC20 _token,
        uint256 _unFreezeStartDate,
        uint256 _totalUnFreezeDate
    ) public {
        
        require(_unFreezeStartDate >= block.timestamp);
        require(_totalUnFreezeDate > _unFreezeStartDate);
        token = _token;
        unFreezeStartDate = _unFreezeStartDate;
        totalUnFreezeDate = _totalUnFreezeDate;
    }

                                                                                                                                                                            
    function ADDBALANCE921(address _to, uint256 _value) public ONLYOWNER497 {	
        require(_to != address(0));
        require(_value > 0);
        require(totalBalance.ADD354(_value)
                <= token.BALANCEOF794(address(this)), "not enough tokens");
        balances[_to] = balances[_to].ADD354(_value);
        totalBalance = totalBalance.ADD354(_value);
    }

                                                                                                                                                        
    function WITHDRAW72(address _to, uint256 _value) public {	
        require(_to != address(0));
        require(_value > 0);
        require(unFreezeStartDate < now, "not unfrozen yet");
        require(
            (GETUNFROZENAMOUNT293(msg.sender).SUB841(withdrawnBalances[msg.sender]))
            >= _value
        );
        withdrawnBalances[msg.sender] = withdrawnBalances[msg.sender].ADD354(_value);
        totalBalance = totalBalance.SUB841(_value);
        token.TRANSFER106(_to, _value);
    }

                                                                                                                                                                
    function GETUNFROZENAMOUNT293(address _holder) public view returns (uint256) {	
        if (now > unFreezeStartDate) {
            if (now > totalUnFreezeDate) {
                
                return balances[_holder];
            }
            
            uint256 partialFreezePeriodLen =
                totalUnFreezeDate.SUB841(unFreezeStartDate);
            uint256 secondsSincePeriodStart = now.SUB841(unFreezeStartDate);
            uint256 amount = balances[_holder]
                .MUL41(secondsSincePeriodStart)
                .DIV827(partialFreezePeriodLen);
            return amount;
        }
        
        return 0;
    }
}