/**
 *Submitted for verification at Etherscan.io on 2020-02-04
*/

pragma solidity 0.5.11; 


/**
 * @title DharmaDai
 * @author 0age
 * @notice Dharma Dai is an upgradeable ERC20 token that delegates all logic to
 * an implementation contract specified by a hard-coded "upgrade beacon"
 * contract.
 */
contract DharmaDai {
  
  address private constant _UPGRADE_BEACON = address(
    0x0000000000ccCf289727C20269911159a7bf9eBd
  );

  /**
   * @notice In the fallback, delegate execution to the implementation set on
   * the upgrade beacon.
   */
  function () external payable {
    
    (bool ok, bytes memory returnData) = _UPGRADE_BEACON.staticcall("");

    
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }

    
    address implementation ;	


    assembly {
      
      
      
      calldatacopy(0, 0, calldatasize)

      
      
      let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

      
      returndatacopy(0, 0, returndatasize)

      switch result
      
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }
}