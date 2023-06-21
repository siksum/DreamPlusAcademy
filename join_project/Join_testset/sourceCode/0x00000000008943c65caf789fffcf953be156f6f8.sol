/**
 *Submitted for verification at Etherscan.io on 2020-02-04
*/

/**
 * @title DharmaUSDC
 * @author 0age
 * @notice Dharma USD Coin is an upgradeable ERC20 token that delegates all
 * logic to an implementation contract specified by a hard-coded "upgrade
 *beacon" contract.
 */
contract DharmaUSDC {
  // Set upgrade beacon address as a constant (i.e. not in contract storage).
  address private constant _UPGRADE_BEACON = address(
    0x00000000000274bE4365Aa18CfDC9A22A947f67D
  );

  /**
   * @notice In the fallback, delegate execution to the implementation set on
   * the upgrade beacon.
   */
  function () external payable {
    // Get the current implementation address from the upgrade beacon.
    (bool ok, bytes memory returnData) = _UPGRADE_BEACON.staticcall("");

    // Revert and pass along revert message if call to upgrade beacon reverts.
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }

    // Put implementation address returned from the upgrade beacon on the stack.
    address implementation = abi.decode(returnData, (address));

    assembly {
      // Copy msg.data. We take full control of memory in this inline assembly
      // block because it will not return to Solidity code. We overwrite the
      // Solidity scratch pad at memory position 0.
      calldatacopy(0, 0, calldatasize)

      // Delegatecall to the implementation, supplying calldata and gas.
      // Out and outsize are set to zero - instead, use the return buffer.
      let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

      // Copy the returned data from the return buffer.
      returndatacopy(0, 0, returndatasize)

      switch result
      // Delegatecall returns 0 on error.
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }
}