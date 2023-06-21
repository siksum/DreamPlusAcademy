pragma solidity 0.5.9;


                                                                                                   
library SafeMath {
                                                                                  
    function MUL41(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV827(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB841(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD354(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD715(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                   
interface IERC20 {
    function TRANSFER106(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE323(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM712(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY757() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF794(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE688(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER887(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL332(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}



                                                                                                                                                     
contract Claimable {
    address public owner;
    address public pendingOwner;

    event OWNERSHIPTRANSFERRED364(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

                                                                                                                          
    constructor() public {
        owner = msg.sender;
    }

                                                                               
    modifier ONLYOWNER497() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                               
    modifier ONLYPENDINGOWNER482() {	//inject NONSTANDARD NAMING
        require(msg.sender == pendingOwner);
        _;
    }

                                                                                                                                               
    function TRANSFEROWNERSHIP634(address newOwner) public ONLYOWNER497 {	//inject NONSTANDARD NAMING
        pendingOwner = newOwner;
    }

                                                                                   
    function CLAIMOWNERSHIP623() public ONLYPENDINGOWNER482 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED364(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract Keeper is Claimable {
    using SafeMath for uint256;
    IERC20 public token;
    // the date when withdrawals become possible
    uint256 public unFreezeStartDate;
    // the date when all funds get unfrozen
    uint256 public totalUnFreezeDate;
    // the records about individual balances
    mapping(address => uint256) public balances;
    // the records about already withdrawn amounts
    mapping(address => uint256) public withdrawnBalances;
    // the sum of registered balance
    uint256 public totalBalance;

    constructor(
        IERC20 _token,
        uint256 _unFreezeStartDate,
        uint256 _totalUnFreezeDate
    ) public {
        // solhint-disable-next-line not-rely-on-time
        require(_unFreezeStartDate >= block.timestamp);
        require(_totalUnFreezeDate > _unFreezeStartDate);
        token = _token;
        unFreezeStartDate = _unFreezeStartDate;
        totalUnFreezeDate = _totalUnFreezeDate;
    }

                                                                                                                                                                            
    function ADDBALANCE921(address _to, uint256 _value) public ONLYOWNER497 {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value > 0);
        require(totalBalance.ADD354(_value)
                <= token.BALANCEOF794(address(this)), "not enough tokens");
        balances[_to] = balances[_to].ADD354(_value);
        totalBalance = totalBalance.ADD354(_value);
    }

                                                                                                                                                        
    function WITHDRAW72(address _to, uint256 _value) public {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                
    function GETUNFROZENAMOUNT293(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (now > unFreezeStartDate) {
            if (now > totalUnFreezeDate) {
                // tokens are totally unfrozen
                return balances[_holder];
            }
            // tokens are partially unfrozen
            uint256 partialFreezePeriodLen =
                totalUnFreezeDate.SUB841(unFreezeStartDate);
            uint256 secondsSincePeriodStart = now.SUB841(unFreezeStartDate);
            uint256 amount = balances[_holder]
                .MUL41(secondsSincePeriodStart)
                .DIV827(partialFreezePeriodLen);
            return amount;
        }
        // tokens are totally frozen
        return 0;
    }
}