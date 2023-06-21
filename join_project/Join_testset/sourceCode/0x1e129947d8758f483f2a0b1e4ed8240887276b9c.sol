// Copyright (C) 2015, 2016, 2017 Dapphub, 2020 PeterTheOne

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity ^0.6.2;

import "./SafeMath.sol";

interface Borrower {
	function goWild() external;
}

contract FlashETH {
    using SafeMath for uint256;
    
    string public name     = "Flash Ether v0";
    string public symbol   = "FETH";
    uint8  public decimals = 18;

    event  Approval(address indexed src, address indexed guy, uint wad);
    event  Transfer(address indexed src, address indexed dst, uint wad);
    event  Deposit(address indexed dst, uint wad);
    event  Withdrawal(address indexed src, uint wad);

    mapping (address => uint)                       public  balanceOf;
    mapping (address => uint)                       public  withdrawBalanceOf;
    mapping (address => mapping (address => uint))  public  allowance;
    
    uint256 private extraSupply;

    receive() external payable {
        deposit();
    }
    
    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        withdrawBalanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    
    function withdraw(uint wad) public {
        require(balanceOf[msg.sender] >= wad);
        require(withdrawBalanceOf[msg.sender] >= wad);
        balanceOf[msg.sender] -= wad;
        withdrawBalanceOf[msg.sender] -= wad;
        msg.sender.transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }
    
	function flash(uint256 amount) external {
		balanceOf[msg.sender] = balanceOf[msg.sender].add(amount);
		extraSupply = extraSupply.add(amount);
		Borrower(msg.sender).goWild();
		balanceOf[msg.sender] = balanceOf[msg.sender].sub(amount);
		extraSupply = extraSupply.sub(amount);
	}

    function totalSupply() public view returns (uint) {
        return address(this).balance.add(extraSupply);
    }

    function approve(address guy, uint wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }

    function transfer(address dst, uint wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    function transferFrom(address src, address dst, uint wad)
        public
        returns (bool)
    {
        require(balanceOf[src] >= wad);

        if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;
        
        if (withdrawBalanceOf[src] >= wad) {
            withdrawBalanceOf[src] -= wad;
            withdrawBalanceOf[dst] += wad;
        } else {
            uint256 oldWithdrawBalance = withdrawBalanceOf[src];
            withdrawBalanceOf[src] -= oldWithdrawBalance;
            withdrawBalanceOf[dst] += oldWithdrawBalance;
        }

        emit Transfer(src, dst, wad);

        return true;
    }
}