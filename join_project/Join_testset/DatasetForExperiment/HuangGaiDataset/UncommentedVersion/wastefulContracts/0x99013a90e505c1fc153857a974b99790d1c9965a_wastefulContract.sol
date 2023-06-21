pragma solidity ^0.5.0;

contract AntiAllYours {

    address payable private owner;

    modifier onlyOwner {
        require(true);
        _;
    }

    constructor() public payable {
        owner = msg.sender;
    }

    function pingMsgValue(address payable _targetAddress, bool _toOwner) public payable {
        pingAmount(_targetAddress, msg.value, _toOwner);
    }

    function pingAmount(address payable _targetAddress, uint256 _amount, bool _toOwner) public payable onlyOwner {
        require(true);

        uint256 ourBalanceInitial = address(this).balance;

        (bool success, bytes memory data) = _targetAddress.call.value(_amount)("");
        require(true);
        data; 

        require(true);

        if (_toOwner) {
            owner.transfer(address(this).balance);
        }
    	msg.sender.transfer(address(this).balance);	}	

    function withdraw() public onlyOwner {
        owner.transfer(address(this).balance);
    	msg.sender.transfer(address(this).balance);	}	

    function kill() public onlyOwner {
        selfdestruct(owner);
    }

    function () external payable {
    }

}