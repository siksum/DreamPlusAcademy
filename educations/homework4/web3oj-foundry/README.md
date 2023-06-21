# commands

1. .env에 RPC_URL , PRIVATE KEY 설정
2. forge create --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY src/Problem.sol:Problem(배포할 컨트랙트)

# call function

1. `cast call <INSTANCE CONTRACT ADDR> "totalSupply()(uint256)" --rpc-url $GOERLI_RPC_URL <인자>`

# send transaction

1. `cast send 0x4008b7d83Ecd6cCbd391D7aF49E1Ab3e915Adcbe "callThrowError()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY`

cast send <Instance Addr> —value 0.1ether —private-key <PRIVATE-KEY> —rpc-url <RPC> 