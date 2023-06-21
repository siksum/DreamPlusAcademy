/**
 *Submitted for verification at Etherscan.io on 2020-04-06
*/

pragma solidity 0.5.15;

// https://github.com/makerdao/sai/blob/master/src/tap.sol
contract SaiTapInterface {
    function sai() public view returns (address);
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    function cash(uint256) public;
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
}

contract TokenInterface {
    function approve(address, uint256) public;
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    function transferFrom(address, address, uint256) public returns (bool);
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    function withdraw(uint256) public;
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    function balanceOf(address) public view returns (uint256);
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
}

// User must approve() this contract on Sai prior to calling.
contract CageFree {

  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  address public tap;
  function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  address public sai;
  function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  address public weth;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event FreeCash(address sender, uint256 amount);

    constructor(address _tap, address _weth) public {
        tap  = _tap;
        sai  = SaiTapInterface(tap).sai();
        weth = _weth;
        TokenInterface(sai).approve(tap, uint256(-1));
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    function freeCash(uint256 wad) public returns (uint256 cashoutBalance) {
        TokenInterface(sai).transferFrom(msg.sender, address(this), wad);
        SaiTapInterface(tap).cash(wad);
        cashoutBalance = TokenInterface(weth).balanceOf(address(this));
        require(cashoutBalance > 0, "Zero ETH value");
        TokenInterface(weth).withdraw(cashoutBalance);
        msg.sender.transfer(cashoutBalance);
        emit FreeCash(msg.sender, cashoutBalance);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function() external payable {
        require(msg.sender == weth, "Only WETH can send ETH");
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
}