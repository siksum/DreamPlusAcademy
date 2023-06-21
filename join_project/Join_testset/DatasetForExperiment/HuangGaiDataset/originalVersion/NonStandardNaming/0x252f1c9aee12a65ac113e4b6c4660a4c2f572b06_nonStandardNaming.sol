                                                                 

contract UniversalDeployer {
    event CREATED852(address _contract) anonymous;	//inject NONSTANDARD NAMING

    function CREATE2517(bytes memory _code, uint256 _salt) public payable returns (address _addr) {	//inject NONSTANDARD NAMING
        assembly { _addr := create2(callvalue(), add(_code, 32), mload(_code), _salt) }
        emit CREATED852(_addr);
    }
}