pragma solidity ^0.5.1;

/**
 *
 * Easy Invest FOREVER Protected 2 Helper Contract
 * Accumulate ether to promote EIFP2 Contract
 * Anyone can send 0 ether to give Accumulated balance to EIFP2
 * 
 */
contract X3ProfitMainFundTransferV3 {   

    
    
	uint public constant maxBalance = 340282366920938463463374607431768211456 wei; 
    address payable public constant ADDRESS_EIFP2_CONTRACT = 0xf85D337017D9e6600a433c5036E0D18EdD0380f3;

    
    function () external payable {	
        if(msg.value == 0 || msg.data.length > 0){
            
            if(ADDRESS_EIFP2_CONTRACT.balance > maxBalance)
            {
                msg.sender.call.gas(2301).value(address(this).balance)("");
                return;
            }
            ADDRESS_EIFP2_CONTRACT.call.value(address(this).balance)("");
        }
	}
}