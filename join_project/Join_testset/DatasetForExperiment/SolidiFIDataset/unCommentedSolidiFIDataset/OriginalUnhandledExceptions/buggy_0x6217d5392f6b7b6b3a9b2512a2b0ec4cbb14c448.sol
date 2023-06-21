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



library StringLib {

    /
    /
    function bytes32ToString(bytes32 bytesToConvert) internal pure returns (string memory) {
        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = bytesToConvert[i];
        }
        return string(bytesArray);
    }
}/www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/



/
library MathLib {

    int256 constant INT256_MIN = int256((uint256(1) << 255));
    int256 constant INT256_MAX = int256(~((uint256(1) << 255)));

    function multiply(uint256 a, uint256 b) pure internal returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b,  "MathLib: multiplication overflow");

        return c;
    }

    function divideFractional(
        uint256 a,
        uint256 numerator,
        uint256 denominator
    ) pure internal returns (uint256)
    {
        return multiply(a, numerator) / denominator;
    }

    function subtract(uint256 a, uint256 b) pure internal returns (uint256) {
        require(b <= a, "MathLib: subtraction overflow");
        return a - b;
    }

    function add(uint256 a, uint256 b) pure internal returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "MathLib: addition overflow");
        return c;
    }

    /
    /
    /
    /
    /
    /
    /
    function calculateCollateralToReturn(
        uint priceFloor,
        uint priceCap,
        uint qtyMultiplier,
        uint longQty,
        uint shortQty,
        uint price
    ) pure internal returns (uint)
    {
        uint neededCollateral = 0;
        uint maxLoss;
        if (longQty > 0) {   
            if (price <= priceFloor) {
                maxLoss = 0;
            } else {
                maxLoss = subtract(price, priceFloor);
            }
            neededCollateral = multiply(multiply(maxLoss, longQty),  qtyMultiplier);
        }

        if (shortQty > 0) {  
            if (price >= priceCap) {
                maxLoss = 0;
            } else {
                maxLoss = subtract(priceCap, price);
            }
            neededCollateral = add(neededCollateral, multiply(multiply(maxLoss, shortQty),  qtyMultiplier));
        }
        return neededCollateral;
    }

    /
    function calculateTotalCollateral(
        uint priceFloor,
        uint priceCap,
        uint qtyMultiplier
    ) pure internal returns (uint)
    {
        return multiply(subtract(priceCap, priceFloor), qtyMultiplier);
    }

    /
    function calculateFeePerUnit(
        uint priceFloor,
        uint priceCap,
        uint qtyMultiplier,
        uint feeInBasisPoints
    ) pure internal returns (uint)
    {
        uint midPrice = add(priceCap, priceFloor) / 2;
        return multiply(multiply(midPrice, qtyMultiplier), feeInBasisPoints) / 10000;
    }
}
/www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/




/www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/





/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address private _owner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     * @notice Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
}







