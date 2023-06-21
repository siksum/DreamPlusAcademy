                                                                 

// File: contracts/lib/math/SafeMath.sol

pragma solidity 0.5.12;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD746(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB522(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL734(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV474(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD487(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: contracts/lib/utils/ReentrancyGuard.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () internal {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT766() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

// File: contracts/extensions/BrokerExtension.sol

pragma solidity 0.5.12;


interface Broker {
    function OWNER350() external returns (address);	//inject NONSTANDARD NAMING
    function ISADMIN111(address _user) external returns(bool);	//inject NONSTANDARD NAMING
    function MARKNONCE499(uint256 _nonce) external;	//inject NONSTANDARD NAMING
}

contract BrokerExtension is ReentrancyGuard {
    Broker public broker;

    modifier ONLYADMIN735() {	//inject NONSTANDARD NAMING
        require(broker.ISADMIN111(msg.sender), "Invalid msg.sender");
        _;
    }

    modifier ONLYOWNER601() {	//inject NONSTANDARD NAMING
        require(broker.OWNER350() == msg.sender, "Invalid msg.sender");
        _;
    }

    function INITIALIZEBROKER351(address _brokerAddress) external {	//inject NONSTANDARD NAMING
        require(_brokerAddress != address(0), "Invalid _brokerAddress");
        require(address(broker) == address(0), "Broker already set");
        broker = Broker(_brokerAddress);
    }
}

// File: contracts/Utils.sol

pragma solidity 0.5.12;


interface ERC20 {
    function BALANCEOF886(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface MarketDapp {
    // Returns the address to approve tokens for
    function TOKENRECEIVER783(address[] calldata assetIds, uint256[] calldata dataValues, address[] calldata addresses) external view returns(address);	//inject NONSTANDARD NAMING
    function TRADE782(address[] calldata assetIds, uint256[] calldata dataValues, address[] calldata addresses, address payable recipient) external payable;	//inject NONSTANDARD NAMING
}

                                                                         
                            
                                                                              
                                                                               
          
library Utils {
    using SafeMath for uint256;

    // The constants for EIP-712 are precompiled to reduce contract size,
    // the original values are left here for reference and verification.
    //
    // bytes32 public constant EIP712_DOMAIN_TYPEHASH = keccak256(abi.encodePacked(
    //     "EIP712Domain(",
    //         "string name,",
    //         "string version,",
    //         "uint256 chainId,",
    //         "address verifyingContract,",
    //         "bytes32 salt",
    //     ")"
    // ));
    // bytes32 public constant EIP712_DOMAIN_TYPEHASH = 0xd87cd6ef79d4e2b95e15ce8abf732db51ec771f1ca2edccf22a46c729ac56472;
    //
    // bytes32 public constant CONTRACT_NAME = keccak256("Switcheo Exchange");
    // bytes32 public constant CONTRACT_VERSION = keccak256("2");
    // uint256 public constant CHAIN_ID = 3; // TODO: Update this before deploying
    // address public constant VERIFYING_CONTRACT = address(1); // TODO: Update this before deploying
    // bytes32 public constant SALT = keccak256("switcheo-eth-salt");

    // bytes32 public constant DOMAIN_SEPARATOR = keccak256(abi.encode(
    //     EIP712_DOMAIN_TYPEHASH,
    //     CONTRACT_NAME,
    //     CONTRACT_VERSION,
    //     CHAIN_ID,
    //     VERIFYING_CONTRACT,
    //     SALT
    // ));
    bytes32 public constant domain_separator277 = 0x14f697e312cdba1c10a1eb5c87d96fa22b63aef9dc39592568387471319ea630;	//inject NONSTANDARD NAMING

    // bytes32 public constant OFFER_TYPEHASH = keccak256(abi.encodePacked(
    //     "Offer(",
    //         "address maker,",
    //         "address offerAssetId,",
    //         "uint256 offerAmount,",
    //         "address wantAssetId,",
    //         "uint256 wantAmount,",
    //         "address feeAssetId,",
    //         "uint256 feeAmount,",
    //         "uint256 nonce",
    //     ")"
    // ));
    bytes32 public constant offer_typehash432 = 0xf845c83a8f7964bc8dd1a092d28b83573b35be97630a5b8a3b8ae2ae79cd9260;	//inject NONSTANDARD NAMING

    // bytes32 public constant CANCEL_TYPEHASH = keccak256(abi.encodePacked(
    //     "Cancel(",
    //         "bytes32 offerHash,",
    //         "address feeAssetId,",
    //         "uint256 feeAmount,",
    //     ")"
    // ));
    bytes32 public constant cancel_typehash244 = 0x46f6d088b1f0ff5a05c3f232c4567f2df96958e05457e6c0e1221dcee7d69c18;	//inject NONSTANDARD NAMING

    // bytes32 public constant FILL_TYPEHASH = keccak256(abi.encodePacked(
    //     "Fill(",
    //         "address filler,",
    //         "address offerAssetId,",
    //         "uint256 offerAmount,",
    //         "address wantAssetId,",
    //         "uint256 wantAmount,",
    //         "address feeAssetId,",
    //         "uint256 feeAmount,",
    //         "uint256 nonce",
    //     ")"
    // ));
    bytes32 public constant fill_typehash891 = 0x5f59dbc3412a4575afed909d028055a91a4250ce92235f6790c155a4b2669e99;	//inject NONSTANDARD NAMING

    // The Ether token address is set as the constant 0x00 for backwards
    // compatibility
    address private constant ether_addr841 = address(0);	//inject NONSTANDARD NAMING

    uint256 private constant mask8846 = ~(~uint256(0) << 8);	//inject NONSTANDARD NAMING
    uint256 private constant mask16730 = ~(~uint256(0) << 16);	//inject NONSTANDARD NAMING
    uint256 private constant mask24167 = ~(~uint256(0) << 24);	//inject NONSTANDARD NAMING
    uint256 private constant mask32705 = ~(~uint256(0) << 32);	//inject NONSTANDARD NAMING
    uint256 private constant mask40813 = ~(~uint256(0) << 40);	//inject NONSTANDARD NAMING
    uint256 private constant mask48800 = ~(~uint256(0) << 48);	//inject NONSTANDARD NAMING
    uint256 private constant mask5681 = ~(~uint256(0) << 56);	//inject NONSTANDARD NAMING
    uint256 private constant mask120170 = ~(~uint256(0) << 120);	//inject NONSTANDARD NAMING
    uint256 private constant mask128978 = ~(~uint256(0) << 128);	//inject NONSTANDARD NAMING
    uint256 private constant mask136887 = ~(~uint256(0) << 136);	//inject NONSTANDARD NAMING
    uint256 private constant mask144398 = ~(~uint256(0) << 144);	//inject NONSTANDARD NAMING

    event TRADE764(	//inject NONSTANDARD NAMING
        address maker,
        address taker,
        address makerGiveAsset,
        uint256 makerGiveAmount,
        address fillerGiveAsset,
        uint256 fillerGiveAmount
    );

                                                                  
                                                              
                                                                                
                             
                                      
    function CALCULATETRADEINCREMENTS819(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        uint256 _incrementsLength
    )
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory increments = new uint256[](_incrementsLength);
        _CREDITFILLBALANCES479(increments, _values);
        _CREDITMAKERBALANCES995(increments, _values);
        _CREDITMAKERFEEBALANCES336(increments, _values);
        return increments;
    }

                                                                  
                                                              
                                                                                
                             
                                      
    function CALCULATETRADEDECREMENTS971(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        uint256 _decrementsLength
    )
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory decrements = new uint256[](_decrementsLength);
        _DEDUCTFILLBALANCES24(decrements, _values);
        _DEDUCTMAKERBALANCES474(decrements, _values);
        return decrements;
    }

                                                                          
                                                                     
                                                                                
                                    
                                      
    function CALCULATENETWORKTRADEINCREMENTS371(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        uint256 _incrementsLength
    )
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory increments = new uint256[](_incrementsLength);
        _CREDITMAKERBALANCES995(increments, _values);
        _CREDITMAKERFEEBALANCES336(increments, _values);
        return increments;
    }

                                                                          
                                                              
                                                                                
                                    
                                      
    function CALCULATENETWORKTRADEDECREMENTS481(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        uint256 _decrementsLength
    )
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory decrements = new uint256[](_decrementsLength);
        _DEDUCTMAKERBALANCES474(decrements, _values);
        return decrements;
    }

                                                                            
                                               
                                          
                                          
                                                
    function VALIDATETRADES340(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes,
        address[] memory _addresses,
        address _operator
    )
        public
        returns (bytes32[] memory)
    {
        _VALIDATETRADEINPUTLENGTHS245(_values, _hashes);
        _VALIDATEUNIQUEOFFERS390(_values);
        _VALIDATEMATCHES641(_values, _addresses);
        _VALIDATEFILLAMOUNTS365(_values);
        _VALIDATETRADEDATA94(_values, _addresses, _operator);

        // validate signatures of all offers
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            offer_typehash432,
            0,
            _values[0] & mask8846 // numOffers
        );

        // validate signatures of all fills
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            fill_typehash891,
            _values[0] & mask8846, // numOffers
            (_values[0] & mask8846) + ((_values[0] & mask16730) >> 8) // numOffers + numFills
        );

        _EMITTRADEEVENTS573(_values, _addresses, new address[](0), false);

        return _hashes;
    }

                                                                                   
                                                      
                                                 
                                                 
                                                       
                                                           
    function VALIDATENETWORKTRADES574(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes,
        address[] memory _addresses,
        address _operator
    )
        public
        pure
        returns (bytes32[] memory)
    {
        _VALIDATENETWORKTRADEINPUTLENGTHS16(_values, _hashes);
        _VALIDATEUNIQUEOFFERS390(_values);
        _VALIDATENETWORKMATCHES440(_values, _addresses, _operator);
        _VALIDATETRADEDATA94(_values, _addresses, _operator);

        // validate signatures of all offers
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            offer_typehash432,
            0,
            _values[0] & mask8846 // numOffers
        );

        return _hashes;
    }

                                                      
                                                      
                                                 
                                                       
                                                      
    function PERFORMNETWORKTRADES116(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses,
        address[] memory _marketDapps
    )
        public
        returns (uint256[] memory)
    {
        uint256[] memory increments = new uint256[](_addresses.length / 2);
        // i = 1 + numOffers * 2
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        uint256 end = _values.length;

        // loop matches
        for(i; i < end; i++) {
            uint256[] memory data = new uint256[](9);
            data[0] = _values[i]; // match data
            data[1] = data[0] & mask8846; // offerIndex
            data[2] = (data[0] & mask24167) >> 16; // operator.surplusAssetIndex
            data[3] = _values[data[1] * 2 + 1]; // offer.dataA
            data[4] = _values[data[1] * 2 + 2]; // offer.dataB
            data[5] = ((data[3] & mask16730) >> 8); // maker.offerAssetIndex
            data[6] = ((data[3] & mask24167) >> 16); // maker.wantAssetIndex
            // amount of offerAssetId to take from the offer is equal to the match.takeAmount
            data[7] = data[0] >> 128;
            // expected amount to receive is: matchData.takeAmount * offer.wantAmount / offer.offerAmount
            data[8] = data[7].MUL734(data[4] >> 128).DIV474(data[4] & mask128978);

            address[] memory assetIds = new address[](3);
            assetIds[0] = _addresses[data[5] * 2 + 1]; // offer.offerAssetId
            assetIds[1] = _addresses[data[6] * 2 + 1]; // offer.wantAssetId
            assetIds[2] = _addresses[data[2] * 2 + 1]; // surplusAssetId

            uint256[] memory dataValues = new uint256[](3);
            dataValues[0] = data[7]; // the proportion of offerAmount to offer
            dataValues[1] = data[8]; // the proportion of wantAmount to receive for the offer
            dataValues[2] = data[0]; // match data

            increments[data[2]] = _PERFORMNETWORKTRADE435(
                assetIds,
                dataValues,
                _marketDapps,
                _addresses
            );
        }

        _EMITTRADEEVENTS573(_values, _addresses, _marketDapps, true);

        return increments;
    }

                                                           
                                                               
                                                               
                                                                     
    function VALIDATECANCEL803(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes,
        address[] memory _addresses
    )
        public
        pure
    {
        bytes32 offerHash = HASHOFFER982(_values, _addresses);

        bytes32 cancelHash = keccak256(abi.encode(
            cancel_typehash244,
            offerHash,
            _addresses[4],
            _values[1] >> 128
        ));

        VALIDATESIGNATURE838(
            cancelHash,
            _addresses[0], // maker
            uint8((_values[2] & mask144398) >> 136), // v
            _hashes[0], // r
            _hashes[1], // s
            ((_values[2] & mask136887) >> 128) != 0 // prefixedSignature
        );
    }

                                                  
                                                               
                                                                     
                                     
    function HASHOFFER982(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses
    )
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encode(
            offer_typehash432,
            _addresses[0], // maker
            _addresses[1], // offerAssetId
            _values[0] & mask128978, // offerAmount
            _addresses[2], // wantAssetId
            _values[0] >> 128, // wantAmount
            _addresses[3], // feeAssetId
            _values[1] & mask128978, // feeAmount
            _values[2] >> 144 // offerNonce
        ));
    }

                                         
                                                           
                                                             
                                                      
    function APPROVETOKENTRANSFER269(	//inject NONSTANDARD NAMING
        address _assetId,
        address _spender,
        uint256 _amount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        // Some tokens have an `approve` which returns a boolean and some do not.
        // The ERC20 interface cannot be used here because it requires specifying
        // an explicit return value, and an EVM exception would be raised when calling
        // a token with the mismatched return value.
        bytes memory payload = abi.encodeWithSignature(
            "approve(address,uint256)",
            _spender,
            _amount
        );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);
        // Ensure that the asset transfer succeeded
        _VALIDATECONTRACTCALLRESULT581(returnData);
    }

                                                  
                                                            
                                                            
                                                       
                                                                            
                                                                      
                                                                           
    function TRANSFERTOKENSIN594(	//inject NONSTANDARD NAMING
        address _user,
        address _assetId,
        uint256 _amount,
        uint256 _expectedAmount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        uint256 initialBalance = TOKENBALANCE680(_assetId);

        // Some tokens have a `transferFrom` which returns a boolean and some do not.
        // The ERC20 interface cannot be used here because it requires specifying
        // an explicit return value, and an EVM exception would be raised when calling
        // a token with the mismatched return value.
        bytes memory payload = abi.encodeWithSignature(
            "transferFrom(address,address,uint256)",
            _user,
            address(this),
            _amount
        );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);
        // Ensure that the asset transfer succeeded
        _VALIDATECONTRACTCALLRESULT581(returnData);

        uint256 finalBalance = TOKENBALANCE680(_assetId);
        uint256 transferredAmount = finalBalance.SUB522(initialBalance);

        require(transferredAmount == _expectedAmount, "Invalid transfer");
    }

                                                            
                                                                      
                                                            
                                                       
    function TRANSFERTOKENSOUT732(	//inject NONSTANDARD NAMING
        address _receivingAddress,
        address _assetId,
        uint256 _amount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        // Some tokens have a `transfer` which returns a boolean and some do not.
        // The ERC20 interface cannot be used here because it requires specifying
        // an explicit return value, and an EVM exception would be raised when calling
        // a token with the mismatched return value.
        bytes memory payload = abi.encodeWithSignature(
                                   "transfer(address,uint256)",
                                   _receivingAddress,
                                   _amount
                               );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);

        // Ensure that the asset transfer succeeded
        _VALIDATECONTRACTCALLRESULT581(returnData);
    }

                                                                   
                                                         
    function EXTERNALBALANCE264(address _assetId) public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (_assetId == ether_addr841) {
            return address(this).balance;
        }
        return TOKENBALANCE680(_assetId);
    }

                                                                    
                                                                           
                     
                                                         
    function TOKENBALANCE680(address _assetId) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return ERC20(_assetId).BALANCEOF886(address(this));
    }

                                                                                      
                                                                         
                                                                                   
                                                                  
                                                 
                                                              
                                                              
                                                              
                                                                
                                                                        
                            
    function VALIDATESIGNATURE838(	//inject NONSTANDARD NAMING
        bytes32 _hash,
        address _user,
        uint8 _v,
        bytes32 _r,
        bytes32 _s,
        bool _prefixed
    )
        public
        pure
    {
        bytes32 eip712Hash = keccak256(abi.encodePacked(
            "\x19\x01",
            domain_separator277,
            _hash
        ));

        if (_prefixed) {
            bytes32 prefixedHash = keccak256(abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                eip712Hash
            ));
            require(_user == ecrecover(prefixedHash, _v, _r, _s), "Invalid signature");
        } else {
            require(_user == ecrecover(eip712Hash, _v, _r, _s), "Invalid signature");
        }
    }

                                                            
                                            
    function VALIDATEADDRESS15(address _address) public pure {	//inject NONSTANDARD NAMING
        require(_address != address(0), "Invalid address");
    }

                                                                            
                                                                          
                                          
    function _CREDITFILLBALANCES479(	//inject NONSTANDARD NAMING
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        // 1 + numOffers * 2
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        // i + numFills * 2
        uint256 end = i + ((_values[0] & mask16730) >> 8) * 2;

        // loop fills
        for(i; i < end; i += 2) {
            uint256 fillerWantAssetIndex = (_values[i] & mask24167) >> 16;
            uint256 wantAmount = _values[i + 1] >> 128;

            // credit fill.wantAmount to filler
            _increments[fillerWantAssetIndex] = _increments[fillerWantAssetIndex].ADD746(wantAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            uint256 operatorFeeAssetIndex = ((_values[i] & mask40813) >> 32);
            // credit fill.feeAmount to operator
            _increments[operatorFeeAssetIndex] = _increments[operatorFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                           
                                                 
                                          
    function _CREDITMAKERBALANCES995(	//inject NONSTANDARD NAMING
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        // i += numOffers * 2
        i += (_values[0] & mask8846) * 2;
        // i += numFills * 2
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        // loop matches
        for(i; i < end; i++) {
            // match.offerIndex
            uint256 offerIndex = _values[i] & mask8846;
            // maker.wantAssetIndex
            uint256 makerWantAssetIndex = (_values[1 + offerIndex * 2] & mask24167) >> 16;

            // match.takeAmount
            uint256 amount = _values[i] >> 128;
            // receiveAmount = match.takeAmount * offer.wantAmount / offer.offerAmount
            amount = amount.MUL734(_values[2 + offerIndex * 2] >> 128)
                           .DIV474(_values[2 + offerIndex * 2] & mask128978);

            // credit maker for the amount received from the match
            _increments[makerWantAssetIndex] = _increments[makerWantAssetIndex].ADD746(amount);
        }
    }

                                                                              
                                                      
                                                 
                                          
    function _CREDITMAKERFEEBALANCES336(	//inject NONSTANDARD NAMING
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        // i + numOffers * 2
        uint256 end = i + (_values[0] & mask8846) * 2;

        // loop offers
        for(i; i < end; i += 2) {
            bool nonceTaken = ((_values[i] & mask128978) >> 120) == 1;
            if (nonceTaken) { continue; }

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            uint256 operatorFeeAssetIndex = (_values[i] & mask40813) >> 32;

            // credit make.feeAmount to operator
            _increments[operatorFeeAssetIndex] = _increments[operatorFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                 
                                
                                                 
                                          
    function _DEDUCTFILLBALANCES24(	//inject NONSTANDARD NAMING
        uint256[] memory _decrements,
        uint256[] memory _values
    )
        private
        pure
    {
        // 1 + numOffers * 2
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        // i + numFills * 2
        uint256 end = i + ((_values[0] & mask16730) >> 8) * 2;

        // loop fills
        for(i; i < end; i += 2) {
            uint256 fillerOfferAssetIndex = (_values[i] & mask16730) >> 8;
            uint256 offerAmount = _values[i + 1] & mask128978;

            // deduct fill.offerAmount from filler
            _decrements[fillerOfferAssetIndex] = _decrements[fillerOfferAssetIndex].ADD746(offerAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            // deduct fill.feeAmount from filler
            uint256 fillerFeeAssetIndex = (_values[i] & mask32705) >> 24;
            _decrements[fillerFeeAssetIndex] = _decrements[fillerFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                 
                                                                   
                                        
                                                 
                                          
    function _DEDUCTMAKERBALANCES474(	//inject NONSTANDARD NAMING
        uint256[] memory _decrements,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        // i + numOffers * 2
        uint256 end = i + (_values[0] & mask8846) * 2;

        // loop offers
        for(i; i < end; i += 2) {
            bool nonceTaken = ((_values[i] & mask128978) >> 120) == 1;
            if (nonceTaken) { continue; }

            uint256 makerOfferAssetIndex = (_values[i] & mask16730) >> 8;
            uint256 offerAmount = _values[i + 1] & mask128978;

            // deduct make.offerAmount from maker
            _decrements[makerOfferAssetIndex] = _decrements[makerOfferAssetIndex].ADD746(offerAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            // deduct make.feeAmount from maker
            uint256 makerFeeAssetIndex = (_values[i] & mask32705) >> 24;
            _decrements[makerFeeAssetIndex] = _decrements[makerFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                   
                                                                             
                                                                                   
                                                          
                                                                                   
    function _EMITTRADEEVENTS573(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses,
        address[] memory _marketDapps,
        bool _forNetworkTrade
    )
        private
    {
        uint256 i = 1;
        // i += numOffers * 2
        i += (_values[0] & mask8846) * 2;
        // i += numFills * 2
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        // loop matches
        for(i; i < end; i++) {
            uint256[] memory data = new uint256[](7);
            data[0] = _values[i] & mask8846; // match.offerIndex
            data[1] = _values[1 + data[0] * 2] & mask8846; // makerIndex
            data[2] = (_values[1 + data[0] * 2] & mask16730) >> 8; // makerOfferAssetIndex
            data[3] = (_values[1 + data[0] * 2] & mask24167) >> 16; // makerWantAssetIndex
            data[4] = _values[i] >> 128; // match.takeAmount
            // receiveAmount = match.takeAmount * offer.wantAmount / offer.offerAmount
            data[5] = data[4].MUL734(_values[2 + data[0] * 2] >> 128)
                             .DIV474(_values[2 + data[0] * 2] & mask128978);
            // match.fillIndex for `trade`, marketDappIndex for `networkTrade`
            data[6] = (_values[i] & mask16730) >> 8;

            address filler;
            if (_forNetworkTrade) {
                filler = _marketDapps[data[6]];
            } else {
                uint256 fillerIndex = (_values[1 + data[6] * 2] & mask8846);
                filler = _addresses[fillerIndex * 2];
            }

            emit TRADE764(
                _addresses[data[1] * 2], // maker
                filler,
                _addresses[data[2] * 2 + 1], // makerGiveAsset
                data[4], // makerGiveAmount
                _addresses[data[3] * 2 + 1], // fillerGiveAsset
                data[5] // fillerGiveAmount
            );
        }
    }


                                                            
                                                                    
                                                                         
                                                             
                                                                         
                                                                             
                                                                     
                                                         
                                                        
                                              
                                                           
                                                                          
                                        
                                                      
                                                       
    function _PERFORMNETWORKTRADE435(	//inject NONSTANDARD NAMING
        address[] memory _assetIds,
        uint256[] memory _dataValues,
        address[] memory _marketDapps,
        address[] memory _addresses
    )
        private
        returns (uint256)
    {
        uint256 dappIndex = (_dataValues[2] & mask16730) >> 8;
        VALIDATEADDRESS15(_marketDapps[dappIndex]);
        MarketDapp marketDapp = MarketDapp(_marketDapps[dappIndex]);

        uint256[] memory funds = new uint256[](6);
        funds[0] = EXTERNALBALANCE264(_assetIds[0]); // initialOfferTokenBalance
        funds[1] = EXTERNALBALANCE264(_assetIds[1]); // initialWantTokenBalance
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            funds[2] = EXTERNALBALANCE264(_assetIds[2]); // initialSurplusTokenBalance
        }

        uint256 ethValue = 0;
        address tokenReceiver;

        if (_assetIds[0] == ether_addr841) {
            ethValue = _dataValues[0]; // offerAmount
        } else {
            tokenReceiver = marketDapp.TOKENRECEIVER783(_assetIds, _dataValues, _addresses);
            APPROVETOKENTRANSFER269(
                _assetIds[0], // offerAssetId
                tokenReceiver,
                _dataValues[0] // offerAmount
            );
        }

        marketDapp.TRADE782.value(ethValue)(
            _assetIds,
            _dataValues,
            _addresses,
            // use uint160 to cast `address` to `address payable`
            address(uint160(address(this))) // destAddress
        );

        funds[3] = EXTERNALBALANCE264(_assetIds[0]); // finalOfferTokenBalance
        funds[4] = EXTERNALBALANCE264(_assetIds[1]); // finalWantTokenBalance
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            funds[5] = EXTERNALBALANCE264(_assetIds[2]); // finalSurplusTokenBalance
        }

        uint256 surplusAmount = 0;

        // validate that the appropriate offerAmount was deducted
        // surplusAssetId == offerAssetId
        if (_assetIds[2] == _assetIds[0]) {
            // surplusAmount = finalOfferTokenBalance - (initialOfferTokenBalance - offerAmount)
            surplusAmount = funds[3].SUB522(funds[0].SUB522(_dataValues[0]));
        } else {
            // finalOfferTokenBalance == initialOfferTokenBalance - offerAmount
            require(funds[3] == funds[0].SUB522(_dataValues[0]), "Invalid offer asset balance");
        }

        // validate that the appropriate wantAmount was credited
        // surplusAssetId == wantAssetId
        if (_assetIds[2] == _assetIds[1]) {
            // surplusAmount = finalWantTokenBalance - (initialWantTokenBalance + wantAmount)
            surplusAmount = funds[4].SUB522(funds[1].ADD746(_dataValues[1]));
        } else {
            // finalWantTokenBalance == initialWantTokenBalance + wantAmount
            require(funds[4] == funds[1].ADD746(_dataValues[1]), "Invalid want asset balance");
        }

        // surplusAssetId != offerAssetId && surplusAssetId != wantAssetId
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            // surplusAmount = finalSurplusTokenBalance - initialSurplusTokenBalance
            surplusAmount = funds[5].SUB522(funds[2]);
        }

        // set the approved token amount back to zero
        if (_assetIds[0] != ether_addr841) {
            APPROVETOKENTRANSFER269(
                _assetIds[0],
                tokenReceiver,
                0
            );
        }

        return surplusAmount;
    }

                                                                 
                                       
                                          
                                          
    function _VALIDATETRADEINPUTLENGTHS245(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;
        uint256 numFills = (_values[0] & mask16730) >> 8;
        uint256 numMatches = (_values[0] & mask24167) >> 16;

        // Validate that bits(24..256) are zero
        require(_values[0] >> 24 == 0, "Invalid trade input");

        // It is enforced by other checks that if a fill is present
        // then it must be completely filled so there must be at least one offer
        // and at least one match in this case.
        // It is possible to have one offer with no matches and no fills
        // but that is blocked by this check as there is no foreseeable use
        // case for it.
        require(
            numOffers > 0 && numFills > 0 && numMatches > 0,
            "Invalid trade input"
        );

        require(
            _values.length == 1 + numOffers * 2 + numFills * 2 + numMatches,
            "Invalid _values.length"
        );

        require(
            _hashes.length == (numOffers + numFills) * 2,
            "Invalid _hashes.length"
        );
    }

                                                                 
                                              
                                                 
                                                 
    function _VALIDATENETWORKTRADEINPUTLENGTHS16(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;
        uint256 numFills = (_values[0] & mask16730) >> 8;
        uint256 numMatches = (_values[0] & mask24167) >> 16;

        // Validate that bits(24..256) are zero
        require(_values[0] >> 24 == 0, "Invalid networkTrade input");

        // Validate that numFills is zero because the offers
        // should be filled against external orders
        require(
            numOffers > 0 && numMatches > 0 && numFills == 0,
            "Invalid networkTrade input"
        );

        require(
            _values.length == 1 + numOffers * 2 + numMatches,
            "Invalid _values.length"
        );

        require(
            _hashes.length == numOffers * 2,
            "Invalid _hashes.length"
        );
    }

                                                                            
                              
                                                                             
                                                   
                                                                               
                                          
                                          
    function _VALIDATEUNIQUEOFFERS390(uint256[] memory _values) private pure {	//inject NONSTANDARD NAMING
        uint256 numOffers = _values[0] & mask8846;

        uint256 prevNonce;

        for(uint256 i = 0; i < numOffers; i++) {
            uint256 nonce = (_values[i * 2 + 1] & mask120170) >> 56;

            if (i == 0) {
                // Set the value of the first nonce
                prevNonce = nonce;
                continue;
            }

            require(nonce > prevNonce, "Invalid offer nonces");
            prevNonce = nonce;
        }
    }

                                           
                                                       
                                                      
                                                 
                                                 
                         
                                                                   
                                          
                                                
    function _VALIDATEMATCHES641(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;
        uint256 numFills = (_values[0] & mask16730) >> 8;

        uint256 i = 1 + numOffers * 2 + numFills * 2;
        uint256 end = _values.length;

        // loop matches
        for (i; i < end; i++) {
            uint256 offerIndex = _values[i] & mask8846;
            uint256 fillIndex = (_values[i] & mask16730) >> 8;

            require(offerIndex < numOffers, "Invalid match.offerIndex");

            require(fillIndex >= numOffers && fillIndex < numOffers + numFills, "Invalid match.fillIndex");

            require(
                _addresses[(_values[1 + offerIndex * 2] & mask8846)] !=
                _addresses[(_values[1 + fillIndex * 2] & mask8846)],
                "offer.maker cannot be the same as fill.filler"
            );

            uint256 makerOfferAssetIndex = (_values[1 + offerIndex * 2] & mask16730) >> 8;
            uint256 makerWantAssetIndex = (_values[1 + offerIndex * 2] & mask24167) >> 16;
            uint256 fillerOfferAssetIndex = (_values[1 + fillIndex * 2] & mask16730) >> 8;
            uint256 fillerWantAssetIndex = (_values[1 + fillIndex * 2] & mask24167) >> 16;

            require(
                _addresses[makerOfferAssetIndex * 2 + 1] ==
                _addresses[fillerWantAssetIndex * 2 + 1],
                "offer.offerAssetId does not match fill.wantAssetId"
            );

            require(
                _addresses[makerWantAssetIndex * 2 + 1] ==
                _addresses[fillerOfferAssetIndex * 2 + 1],
                "offer.wantAssetId does not match fill.offerAssetId"
            );

            // require that bits(16..128) are all zero for every match
            require((_values[i] & mask128978) >> 16 == uint256(0), "Invalid match data");

            uint256 takeAmount = _values[i] >> 128;
            require(takeAmount > 0, "Invalid match.takeAmount");

            uint256 offerDataB = _values[2 + offerIndex * 2];
            // (offer.wantAmount * takeAmount) % offer.offerAmount == 0
            require(
                (offerDataB >> 128).MUL734(takeAmount).MOD487(offerDataB & mask128978) == 0,
                "Invalid amounts"
            );
        }
    }

                                           
                                                       
                                                                           
                         
                                                                   
                                          
                                                
                                                           
    function _VALIDATENETWORKMATCHES440(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses,
        address _operator
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;

        // 1 + numOffers * 2
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        uint256 end = _values.length;

        // loop matches
        for (i; i < end; i++) {
            uint256 offerIndex = _values[i] & mask8846;
            uint256 surplusAssetIndex = (_values[i] & mask24167) >> 16;

            require(offerIndex < numOffers, "Invalid match.offerIndex");
            require(_addresses[surplusAssetIndex * 2] == _operator, "Invalid operator address");

            uint256 takeAmount = _values[i] >> 128;
            require(takeAmount > 0, "Invalid match.takeAmount");

            uint256 offerDataB = _values[2 + offerIndex * 2];
            // (offer.wantAmount * takeAmount) % offer.offerAmount == 0
            require(
                (offerDataB >> 128).MUL734(takeAmount).MOD487(offerDataB & mask128978) == 0,
                "Invalid amounts"
            );
        }
    }

                                                                               
                                                                          
                                        
                                          
    function _VALIDATEFILLAMOUNTS365(uint256[] memory _values) private pure {	//inject NONSTANDARD NAMING
        // "filled" is used to store the sum of `takeAmount`s and `giveAmount`s.
        // While a fill's `offerAmount` and `wantAmount` are combined to share
        // a single uint256 value, each sum of `takeAmount`s and `giveAmount`s
        // for a fill is tracked with an individual uint256 value.
        // This is to prevent the verification from being vulnerable to overflow
        // issues.
        uint256[] memory filled = new uint256[](_values.length);

        uint256 i = 1;
        // i += numOffers * 2
        i += (_values[0] & mask8846) * 2;
        // i += numFills * 2
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        // loop matches
        for (i; i < end; i++) {
            uint256 offerIndex = _values[i] & mask8846;
            uint256 fillIndex = (_values[i] & mask16730) >> 8;
            uint256 takeAmount = _values[i] >> 128;
            uint256 wantAmount = _values[2 + offerIndex * 2] >> 128;
            uint256 offerAmount = _values[2 + offerIndex * 2] & mask128978;
            // giveAmount = takeAmount * wantAmount / offerAmount
            uint256 giveAmount = takeAmount.MUL734(wantAmount).DIV474(offerAmount);

            // (1 + fillIndex * 2) would give the index of the first part
            // of the data for the fill at fillIndex within `_values`,
            // and (2 + fillIndex * 2) would give the index of the second part
            filled[1 + fillIndex * 2] = filled[1 + fillIndex * 2].ADD746(giveAmount);
            filled[2 + fillIndex * 2] = filled[2 + fillIndex * 2].ADD746(takeAmount);
        }

        // numOffers
        i = _values[0] & mask8846;
        // i + numFills
        end = i + ((_values[0] & mask16730) >> 8);

        // loop fills
        for(i; i < end; i++) {
            require(
                // fill.offerAmount == (sum of given amounts for fill)
                _values[i * 2 + 2] & mask128978 == filled[i * 2 + 1] &&
                // fill.wantAmount == (sum of taken amounts for fill)
                _values[i * 2 + 2] >> 128 == filled[i * 2 + 2],
                "Invalid fills"
            );
        }
    }

                                                  
                                                                          
                                                                         
                                                                        
                                      
                                            
                                                                                
                                                                         
                                          
                                                
    function _VALIDATETRADEDATA94(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        address[] memory _addresses,
        address _operator
    )
        private
        pure
    {
        // numOffers + numFills
        uint256 end = (_values[0] & mask8846) +
                      ((_values[0] & mask16730) >> 8);

        for (uint256 i = 0; i < end; i++) {
            uint256 dataA = _values[i * 2 + 1];
            uint256 dataB = _values[i * 2 + 2];

            require(
                // user address == user in user.offerAssetIndex pair
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask16730) >> 8) * 2],
                "Invalid user in user.offerAssetIndex"
            );

            require(
                // user address == user in user.wantAssetIndex pair
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask24167) >> 16) * 2],
                "Invalid user in user.wantAssetIndex"
            );

            require(
                // user address == user in user.feeAssetIndex pair
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask32705) >> 24) * 2],
                "Invalid user in user.feeAssetIndex"
            );

            require(
                // offerAssetId != wantAssetId
                _addresses[((dataA & mask16730) >> 8) * 2 + 1] !=
                _addresses[((dataA & mask24167) >> 16) * 2 + 1],
                "Invalid trade assets"
            );

            require(
                // offerAmount > 0 && wantAmount > 0
                (dataB & mask128978) > 0 && (dataB >> 128) > 0,
                "Invalid trade amounts"
            );

            uint256 operatorFeeAssetIndex = ((dataA & mask40813) >> 32) * 2;

             require(
                _addresses[operatorFeeAssetIndex] == _operator,
                "Invalid operator address"
            );

             require(
                _addresses[operatorFeeAssetIndex + 1] ==
                _addresses[((dataA & mask32705) >> 24) * 2 + 1],
                "Invalid operator fee asset ID"
            );
        }
    }

                                                              
                                                                    
                                                    
                                          
                                          
                                                
                                                                       
                                              
                                              
                                                                      
                                          
    function _VALIDATETRADESIGNATURES448(	//inject NONSTANDARD NAMING
        uint256[] memory _values,
        bytes32[] memory _hashes,
        address[] memory _addresses,
        bytes32 _typehash,
        uint256 _i,
        uint256 _end
    )
        private
        pure
    {
        for (_i; _i < _end; _i++) {
            uint256 dataA = _values[_i * 2 + 1];
            uint256 dataB = _values[_i * 2 + 2];

            bytes32 hashKey = keccak256(abi.encode(
                _typehash,
                _addresses[(dataA & mask8846) * 2], // user
                _addresses[((dataA & mask16730) >> 8) * 2 + 1], // offerAssetId
                dataB & mask128978, // offerAmount
                _addresses[((dataA & mask24167) >> 16) * 2 + 1], // wantAssetId
                dataB >> 128, // wantAmount
                _addresses[((dataA & mask32705) >> 24) * 2 + 1], // feeAssetId
                dataA >> 128, // feeAmount
                (dataA & mask120170) >> 56 // nonce
            ));

            bool prefixedSignature = ((dataA & mask5681) >> 48) != 0;

            VALIDATESIGNATURE838(
                hashKey,
                _addresses[(dataA & mask8846) * 2], // user
                uint8((dataA & mask48800) >> 40), // The `v` component of the user's signature
                _hashes[_i * 2], // The `r` component of the user's signature
                _hashes[_i * 2 + 1], // The `s` component of the user's signature
                prefixedSignature
            );

            _hashes[_i * 2] = hashKey;
        }
    }

                                                           
                                             
    function _VALIDATECONTRACTADDRESS932(address _contract) private view {	//inject NONSTANDARD NAMING
        assembly {
            if iszero(extcodesize(_contract)) { revert(0, 0) }
        }
    }

                                                                 
                                                             
                                                                               
                                                  
                                                        
                                                          
                                                        
    function _CALLCONTRACT94(	//inject NONSTANDARD NAMING
        address _contract,
        bytes memory _payload
    )
        private
        returns (bytes memory)
    {
        bool success;
        bytes memory returnData;

        (success, returnData) = _contract.call(_payload);
        require(success, "Contract call failed");

        return returnData;
    }

                                                                      
                                                             
                                                                                                                         
                                                                          
                                                           
    function _VALIDATECONTRACTCALLRESULT581(bytes memory _data) private pure {	//inject NONSTANDARD NAMING
        require(
            _data.length == 0 ||
            (_data.length == 32 && _GETUINT256FROMBYTES176(_data) != 0),
            "Invalid contract call result"
        );
    }

                                                                                 
                                      
                                                 
    function _GETUINT256FROMBYTES176(	//inject NONSTANDARD NAMING
        bytes memory _data
    )
        private
        pure
        returns (uint256)
    {
        uint256 parsed;
        assembly { parsed := mload(add(_data, 32)) }
        return parsed;
    }
}

// File: contracts/extensions/UniswapDappV2.sol

pragma solidity 0.5.12;




interface UniswapRouterV2 {
    function WETH962() external pure returns (address);	//inject NONSTANDARD NAMING
    function SWAPEXACTETHFORTOKENS910(uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORETH701(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORTOKENS291(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}


                                                
                            
                                                                        
contract UniswapDappV2 is BrokerExtension {
    using SafeMath for uint256;

    UniswapRouterV2 public router;
    address private constant ether_addr841 = address(0);	//inject NONSTANDARD NAMING

    constructor(address _routerAddress) public {
        router = UniswapRouterV2(_routerAddress);
    }

    function SETROUTER109(address _routerAddress) external ONLYOWNER601 NONREENTRANT766 {	//inject NONSTANDARD NAMING
        router = UniswapRouterV2(_routerAddress);
    }

                                                                 
    function TOKENRECEIVER783(	//inject NONSTANDARD NAMING
        address[] memory                ,
        uint256[] memory                  ,
        address[] memory                 
    )
        public
        view
        returns(address)
    {
        return address(this);
    }

                                                                 
    function TRADE782(	//inject NONSTANDARD NAMING
        address[] memory _assetIds,
        uint256[] memory _dataValues,
        address[] memory                 ,
        address payable _recipient
    )
        public
        payable
        NONREENTRANT766
    {
        // _dataValues[2] bits(24..56): delay
        uint256 deadline = now.ADD746((_dataValues[2] & ~(~uint256(0) << 56)) >> 24);

        // give exact ETH and expect min tokens back
        if (_assetIds[0] == ether_addr841) {
            address[] memory path = new address[](2);
            path[0] = router.WETH962(); // token in
            path[1] = _assetIds[1]; // token out

            router.SWAPEXACTETHFORTOKENS910.value(_dataValues[0])(
                _dataValues[1],
                path,
                _recipient,
                deadline
            );
            return;
        }

        Utils.TRANSFERTOKENSIN594(msg.sender, _assetIds[0], _dataValues[0], _dataValues[0]);
        Utils.APPROVETOKENTRANSFER269(
            _assetIds[0],
            address(router),
            _dataValues[0]
        );

        if (_assetIds[1] == ether_addr841) {
            address[] memory path = new address[](2);
            path[0] = _assetIds[0]; // token in
            path[1] = router.WETH962(); // token out

            router.SWAPEXACTTOKENSFORETH701(
                _dataValues[0],
                _dataValues[1],
                path,
                _recipient,
                deadline
            );
            return;
        }

        address[] memory path = new address[](2);
        path[0] = _assetIds[0]; // token in
        path[1] = _assetIds[1]; // token out

        router.SWAPEXACTTOKENSFORTOKENS291(
            _dataValues[0],
            _dataValues[1],
            path,
            _recipient,
            deadline
        );
    }
}