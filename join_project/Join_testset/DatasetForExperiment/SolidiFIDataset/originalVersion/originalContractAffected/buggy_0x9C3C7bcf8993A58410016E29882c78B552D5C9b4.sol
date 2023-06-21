/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity ^0.5.12;

/**
 * @title Mining logic
 * @dev Calculation of mining quantity
 */
contract NEST_3_OrePoolLogic {
    using address_make_payable for address;
    using SafeMath for uint256;
    uint256 blockAttenuation = 2400000;                         //  Block attenuation interval
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 attenuationTop = 90;                                //  Attenuation coefficient
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 attenuationBottom = 100;                            //  Attenuation coefficient
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(uint256 => mapping(address => uint256)) blockEth;   //  Total service charge of quotation block. block No. = > token address = > total service charge
  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(uint256 => uint256) blockTokenNum;                  //  Block currency quantity. block number = > currency quantity
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(uint256 => uint256) blockMining;                    //  Ore yield of quotation block. Block No. = > ore yield
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 latestMining;                                       //  Latest quotation block
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  NEST_2_Mapping mappingContract;                             //  Mapping contract
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  NEST_3_MiningSave miningSave;                               //  Ore pool contract
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  address abonusAddress;                                      //  Address of dividend pool
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  address offerFactoryAddress;                                //  Offer factory contract address
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  mapping(uint256 => uint256) blockAmountList;                //  Attenuation list. block number = > attenuation coefficient
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 latestBlock;                                        //  Latest attenuation block

    //  Current block, last quoted block, current block ore yield, current handling fee, token address
  uint256 bugv_tmstmp5 = block.timestamp;
  event oreDrawingLog(uint256 nowBlock, uint256 frontBlock, uint256 blockAmount, uint256 miningEth, address tokenAddress);
    //  Quotation block, token address, all handling charges of token, my handling charges, number of tokens
  uint256 bugv_tmstmp1 = block.timestamp;
  event miningLog(uint256 blockNum, address tokenAddress, uint256 miningEthAll, uint256 miningEthSelf, uint256 tokenNum);

    /**
    * @dev Initialization method
    * @param map Mapping contract address
    */
    constructor(address map) public {
        mappingContract = NEST_2_Mapping(address(map));                  
        miningSave = NEST_3_MiningSave(mappingContract.checkAddress("miningSave"));
        abonusAddress = address(mappingContract.checkAddress("abonus"));
        offerFactoryAddress = address(mappingContract.checkAddress("offerFactory"));
        latestBlock = block.number.sub(388888);
        latestMining = block.number;
        blockAmountList[block.number.sub(2788888)] = 400 ether;
        blockAmountList[block.number.sub(388888)] = blockAmountList[block.number.sub(2788888)].mul(attenuationTop).div(attenuationBottom);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    
    /**
    * @dev Change mapping contract
    * @param map Mapping contract address
    */
    function changeMapping(address map) public onlyOwner {
        mappingContract = NEST_2_Mapping(address(map));                 
        miningSave = NEST_3_MiningSave(mappingContract.checkAddress("miningSave"));
        abonusAddress = address(mappingContract.checkAddress("abonus"));
        offerFactoryAddress = address(mappingContract.checkAddress("offerFactory"));
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    /**
    * @dev Calculation of mining volume
    * @param token Offer token address
    */
    function oreDrawing(address token) public payable {
        require(address(msg.sender) == offerFactoryAddress);
        uint256 frontBlock = latestMining;
        changeBlockAmountList();
        if (blockEth[block.number][token] == 0) {
            blockTokenNum[block.number] = blockTokenNum[block.number].add(1);
        }
        blockEth[block.number][token] = blockEth[block.number][token].add(msg.value);
        repayEth(msg.value);
        emit oreDrawingLog(block.number, frontBlock,blockAmountList[latestBlock],msg.value,token);
    }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
    
    /**
    * @dev Mining
    * @param amount Number of handling charges
    * @param blockNum Offer block number
    * @param target Transfer target
    * @param token Token address
    * @return Ore yield
    */
    function mining(uint256 amount, uint256 blockNum, address target, address token) public returns(uint256) {
        require(address(msg.sender) == offerFactoryAddress);
        uint256 miningAmount = amount.mul(blockMining[blockNum]).div(blockEth[blockNum][token].mul(blockTokenNum[blockNum]));
        uint256 realAmount = miningSave.turnOut(miningAmount, target);
        emit miningLog(blockNum, token,blockEth[blockNum][token],amount,blockTokenNum[blockNum]);
        return realAmount;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    
    function changeBlockAmountList() private {
        uint256 subBlock = block.number.sub(latestBlock);
        if (subBlock >= blockAttenuation) {
            uint256 subBlockTimes = subBlock.div(blockAttenuation);
            for (uint256 i = 1; i < subBlockTimes.add(1); i++) {
                uint256 newBlockAmount = blockAmountList[latestBlock].mul(attenuationTop).div(attenuationBottom);
                latestBlock = latestBlock.add(blockAttenuation);
                if (latestMining < latestBlock) {
                    blockMining[block.number] = blockMining[block.number].add((blockAmountList[latestBlock.sub(blockAttenuation)]).mul(latestBlock.sub(latestMining).sub(1)));
                    latestMining = latestBlock.sub(1);
                }
                blockAmountList[latestBlock] = newBlockAmount;
            }
        }
        blockMining[block.number] = blockMining[block.number].add(blockAmountList[latestBlock].mul(block.number.sub(latestMining)));
        latestMining = block.number;
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
    
    function repayEth(uint256 asset) private {
        address payable addr = abonusAddress.make_payable();
        addr.transfer(asset);
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    //  View block falloff interval
    function checkBlockAttenuation() public view returns(uint256) {
        return blockAttenuation;
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    //  View attenuation factor
    function checkAttenuation() public view returns(uint256 top, uint256 bottom) {
        return (attenuationTop, attenuationBottom);
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    //  View the total service charge of quotation block
    function checkBlockEth(uint256 blockNum, address token) public view returns(uint256) {
        return blockEth[blockNum][token];
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    //  View block currency quantity
    function checkBlockTokenNum(uint256 blockNum) public view returns(uint256) {
        return blockTokenNum[blockNum];
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    //  View the ore yield of quotation block
    function checkBlockMining(uint256 blockNum) public view returns(uint256) {
        return blockMining[blockNum];
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    //  View the latest quotation block
    function checkLatestMining() public view returns(uint256) {
        return latestMining;
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    //  View falloff list
    function checkBlockAmountList(uint256 blockNum) public view returns(uint256) {
        return blockAmountList[blockNum];
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    //  View current ore output
    function checkBlockAmountListLatest() public view returns(uint256) {
        return blockAmountList[latestBlock];
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    //  View the latest falloff block
    function checkLatestBlock() public view returns(uint256) {
        return latestBlock;
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

    //  View the output of quotation contract
    function checkBlockRealAmount(uint256 amount, uint256 blockNum, address token) public view returns(uint256) {
        return amount.mul(blockMining[blockNum]).div(blockEth[blockNum][token].mul(blockTokenNum[blockNum]));
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function changeBlockAttenuation(uint256 blockNum) public onlyOwner {
        require(blockNum > 0);
        blockAttenuation = blockNum;
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
    
    function changeAttenuation(uint256 top, uint256 bottom) public onlyOwner {
        require(top > 0);
        require(bottom > 0);
        attenuationTop = top;
        attenuationBottom = bottom;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    modifier onlyOwner(){
        require(mappingContract.checkOwners(msg.sender) == true);
        _;
    }
uint256 bugv_tmstmp2 = block.timestamp;
}

contract NEST_3_MiningSave {
    function turnOut(uint256 amount, address target) public returns(uint256);
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    function checkBalance() public view returns(uint256);
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

contract NEST_2_Mapping {
	function checkAddress(string memory name) public view returns (address contractAddress);
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
	function checkOwners(address man) public view returns (bool);
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

contract ERC20 {
    function totalSupply() public view returns (uint supply);
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    function balanceOf( address who ) public view returns (uint value);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    function allowance( address owner, address spender ) public view returns (uint _allowance);
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function transfer( address to, uint256 value) external;
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    function transferFrom( address from, address to, uint value) public returns (bool ok);
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
    function approve( address spender, uint value ) public returns (bool ok);
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  uint256 bugv_tmstmp4 = block.timestamp;
  event Transfer( address indexed from, address indexed to, uint value);
  uint256 bugv_tmstmp3 = block.timestamp;
  event Approval( address indexed owner, address indexed spender, uint value);
}

library address_make_payable {
   function make_payable(address x) internal pure returns (address payable) {
      return address(uint160(x));
   }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
    assert(_b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = _a / _b;
    assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold
    return _a / _b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
    assert(_b <= _a);
    return _a - _b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}