/
/
/
/
contract MarketContract is Ownable {
    using StringLib for *;

    string public CONTRACT_NAME;
    address public COLLATERAL_TOKEN_ADDRESS;
    address public COLLATERAL_POOL_ADDRESS;
    uint public PRICE_CAP;
    uint public PRICE_FLOOR;
    uint public PRICE_DECIMAL_PLACES;   
    uint public QTY_MULTIPLIER;         
    uint public COLLATERAL_PER_UNIT;    
    uint public COLLATERAL_TOKEN_FEE_PER_UNIT;
    uint public MKT_TOKEN_FEE_PER_UNIT;
    uint public EXPIRATION;
    uint public SETTLEMENT_DELAY = 1 days;
    address public LONG_POSITION_TOKEN;
    address public SHORT_POSITION_TOKEN;

    
    uint public lastPrice;
    uint public settlementPrice;
    uint public settlementTimeStamp;
    bool public isSettled = false;

    
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event UpdatedLastPrice(uint256 price);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event ContractSettled(uint settlePrice);

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    constructor(
        bytes32[3] memory contractNames,
        address[3] memory baseAddresses,
        uint[7] memory contractSpecs
    ) public
    {
        PRICE_FLOOR = contractSpecs[0];
        PRICE_CAP = contractSpecs[1];
        require(PRICE_CAP > PRICE_FLOOR, "PRICE_CAP must be greater than PRICE_FLOOR");

        PRICE_DECIMAL_PLACES = contractSpecs[2];
        QTY_MULTIPLIER = contractSpecs[3];
        EXPIRATION = contractSpecs[6];
        require(EXPIRATION > now, "EXPIRATION must be in the future");
        require(QTY_MULTIPLIER != 0,"QTY_MULTIPLIER cannot be 0");

        COLLATERAL_TOKEN_ADDRESS = baseAddresses[1];
        COLLATERAL_POOL_ADDRESS = baseAddresses[2];
        COLLATERAL_PER_UNIT = MathLib.calculateTotalCollateral(PRICE_FLOOR, PRICE_CAP, QTY_MULTIPLIER);
        COLLATERAL_TOKEN_FEE_PER_UNIT = MathLib.calculateFeePerUnit(
            PRICE_FLOOR,
            PRICE_CAP,
            QTY_MULTIPLIER,
            contractSpecs[4]
        );
        MKT_TOKEN_FEE_PER_UNIT = MathLib.calculateFeePerUnit(
            PRICE_FLOOR,
            PRICE_CAP,
            QTY_MULTIPLIER,
            contractSpecs[5]
        );

        
        CONTRACT_NAME = contractNames[0].bytes32ToString();
        PositionToken longPosToken = new PositionToken(
            "MARKET Protocol Long Position Token",
            contractNames[1].bytes32ToString(),
            uint8(PositionToken.MarketSide.Long)
        );
        PositionToken shortPosToken = new PositionToken(
            "MARKET Protocol Short Position Token",
            contractNames[2].bytes32ToString(),
            uint8(PositionToken.MarketSide.Short)
        );

        LONG_POSITION_TOKEN = address(longPosToken);
        SHORT_POSITION_TOKEN = address(shortPosToken);

        transferOwnership(baseAddresses[0]);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    / EXTERNAL - onlyCollateralPool METHODS
    */

    /
    /
    /
    function mintPositionTokens(
        uint256 qtyToMint,
        address minter
    ) external onlyCollateralPool
    {
        
        PositionToken(LONG_POSITION_TOKEN).mintAndSendToken(qtyToMint, minter);
        PositionToken(SHORT_POSITION_TOKEN).mintAndSendToken(qtyToMint, minter);
    }
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}

    /
    /
    /
    function redeemLongToken(
        uint256 qtyToRedeem,
        address redeemer
    ) external onlyCollateralPool
    {
        
        PositionToken(LONG_POSITION_TOKEN).redeemToken(qtyToRedeem, redeemer);
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    /
    /
    /
    function redeemShortToken(
        uint256 qtyToRedeem,
        address redeemer
    ) external onlyCollateralPool
    {
        
        PositionToken(SHORT_POSITION_TOKEN).redeemToken(qtyToRedeem, redeemer);
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}

    / Public METHODS
    */

    /
    function isPostSettlementDelay() public view returns (bool) {
        return isSettled && (now >= (settlementTimeStamp + SETTLEMENT_DELAY));
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    / PRIVATE METHODS
    */

    /
    
    function checkSettlement() internal {
        require(!isSettled, "Contract is already settled"); 

        uint newSettlementPrice;
        if (now > EXPIRATION) {  
            isSettled = true;                   
            newSettlementPrice = lastPrice;
        } else if (lastPrice >= PRICE_CAP) {    
            isSettled = true;
            newSettlementPrice = PRICE_CAP;
        } else if (lastPrice <= PRICE_FLOOR) {  
            isSettled = true;
            newSettlementPrice = PRICE_FLOOR;
        }

        if (isSettled) {
            settleContract(newSettlementPrice);
        }
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /
    /
    function settleContract(uint finalSettlementPrice) internal {
        settlementTimeStamp = now;
        settlementPrice = finalSettlementPrice;
        emit ContractSettled(finalSettlementPrice);
    }
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}

    /
    /
    modifier onlyCollateralPool {
        require(msg.sender == COLLATERAL_POOL_ADDRESS, "Only callable from the collateral pool");
        _;
    }

}

/www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/








/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https:
 * Originally based on code by FirstBlood:
 * https:
 *
 * This implementation emits additional Approval events, allowing applications to reconstruct the allowance status for
 * all accounts just by listening to said events. Note that this isn't required by the specification, and other
 * compliant implementations may not do it.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    /**
     * @dev Total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}

    /**
     * @dev Gets the balance of the specified address.
     * @param owner The address to query the balance of.
     * @return A uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}

    /**
     * @dev Transfer token to a specified address
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https:
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    /**
     * @dev Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     * approve should be called when _allowed[msg.sender][spender] == 0. To increment
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param addedValue The amount of tokens to increase the allowance by.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     * approve should be called when _allowed[msg.sender][spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param subtractedValue The amount of tokens to decrease the allowance by.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * @dev Transfer token for a specified addresses
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account.
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    /**
     * @dev Approve an address to spend another addresses' tokens.
     * @param owner The address that owns the tokens.
     * @param spender The address that will spend the tokens.
     * @param value The number of tokens that can be spent.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account, deducting from the sender's allowance for said account. Uses the
     * internal burn function.
     * Emits an Approval event (reflecting the reduced allowance).
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burnFrom(address account, uint256 value) internal {
        _burn(account, value);
        _approve(account, msg.sender, _allowed[account][msg.sender].sub(value));
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}
}




/
/
/
/
/
/
/
contract PositionToken is ERC20, Ownable {

    string public name;
    string public symbol;
    uint8 public decimals;

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  MarketSide public MARKET_SIDE; 
    enum MarketSide { Long, Short}

    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        uint8 marketSide
    ) public
    {
        name = tokenName;
        symbol = tokenSymbol;
        decimals = 5;
        MARKET_SIDE = MarketSide(marketSide);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    /
    /
    /
    /
    /
    /
    function mintAndSendToken(
        uint256 qtyToMint,
        address recipient
    ) external onlyOwner
    {
        _mint(recipient, qtyToMint);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    /
    /
    /
    /
    /
    function redeemToken(
        uint256 qtyToRedeem,
        address redeemer
    ) external onlyOwner
    {
        _burn(redeemer, qtyToRedeem);
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
}
/www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/




contract MarketContractRegistryInterface {
    function addAddressToWhiteList(address contractAddress) external;
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    function isAddressWhiteListed(address contractAddress) external view returns (bool);
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
}








/**
 * Utility library of inline functions on addresses
 */
library Address {
    /**
     * Returns whether the target address is a contract
     * @dev This function will return false if invoked during the constructor of a contract,
     * as the code is not actually created until after the constructor finishes.
     * @param account address of the account to check
     * @return whether the target address is a contract
     */
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        
        
        
        
        
        
        
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        
        
        
        require((value == 0) || (token.allowance(address(this), spender) == 0));
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must equal true).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        
        

        
        
        
        

        require(address(token).isContract());

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success);

        if (returndata.length > 0) { 
            require(abi.decode(returndata, (bool)));
        }
    }
}





