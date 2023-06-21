pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;

                                                                                                                                                                                             
contract Ownable {
  address payable public owner;


  event OWNERSHIPRENOUNCED366(address indexed previousOwner);	
  event OWNERSHIPTRANSFERRED945(	
    address indexed previousOwner,
    address indexed newOwner
  );


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER262() {	
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                                                                                                                                   
  function RENOUNCEOWNERSHIP63() public ONLYOWNER262 {	
    emit OWNERSHIPRENOUNCED366(owner);
    owner = address(0);
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP794(address payable _newOwner) public ONLYOWNER262 {	
    _TRANSFEROWNERSHIP391(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP391(address payable _newOwner) internal {	
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED945(owner, _newOwner);
    owner = _newOwner;
  }
}

library ERC20SafeTransfer {
    function SAFETRANSFER954(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {	
        (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
        require(success, "Transfer failed");

        return FETCHRETURNDATA979();
    }

    function SAFETRANSFERFROM500(address _tokenAddress, address _from, address _to, uint256 _value) internal returns (bool success) {	
        (success,) = _tokenAddress.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", _from, _to, _value));
        require(success, "Transfer From failed");

        return FETCHRETURNDATA979();
    }

    function SAFEAPPROVE138(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {	
        (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
        require(success,  "Approve failed");

        return FETCHRETURNDATA979();
    }

    function FETCHRETURNDATA979() internal pure returns (bool success){	
        assembly {
            switch returndatasize()
            case 0 {
                success := 1
            }
            case 32 {
                returndatacopy(0, 0, 32)
                success := mload(0)
            }
            default {
                revert(0, 0)
            }
        }
    }

}

                                                                                            
contract Withdrawable is Ownable {

                                                                                   
                                                                              
                                                                              
                                                                             
                                                                         
    function WITHDRAWTOKEN873(address _token, uint256 _amount) external ONLYOWNER262 returns (bool) {	
        return ERC20SafeTransfer.SAFETRANSFER954(_token, owner, _amount);
    }

                                                                                   
                                                                              
                                                                            
    function WITHDRAWETH95(uint256 _amount) external ONLYOWNER262 {	
        owner.transfer(_amount);
    }
}

                                                                                        
contract ERC20 {
  function TOTALSUPPLY159() public view returns (uint256);	

  function BALANCEOF957(address _who) public view returns (uint256);	

  function ALLOWANCE807(address _owner, address _spender)	
    public view returns (uint256);

  function TRANSFER357(address _to, uint256 _value) public returns (bool);	

  function APPROVE554(address _spender, uint256 _value)	
    public returns (bool);

  function TRANSFERFROM824(address _from, address _to, uint256 _value)	
    public returns (bool);

  function DECIMALS127() public view returns (uint256);	

  event TRANSFER570(	
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL123(	
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

                                                                                                                             
                                                                                    
contract TokenTransferProxy is Ownable {

                                                                               
    modifier ONLYAUTHORIZED243 {	
        require(authorized[msg.sender]);
        _;
    }

    modifier TARGETAUTHORIZED674(address target) {	
        require(authorized[target]);
        _;
    }

    modifier TARGETNOTAUTHORIZED384(address target) {	
        require(!authorized[target]);
        _;
    }

    mapping (address => bool) public authorized;
    address[] public authorities;

    event LOGAUTHORIZEDADDRESSADDED25(address indexed target, address indexed caller);	
    event LOGAUTHORIZEDADDRESSREMOVED173(address indexed target, address indexed caller);	

                                      

                                   
                                           
    function ADDAUTHORIZEDADDRESS2(address target)	
        public
        ONLYOWNER262
        TARGETNOTAUTHORIZED384(target)
    {
        authorized[target] = true;
        authorities.push(target);
        emit LOGAUTHORIZEDADDRESSADDED25(target, msg.sender);
    }

                                               
                                                           
    function REMOVEAUTHORIZEDADDRESS147(address target)	
        public
        ONLYOWNER262
        TARGETAUTHORIZED674(target)
    {
        delete authorized[target];
        for (uint i = 0; i < authorities.length; i++) {
            if (authorities[i] == target) {
                authorities[i] = authorities[authorities.length - 1];
                authorities.length -= 1;
                break;
            }
        }
        emit LOGAUTHORIZEDADDRESSREMOVED173(target, msg.sender);
    }

                                                                    
                                                  
                                                   
                                               
                                                 
                                    
    function TRANSFERFROM824(	
        address token,
        address from,
        address to,
        uint value)
        public
        ONLYAUTHORIZED243
        returns (bool)
    {
        require(ERC20SafeTransfer.SAFETRANSFERFROM500(token, from, to, value));
        return true;
    }

                                           

                                           
                                              
    function GETAUTHORIZEDADDRESSES668()	
        public
        view
        returns (address[] memory)
    {
        return authorities;
    }
}

                                                                                                                
contract Pausable is Ownable {
  event PAUSED708();	
  event UNPAUSED47();	

  bool private _paused = false;

                                                                         
  function PAUSED915() public view returns (bool) {	
    return _paused;
  }

                                                                                                
  modifier WHENNOTPAUSED398() {	
    require(!_paused, "Contract is paused.");
    _;
  }

                                                                                            
  modifier WHENPAUSED116() {	
    require(_paused, "Contract not paused.");
    _;
  }

                                                                          
  function PAUSE158() public ONLYOWNER262 WHENNOTPAUSED398 {	
    _paused = true;
    emit PAUSED708();
  }

                                                                             
  function UNPAUSE718() public ONLYOWNER262 WHENPAUSED116 {	
    _paused = false;
    emit UNPAUSED47();
  }
}

                                                                                          
library SafeMath {

                                                                
  function MUL598(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    
    
    
    if (_a == 0) {
      return 0;
    }

    uint256 c = _a * _b;
    require(c / _a == _b);

    return c;
  }

                                                                                                         
  function DIV842(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    require(_b > 0); 
    uint256 c = _a / _b;
    

    return c;
  }

                                                                                                            
  function SUB153(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    require(_b <= _a);
    uint256 c = _a - _b;

    return c;
  }

                                                          
  function ADD77(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    uint256 c = _a + _b;
    require(c >= _a);

    return c;
  }

                                                                                                                               
  function MOD283(uint256 a, uint256 b) internal pure returns (uint256) {	
    require(b != 0);
    return a % b;
  }
}

                                                       

library Math {
  function MAX403(uint256 a, uint256 b) internal pure returns (uint256) {	
    return a >= b ? a : b;
  }

  function MIN613(uint256 a, uint256 b) internal pure returns (uint256) {	
    return a < b ? a : b;
  }

  function AVERAGE846(uint256 a, uint256 b) internal pure returns (uint256) {	
    
    return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
  }
}

                                                         

library Utils {

    uint256 constant internal precision468 = (10**18);	
    uint256 constant internal max_qty958   = (10**28); 
    uint256 constant internal max_rate26  = (precision468 * 10**6); 
    uint256 constant internal max_decimals767 = 18;	
    uint256 constant internal eth_decimals904 = 18;	
    uint256 constant internal max_uint585 = 2**256-1;	
    address constant internal eth_address795 = address(0x0);	

    
    function PRECISION601() internal pure returns (uint256) { return precision468; }	
    function MAX_QTY529() internal pure returns (uint256) { return max_qty958; }	
    function MAX_RATE341() internal pure returns (uint256) { return max_rate26; }	
    function MAX_DECIMALS407() internal pure returns (uint256) { return max_decimals767; }	
    function ETH_DECIMALS491() internal pure returns (uint256) { return eth_decimals904; }	
    function MAX_UINT636() internal pure returns (uint256) { return max_uint585; }	
    function ETH_ADDRESS741() internal pure returns (address) { return eth_address795; }	

                                                                            
                                                                                       
                                                                  
                                                                        
                                                                  
    function GETDECIMALS464(address token)	
        internal
        returns (uint256 decimals)
    {
        bytes4 functionSig = bytes4(keccak256("decimals()"));

                                                                                    
                                                                            
        assembly {
            
            let ptr := mload(0x40)
            
            mstore(ptr,functionSig)
            let functionSigLength := 0x04
            let wordLength := 0x20

            let success := call(
                                5000, 
                                token, 
                                0, 
                                ptr, 
                                functionSigLength, 
                                ptr, 
                                wordLength 
                               )

            switch success
            case 0 {
                decimals := 0 
            }
            case 1 {
                decimals := mload(ptr) 
            }
            mstore(0x40,add(ptr,0x04)) 
        }
    }

                                                                                                       
                                                                            
                                                             
                                                                      
                                                                                       
                                                                           
    function TOKENALLOWANCEANDBALANCESET447(	
        address tokenOwner,
        address tokenAddress,
        uint256 tokenAmount,
        address addressToAllow
    )
        internal
        view
        returns (bool)
    {
        return (
            ERC20(tokenAddress).ALLOWANCE807(tokenOwner, addressToAllow) >= tokenAmount &&
            ERC20(tokenAddress).BALANCEOF957(tokenOwner) >= tokenAmount
        );
    }

    function CALCDSTQTY248(uint srcQty, uint srcDecimals, uint dstDecimals, uint rate) internal pure returns (uint) {	
        if (dstDecimals >= srcDecimals) {
            require((dstDecimals - srcDecimals) <= max_decimals767);
            return (srcQty * rate * (10**(dstDecimals - srcDecimals))) / precision468;
        } else {
            require((srcDecimals - dstDecimals) <= max_decimals767);
            return (srcQty * rate) / (precision468 * (10**(srcDecimals - dstDecimals)));
        }
    }

    function CALCSRCQTY985(uint dstQty, uint srcDecimals, uint dstDecimals, uint rate) internal pure returns (uint) {	

        
        uint numerator;
        uint denominator;
        if (srcDecimals >= dstDecimals) {
            require((srcDecimals - dstDecimals) <= max_decimals767);
            numerator = (precision468 * dstQty * (10**(srcDecimals - dstDecimals)));
            denominator = rate;
        } else {
            require((dstDecimals - srcDecimals) <= max_decimals767);
            numerator = (precision468 * dstQty);
            denominator = (rate * (10**(dstDecimals - srcDecimals)));
        }
        return (numerator + denominator - 1) / denominator; 
    }

    function CALCDESTAMOUNT14(ERC20 src, ERC20 dest, uint srcAmount, uint rate) internal returns (uint) {	
        return CALCDSTQTY248(srcAmount, GETDECIMALS464(address(src)), GETDECIMALS464(address(dest)), rate);
    }

    function CALCSRCAMOUNT569(ERC20 src, ERC20 dest, uint destAmount, uint rate) internal returns (uint) {	
        return CALCSRCQTY985(destAmount, GETDECIMALS464(address(src)), GETDECIMALS464(address(dest)), rate);
    }

    function CALCRATEFROMQTY959(uint srcAmount, uint destAmount, uint srcDecimals, uint dstDecimals)	
        internal pure returns (uint)
    {
        require(srcAmount <= max_qty958);
        require(destAmount <= max_qty958);

        if (dstDecimals >= srcDecimals) {
            require((dstDecimals - srcDecimals) <= max_decimals767);
            return (destAmount * precision468 / ((10 ** (dstDecimals - srcDecimals)) * srcAmount));
        } else {
            require((srcDecimals - dstDecimals) <= max_decimals767);
            return (destAmount * precision468 * (10 ** (srcDecimals - dstDecimals)) / srcAmount);
        }
    }

                                                                                                              
    function MIN613(uint256 a, uint256 b) internal pure returns (uint256) {	
        return a < b ? a : b;
    }
}

contract Partner {

    address payable public partnerBeneficiary;
    uint256 public partnerPercentage; 

    uint256 public companyPercentage;
    address payable public companyBeneficiary;

    event LOGPAYOUT87(	
        address[] tokens,
        uint256[] amount
    );

    function INIT558(	
        address payable _companyBeneficiary,
        uint256 _companyPercentage,
        address payable _partnerBeneficiary,
        uint256 _partnerPercentage
    ) public {
        require(companyBeneficiary == address(0x0) && partnerBeneficiary == address(0x0));
        companyBeneficiary = _companyBeneficiary;
        companyPercentage = _companyPercentage;
        partnerBeneficiary = _partnerBeneficiary;
        partnerPercentage = _partnerPercentage;
    }

    function PAYOUT326(	
        address[] memory tokens,
        uint256[] memory amounts
    ) public {
        
        for(uint256 index = 0; index<tokens.length; index++){
            uint256 partnerAmount = SafeMath.DIV842(SafeMath.MUL598(amounts[index], partnerPercentage), GETTOTALFEEPERCENTAGE585());
            uint256 companyAmount = amounts[index] - partnerAmount;
            if(tokens[index] == Utils.ETH_ADDRESS741()){
                partnerBeneficiary.transfer(partnerAmount);
                companyBeneficiary.transfer(companyAmount);
            } else {
                ERC20SafeTransfer.SAFETRANSFER954(tokens[index], partnerBeneficiary, partnerAmount);
                ERC20SafeTransfer.SAFETRANSFER954(tokens[index], companyBeneficiary, companyAmount);
            }
        }
	emit LOGPAYOUT87(tokens,amounts);
    }

    function GETTOTALFEEPERCENTAGE585() public view returns (uint256){	
        return partnerPercentage + companyPercentage;
    }

    function() external payable {

    }
}

                                                       
contract ExchangeHandler is Withdrawable, Pausable {

                                     

                               
                               

    function PERFORMORDER29(	
        bytes memory genericPayload,
        uint256 availableToSpend,
        uint256 targetAmount,
        bool targetAmountIsSource
    )
        public
        payable
        returns (uint256 amountSpentOnOrder, uint256 amountReceivedFromOrder);

}

                                         
contract TotlePrimary is Withdrawable, Pausable {

                                     

    TokenTransferProxy public tokenTransferProxy;
    mapping(address => bool) public signers;
                               

                           

    
    struct Order {
        address payable exchangeHandler;
        bytes encodedPayload;
    }

    struct Trade {
        address sourceToken;
        address destinationToken;
        uint256 amount;
        bool isSourceAmount; 
        Order[] orders;
    }

    struct Swap {
        Trade[] trades;
        uint256 minimumExchangeRate;
        uint256 minimumDestinationAmount;
        uint256 sourceAmount;
        uint256 tradeToTakeFeeFrom;
        bool takeFeeFromSource; 
        address payable redirectAddress;
        bool required;
    }

    struct SwapCollection {
        Swap[] swaps;
        address payable partnerContract;
        uint256 expirationBlock;
        bytes32 id;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    struct TokenBalance {
        address tokenAddress;
        uint256 balance;
    }

    struct FeeVariables {
        uint256 feePercentage;
        Partner partner;
        uint256 totalFee;
    }

    struct AmountsSpentReceived{
        uint256 spent;
        uint256 received;
    }
                            

    event LOGSWAPCOLLECTION87(	
        bytes32 indexed id,
        address indexed partnerContract,
        address indexed user
    );

    event LOGSWAP572(	
        bytes32 indexed id,
        address sourceAsset,
        address destinationAsset,
        uint256 sourceAmount,
        uint256 destinationAmount,
        address feeAsset,
        uint256 feeAmount
    );

                           
                                                                    
                                                                                                                         
    constructor (address _tokenTransferProxy, address _signer                     ) public {
        tokenTransferProxy = TokenTransferProxy(_tokenTransferProxy);
        signers[_signer] = true;
                                       
    }

                                      

    modifier NOTEXPIRED226(SwapCollection memory swaps) {	
        require(swaps.expirationBlock > block.number, "Expired");
        _;
    }

    modifier VALIDSIGNATURE415(SwapCollection memory swaps){	
        bytes32 hash = keccak256(abi.encode(swaps.swaps, swaps.partnerContract, swaps.expirationBlock, swaps.id, msg.sender));
        require(signers[ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)), swaps.v, swaps.r, swaps.s)], "Invalid signature");
        _;
    }

                                                   
                                                                               
    function PERFORMSWAPCOLLECTION470(	
        SwapCollection memory swaps
    )
        public
        payable
        WHENNOTPAUSED398
        NOTEXPIRED226(swaps)
        VALIDSIGNATURE415(swaps)
    {
        TokenBalance[20] memory balances;
        balances[0] = TokenBalance(address(Utils.ETH_ADDRESS741()), msg.value);
        this.LOG881("Created eth balance", balances[0].balance, 0x0);
        for(uint256 swapIndex = 0; swapIndex < swaps.swaps.length; swapIndex++){
            this.LOG881("About to perform swap", swapIndex, swaps.id);
            PERFORMSWAP968(swaps.id, swaps.swaps[swapIndex], balances, swaps.partnerContract);
        }
        emit LOGSWAPCOLLECTION87(swaps.id, swaps.partnerContract, msg.sender);
        TRANSFERALLTOKENSTOUSER385(balances);
    }

    function ADDSIGNER477(address newSigner) public ONLYOWNER262 {	
         signers[newSigner] = true;
    }

    function REMOVESIGNER156(address signer) public ONLYOWNER262 {	
         signers[signer] = false;
    }

                                        


    function PERFORMSWAP968(	
        bytes32 swapCollectionId,
        Swap memory swap,
        TokenBalance[20] memory balances,
        address payable partnerContract
    )
        internal
    {
        if(!TRANSFERFROMSENDERDIFFERENCE522(balances, swap.trades[0].sourceToken, swap.sourceAmount)){
            if(swap.required){
                revert("Failed to get tokens for required swap");
            } else {
                return;
            }
        }
        uint256 amountSpentFirstTrade = 0;
        uint256 amountReceived = 0;
        uint256 feeAmount = 0;
        for(uint256 tradeIndex = 0; tradeIndex < swap.trades.length; tradeIndex++){
            if(tradeIndex == swap.tradeToTakeFeeFrom && swap.takeFeeFromSource){
                feeAmount = TAKEFEE418(balances, swap.trades[tradeIndex].sourceToken, partnerContract,tradeIndex==0 ? swap.sourceAmount : amountReceived);
            }
            uint256 tempSpent;
            this.LOG881("About to performTrade",0,0x0);
            (tempSpent, amountReceived) = PERFORMTRADE808(
                swap.trades[tradeIndex],
                balances,
                Utils.MIN613(
                    tradeIndex == 0 ? swap.sourceAmount : amountReceived,
                    balances[FINDTOKEN145(balances, swap.trades[tradeIndex].sourceToken)].balance
                )
            );
            if(!swap.trades[tradeIndex].isSourceAmount && amountReceived < swap.trades[tradeIndex].amount){
                if(swap.required){
                    revert("Not enough destination amount");
                }
                return;
            }
            if(tradeIndex == 0){
                amountSpentFirstTrade = tempSpent;
            }
            if(tradeIndex == swap.tradeToTakeFeeFrom && !swap.takeFeeFromSource){
                feeAmount = TAKEFEE418(balances, swap.trades[tradeIndex].destinationToken, partnerContract, amountReceived);
            }
        }
        this.LOG881("About to emit LogSwap", 0, 0x0);
        emit LOGSWAP572(
            swapCollectionId,
            swap.trades[0].sourceToken,
            swap.trades[swap.trades.length-1].destinationToken,
            amountSpentFirstTrade,
            amountReceived,
            swap.takeFeeFromSource?swap.trades[swap.tradeToTakeFeeFrom].sourceToken:swap.trades[swap.tradeToTakeFeeFrom].destinationToken,
            feeAmount
        );

        if(amountReceived < swap.minimumDestinationAmount){
            this.LOG881("Minimum destination amount failed", 0, 0x0);
            revert("Tokens got less than minimumDestinationAmount");
        } else if (MINIMUMRATEFAILED121(swap.trades[0].sourceToken, swap.trades[swap.trades.length-1].destinationToken,swap.sourceAmount, amountReceived, swap.minimumExchangeRate)){
            this.LOG881("Minimum rate failed", 0, 0x0);
            revert("Minimum exchange rate not met");
        }
        if(swap.redirectAddress != msg.sender && swap.redirectAddress != address(0x0)){
            this.LOG881("About to redirect tokens", amountReceived, 0x0);
            uint256 destinationTokenIndex = FINDTOKEN145(balances,swap.trades[swap.trades.length-1].destinationToken);
            uint256 amountToSend = Math.MIN613(amountReceived, balances[destinationTokenIndex].balance);
            TRANSFERTOKENS148(balances, destinationTokenIndex, swap.redirectAddress, amountToSend);
            REMOVEBALANCE714(balances, swap.trades[swap.trades.length-1].destinationToken, amountToSend);
        }
    }

    function PERFORMTRADE808(	
        Trade memory trade, 
        TokenBalance[20] memory balances,
        uint256 availableToSpend
    ) 
        internal returns (uint256 totalSpent, uint256 totalReceived)
    {
        uint256 tempSpent = 0;
        uint256 tempReceived = 0;
        for(uint256 orderIndex = 0; orderIndex < trade.orders.length; orderIndex++){
            if((availableToSpend - totalSpent) * 10000 < availableToSpend){
                break;
            } else if(!trade.isSourceAmount && tempReceived == trade.amount){
                break;
            } else if (trade.isSourceAmount && tempSpent == trade.amount){
                break;
            }
            this.LOG881("About to perform order", orderIndex,0x0);
            (tempSpent, tempReceived) = PERFORMORDER29(
                trade.orders[orderIndex], 
                availableToSpend - totalSpent,
                trade.isSourceAmount ? availableToSpend - totalSpent : trade.amount - totalReceived, 
                trade.isSourceAmount,
                trade.sourceToken, 
                balances);
            this.LOG881("Order performed",0,0x0);
            totalSpent += tempSpent;
            totalReceived += tempReceived;
        }
        ADDBALANCE177(balances, trade.destinationToken, tempReceived);
        REMOVEBALANCE714(balances, trade.sourceToken, tempSpent);
        this.LOG881("Trade performed",tempSpent, 0);
    }

    function PERFORMORDER29(	
        Order memory order, 
        uint256 availableToSpend,
        uint256 targetAmount,
        bool isSourceAmount,
        address tokenToSpend,
        TokenBalance[20] memory balances
    )
        internal returns (uint256 spent, uint256 received)
    {
        this.LOG881("Performing order", availableToSpend, 0x0);

        if(tokenToSpend == Utils.ETH_ADDRESS741()){
            (spent, received) = ExchangeHandler(order.exchangeHandler).PERFORMORDER29.value(availableToSpend)(order.encodedPayload, availableToSpend, targetAmount, isSourceAmount);

        } else {
            TRANSFERTOKENS148(balances, FINDTOKEN145(balances, tokenToSpend), order.exchangeHandler, availableToSpend);
            (spent, received) = ExchangeHandler(order.exchangeHandler).PERFORMORDER29(order.encodedPayload, availableToSpend, targetAmount, isSourceAmount);
        }
        this.LOG881("Performing order", spent,0x0);
        this.LOG881("Performing order", received,0x0);
    }

    function MINIMUMRATEFAILED121(	
        address sourceToken,
        address destinationToken,
        uint256 sourceAmount,
        uint256 destinationAmount,
        uint256 minimumExchangeRate
    )
        internal returns(bool failed)
    {
        this.LOG881("About to get source decimals",sourceAmount,0x0);
        uint256 sourceDecimals = sourceToken == Utils.ETH_ADDRESS741() ? 18 : Utils.GETDECIMALS464(sourceToken);
        this.LOG881("About to get destination decimals",destinationAmount,0x0);
        uint256 destinationDecimals = destinationToken == Utils.ETH_ADDRESS741() ? 18 : Utils.GETDECIMALS464(destinationToken);
        this.LOG881("About to calculate amount got",0,0x0);
        uint256 rateGot = Utils.CALCRATEFROMQTY959(sourceAmount, destinationAmount, sourceDecimals, destinationDecimals);
        this.LOG881("Minimum rate failed", rateGot, 0x0);
        return rateGot < minimumExchangeRate;
    }

    function TAKEFEE418(	
        TokenBalance[20] memory balances,
        address token,
        address payable partnerContract,
        uint256 amountTraded
    )
        internal
        returns (uint256 feeAmount)
    {
        Partner partner = Partner(partnerContract);
        uint256 feePercentage = partner.GETTOTALFEEPERCENTAGE585();
        this.LOG881("Got fee percentage", feePercentage, 0x0);
        feeAmount = CALCULATEFEE511(amountTraded, feePercentage);
        this.LOG881("Taking fee", feeAmount, 0);
        TRANSFERTOKENS148(balances, FINDTOKEN145(balances, token), partnerContract, feeAmount);
        REMOVEBALANCE714(balances, FINDTOKEN145(balances, token), feeAmount);
        this.LOG881("Took fee", 0, 0x0);
        return feeAmount;
    }

    function TRANSFERFROMSENDERDIFFERENCE522(	
        TokenBalance[20] memory balances,
        address token,
        uint256 sourceAmount
    )
        internal returns (bool)
    {
        if(token == Utils.ETH_ADDRESS741()){
            if(sourceAmount>balances[0].balance){
                this.LOG881("Not enough eth", 0,0x0);
                return false;
            }
            this.LOG881("Enough eth", 0,0x0);
            return true;
        }

        uint256 tokenIndex = FINDTOKEN145(balances, token);
        if(sourceAmount>balances[tokenIndex].balance){
            this.LOG881("Transferring in token", 0,0x0);
            bool success;
            (success,) = address(tokenTransferProxy).call(abi.encodeWithSignature("transferFrom(address,address,address,uint256)", token, msg.sender, address(this), sourceAmount - balances[tokenIndex].balance));
            if(success){
                this.LOG881("Got enough token", 0,0x0);
                balances[tokenIndex].balance = sourceAmount;
                return true;
            }
            this.LOG881("Didn't get enough token", 0,0x0);
            return false;
        }
        return true;
    }

    function TRANSFERALLTOKENSTOUSER385(	
        TokenBalance[20] memory balances
    )
        internal
    {
        this.LOG881("About to transfer all tokens", 0, 0x0);
        for(uint256 balanceIndex = 0; balanceIndex < balances.length; balanceIndex++){
            if(balanceIndex != 0 && balances[balanceIndex].tokenAddress == address(0x0)){
                return;
            }
            this.LOG881("Transferring tokens", uint256(balances[balanceIndex].balance),0x0);
            TRANSFERTOKENS148(balances, balanceIndex, msg.sender, balances[balanceIndex].balance);
        }
    }



    function TRANSFERTOKENS148(	
        TokenBalance[20] memory balances,
        uint256 tokenIndex,
        address payable destination,
        uint256 tokenAmount
    )
        internal
    {
        if(tokenAmount > 0){
            if(balances[tokenIndex].tokenAddress == Utils.ETH_ADDRESS741()){
                destination.transfer(tokenAmount);
            } else {
                ERC20SafeTransfer.SAFETRANSFER954(balances[tokenIndex].tokenAddress, destination, tokenAmount);
            }
        }
    }

    function FINDTOKEN145(	
        TokenBalance[20] memory balances,
        address token
    )
        internal pure returns (uint256)
    {
        for(uint256 index = 0; index < balances.length; index++){
            if(balances[index].tokenAddress == token){
                return index;
            } else if (index != 0 && balances[index].tokenAddress == address(0x0)){
                balances[index] = TokenBalance(token, 0);
                return index;
            }
        }
    }

    function ADDBALANCE177(	
        TokenBalance[20] memory balances,
        address tokenAddress,
        uint256 amountToAdd
    )
        internal
        pure
    {
        uint256 tokenIndex = FINDTOKEN145(balances, tokenAddress);
        ADDBALANCE177(balances, tokenIndex, amountToAdd);
    }

    function ADDBALANCE177(	
        TokenBalance[20] memory balances,
        uint256 balanceIndex,
        uint256 amountToAdd
    )
        internal
        pure
    {
       balances[balanceIndex].balance += amountToAdd;
    }

    function REMOVEBALANCE714(	
        TokenBalance[20] memory balances,
        address tokenAddress,
        uint256 amountToRemove
    )
        internal
        pure
    {
        uint256 tokenIndex = FINDTOKEN145(balances, tokenAddress);
        REMOVEBALANCE714(balances, tokenIndex, amountToRemove);
    }

    function REMOVEBALANCE714(	
        TokenBalance[20] memory balances,
        uint256 balanceIndex,
        uint256 amountToRemove
    )
        internal
        pure
    {
        balances[balanceIndex].balance -= amountToRemove;
    }

    
    
    
    function CALCULATEFEE511(uint256 amount, uint256 fee) internal pure returns (uint256){	
        return SafeMath.DIV842(SafeMath.MUL598(amount, fee), 1 ether);
    }

                                               

                                                                                       
                                                                                     
    function() external payable WHENNOTPAUSED398 {
        
        uint256 size;
        address sender = msg.sender;
        assembly {
            size := extcodesize(sender)
        }
        if (size == 0) {
            revert("EOA cannot send ether to primary fallback");
        }
    }
    event LOG598(string a, uint256 b, bytes32 c);	

    function LOG881(string memory a, uint256 b, bytes32 c) public {	
        emit LOG598(a,b,c);
    }
}