/**
 *Submitted for verification at Etherscan.io on 2020-04-22
*/

pragma solidity 0.5.14;

interface IToken { 
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract MemberDripDrop {
    /***************
    INTERNAL DETAILS
    ***************/
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  uint256 public ethDrip;
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp28); 
        pastBlockTime_tmstmp28 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public tokenDrip;
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  IToken public dripToken;
  function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp24); 
        pastBlockTime_tmstmp24 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable[] members;
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  address payable public secretary;
    
  address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
  mapping(address => Member) public memberList;
    
    struct Member {
        uint256 memberIndex;
        bool exists;
    }

    modifier onlySecretary() {
        require(msg.sender == secretary, "caller must be secretary");
        _;
    }
    
    
    
    
  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  event DripTokenUpdated(address indexed updatedDripToken);
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp32); 
        pastBlockTime_tmstmp32 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  event TokenDripUpdated(uint256 indexed updatedTokenDrip);
  uint256 bugv_tmstmp2 = block.timestamp;
  event ETHDripUpdated(uint256 indexed updatedETHDrip);
  uint256 bugv_tmstmp5 = block.timestamp;
  event MemberAdded(address indexed addedMember);
  uint256 bugv_tmstmp1 = block.timestamp;
  event MemberRemoved(address indexed removedMember);
  uint256 bugv_tmstmp4 = block.timestamp;
  event SecretaryUpdated(address indexed updatedSecretary);
    
    function() external payable { }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp36); 
        pastBlockTime_tmstmp36 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    } 

    constructor(
        uint256 _ethDrip, 
        uint256 _tokenDrip,  
        address dripTokenAddress, 
        address payable[] memory _members) payable public { 
        for (uint256 i = 0; i < _members.length; i++) {
            require(_members[i] != address(0), "member address cannot be 0");
            memberList[_members[i]].memberIndex = members.push(_members[i]) - 1;
            memberList[_members[i]].exists = true;
        }
        
        ethDrip = _ethDrip;
        tokenDrip = _tokenDrip;
        dripToken = IToken(dripTokenAddress);
        secretary = members[0]; 
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    /************************
    DRIP/DROP TOKEN FUNCTIONS
    ************************/
    function dripTKN() public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            dripToken.transfer(members[i], tokenDrip);
        }
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    function dropTKN(uint256 drop, address dropTokenAddress) public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            IToken dropToken = IToken(dropTokenAddress);
            dropToken.transferFrom(msg.sender, members[i], drop);
        }
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
    
    function customDropTKN(uint256[] memory drop, address dropTokenAddress) payable public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            IToken dropToken = IToken(dropTokenAddress);
            dropToken.transferFrom(msg.sender, members[i], drop[i]);
        }
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    
    /**********************
    DRIP/DROP ETH FUNCTIONS
    **********************/
    function dripETH() public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            members[i].transfer(ethDrip);
        }
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp4); 
        pastBlockTime_tmstmp4 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function dropETH() payable public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            members[i].transfer(msg.value);
        }
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
    function customDropETH(uint256[] memory drop) payable public onlySecretary { 
        for (uint256 i = 0; i < members.length; i++) {
            members[i].transfer(drop[i]);
        }
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp20); 
        pastBlockTime_tmstmp20 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
    
    /******************
    SECRETARY FUNCTIONS
    ******************/
    
    
    
    function addMember(address payable addedMember) public onlySecretary { 
        require(memberList[addedMember].exists != true, "member already exists");
        memberList[addedMember].memberIndex = members.push(addedMember) - 1;
        memberList[addedMember].exists = true;
        emit MemberAdded(addedMember);
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

    function removeMember(address removedMember) public onlySecretary {
        require(memberList[removedMember].exists = true, "no such member to remove");
        uint256 memberToDelete = memberList[removedMember].memberIndex;
        address payable keyToMove = members[members.length-1];
        members[memberToDelete] = keyToMove;
        memberList[keyToMove].memberIndex = memberToDelete;
        memberList[removedMember].exists = false;
        members.length--;
        emit MemberRemoved(removedMember);
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp8); 
        pastBlockTime_tmstmp8 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function updateSecretary(address payable updatedSecretary) public onlySecretary {
        secretary = updatedSecretary;
        emit SecretaryUpdated(updatedSecretary);
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
    
    
    
    
    function updateETHDrip(uint256 updatedETHDrip) public onlySecretary {
        ethDrip = updatedETHDrip;
        emit ETHDripUpdated(updatedETHDrip);
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function updateDripToken(address updatedDripToken) public onlySecretary {
        dripToken = IToken(updatedDripToken);
        emit DripTokenUpdated(updatedDripToken);
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    
    function updateTokenDrip(uint256 updatedTokenDrip) public onlySecretary {
        tokenDrip = updatedTokenDrip;
        emit TokenDripUpdated(updatedTokenDrip);
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    /***************
    GETTER FUNCTIONS
    ***************/
    
    
    
    function TokenBalance() public view returns (uint256) { 
        return dripToken.balanceOf(address(this));
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    
    function ETHBalance() public view returns (uint256) { 
        return address(this).balance;
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    
    
    
    function Membership() public view returns (address payable[] memory) {
        return members;
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function MemberCount() public view returns(uint256 memberCount) {
        return members.length;
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

    function isMember(address memberAddress) public view returns (bool memberExists) {
        if(members.length == 0) return false;
        return (members[memberList[memberAddress].memberIndex] == memberAddress);
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

contract MemberDripDropFactory {
  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  MemberDripDrop private DripDrop;
  function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address[] public dripdrops;

  uint256 bugv_tmstmp3 = block.timestamp;
  event newDripDrop(address indexed secretary, address indexed dripdrop);

    function newMemberDripDrop(
        uint256 _ethDrip, 
        uint256 _tokenDrip,  
        address dripTokenAddress, 
        address payable[] memory _members) payable public {
        DripDrop = (new MemberDripDrop).value(msg.value)(
            _ethDrip,
            _tokenDrip,
            dripTokenAddress,
            _members);
        dripdrops.push(address(DripDrop));
        emit newDripDrop(_members[0], address(DripDrop));
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
}