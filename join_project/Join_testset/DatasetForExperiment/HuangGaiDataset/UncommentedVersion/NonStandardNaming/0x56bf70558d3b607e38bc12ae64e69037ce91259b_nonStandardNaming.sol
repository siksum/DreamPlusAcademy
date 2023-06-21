                                                                                                                    
 
pragma solidity 0.5.3;
pragma experimental ABIEncoderV2;


                                                                                                                          
contract ERC20Basic {
  function TOTALSUPPLY509() public view returns (uint256);	
  function BALANCEOF328(address _who) public view returns (uint256);	
  function TRANSFER90(address _to, uint256 _value) public returns (bool);	
  event TRANSFER976(address indexed from, address indexed to, uint256 value);	
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE795(address _owner, address _spender)	
    public view returns (uint256);

  function TRANSFERFROM574(address _from, address _to, uint256 _value)	
    public returns (bool);

  function APPROVE261(address _spender, uint256 _value) public returns (bool);	
  event APPROVAL787(	
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract EIP20 is ERC20 {
    string public name;
    uint8 public decimals;
    string public symbol;
}

interface NonCompliantEIP20 {
    function TRANSFER90(address _to, uint256 _value) external;	
    function TRANSFERFROM574(address _from, address _to, uint256 _value) external;	
    function APPROVE261(address _spender, uint256 _value) external;	
}

contract EIP20Wrapper {

    function EIP20TRANSFER810(	
        address token,
        address to,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).TRANSFER90(to, value);

        assembly {
            switch returndatasize()   
            case 0 {                        
                result := not(0)            
            }
            case 32 {                       
                returndatacopy(0, 0, 32) 
                result := mload(0)          
            }
            default {                       
                revert(0, 0) 
            }
        }

        require(result, "eip20Transfer failed");
    }

    function EIP20TRANSFERFROM923(	
        address token,
        address from,
        address to,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).TRANSFERFROM574(from, to, value);

        assembly {
            switch returndatasize()   
            case 0 {                        
                result := not(0)            
            }
            case 32 {                       
                returndatacopy(0, 0, 32) 
                result := mload(0)          
            }
            default {                       
                revert(0, 0) 
            }
        }

        require(result, "eip20TransferFrom failed");
    }

    function EIP20APPROVE789(	
        address token,
        address spender,
        uint256 value)
        internal
        returns (bool result) {

        NonCompliantEIP20(token).APPROVE261(spender, value);

        assembly {
            switch returndatasize()   
            case 0 {                        
                result := not(0)            
            }
            case 32 {                       
                returndatacopy(0, 0, 32) 
                result := mload(0)          
            }
            default {                       
                revert(0, 0) 
            }
        }

        require(result, "eip20Approve failed");
    }
}

                                                                                         
library SafeMath {

                                                               
  function MUL113(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	
    
    
    
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

                                                                             
  function DIV505(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    
    
    
    return _a / _b;
  }

                                                                                            
  function DIVCEIL913(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    if (_a == 0) {
      return 0;
    }

    return ((_a - 1) / _b) + 1;
  }

                                                                                                           
  function SUB744(uint256 _a, uint256 _b) internal pure returns (uint256) {	
    assert(_b <= _a);
    return _a - _b;
  }

                                                         
  function ADD936(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}

                                                                                                                                                                                             
contract Ownable {
  address public owner;

  event OWNERSHIPTRANSFERRED260(	
    address indexed previousOwner,
    address indexed newOwner
  );

                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER974() {	
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP620(address _newOwner) public ONLYOWNER974 {	
    _TRANSFEROWNERSHIP425(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP425(address _newOwner) internal {	
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED260(owner, _newOwner);
    owner = _newOwner;
  }
}

contract BZxOwnable is Ownable {

    address public bZxContractAddress;

    event BZXOWNERSHIPTRANSFERRED276(address indexed previousBZxContract, address indexed newBZxContract);	

    
    modifier ONLYBZX628() {	
        require(msg.sender == bZxContractAddress, "only bZx contracts can call this function");
        _;
    }

                                                                                                                                                                                                     
    function TRANSFERBZXOWNERSHIP99(address newBZxContractAddress) public ONLYOWNER974 {	
        require(newBZxContractAddress != address(0) && newBZxContractAddress != owner, "transferBZxOwnership::unauthorized");
        emit BZXOWNERSHIPTRANSFERRED276(bZxContractAddress, newBZxContractAddress);
        bZxContractAddress = newBZxContractAddress;
    }

                                                                                                                                                                                                                                                                                
    function TRANSFEROWNERSHIP620(address newOwner) public ONLYOWNER974 {	
        require(newOwner != address(0) && newOwner != bZxContractAddress, "transferOwnership::unauthorized");
        emit OWNERSHIPTRANSFERRED260(owner, newOwner);
        owner = newOwner;
    }
}

contract ExchangeV2Interface {

    struct OrderV2 {
        address makerAddress;           
        address takerAddress;           
        address feeRecipientAddress;    
        address senderAddress;          
        uint256 makerAssetAmount;       
        uint256 takerAssetAmount;       
        uint256 makerFee;               
        uint256 takerFee;               
        uint256 expirationTimeSeconds;  
        uint256 salt;                   
        bytes makerAssetData;           
        bytes takerAssetData;           
    }

    struct FillResults {
        uint256 makerAssetFilledAmount;  
        uint256 takerAssetFilledAmount;  
        uint256 makerFeePaid;            
        uint256 takerFeePaid;            
    }

                                   
                                                                     
                                                                  
                                                                         
                                                                    
                                                                
    function FILLORDERNOTHROW738(	
        OrderV2 memory order,
        uint256 takerAssetFillAmount,
        bytes memory signature)
        public
        returns (FillResults memory fillResults);

                                                                                                                  
                                                                     
                                                    
                                                                         
                                                                        
                                                                 
    function MARKETSELLORDERSNOTHROW432(	
        OrderV2[] memory orders,
        uint256 takerAssetFillAmount,
        bytes[] memory signatures)
        public
        returns (FillResults memory totalFillResults);


                                                
                                                
                                                                            
                                          
                                            
    function ISVALIDSIGNATURE364(	
        bytes32 hash,
        address signerAddress,
        bytes calldata signature)
        external
        view
        returns (bool isValid);
}

contract BZxTo0xShared {
    using SafeMath for uint256;

                                                                                     
                                                 
                                   
                                       
                                                    
                                                     
    function _SAFEGETPARTIALAMOUNTFLOOR925(	
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
        internal
        pure
        returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        require(
            !_ISROUNDINGERRORFLOOR497(
                numerator,
                denominator,
                target
            ),
            "ROUNDING_ERROR"
        );
        
        partialAmount = SafeMath.DIV505(
            SafeMath.MUL113(numerator, target),
            denominator
        );
        return partialAmount;
    }

                                                                 
                                   
                                       
                                                                   
                                          
    function _ISROUNDINGERRORFLOOR497(	
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
        internal
        pure
        returns (bool isError)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if (target == 0 || numerator == 0) {
            return false;
        }
        
        
        
        
        
        
        
        
        
        
        uint256 remainder = mulmod(
            target,
            numerator,
            denominator
        );
        isError = SafeMath.MUL113(1000, remainder) >= SafeMath.MUL113(numerator, target);
        return isError;
    }
}

contract BZxTo0xV2 is BZxTo0xShared, EIP20Wrapper, BZxOwnable {
    using SafeMath for uint256;

    event LOGFILLRESULTS314(	
        uint256 makerAssetFilledAmount,
        uint256 takerAssetFilledAmount,
        uint256 makerFeePaid,
        uint256 takerFeePaid
    );

    bool public DEBUG = false;

    address public exchangeV2Contract;
    address public zrxTokenContract;
    address public erc20ProxyContract;

    constructor(
        address _exchangeV2,
        address _zrxToken,
        address _proxy)
        public
    {
        exchangeV2Contract = _exchangeV2;
        zrxTokenContract = _zrxToken;
        erc20ProxyContract = _proxy;
    }

    function()
        external {
        revert();
    }

    
    function TAKE0XV2TRADE625(	
        address trader,
        address vaultAddress,
        uint256 sourceTokenAmountToUse,
        ExchangeV2Interface.OrderV2[] memory orders0x, 
        bytes[] memory signatures0x) 
        public
        ONLYBZX628
        returns (
            address destTokenAddress,
            uint256 destTokenAmount,
            uint256 sourceTokenUsedAmount)
    {
        address sourceTokenAddress;

        
        (destTokenAddress, sourceTokenAddress) = GETV2TOKENS490(orders0x[0]);

        (sourceTokenUsedAmount, destTokenAmount) = _TAKE0XV2TRADE117(
            trader,
            sourceTokenAddress,
            sourceTokenAmountToUse,
            orders0x,
            signatures0x);

        if (sourceTokenUsedAmount < sourceTokenAmountToUse) {
            
            revert("BZxTo0xV2::take0xTrade: sourceTokenUsedAmount < sourceTokenAmountToUse");
        }

        
        EIP20TRANSFER810(
            destTokenAddress,
            vaultAddress,
            destTokenAmount);
    }

                                                                        
                                   
                                       
                                                    
                                        
    function GETPARTIALAMOUNT374(uint256 numerator, uint256 denominator, uint256 target)	
        public
        pure
        returns (uint256)
    {
        return SafeMath.DIV505(SafeMath.MUL113(numerator, target), denominator);
    }

                                                                                      
                                        
                                                        
    function GETV2TOKENS490(	
        ExchangeV2Interface.OrderV2 memory order)
        public
        pure
        returns (
            address makerTokenAddress,
            address takerTokenAddress)
    {
        bytes memory makerAssetData = order.makerAssetData;
        bytes memory takerAssetData = order.takerAssetData;
        bytes4 makerProxyID;
        bytes4 takerProxyID;

        
        assembly {
            makerProxyID := mload(add(makerAssetData, 32))
            takerProxyID := mload(add(takerAssetData, 32))

            makerTokenAddress := mload(add(makerAssetData, 36))
            takerTokenAddress := mload(add(takerAssetData, 36))
        }

        
        require(makerProxyID == 0xf47261b0 && takerProxyID == 0xf47261b0, "BZxTo0xV2::getV2Tokens: 0x V2 orders must use ERC20 tokens");
    }

    function SET0XV2EXCHANGE155 (	
        address _exchange)
        public
        ONLYOWNER974
    {
        exchangeV2Contract = _exchange;
    }

    function SETZRXTOKEN21 (	
        address _zrxToken)
        public
        ONLYOWNER974
    {
        zrxTokenContract = _zrxToken;
    }

    function SET0XTOKENPROXY629 (	
        address _proxy)
        public
        ONLYOWNER974
    {
        erc20ProxyContract = _proxy;
    }

    function APPROVEFOR899 (	
        address token,
        address spender,
        uint256 value)
        public
        ONLYOWNER974
        returns (bool)
    {
        EIP20APPROVE789(
            token,
            spender,
            value);

        return true;
    }

    function TOGGLEDEBUG431 (	
        bool isDebug)
        public
        ONLYOWNER974
    {
        DEBUG = isDebug;
    }

    function _TAKE0XV2TRADE117(	
        address trader,
        address sourceTokenAddress,
        uint256 sourceTokenAmountToUse,
        ExchangeV2Interface.OrderV2[] memory orders0x, 
        bytes[] memory signatures0x)
        internal
        returns (uint256 sourceTokenUsedAmount, uint256 destTokenAmount)
    {
        uint256 zrxTokenAmount = 0;
        uint256 takerAssetRemaining = sourceTokenAmountToUse;
        for (uint256 i = 0; i < orders0x.length; i++) {
            
            
            
            
            if (i > 0)
                orders0x[i].makerAssetData = orders0x[0].makerAssetData;

            
            if (takerAssetRemaining > 0 && orders0x[i].takerFee > 0) { 
                if (takerAssetRemaining >= orders0x[i].takerAssetAmount) {
                    zrxTokenAmount = zrxTokenAmount.ADD936(orders0x[i].takerFee);
                    takerAssetRemaining = takerAssetRemaining.SUB744(orders0x[i].takerAssetAmount);
                } else {
                    zrxTokenAmount = zrxTokenAmount.ADD936(_SAFEGETPARTIALAMOUNTFLOOR925(
                        takerAssetRemaining,
                        orders0x[i].takerAssetAmount,
                        orders0x[i].takerFee
                    ));
                    takerAssetRemaining = 0;
                }
            }
        }

        if (zrxTokenAmount > 0) {
            
            EIP20TRANSFERFROM923(
                zrxTokenContract,
                trader,
                address(this),
                zrxTokenAmount);
        }

        
        uint256 tempAllowance = EIP20(sourceTokenAddress).ALLOWANCE795(address(this), erc20ProxyContract);
        if (tempAllowance < sourceTokenAmountToUse) {
            if (tempAllowance > 0) {
                
                EIP20APPROVE789(
                    sourceTokenAddress,
                    erc20ProxyContract,
                    0);
            }

            EIP20APPROVE789(
                sourceTokenAddress,
                erc20ProxyContract,
                sourceTokenAmountToUse);
        }

        ExchangeV2Interface.FillResults memory fillResults;
        if (orders0x.length > 1) {
            fillResults = ExchangeV2Interface(exchangeV2Contract).MARKETSELLORDERSNOTHROW432(
                orders0x,
                sourceTokenAmountToUse,
                signatures0x);
        } else {
            fillResults = ExchangeV2Interface(exchangeV2Contract).FILLORDERNOTHROW738(
                orders0x[0],
                sourceTokenAmountToUse,
                signatures0x[0]);
        }

        if (zrxTokenAmount > 0 && fillResults.takerFeePaid < zrxTokenAmount) {
            
            EIP20TRANSFER810(
                zrxTokenContract,
                trader,
                zrxTokenAmount.SUB744(fillResults.takerFeePaid));
        }

        if (DEBUG) {
            emit LOGFILLRESULTS314(
                fillResults.makerAssetFilledAmount,
                fillResults.takerAssetFilledAmount,
                fillResults.makerFeePaid,
                fillResults.takerFeePaid
            );
        }

        sourceTokenUsedAmount = fillResults.takerAssetFilledAmount;
        destTokenAmount = fillResults.makerAssetFilledAmount;
    }
}