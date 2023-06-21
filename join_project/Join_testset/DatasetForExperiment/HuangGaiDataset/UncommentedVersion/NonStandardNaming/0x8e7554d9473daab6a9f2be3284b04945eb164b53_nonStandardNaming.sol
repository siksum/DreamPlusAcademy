                                                                 



pragma solidity 0.5.12;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD746(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB522(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL734(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV474(uint256 a, uint256 b) internal pure returns (uint256) {	
        
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD487(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}



pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () internal {
        
        
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT766() {	
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}



pragma solidity 0.5.12;


interface Broker {
    function OWNER350() external returns (address);	
    function ISADMIN111(address _user) external returns(bool);	
    function MARKNONCE499(uint256 _nonce) external;	
}

contract BrokerExtension is ReentrancyGuard {
    Broker public broker;

    modifier ONLYADMIN735() {	
        require(broker.ISADMIN111(msg.sender), "Invalid msg.sender");
        _;
    }

    modifier ONLYOWNER601() {	
        require(broker.OWNER350() == msg.sender, "Invalid msg.sender");
        _;
    }

    function INITIALIZEBROKER351(address _brokerAddress) external {	
        require(_brokerAddress != address(0), "Invalid _brokerAddress");
        require(address(broker) == address(0), "Broker already set");
        broker = Broker(_brokerAddress);
    }
}



pragma solidity 0.5.12;


interface ERC20 {
    function BALANCEOF886(address account) external view returns (uint256);	
}

interface MarketDapp {
    
    function TOKENRECEIVER783(address[] calldata assetIds, uint256[] calldata dataValues, address[] calldata addresses) external view returns(address);	
    function TRADE782(address[] calldata assetIds, uint256[] calldata dataValues, address[] calldata addresses, address payable recipient) external payable;	
}

                                                                         
                            
                                                                              
                                                                               
          
library Utils {
    using SafeMath for uint256;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    bytes32 public constant domain_separator277 = 0x14f697e312cdba1c10a1eb5c87d96fa22b63aef9dc39592568387471319ea630;	

    
    
    
    
    
    
    
    
    
    
    
    
    bytes32 public constant offer_typehash432 = 0xf845c83a8f7964bc8dd1a092d28b83573b35be97630a5b8a3b8ae2ae79cd9260;	

    
    
    
    
    
    
    
    bytes32 public constant cancel_typehash244 = 0x46f6d088b1f0ff5a05c3f232c4567f2df96958e05457e6c0e1221dcee7d69c18;	

    
    
    
    
    
    
    
    
    
    
    
    
    bytes32 public constant fill_typehash891 = 0x5f59dbc3412a4575afed909d028055a91a4250ce92235f6790c155a4b2669e99;	

    
    
    address private constant ether_addr841 = address(0);	

    uint256 private constant mask8846 = ~(~uint256(0) << 8);	
    uint256 private constant mask16730 = ~(~uint256(0) << 16);	
    uint256 private constant mask24167 = ~(~uint256(0) << 24);	
    uint256 private constant mask32705 = ~(~uint256(0) << 32);	
    uint256 private constant mask40813 = ~(~uint256(0) << 40);	
    uint256 private constant mask48800 = ~(~uint256(0) << 48);	
    uint256 private constant mask5681 = ~(~uint256(0) << 56);	
    uint256 private constant mask120170 = ~(~uint256(0) << 120);	
    uint256 private constant mask128978 = ~(~uint256(0) << 128);	
    uint256 private constant mask136887 = ~(~uint256(0) << 136);	
    uint256 private constant mask144398 = ~(~uint256(0) << 144);	

    event TRADE764(	
        address maker,
        address taker,
        address makerGiveAsset,
        uint256 makerGiveAmount,
        address fillerGiveAsset,
        uint256 fillerGiveAmount
    );

                                                                  
                                                              
                                                                                
                             
                                      
    function CALCULATETRADEINCREMENTS819(	
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

                                                                  
                                                              
                                                                                
                             
                                      
    function CALCULATETRADEDECREMENTS971(	
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

                                                                          
                                                                     
                                                                                
                                    
                                      
    function CALCULATENETWORKTRADEINCREMENTS371(	
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

                                                                          
                                                              
                                                                                
                                    
                                      
    function CALCULATENETWORKTRADEDECREMENTS481(	
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

                                                                            
                                               
                                          
                                          
                                                
    function VALIDATETRADES340(	
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

        
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            offer_typehash432,
            0,
            _values[0] & mask8846 
        );

        
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            fill_typehash891,
            _values[0] & mask8846, 
            (_values[0] & mask8846) + ((_values[0] & mask16730) >> 8) 
        );

        _EMITTRADEEVENTS573(_values, _addresses, new address[](0), false);

        return _hashes;
    }

                                                                                   
                                                      
                                                 
                                                 
                                                       
                                                           
    function VALIDATENETWORKTRADES574(	
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

        
        _VALIDATETRADESIGNATURES448(
            _values,
            _hashes,
            _addresses,
            offer_typehash432,
            0,
            _values[0] & mask8846 
        );

        return _hashes;
    }

                                                      
                                                      
                                                 
                                                       
                                                      
    function PERFORMNETWORKTRADES116(	
        uint256[] memory _values,
        address[] memory _addresses,
        address[] memory _marketDapps
    )
        public
        returns (uint256[] memory)
    {
        uint256[] memory increments = new uint256[](_addresses.length / 2);
        
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        uint256 end = _values.length;

        
        for(i; i < end; i++) {
            uint256[] memory data = new uint256[](9);
            data[0] = _values[i]; 
            data[1] = data[0] & mask8846; 
            data[2] = (data[0] & mask24167) >> 16; 
            data[3] = _values[data[1] * 2 + 1]; 
            data[4] = _values[data[1] * 2 + 2]; 
            data[5] = ((data[3] & mask16730) >> 8); 
            data[6] = ((data[3] & mask24167) >> 16); 
            
            data[7] = data[0] >> 128;
            
            data[8] = data[7].MUL734(data[4] >> 128).DIV474(data[4] & mask128978);

            address[] memory assetIds = new address[](3);
            assetIds[0] = _addresses[data[5] * 2 + 1]; 
            assetIds[1] = _addresses[data[6] * 2 + 1]; 
            assetIds[2] = _addresses[data[2] * 2 + 1]; 

            uint256[] memory dataValues = new uint256[](3);
            dataValues[0] = data[7]; 
            dataValues[1] = data[8]; 
            dataValues[2] = data[0]; 

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

                                                           
                                                               
                                                               
                                                                     
    function VALIDATECANCEL803(	
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
            _addresses[0], 
            uint8((_values[2] & mask144398) >> 136), 
            _hashes[0], 
            _hashes[1], 
            ((_values[2] & mask136887) >> 128) != 0 
        );
    }

                                                  
                                                               
                                                                     
                                     
    function HASHOFFER982(	
        uint256[] memory _values,
        address[] memory _addresses
    )
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encode(
            offer_typehash432,
            _addresses[0], 
            _addresses[1], 
            _values[0] & mask128978, 
            _addresses[2], 
            _values[0] >> 128, 
            _addresses[3], 
            _values[1] & mask128978, 
            _values[2] >> 144 
        ));
    }

                                         
                                                           
                                                             
                                                      
    function APPROVETOKENTRANSFER269(	
        address _assetId,
        address _spender,
        uint256 _amount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        
        
        
        
        bytes memory payload = abi.encodeWithSignature(
            "approve(address,uint256)",
            _spender,
            _amount
        );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);
        
        _VALIDATECONTRACTCALLRESULT581(returnData);
    }

                                                  
                                                            
                                                            
                                                       
                                                                            
                                                                      
                                                                           
    function TRANSFERTOKENSIN594(	
        address _user,
        address _assetId,
        uint256 _amount,
        uint256 _expectedAmount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        uint256 initialBalance = TOKENBALANCE680(_assetId);

        
        
        
        
        bytes memory payload = abi.encodeWithSignature(
            "transferFrom(address,address,uint256)",
            _user,
            address(this),
            _amount
        );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);
        
        _VALIDATECONTRACTCALLRESULT581(returnData);

        uint256 finalBalance = TOKENBALANCE680(_assetId);
        uint256 transferredAmount = finalBalance.SUB522(initialBalance);

        require(transferredAmount == _expectedAmount, "Invalid transfer");
    }

                                                            
                                                                      
                                                            
                                                       
    function TRANSFERTOKENSOUT732(	
        address _receivingAddress,
        address _assetId,
        uint256 _amount
    )
        public
    {
        _VALIDATECONTRACTADDRESS932(_assetId);

        
        
        
        
        bytes memory payload = abi.encodeWithSignature(
                                   "transfer(address,uint256)",
                                   _receivingAddress,
                                   _amount
                               );
        bytes memory returnData = _CALLCONTRACT94(_assetId, payload);

        
        _VALIDATECONTRACTCALLRESULT581(returnData);
    }

                                                                   
                                                         
    function EXTERNALBALANCE264(address _assetId) public view returns (uint256) {	
        if (_assetId == ether_addr841) {
            return address(this).balance;
        }
        return TOKENBALANCE680(_assetId);
    }

                                                                    
                                                                           
                     
                                                         
    function TOKENBALANCE680(address _assetId) public view returns (uint256) {	
        return ERC20(_assetId).BALANCEOF886(address(this));
    }

                                                                                      
                                                                         
                                                                                   
                                                                  
                                                 
                                                              
                                                              
                                                              
                                                                
                                                                        
                            
    function VALIDATESIGNATURE838(	
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

                                                            
                                            
    function VALIDATEADDRESS15(address _address) public pure {	
        require(_address != address(0), "Invalid address");
    }

                                                                            
                                                                          
                                          
    function _CREDITFILLBALANCES479(	
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        
        uint256 end = i + ((_values[0] & mask16730) >> 8) * 2;

        
        for(i; i < end; i += 2) {
            uint256 fillerWantAssetIndex = (_values[i] & mask24167) >> 16;
            uint256 wantAmount = _values[i + 1] >> 128;

            
            _increments[fillerWantAssetIndex] = _increments[fillerWantAssetIndex].ADD746(wantAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            uint256 operatorFeeAssetIndex = ((_values[i] & mask40813) >> 32);
            
            _increments[operatorFeeAssetIndex] = _increments[operatorFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                           
                                                 
                                          
    function _CREDITMAKERBALANCES995(	
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        
        i += (_values[0] & mask8846) * 2;
        
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        
        for(i; i < end; i++) {
            
            uint256 offerIndex = _values[i] & mask8846;
            
            uint256 makerWantAssetIndex = (_values[1 + offerIndex * 2] & mask24167) >> 16;

            
            uint256 amount = _values[i] >> 128;
            
            amount = amount.MUL734(_values[2 + offerIndex * 2] >> 128)
                           .DIV474(_values[2 + offerIndex * 2] & mask128978);

            
            _increments[makerWantAssetIndex] = _increments[makerWantAssetIndex].ADD746(amount);
        }
    }

                                                                              
                                                      
                                                 
                                          
    function _CREDITMAKERFEEBALANCES336(	
        uint256[] memory _increments,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        
        uint256 end = i + (_values[0] & mask8846) * 2;

        
        for(i; i < end; i += 2) {
            bool nonceTaken = ((_values[i] & mask128978) >> 120) == 1;
            if (nonceTaken) { continue; }

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            uint256 operatorFeeAssetIndex = (_values[i] & mask40813) >> 32;

            
            _increments[operatorFeeAssetIndex] = _increments[operatorFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                 
                                
                                                 
                                          
    function _DEDUCTFILLBALANCES24(	
        uint256[] memory _decrements,
        uint256[] memory _values
    )
        private
        pure
    {
        
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        
        uint256 end = i + ((_values[0] & mask16730) >> 8) * 2;

        
        for(i; i < end; i += 2) {
            uint256 fillerOfferAssetIndex = (_values[i] & mask16730) >> 8;
            uint256 offerAmount = _values[i + 1] & mask128978;

            
            _decrements[fillerOfferAssetIndex] = _decrements[fillerOfferAssetIndex].ADD746(offerAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            
            uint256 fillerFeeAssetIndex = (_values[i] & mask32705) >> 24;
            _decrements[fillerFeeAssetIndex] = _decrements[fillerFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                                 
                                                                   
                                        
                                                 
                                          
    function _DEDUCTMAKERBALANCES474(	
        uint256[] memory _decrements,
        uint256[] memory _values
    )
        private
        pure
    {
        uint256 i = 1;
        
        uint256 end = i + (_values[0] & mask8846) * 2;

        
        for(i; i < end; i += 2) {
            bool nonceTaken = ((_values[i] & mask128978) >> 120) == 1;
            if (nonceTaken) { continue; }

            uint256 makerOfferAssetIndex = (_values[i] & mask16730) >> 8;
            uint256 offerAmount = _values[i + 1] & mask128978;

            
            _decrements[makerOfferAssetIndex] = _decrements[makerOfferAssetIndex].ADD746(offerAmount);

            uint256 feeAmount = _values[i] >> 128;
            if (feeAmount == 0) { continue; }

            
            uint256 makerFeeAssetIndex = (_values[i] & mask32705) >> 24;
            _decrements[makerFeeAssetIndex] = _decrements[makerFeeAssetIndex].ADD746(feeAmount);
        }
    }

                                                   
                                                                             
                                                                                   
                                                          
                                                                                   
    function _EMITTRADEEVENTS573(	
        uint256[] memory _values,
        address[] memory _addresses,
        address[] memory _marketDapps,
        bool _forNetworkTrade
    )
        private
    {
        uint256 i = 1;
        
        i += (_values[0] & mask8846) * 2;
        
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        
        for(i; i < end; i++) {
            uint256[] memory data = new uint256[](7);
            data[0] = _values[i] & mask8846; 
            data[1] = _values[1 + data[0] * 2] & mask8846; 
            data[2] = (_values[1 + data[0] * 2] & mask16730) >> 8; 
            data[3] = (_values[1 + data[0] * 2] & mask24167) >> 16; 
            data[4] = _values[i] >> 128; 
            
            data[5] = data[4].MUL734(_values[2 + data[0] * 2] >> 128)
                             .DIV474(_values[2 + data[0] * 2] & mask128978);
            
            data[6] = (_values[i] & mask16730) >> 8;

            address filler;
            if (_forNetworkTrade) {
                filler = _marketDapps[data[6]];
            } else {
                uint256 fillerIndex = (_values[1 + data[6] * 2] & mask8846);
                filler = _addresses[fillerIndex * 2];
            }

            emit TRADE764(
                _addresses[data[1] * 2], 
                filler,
                _addresses[data[2] * 2 + 1], 
                data[4], 
                _addresses[data[3] * 2 + 1], 
                data[5] 
            );
        }
    }


                                                            
                                                                    
                                                                         
                                                             
                                                                         
                                                                             
                                                                     
                                                         
                                                        
                                              
                                                           
                                                                          
                                        
                                                      
                                                       
    function _PERFORMNETWORKTRADE435(	
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
        funds[0] = EXTERNALBALANCE264(_assetIds[0]); 
        funds[1] = EXTERNALBALANCE264(_assetIds[1]); 
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            funds[2] = EXTERNALBALANCE264(_assetIds[2]); 
        }

        uint256 ethValue = 0;
        address tokenReceiver;

        if (_assetIds[0] == ether_addr841) {
            ethValue = _dataValues[0]; 
        } else {
            tokenReceiver = marketDapp.TOKENRECEIVER783(_assetIds, _dataValues, _addresses);
            APPROVETOKENTRANSFER269(
                _assetIds[0], 
                tokenReceiver,
                _dataValues[0] 
            );
        }

        marketDapp.TRADE782.value(ethValue)(
            _assetIds,
            _dataValues,
            _addresses,
            
            address(uint160(address(this))) 
        );

        funds[3] = EXTERNALBALANCE264(_assetIds[0]); 
        funds[4] = EXTERNALBALANCE264(_assetIds[1]); 
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            funds[5] = EXTERNALBALANCE264(_assetIds[2]); 
        }

        uint256 surplusAmount = 0;

        
        
        if (_assetIds[2] == _assetIds[0]) {
            
            surplusAmount = funds[3].SUB522(funds[0].SUB522(_dataValues[0]));
        } else {
            
            require(funds[3] == funds[0].SUB522(_dataValues[0]), "Invalid offer asset balance");
        }

        
        
        if (_assetIds[2] == _assetIds[1]) {
            
            surplusAmount = funds[4].SUB522(funds[1].ADD746(_dataValues[1]));
        } else {
            
            require(funds[4] == funds[1].ADD746(_dataValues[1]), "Invalid want asset balance");
        }

        
        if (_assetIds[2] != _assetIds[0] && _assetIds[2] != _assetIds[1]) {
            
            surplusAmount = funds[5].SUB522(funds[2]);
        }

        
        if (_assetIds[0] != ether_addr841) {
            APPROVETOKENTRANSFER269(
                _assetIds[0],
                tokenReceiver,
                0
            );
        }

        return surplusAmount;
    }

                                                                 
                                       
                                          
                                          
    function _VALIDATETRADEINPUTLENGTHS245(	
        uint256[] memory _values,
        bytes32[] memory _hashes
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;
        uint256 numFills = (_values[0] & mask16730) >> 8;
        uint256 numMatches = (_values[0] & mask24167) >> 16;

        
        require(_values[0] >> 24 == 0, "Invalid trade input");

        
        
        
        
        
        
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

                                                                 
                                              
                                                 
                                                 
    function _VALIDATENETWORKTRADEINPUTLENGTHS16(	
        uint256[] memory _values,
        bytes32[] memory _hashes
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;
        uint256 numFills = (_values[0] & mask16730) >> 8;
        uint256 numMatches = (_values[0] & mask24167) >> 16;

        
        require(_values[0] >> 24 == 0, "Invalid networkTrade input");

        
        
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

                                                                            
                              
                                                                             
                                                   
                                                                               
                                          
                                          
    function _VALIDATEUNIQUEOFFERS390(uint256[] memory _values) private pure {	
        uint256 numOffers = _values[0] & mask8846;

        uint256 prevNonce;

        for(uint256 i = 0; i < numOffers; i++) {
            uint256 nonce = (_values[i * 2 + 1] & mask120170) >> 56;

            if (i == 0) {
                
                prevNonce = nonce;
                continue;
            }

            require(nonce > prevNonce, "Invalid offer nonces");
            prevNonce = nonce;
        }
    }

                                           
                                                       
                                                      
                                                 
                                                 
                         
                                                                   
                                          
                                                
    function _VALIDATEMATCHES641(	
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

            
            require((_values[i] & mask128978) >> 16 == uint256(0), "Invalid match data");

            uint256 takeAmount = _values[i] >> 128;
            require(takeAmount > 0, "Invalid match.takeAmount");

            uint256 offerDataB = _values[2 + offerIndex * 2];
            
            require(
                (offerDataB >> 128).MUL734(takeAmount).MOD487(offerDataB & mask128978) == 0,
                "Invalid amounts"
            );
        }
    }

                                           
                                                       
                                                                           
                         
                                                                   
                                          
                                                
                                                           
    function _VALIDATENETWORKMATCHES440(	
        uint256[] memory _values,
        address[] memory _addresses,
        address _operator
    )
        private
        pure
    {
        uint256 numOffers = _values[0] & mask8846;

        
        uint256 i = 1 + (_values[0] & mask8846) * 2;
        uint256 end = _values.length;

        
        for (i; i < end; i++) {
            uint256 offerIndex = _values[i] & mask8846;
            uint256 surplusAssetIndex = (_values[i] & mask24167) >> 16;

            require(offerIndex < numOffers, "Invalid match.offerIndex");
            require(_addresses[surplusAssetIndex * 2] == _operator, "Invalid operator address");

            uint256 takeAmount = _values[i] >> 128;
            require(takeAmount > 0, "Invalid match.takeAmount");

            uint256 offerDataB = _values[2 + offerIndex * 2];
            
            require(
                (offerDataB >> 128).MUL734(takeAmount).MOD487(offerDataB & mask128978) == 0,
                "Invalid amounts"
            );
        }
    }

                                                                               
                                                                          
                                        
                                          
    function _VALIDATEFILLAMOUNTS365(uint256[] memory _values) private pure {	
        
        
        
        
        
        
        uint256[] memory filled = new uint256[](_values.length);

        uint256 i = 1;
        
        i += (_values[0] & mask8846) * 2;
        
        i += ((_values[0] & mask16730) >> 8) * 2;

        uint256 end = _values.length;

        
        for (i; i < end; i++) {
            uint256 offerIndex = _values[i] & mask8846;
            uint256 fillIndex = (_values[i] & mask16730) >> 8;
            uint256 takeAmount = _values[i] >> 128;
            uint256 wantAmount = _values[2 + offerIndex * 2] >> 128;
            uint256 offerAmount = _values[2 + offerIndex * 2] & mask128978;
            
            uint256 giveAmount = takeAmount.MUL734(wantAmount).DIV474(offerAmount);

            
            
            
            filled[1 + fillIndex * 2] = filled[1 + fillIndex * 2].ADD746(giveAmount);
            filled[2 + fillIndex * 2] = filled[2 + fillIndex * 2].ADD746(takeAmount);
        }

        
        i = _values[0] & mask8846;
        
        end = i + ((_values[0] & mask16730) >> 8);

        
        for(i; i < end; i++) {
            require(
                
                _values[i * 2 + 2] & mask128978 == filled[i * 2 + 1] &&
                
                _values[i * 2 + 2] >> 128 == filled[i * 2 + 2],
                "Invalid fills"
            );
        }
    }

                                                  
                                                                          
                                                                         
                                                                        
                                      
                                            
                                                                                
                                                                         
                                          
                                                
    function _VALIDATETRADEDATA94(	
        uint256[] memory _values,
        address[] memory _addresses,
        address _operator
    )
        private
        pure
    {
        
        uint256 end = (_values[0] & mask8846) +
                      ((_values[0] & mask16730) >> 8);

        for (uint256 i = 0; i < end; i++) {
            uint256 dataA = _values[i * 2 + 1];
            uint256 dataB = _values[i * 2 + 2];

            require(
                
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask16730) >> 8) * 2],
                "Invalid user in user.offerAssetIndex"
            );

            require(
                
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask24167) >> 16) * 2],
                "Invalid user in user.wantAssetIndex"
            );

            require(
                
                _addresses[(dataA & mask8846) * 2] ==
                _addresses[((dataA & mask32705) >> 24) * 2],
                "Invalid user in user.feeAssetIndex"
            );

            require(
                
                _addresses[((dataA & mask16730) >> 8) * 2 + 1] !=
                _addresses[((dataA & mask24167) >> 16) * 2 + 1],
                "Invalid trade assets"
            );

            require(
                
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

                                                              
                                                                    
                                                    
                                          
                                          
                                                
                                                                       
                                              
                                              
                                                                      
                                          
    function _VALIDATETRADESIGNATURES448(	
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
                _addresses[(dataA & mask8846) * 2], 
                _addresses[((dataA & mask16730) >> 8) * 2 + 1], 
                dataB & mask128978, 
                _addresses[((dataA & mask24167) >> 16) * 2 + 1], 
                dataB >> 128, 
                _addresses[((dataA & mask32705) >> 24) * 2 + 1], 
                dataA >> 128, 
                (dataA & mask120170) >> 56 
            ));

            bool prefixedSignature = ((dataA & mask5681) >> 48) != 0;

            VALIDATESIGNATURE838(
                hashKey,
                _addresses[(dataA & mask8846) * 2], 
                uint8((dataA & mask48800) >> 40), 
                _hashes[_i * 2], 
                _hashes[_i * 2 + 1], 
                prefixedSignature
            );

            _hashes[_i * 2] = hashKey;
        }
    }

                                                           
                                             
    function _VALIDATECONTRACTADDRESS932(address _contract) private view {	
        assembly {
            if iszero(extcodesize(_contract)) { revert(0, 0) }
        }
    }

                                                                 
                                                             
                                                                               
                                                  
                                                        
                                                          
                                                        
    function _CALLCONTRACT94(	
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

                                                                      
                                                             
                                                                                                                         
                                                                          
                                                           
    function _VALIDATECONTRACTCALLRESULT581(bytes memory _data) private pure {	
        require(
            _data.length == 0 ||
            (_data.length == 32 && _GETUINT256FROMBYTES176(_data) != 0),
            "Invalid contract call result"
        );
    }

                                                                                 
                                      
                                                 
    function _GETUINT256FROMBYTES176(	
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



pragma solidity 0.5.12;




interface UniswapRouterV2 {
    function WETH962() external pure returns (address);	
    function SWAPEXACTETHFORTOKENS910(uint amountOutMin, address[] calldata path, address to, uint deadline)	
        external
        payable
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORETH701(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)	
        external
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORTOKENS291(	
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
    address private constant ether_addr841 = address(0);	

    constructor(address _routerAddress) public {
        router = UniswapRouterV2(_routerAddress);
    }

    function SETROUTER109(address _routerAddress) external ONLYOWNER601 NONREENTRANT766 {	
        router = UniswapRouterV2(_routerAddress);
    }

                                                                 
    function TOKENRECEIVER783(	
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

                                                                 
    function TRADE782(	
        address[] memory _assetIds,
        uint256[] memory _dataValues,
        address[] memory                 ,
        address payable _recipient
    )
        public
        payable
        NONREENTRANT766
    {
        
        uint256 deadline = now.ADD746((_dataValues[2] & ~(~uint256(0) << 56)) >> 24);

        
        if (_assetIds[0] == ether_addr841) {
            address[] memory path = new address[](2);
            path[0] = router.WETH962(); 
            path[1] = _assetIds[1]; 

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
            path[0] = _assetIds[0]; 
            path[1] = router.WETH962(); 

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
        path[0] = _assetIds[0]; 
        path[1] = _assetIds[1]; 

        router.SWAPEXACTTOKENSFORTOKENS291(
            _dataValues[0],
            _dataValues[1],
            path,
            _recipient,
            deadline
        );
    }
}