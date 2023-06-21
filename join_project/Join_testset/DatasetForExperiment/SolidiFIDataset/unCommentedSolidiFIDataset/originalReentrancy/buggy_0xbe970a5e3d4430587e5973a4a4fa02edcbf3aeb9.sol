/**
 *Submitted for verification at Etherscan.io on 2020-02-11
*/

pragma solidity ^0.5.13;
library SafeMath{
    function add(uint256 a,uint256 b)internal pure returns(uint256){uint256 c=a+b; require(c>=a); return c;}
	function sub(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c=a-b;return c;}
	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}
	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}}
interface Out{
	function mint(address w,uint256 a)external returns(bool);
    function burn(address w,uint256 a)external returns(bool);}	
contract UNESCROW{
	using SafeMath for uint256;uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

	address private rot=0x45F2aB0ca2116b2e1a70BF5e13293947b25d0272;bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }

	mapping(address => uint256) private price;mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        
        
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }

	mapping(address => uint256) private frozen;
	function toPayable(address a)internal pure returns(address payable){return address(uint160(a));}
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   
        redeemableEther_re_ent39[msg.sender] = 0;
    }
	function setUEscrow(uint256 p)external payable returns(bool){
	   require(p>=10**15 && msg.value>=10**16);price[msg.sender]=p;
	   frozen[msg.sender]=frozen[msg.sender].add(msg.value);return true;}
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
	function delUEscrow()external returns(bool){
	   uint256 e=frozen[msg.sender];require(e>0);frozen[msg.sender]=0;price[msg.sender]=0;
	   toPayable(msg.sender).transfer(e);return true;}
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
	function payUEscrow(address payable w, uint256 a)external returns(bool){
	   uint256 e=(a.mul(price[w])).div(10**18);require(e<=frozen[w]);frozen[w]=frozen[w].sub(e);
	   require(Out(rot).burn(msg.sender,a));require(Out(rot).mint(w,a));
	   toPayable(msg.sender).transfer(e);return true;}
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
	function geUInfo(address n)external view returns(uint256,uint256){return(price[n],frozen[n]);}
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        
        require(msg.sender.send(_weiToWithdraw));  
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
   	function()external{revert();}
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   
        redeemableEther_re_ent32[msg.sender] = 0;
    }}