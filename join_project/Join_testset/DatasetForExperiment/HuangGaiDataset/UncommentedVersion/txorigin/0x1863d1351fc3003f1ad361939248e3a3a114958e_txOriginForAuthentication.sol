/*
Implements a rate oracle (for EUR/ETH)
Operated by Capacity Blockchain Solutions GmbH.
No warranties.
*/


pragma solidity ^0.5.2;

/**
 * @title ERC20 interface
 * @dev see https:
 */
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



pragma solidity ^0.5.2;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
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
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0);
        uint256 c = a / b;
        

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
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

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



/*
Interface for requests to the rate oracle (for EUR/ETH)
Copy this to projects that need to access the oracle.
See rate-oracle project for implementation.
*/
pragma solidity ^0.5.0;


contract OracleRequest {

    uint256 public EUR_WEI; 

    uint256 public lastUpdate; 

    function ETH_EUR() public view returns (uint256); 

    function ETH_EURCENT() public view returns (uint256); 

}



/*
Implements a rate oracle (for EUR/ETH)
*/
pragma solidity ^0.5.0;




contract Oracle is OracleRequest {
    using SafeMath for uint256;

    address public rateControl;

    address public tokenAssignmentControl;

    constructor(address _rateControl, address _tokenAssignmentControl)
    public
    {
        lastUpdate = 0;
        rateControl = _rateControl;
        tokenAssignmentControl = _tokenAssignmentControl;
    }

    modifier onlyRateControl()
    {
        require(tx.origin == rateControl, "rateControl key required for this function.");	
        _;
    }

    modifier onlyTokenAssignmentControl() {
        require(tx.origin == tokenAssignmentControl, "tokenAssignmentControl key required for this function.");	
        _;
    }

    function setRate(uint256 _new_EUR_WEI)
    public
    onlyRateControl
    {
        lastUpdate = now;
        require(_new_EUR_WEI > 0, "Please assign a valid rate.");
        EUR_WEI = _new_EUR_WEI;
    }

    function ETH_EUR()
    public view
    returns (uint256)
    {
        return uint256(1 ether).div(EUR_WEI);
    }

    function ETH_EURCENT()
    public view
    returns (uint256)
    {
        return uint256(100 ether).div(EUR_WEI);
    }

    /*** Make sure currency doesn't get stranded in this contract ***/

    
    function rescueToken(IERC20 _foreignToken, address _to)
    public
    onlyTokenAssignmentControl
    {
        _foreignToken.transfer(_to, _foreignToken.balanceOf(address(this)));
    }

    
    function() external
    payable
    {
        revert("The contract cannot receive ETH payments.");
    }
}