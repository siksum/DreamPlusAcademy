// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEtherFunctionProblem {
    address payable public contractAddress; // 이더를 돌려받을 컨트랙트 주소

    // 이더를 돌려받을 컨트랙트 주소 설정하기
    function setReceiveEtherAddress(address payable _contractAddress) public {
        require(
            _contractAddress.code.length > 0,
            "_contractAddress is not Contract"
        );
        contractAddress = _contractAddress;
    }

    function SendAndReceiveEther(uint256 _amount) public payable {
        //msg.sender.transfer(msg.value)
        (bool sent, ) = contractAddress.call{value: _amount}("");
        require(sent, "Failed to sent Ether");
    }

    receive() external payable {}
}