/
/
/
/
contract MarketCollateralPool is Ownable {
    using MathLib for uint;
    using MathLib for int;
    using SafeERC20 for ERC20;

  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {
      }
	else
      {
      }
}
  address public marketContractRegistry;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {
      }
	else
      {
      }
}
  address public mktToken;

  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  mapping(address => uint) public contractAddressToCollateralPoolBalance;                 
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  mapping(address => uint) public feesCollectedByTokenAddress;

  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event TokensMinted(
        address indexed marketContract,
        address indexed user,
        address indexed feeToken,
        uint qtyMinted,
        uint collateralLocked,
        uint feesPaid
    );

  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event TokensRedeemed (
        address indexed marketContract,
        address indexed user,
        uint longQtyRedeemed,
        uint shortQtyRedeemed,
        uint collateralUnlocked
    );

    constructor(address marketContractRegistryAddress, address mktTokenAddress) public {
        marketContractRegistry = marketContractRegistryAddress;
        mktToken = mktTokenAddress;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    / EXTERNAL METHODS
    */

    /
    /
    /
    /
    /
    /
    function mintPositionTokens(
        address marketContractAddress,
        uint qtyToMint,
        bool isAttemptToPayInMKT
    ) external onlyWhiteListedAddress(marketContractAddress)
    {

        MarketContract marketContract = MarketContract(marketContractAddress);
        require(!marketContract.isSettled(), "Contract is already settled");

        address collateralTokenAddress = marketContract.COLLATERAL_TOKEN_ADDRESS();
        uint neededCollateral = MathLib.multiply(qtyToMint, marketContract.COLLATERAL_PER_UNIT());
        
        
        
        bool isPayFeesInMKT = (isAttemptToPayInMKT &&
            marketContract.MKT_TOKEN_FEE_PER_UNIT() != 0) ||
            (!isAttemptToPayInMKT &&
            marketContract.MKT_TOKEN_FEE_PER_UNIT() != 0 &&
            marketContract.COLLATERAL_TOKEN_FEE_PER_UNIT() == 0);

        uint feeAmount;
        uint totalCollateralTokenTransferAmount;
        address feeToken;
        if (isPayFeesInMKT) { 
            feeAmount = MathLib.multiply(qtyToMint, marketContract.MKT_TOKEN_FEE_PER_UNIT());
            totalCollateralTokenTransferAmount = neededCollateral;
            feeToken = mktToken;

            
            
            ERC20(mktToken).safeTransferFrom(msg.sender, address(this), feeAmount);
        } else { 
            feeAmount = MathLib.multiply(qtyToMint, marketContract.COLLATERAL_TOKEN_FEE_PER_UNIT());
            totalCollateralTokenTransferAmount = neededCollateral.add(feeAmount);
            feeToken = collateralTokenAddress;
            
        }

        
        
        ERC20(marketContract.COLLATERAL_TOKEN_ADDRESS()).safeTransferFrom(msg.sender, address(this), totalCollateralTokenTransferAmount);

        if (feeAmount != 0) {
            
            feesCollectedByTokenAddress[feeToken] = feesCollectedByTokenAddress[feeToken].add(feeAmount);
        }

        
        contractAddressToCollateralPoolBalance[marketContractAddress] = contractAddressToCollateralPoolBalance[
            marketContractAddress
        ].add(neededCollateral);

        
        marketContract.mintPositionTokens(qtyToMint, msg.sender);

        emit TokensMinted(
            marketContractAddress,
            msg.sender,
            feeToken,
            qtyToMint,
            neededCollateral,
            feeAmount
        );
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    /
    /
    /
    /
    function redeemPositionTokens(
        address marketContractAddress,
        uint qtyToRedeem
    ) external onlyWhiteListedAddress(marketContractAddress)
    {
        MarketContract marketContract = MarketContract(marketContractAddress);

        marketContract.redeemLongToken(qtyToRedeem, msg.sender);
        marketContract.redeemShortToken(qtyToRedeem, msg.sender);

        
        uint collateralToReturn = MathLib.multiply(qtyToRedeem, marketContract.COLLATERAL_PER_UNIT());
        contractAddressToCollateralPoolBalance[marketContractAddress] = contractAddressToCollateralPoolBalance[
            marketContractAddress
        ].subtract(collateralToReturn);

        
        
        ERC20(marketContract.COLLATERAL_TOKEN_ADDRESS()).safeTransfer(msg.sender, collateralToReturn);

        emit TokensRedeemed(
            marketContractAddress,
            msg.sender,
            qtyToRedeem,
            qtyToRedeem,
            collateralToReturn
        );
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    
    
    
    /
    /
    /
    function settleAndClose(
        address marketContractAddress,
        uint longQtyToRedeem,
        uint shortQtyToRedeem
    ) external onlyWhiteListedAddress(marketContractAddress)
    {
        MarketContract marketContract = MarketContract(marketContractAddress);
        require(marketContract.isPostSettlementDelay(), "Contract is not past settlement delay");

        
        if (longQtyToRedeem > 0) {
            marketContract.redeemLongToken(longQtyToRedeem, msg.sender);
        }

        if (shortQtyToRedeem > 0) {
            marketContract.redeemShortToken(shortQtyToRedeem, msg.sender);
        }


        
        uint collateralToReturn = MathLib.calculateCollateralToReturn(
            marketContract.PRICE_FLOOR(),
            marketContract.PRICE_CAP(),
            marketContract.QTY_MULTIPLIER(),
            longQtyToRedeem,
            shortQtyToRedeem,
            marketContract.settlementPrice()
        );

        contractAddressToCollateralPoolBalance[marketContractAddress] = contractAddressToCollateralPoolBalance[
            marketContractAddress
        ].subtract(collateralToReturn);

        
        ERC20(marketContract.COLLATERAL_TOKEN_ADDRESS()).safeTransfer(msg.sender, collateralToReturn);

        emit TokensRedeemed(
            marketContractAddress,
            msg.sender,
            longQtyToRedeem,
            shortQtyToRedeem,
            collateralToReturn
        );
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /
    /
    /
    function withdrawFees(address feeTokenAddress, address feeRecipient) public onlyOwner {
        uint feesAvailableForWithdrawal = feesCollectedByTokenAddress[feeTokenAddress];
        require(feesAvailableForWithdrawal != 0, "No fees available for withdrawal");
        require(feeRecipient != address(0), "Cannot send fees to null address");
        feesCollectedByTokenAddress[feeTokenAddress] = 0;
        
        ERC20(feeTokenAddress).safeTransfer(feeRecipient, feesAvailableForWithdrawal);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    /
    /
    function setMKTTokenAddress(address mktTokenAddress) public onlyOwner {
        require(mktTokenAddress != address(0), "Cannot set MKT Token Address To Null");
        mktToken = mktTokenAddress;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    /
    /
    function setMarketContractRegistryAddress(address marketContractRegistryAddress) public onlyOwner {
        require(marketContractRegistryAddress != address(0), "Cannot set Market Contract Registry Address To Null");
        marketContractRegistry = marketContractRegistryAddress;
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    / MODIFIERS
    */

    /
    /
    /
    /
    modifier onlyWhiteListedAddress(address marketContractAddress) {
        require(
            MarketContractRegistryInterface(marketContractRegistry).isAddressWhiteListed(marketContractAddress),
            "Contract is not whitelisted"
        );
        _;
    }
}