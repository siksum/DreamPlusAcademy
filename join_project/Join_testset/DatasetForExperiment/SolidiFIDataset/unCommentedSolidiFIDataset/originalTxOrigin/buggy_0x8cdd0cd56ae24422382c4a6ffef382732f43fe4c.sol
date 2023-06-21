/www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

*/

pragma solidity 0.5.2;

contract Pool {
    
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  address public owner;

    CONSTANT PUBLIC FUNCTIONS
     */
    function balanceOf(address _who) external view returns (uint256);
    function totalSupply() external view returns (uint256 totaSupply);
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
    function getEventful() external view returns (address);
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
    function getData() external view returns (string memory name, string memory symbol, uint256 sellPrice, uint256 buyPrice);
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    function calcSharePrice() external view returns (uint256);
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    function getAdminData() external view returns (address, address feeCollector, address dragodAO, uint256 ratio, uint256 transactionFee, uint32 minPeriod);
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
}

contract SafeMath {

    function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }

    function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    function max64(uint64 a, uint64 b) internal pure returns (uint64) {
        return a >= b ? a : b;
    }

    function min64(uint64 a, uint64 b) internal pure returns (uint64) {
        return a < b ? a : b;
    }

    function max256(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    function min256(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }
}

contract RigoToken {

  function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  address public minter;
  function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  uint256 public totalSupply;
    
    function balanceOf(address _who) external view returns (uint256);
}

interface DragoRegistry {

    

    event Registered(string name, string symbol, uint256 id, address indexed drago, address indexed owner, address indexed group);
    event Unregistered(string indexed name, string indexed symbol, uint256 indexed id);
    event MetaChanged(uint256 indexed id, bytes32 indexed key, bytes32 value);

    CORE FUNCTIONS
     */
    function register(address _drago, string calldata _name, string calldata _symbol, uint256 _dragoId, address _owner) external payable returns (bool);
    function unregister(uint256 _id) external;
    function setMeta(uint256 _id, bytes32 _key, bytes32 _value) external;
    function addGroup(address _group) external;
    function setFee(uint256 _fee) external;
    function updateOwner(uint256 _id) external;
    function updateOwners(uint256[] calldata _id) external;
    function upgrade(address _newAddress) external payable; 
    function setUpgraded(uint256 _version) external;
    function drain() external;

    CONSTANT PUBLIC FUNCTIONS
     */
    function dragoCount() external view returns (uint256);
    function fromId(uint256 _id) external view returns (address drago, string memory name, string memory symbol, uint256 dragoId, address owner, address group);
    function fromAddress(address _drago) external view returns (uint256 id, string memory name, string memory symbol, uint256 dragoId, address owner, address group);
    function fromName(string calldata _name) external view returns (uint256 id, address drago, string memory symbol, uint256 dragoId, address owner, address group);
    function getNameFromAddress(address _pool) external view returns (string memory);
    function getSymbolFromAddress(address _pool) external view returns (string memory);
    function meta(uint256 _id, bytes32 _key) external view returns (bytes32);
    function getGroups() external view returns (address[] memory);
    function getFee() external view returns (uint256);
}

interface Inflation {

    CORE FUNCTIONS
     */
    function mintInflation(address _thePool, uint256 _reward) external returns (bool);
    function setInflationFactor(address _group, uint256 _inflationFactor) external;
    function setMinimumRigo(uint256 _minimum) external;
    function setRigoblock(address _newRigoblock) external;
    function setAuthority(address _authority) external;
    function setProofOfPerformance(address _pop) external;
    function setPeriod(uint256 _newPeriod) external;

    CONSTANT PUBLIC FUNCTIONS
     */
    function canWithdraw(address _thePool) external view returns (bool);
    function getInflationFactor(address _group) external view returns (uint256);
}

contract ReentrancyGuard {

    
  function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  bool private locked = false;

    /
    /
    modifier nonReentrant() {
        
        require(
            !locked,
            "REENTRANCY_ILLEGAL"
        );

        
        locked = true;

        
        _;

        
        locked = false;
    }
}

interface ProofOfPerformanceFace {

    CORE FUNCTIONS
     */
    function claimPop(uint256 _ofPool) external;
    function setRegistry(address _dragoRegistry) external;
    function setRigoblockDao(address _rigoblockDao) external;
    function setRatio(address _ofGroup, uint256 _ratio) external;

    CONSTANT PUBLIC FUNCTIONS
     */
    function getPoolData(uint256 _ofPool)
        external view
        returns (
            bool active,
            address thePoolAddress,
            address thePoolGroup,
            uint256 thePoolPrice,
            uint256 thePoolSupply,
            uint256 poolValue,
            uint256 epochReward,
            uint256 ratio,
            uint256 pop
        );

    function getHwm(uint256 _ofPool) external view returns (uint256);
}

/
/

contract ProofOfPerformance is
    SafeMath,
    ReentrancyGuard,
    ProofOfPerformanceFace
{
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  address public RIGOTOKENADDRESS;

  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  address public dragoRegistry;
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  address public rigoblockDao;

  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  mapping (uint256 => PoolPrice) poolPrice;
  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  mapping (address => Group) groups;

    struct PoolPrice {
        uint256 highwatermark;
    }

    struct Group {
        uint256 rewardRatio;
    }

    modifier onlyRigoblockDao() {
        require(
            msg.sender == rigoblockDao,
            "ONLY_RIGOBLOCK_DAO"
        );
        _;
    }

    constructor(
        address _rigoTokenAddress,
        address _rigoblockDao,
        address _dragoRegistry)
        public
    {
        RIGOTOKENADDRESS = _rigoTokenAddress;
        rigoblockDao = _rigoblockDao;
        dragoRegistry = _dragoRegistry;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    CORE FUNCTIONS
     */
    /
    /
    function claimPop(uint256 _ofPool)
        external
        nonReentrant
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        address poolAddress;
        (poolAddress, , , , , ) = registry.fromId(_ofPool);
        uint256 pop = proofOfPerformanceInternal(_ofPool);
        require(
            pop > 0,
            "POP_REWARD_IS_NULL"
        );
        (uint256 price, ) = getPoolPriceInternal(_ofPool);
        poolPrice[_ofPool].highwatermark = price;
        require(
            Inflation(getMinter()).mintInflation(poolAddress, pop),
            "MINT_INFLATION_ERROR"
        );
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    /
    /
    function setRegistry(address _dragoRegistry)
        external
        onlyRigoblockDao
    {
        dragoRegistry = _dragoRegistry;
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    /
    /
    function setRigoblockDao(address _rigoblockDao)
        external
        onlyRigoblockDao
    {
        rigoblockDao = _rigoblockDao;
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

    /
    /
    /
    /
    function setRatio(
        address _ofGroup,
        uint256 _ratio)
        external
        onlyRigoblockDao
    {
        require(
            _ratio <= 10000,
            "RATIO_BIGGER_THAN_10000"
        ); 
        groups[_ofGroup].rewardRatio = _ratio;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    CONSTANT PUBLIC FUNCTIONS
     */
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
    function getPoolData(uint256 _ofPool)
        external
        view
        returns (
            bool active,
            address thePoolAddress,
            address thePoolGroup,
            uint256 thePoolPrice,
            uint256 thePoolSupply,
            uint256 poolValue,
            uint256 epochReward,
            uint256 ratio,
            uint256 pop
        )
    {
        active = isActiveInternal(_ofPool);
        (thePoolAddress, thePoolGroup) = addressFromIdInternal(_ofPool);
        (thePoolPrice, thePoolSupply) = getPoolPriceInternal(_ofPool);
        (poolValue, ) = calcPoolValueInternal(_ofPool);
        epochReward = getEpochRewardInternal(_ofPool);
        ratio = getRatioInternal(_ofPool);
        pop = proofOfPerformanceInternal(_ofPool);
        return(
            active,
            thePoolAddress,
            thePoolGroup,
            thePoolPrice,
            thePoolSupply,
            poolValue,
            epochReward,
            ratio,
            pop
        );
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

    /
    /
    /
    function getHwm(uint256 _ofPool)
        external
        view
        returns (uint256)
    {
        return poolPrice[_ofPool].highwatermark;
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    /
    /
    /
    function getEpochReward(uint256 _ofPool)
        external
        view
        returns (uint256)
    {
        return getEpochRewardInternal(_ofPool);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    /
    /
    /
    function getRatio(uint256 _ofPool)
        external
        view
        returns (uint256)
    {
        return getRatioInternal(_ofPool);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    /
    /
    /
    /
    /
    /
    /
    function proofOfPerformance(uint256 _ofPool)
        external
        view
        returns (uint256)
    {
        return proofOfPerformanceInternal(_ofPool);
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    /
    /
    /
    function isActive(uint256 _ofPool)
        external
        view
        returns (bool)
    {
        return isActiveInternal(_ofPool);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    /
    /
    /
    /
    function addressFromId(uint256 _ofPool)
        external
        view
        returns (
            address pool,
            address group
        )
    {
        return (addressFromIdInternal(_ofPool));
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    /
    /
    /
    /
    function getPoolPrice(uint256 _ofPool)
        external
        view
        returns (
            uint256 thePoolPrice,
            uint256 totalTokens
        )
    {
        return (getPoolPriceInternal(_ofPool));
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    /
    /
    /
    /
    function calcPoolValue(uint256 _ofPool)
        external
        view
        returns (
            uint256 aum,
            bool success
        )
    {
        return (calcPoolValueInternal(_ofPool));
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    INTERNAL FUNCTIONS
     */
    /
    /
    /
    function getEpochRewardInternal(uint256 _ofPool)
        internal
        view
        returns (uint256)
    {
        ( , address group) = addressFromIdInternal(_ofPool);
        return Inflation(getMinter()).getInflationFactor(group);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    /
    /
    /
    function getRatioInternal(uint256 _ofPool)
        internal
        view
        returns (uint256)
    {
        ( , address group) = addressFromIdInternal(_ofPool);
        return groups[group].rewardRatio;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    /
    /
    function getMinter()
        internal
        view
        returns (address)
    {
        RigoToken token = RigoToken(RIGOTOKENADDRESS);
        return token.minter();
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    /
    /
    /
    /
    /
    /
    /
    function proofOfPerformanceInternal(uint256 _ofPool)
        internal
        view
        returns (uint256)
    {
        uint256 highwatermark = 1000 ether; 
        if (poolPrice[_ofPool].highwatermark == 0) {
            highwatermark = 1 ether;
        } else {
            highwatermark = poolPrice[_ofPool].highwatermark;
        }
        (uint256 poolValue, ) = calcPoolValueInternal(_ofPool);
        require(
            poolValue != 0,
            "POOL_VALUE_NULL"
        );
        (uint256 newPrice, uint256 tokenSupply) = getPoolPriceInternal(_ofPool);
        require (
            newPrice >= highwatermark,
            "PRICE_LOWER_THAN_HWM"
        );
        require (
            tokenSupply > 0,
            "TOKEN_SUPPLY_NULL"
        );

        uint256 epochReward = 0;
        (address thePoolAddress, ) = addressFromIdInternal(_ofPool);
        uint256 grgBalance = 
            RigoToken(RIGOTOKENADDRESS)
            .balanceOf(
                Pool(thePoolAddress)
                .owner()
        );
        if (grgBalance >= 1 * 10 ** 18) {
            epochReward = safeMul(getEpochRewardInternal(_ofPool), 10); 
        } else {
            epochReward = getEpochRewardInternal(_ofPool);
        }

        uint256 rewardRatio = getRatioInternal(_ofPool);
        uint256 prevPrice = highwatermark;
        uint256 priceDiff = safeSub(newPrice, prevPrice);
        uint256 performanceComponent = safeMul(safeMul(priceDiff, tokenSupply), epochReward);
        uint256 performanceReward = safeDiv(safeMul(performanceComponent, rewardRatio), 10000 ether);
        uint256 assetsComponent = safeMul(poolValue, epochReward);
        uint256 assetsReward = safeDiv(safeMul(assetsComponent, safeSub(10000, rewardRatio)), 10000 ether);
        uint256 popReward = safeAdd(performanceReward, assetsReward);
        if (popReward >= safeDiv(RigoToken(RIGOTOKENADDRESS).totalSupply(), 10000)) {
            return (safeDiv(RigoToken(RIGOTOKENADDRESS).totalSupply(), 10000));
        } else {
            return (popReward);
        }
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    /
    /
    /
    function isActiveInternal(uint256 _ofPool)
        internal view
        returns (bool)
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        (address thePool, , , , , ) = registry.fromId(_ofPool);
        if (thePool != address(0)) {
            return true;
        }
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    /
    /
    /
    /
    function addressFromIdInternal(uint256 _ofPool)
        internal
        view
        returns (
            address pool,
            address group
        )
    {
        DragoRegistry registry = DragoRegistry(dragoRegistry);
        (pool, , , , , group) = registry.fromId(_ofPool);
        return (pool, group);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    /
    /
    /
    /
    function getPoolPriceInternal(uint256 _ofPool)
        internal
        view
        returns (
            uint256 thePoolPrice,
            uint256 totalTokens
        )
    {
        (address poolAddress, ) = addressFromIdInternal(_ofPool);
        Pool pool = Pool(poolAddress);
        thePoolPrice = pool.calcSharePrice();
        totalTokens = pool.totalSupply();
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

    /
    /
    /
    /
    function calcPoolValueInternal(uint256 _ofPool)
        internal
        view
        returns (
            uint256 aum,
            bool success
        )
    {
        (uint256 price, uint256 supply) = getPoolPriceInternal(_ofPool);
        return ((aum = (price * supply / 1000000)), true); 
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
}