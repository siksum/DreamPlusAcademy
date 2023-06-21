                                                                 



pragma solidity ^0.5.16;

contract ComptrollerErrorReporter {
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        COMPTROLLER_MISMATCH,
        INSUFFICIENT_SHORTFALL,
        INSUFFICIENT_LIQUIDITY,
        INVALID_CLOSE_FACTOR,
        INVALID_COLLATERAL_FACTOR,
        INVALID_LIQUIDATION_INCENTIVE,
        MARKET_NOT_ENTERED, 
        MARKET_NOT_LISTED,
        MARKET_ALREADY_LISTED,
        MATH_ERROR,
        NONZERO_BORROW_BALANCE,
        PRICE_ERROR,
        REJECTION,
        SNAPSHOT_ERROR,
        TOO_MANY_ASSETS,
        TOO_MUCH_REPAY
    }

    enum FailureInfo {
        ACCEPT_ADMIN_PENDING_ADMIN_CHECK,
        ACCEPT_PENDING_IMPLEMENTATION_ADDRESS_CHECK,
        EXIT_MARKET_BALANCE_OWED,
        EXIT_MARKET_REJECTION,
        SET_CLOSE_FACTOR_OWNER_CHECK,
        SET_CLOSE_FACTOR_VALIDATION,
        SET_COLLATERAL_FACTOR_OWNER_CHECK,
        SET_COLLATERAL_FACTOR_NO_EXISTS,
        SET_COLLATERAL_FACTOR_VALIDATION,
        SET_COLLATERAL_FACTOR_WITHOUT_PRICE,
        SET_IMPLEMENTATION_OWNER_CHECK,
        SET_LIQUIDATION_INCENTIVE_OWNER_CHECK,
        SET_LIQUIDATION_INCENTIVE_VALIDATION,
        SET_MAX_ASSETS_OWNER_CHECK,
        SET_PENDING_ADMIN_OWNER_CHECK,
        SET_PENDING_IMPLEMENTATION_OWNER_CHECK,
        SET_PRICE_ORACLE_OWNER_CHECK,
        SUPPORT_MARKET_EXISTS,
        SUPPORT_MARKET_OWNER_CHECK,
        SET_PAUSE_GUARDIAN_OWNER_CHECK
    }

                                                                                                                                                                                                                                              
    event FAILURE858(uint error, uint info, uint detail);	

                                                                                                                           
    function FAIL199(Error err, FailureInfo info) internal returns (uint) {	
        emit FAILURE858(uint(err), uint(info), 0);

        return uint(err);
    }

                                                                                                               
    function FAILOPAQUE20(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	
        emit FAILURE858(uint(err), uint(info), opaqueError);

        return uint(err);
    }
}

contract TokenErrorReporter {
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        BAD_INPUT,
        COMPTROLLER_REJECTION,
        COMPTROLLER_CALCULATION_ERROR,
        INTEREST_RATE_MODEL_ERROR,
        INVALID_ACCOUNT_PAIR,
        INVALID_CLOSE_AMOUNT_REQUESTED,
        INVALID_COLLATERAL_FACTOR,
        MATH_ERROR,
        MARKET_NOT_FRESH,
        MARKET_NOT_LISTED,
        TOKEN_INSUFFICIENT_ALLOWANCE,
        TOKEN_INSUFFICIENT_BALANCE,
        TOKEN_INSUFFICIENT_CASH,
        TOKEN_TRANSFER_IN_FAILED,
        TOKEN_TRANSFER_OUT_FAILED
    }

                                                                                                                                                                                                                                                                                   
    enum FailureInfo {
        ACCEPT_ADMIN_PENDING_ADMIN_CHECK,
        ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED,
        ACCRUE_INTEREST_BORROW_RATE_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED,
        ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED,
        BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED,
        BORROW_ACCRUE_INTEREST_FAILED,
        BORROW_CASH_NOT_AVAILABLE,
        BORROW_FRESHNESS_CHECK,
        BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED,
        BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED,
        BORROW_MARKET_NOT_LISTED,
        BORROW_COMPTROLLER_REJECTION,
        LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED,
        LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED,
        LIQUIDATE_COLLATERAL_FRESHNESS_CHECK,
        LIQUIDATE_COMPTROLLER_REJECTION,
        LIQUIDATE_COMPTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED,
        LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX,
        LIQUIDATE_CLOSE_AMOUNT_IS_ZERO,
        LIQUIDATE_FRESHNESS_CHECK,
        LIQUIDATE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_REPAY_BORROW_FRESH_FAILED,
        LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED,
        LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED,
        LIQUIDATE_SEIZE_COMPTROLLER_REJECTION,
        LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_SEIZE_TOO_MUCH,
        MINT_ACCRUE_INTEREST_FAILED,
        MINT_COMPTROLLER_REJECTION,
        MINT_EXCHANGE_CALCULATION_FAILED,
        MINT_EXCHANGE_RATE_READ_FAILED,
        MINT_FRESHNESS_CHECK,
        MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED,
        MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED,
        MINT_TRANSFER_IN_FAILED,
        MINT_TRANSFER_IN_NOT_POSSIBLE,
        REDEEM_ACCRUE_INTEREST_FAILED,
        REDEEM_COMPTROLLER_REJECTION,
        REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED,
        REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED,
        REDEEM_EXCHANGE_RATE_READ_FAILED,
        REDEEM_FRESHNESS_CHECK,
        REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED,
        REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED,
        REDEEM_TRANSFER_OUT_NOT_POSSIBLE,
        REDUCE_RESERVES_ACCRUE_INTEREST_FAILED,
        REDUCE_RESERVES_ADMIN_CHECK,
        REDUCE_RESERVES_CASH_NOT_AVAILABLE,
        REDUCE_RESERVES_FRESH_CHECK,
        REDUCE_RESERVES_VALIDATION,
        REPAY_BEHALF_ACCRUE_INTEREST_FAILED,
        REPAY_BORROW_ACCRUE_INTEREST_FAILED,
        REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_COMPTROLLER_REJECTION,
        REPAY_BORROW_FRESHNESS_CHECK,
        REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE,
        SET_COLLATERAL_FACTOR_OWNER_CHECK,
        SET_COLLATERAL_FACTOR_VALIDATION,
        SET_COMPTROLLER_OWNER_CHECK,
        SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED,
        SET_INTEREST_RATE_MODEL_FRESH_CHECK,
        SET_INTEREST_RATE_MODEL_OWNER_CHECK,
        SET_MAX_ASSETS_OWNER_CHECK,
        SET_ORACLE_MARKET_NOT_LISTED,
        SET_PENDING_ADMIN_OWNER_CHECK,
        SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED,
        SET_RESERVE_FACTOR_ADMIN_CHECK,
        SET_RESERVE_FACTOR_FRESH_CHECK,
        SET_RESERVE_FACTOR_BOUNDS_CHECK,
        TRANSFER_COMPTROLLER_REJECTION,
        TRANSFER_NOT_ALLOWED,
        TRANSFER_NOT_ENOUGH,
        TRANSFER_TOO_MUCH,
        ADD_RESERVES_ACCRUE_INTEREST_FAILED,
        ADD_RESERVES_FRESH_CHECK,
        ADD_RESERVES_TRANSFER_IN_NOT_POSSIBLE
    }

                                                                                                                                                                                                                                              
    event FAILURE858(uint error, uint info, uint detail);	

                                                                                                                           
    function FAIL199(Error err, FailureInfo info) internal returns (uint) {	
        emit FAILURE858(uint(err), uint(info), 0);

        return uint(err);
    }

                                                                                                               
    function FAILOPAQUE20(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	
        emit FAILURE858(uint(err), uint(info), opaqueError);

        return uint(err);
    }
}



pragma solidity ^0.5.16;

contract ComptrollerInterface {
                                                                              
    bool public constant iscomptroller712 = true;	

                               

    function ENTERMARKETS429(address[] calldata cTokens) external returns (uint[] memory);	
    function EXITMARKET596(address cToken) external returns (uint);	

                          

    function MINTALLOWED296(address cToken, address minter, uint mintAmount) external returns (uint);	
    function MINTVERIFY951(address cToken, address minter, uint mintAmount, uint mintTokens) external;	

    function REDEEMALLOWED958(address cToken, address redeemer, uint redeemTokens) external returns (uint);	
    function REDEEMVERIFY274(address cToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	

    function BORROWALLOWED147(address cToken, address borrower, uint borrowAmount) external returns (uint);	
    function BORROWVERIFY493(address cToken, address borrower, uint borrowAmount) external;	

    function REPAYBORROWALLOWED909(	
        address cToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function REPAYBORROWVERIFY92(	
        address cToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED683(	
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function LIQUIDATEBORROWVERIFY991(	
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED654(	
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function SEIZEVERIFY716(	
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED34(address cToken, address src, address dst, uint transferTokens) external returns (uint);	
    function TRANSFERVERIFY44(address cToken, address src, address dst, uint transferTokens) external;	

                                                

    function LIQUIDATECALCULATESEIZETOKENS351(	
        address cTokenBorrowed,
        address cTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}



pragma solidity ^0.5.16;

                                                                               
contract InterestRateModel {
                                                                                     
    bool public constant isinterestratemodel312 = true;	

                                                                                                                                                                                                                                                                                                                                                                                    
    function GETBORROWRATE780(uint cash, uint borrows, uint reserves) external view returns (uint);	

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function GETSUPPLYRATE477(uint cash, uint borrows, uint reserves, uint reserveFactorMantissa) external view returns (uint);	

}



pragma solidity ^0.5.16;



contract CTokenStorage {
                                                                 
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                                                            

    uint internal constant borrowratemaxmantissa267 = 0.0005e16;	

                                                                                              
    uint internal constant reservefactormaxmantissa510 = 1e18;	

                                                              
    address payable public admin;

                                                                      
    address payable public pendingAdmin;

                                                                              
    ComptrollerInterface public comptroller;

                                                                                         
    InterestRateModel public interestRateModel;

                                                                                                                    
    uint internal initialExchangeRateMantissa;

                                                                                    
    uint public reserveFactorMantissa;

                                                                             
    uint public accrualBlockNumber;

                                                                                                            
    uint public borrowIndex;

                                                                                                   
    uint public totalBorrows;

                                                                                             
    uint public totalReserves;

                                                                    
    uint public totalSupply;

                                                                                 
    mapping (address => uint) internal accountTokens;

                                                                                  
    mapping (address => mapping (address => uint)) internal transferAllowances;

                                                                                                                                                                                                                                                                                            
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

                                                                                          
    mapping(address => BorrowSnapshot) internal accountBorrows;
}

contract CTokenInterface is CTokenStorage {
                                                                                        
    bool public constant isctoken613 = true;	


                           

                                                                     
    event ACCRUEINTEREST220(uint cashPrior, uint interestAccumulated, uint borrowIndex, uint totalBorrows);	

                                                                   
    event MINT819(address minter, uint mintAmount, uint mintTokens);	

                                                                     
    event REDEEM841(address redeemer, uint redeemAmount, uint redeemTokens);	

                                                                        
    event BORROW882(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);	

                                                                    
    event REPAYBORROW619(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);	

                                                                        
    event LIQUIDATEBORROW684(address liquidator, address borrower, uint repayAmount, address cTokenCollateral, uint seizeTokens);	


                          

                                                                         
    event NEWPENDINGADMIN512(address oldPendingAdmin, address newPendingAdmin);	

                                                                                                        
    event NEWADMIN610(address oldAdmin, address newAdmin);	

                                                                        
    event NEWCOMPTROLLER225(ComptrollerInterface oldComptroller, ComptrollerInterface newComptroller);	

                                                                              
    event NEWMARKETINTERESTRATEMODEL107(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);	

                                                                               
    event NEWRESERVEFACTOR869(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);	

                                                                        
    event RESERVESADDED940(address benefactor, uint addAmount, uint newTotalReserves);	

                                                                          
    event RESERVESREDUCED80(address admin, uint reduceAmount, uint newTotalReserves);	

                                                   
    event TRANSFER918(address indexed from, address indexed to, uint amount);	

                                                   
    event APPROVAL948(address indexed owner, address indexed spender, uint amount);	

                                            
    event FAILURE858(uint error, uint info, uint detail);	


                            

    function TRANSFER827(address dst, uint amount) external returns (bool);	
    function TRANSFERFROM598(address src, address dst, uint amount) external returns (bool);	
    function APPROVE393(address spender, uint amount) external returns (bool);	
    function ALLOWANCE530(address owner, address spender) external view returns (uint);	
    function BALANCEOF492(address owner) external view returns (uint);	
    function BALANCEOFUNDERLYING498(address owner) external returns (uint);	
    function GETACCOUNTSNAPSHOT488(address account) external view returns (uint, uint, uint, uint);	
    function BORROWRATEPERBLOCK133() external view returns (uint);	
    function SUPPLYRATEPERBLOCK419() external view returns (uint);	
    function TOTALBORROWSCURRENT195() external returns (uint);	
    function BORROWBALANCECURRENT248(address account) external returns (uint);	
    function BORROWBALANCESTORED905(address account) public view returns (uint);	
    function EXCHANGERATECURRENT733() public returns (uint);	
    function EXCHANGERATESTORED682() public view returns (uint);	
    function GETCASH793() external view returns (uint);	
    function ACCRUEINTEREST257() public returns (uint);	
    function SEIZE0(address liquidator, address borrower, uint seizeTokens) external returns (uint);	


                             

    function _SETPENDINGADMIN611(address payable newPendingAdmin) external returns (uint);	
    function _ACCEPTADMIN491() external returns (uint);	
    function _SETCOMPTROLLER696(ComptrollerInterface newComptroller) public returns (uint);	
    function _SETRESERVEFACTOR713(uint newReserveFactorMantissa) external returns (uint);	
    function _REDUCERESERVES580(uint reduceAmount) external returns (uint);	
    function _SETINTERESTRATEMODEL987(InterestRateModel newInterestRateModel) public returns (uint);	
}

contract CErc20Storage {
                                                               
    address public underlying;
}

contract CErc20Interface is CErc20Storage {

                            

    function MINT551(uint mintAmount) external returns (uint);	
    function REDEEM67(uint redeemTokens) external returns (uint);	
    function REDEEMUNDERLYING192(uint redeemAmount) external returns (uint);	
    function BORROW373(uint borrowAmount) external returns (uint);	
    function REPAYBORROW846(uint repayAmount) external returns (uint);	
    function REPAYBORROWBEHALF108(address borrower, uint repayAmount) external returns (uint);	
    function LIQUIDATEBORROW751(address borrower, uint repayAmount, CTokenInterface cTokenCollateral) external returns (uint);	


                             

    function _ADDRESERVES280(uint addAmount) external returns (uint);	
}

contract CDelegationStorage {
                                                                       
    address public implementation;
}

contract CDelegatorInterface is CDelegationStorage {
                                                                     
    event NEWIMPLEMENTATION476(address oldImplementation, address newImplementation);	

                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SETIMPLEMENTATION518(address implementation_, bool allowResign, bytes memory becomeImplementationData) public;	
}

contract CDelegateInterface is CDelegationStorage {
                                                                                                                                                                                                                                                
    function _BECOMEIMPLEMENTATION59(bytes memory data) public;	

                                                                                                  
    function _RESIGNIMPLEMENTATION830() public;	
}



pragma solidity ^0.5.16;

                                                                                                                                                                                                                        
contract CarefulMath {

                                                                   
    enum MathError {
        NO_ERROR,
        DIVISION_BY_ZERO,
        INTEGER_OVERFLOW,
        INTEGER_UNDERFLOW
    }

                                                                               
    function MULUINT340(uint a, uint b) internal pure returns (MathError, uint) {	
        if (a == 0) {
            return (MathError.NO_ERROR, 0);
        }

        uint c = a * b;

        if (c / a != b) {
            return (MathError.INTEGER_OVERFLOW, 0);
        } else {
            return (MathError.NO_ERROR, c);
        }
    }

                                                                                   
    function DIVUINT381(uint a, uint b) internal pure returns (MathError, uint) {	
        if (b == 0) {
            return (MathError.DIVISION_BY_ZERO, 0);
        }

        return (MathError.NO_ERROR, a / b);
    }

                                                                                                                           
    function SUBUINT134(uint a, uint b) internal pure returns (MathError, uint) {	
        if (b <= a) {
            return (MathError.NO_ERROR, a - b);
        } else {
            return (MathError.INTEGER_UNDERFLOW, 0);
        }
    }

                                                                         
    function ADDUINT378(uint a, uint b) internal pure returns (MathError, uint) {	
        uint c = a + b;

        if (c >= a) {
            return (MathError.NO_ERROR, c);
        } else {
            return (MathError.INTEGER_OVERFLOW, 0);
        }
    }

                                                         
    function ADDTHENSUBUINT730(uint a, uint b, uint c) internal pure returns (MathError, uint) {	
        (MathError err0, uint sum) = ADDUINT378(a, b);

        if (err0 != MathError.NO_ERROR) {
            return (err0, 0);
        }

        return SUBUINT134(sum, c);
    }
}



pragma solidity ^0.5.16;


                                                                                                                                                                                                                                                                                                                                    
contract Exponential is CarefulMath {
    uint constant expscale574 = 1e18;	
    uint constant doublescale189 = 1e36;	
    uint constant halfexpscale270 = expscale574/2;	
    uint constant mantissaone581 = expscale574;	

    struct Exp {
        uint mantissa;
    }

    struct Double {
        uint mantissa;
    }

                                                                                                                                                                                                   
    function GETEXP332(uint num, uint denom) pure internal returns (MathError, Exp memory) {	
        (MathError err0, uint scaledNumerator) = MULUINT340(num, expscale574);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        (MathError err1, uint rational) = DIVUINT381(scaledNumerator, denom);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: rational}));
    }

                                                                               
    function ADDEXP293(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	
        (MathError error, uint result) = ADDUINT378(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                                    
    function SUBEXP888(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	
        (MathError error, uint result) = SUBUINT134(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                             
    function MULSCALAR106(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	
        (MathError err0, uint scaledMantissa) = MULUINT340(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: scaledMantissa}));
    }

                                                                                                     
    function MULSCALARTRUNCATE980(Exp memory a, uint scalar) pure internal returns (MathError, uint) {	
        (MathError err, Exp memory product) = MULSCALAR106(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE613(product));
    }

                                                                                                                                     
    function MULSCALARTRUNCATEADDUINT577(Exp memory a, uint scalar, uint addend) pure internal returns (MathError, uint) {	
        (MathError err, Exp memory product) = MULSCALAR106(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return ADDUINT378(TRUNCATE613(product), addend);
    }

                                                                           
    function DIVSCALAR946(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	
        (MathError err0, uint descaledMantissa) = DIVUINT381(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: descaledMantissa}));
    }

                                                                           
    function DIVSCALARBYEXP165(uint scalar, Exp memory divisor) pure internal returns (MathError, Exp memory) {	
                                                                                                                                                                                                                                                                                 
        (MathError err0, uint numerator) = MULUINT340(expscale574, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }
        return GETEXP332(numerator, divisor.mantissa);
    }

                                                                                                   
    function DIVSCALARBYEXPTRUNCATE9(uint scalar, Exp memory divisor) pure internal returns (MathError, uint) {	
        (MathError err, Exp memory fraction) = DIVSCALARBYEXP165(scalar, divisor);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE613(fraction));
    }

                                                                                     
    function MULEXP943(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	

        (MathError err0, uint doubleScaledProduct) = MULUINT340(a.mantissa, b.mantissa);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        
        
        
        (MathError err1, uint doubleScaledProductWithHalfScale) = ADDUINT378(halfexpscale270, doubleScaledProduct);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        (MathError err2, uint product) = DIVUINT381(doubleScaledProductWithHalfScale, expscale574);
        
        assert(err2 == MathError.NO_ERROR);

        return (MathError.NO_ERROR, Exp({mantissa: product}));
    }

                                                                                                           
    function MULEXP943(uint a, uint b) pure internal returns (MathError, Exp memory) {	
        return MULEXP943(Exp({mantissa: a}), Exp({mantissa: b}));
    }

                                                                                       
    function MULEXP3603(Exp memory a, Exp memory b, Exp memory c) pure internal returns (MathError, Exp memory) {	
        (MathError err, Exp memory ab) = MULEXP943(a, b);
        if (err != MathError.NO_ERROR) {
            return (err, ab);
        }
        return MULEXP943(ab, c);
    }

                                                                                                                                                                                                                                 
    function DIVEXP228(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	
        return GETEXP332(a.mantissa, b.mantissa);
    }

                                                                                                                                                 
    function TRUNCATE613(Exp memory exp) pure internal returns (uint) {	
        
        return exp.mantissa / expscale574;
    }

                                                                        
    function LESSTHANEXP255(Exp memory left, Exp memory right) pure internal returns (bool) {	
        return left.mantissa < right.mantissa;
    }

                                                            
    function LESSTHANOREQUALEXP333(Exp memory left, Exp memory right) pure internal returns (bool) {	
        return left.mantissa <= right.mantissa;
    }

                                                           
    function GREATERTHANEXP480(Exp memory left, Exp memory right) pure internal returns (bool) {	
        return left.mantissa > right.mantissa;
    }

                                                               
    function ISZEROEXP779(Exp memory value) pure internal returns (bool) {	
        return value.mantissa == 0;
    }

    function SAFE224367(uint n, string memory errorMessage) pure internal returns (uint224) {	
        require(n < 2**224, errorMessage);
        return uint224(n);
    }

    function SAFE32782(uint n, string memory errorMessage) pure internal returns (uint32) {	
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function ADD_483(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	
        return Exp({mantissa: ADD_483(a.mantissa, b.mantissa)});
    }

    function ADD_483(Double memory a, Double memory b) pure internal returns (Double memory) {	
        return Double({mantissa: ADD_483(a.mantissa, b.mantissa)});
    }

    function ADD_483(uint a, uint b) pure internal returns (uint) {	
        return ADD_483(a, b, "addition overflow");
    }

    function ADD_483(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	
        uint c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function SUB_491(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	
        return Exp({mantissa: SUB_491(a.mantissa, b.mantissa)});
    }

    function SUB_491(Double memory a, Double memory b) pure internal returns (Double memory) {	
        return Double({mantissa: SUB_491(a.mantissa, b.mantissa)});
    }

    function SUB_491(uint a, uint b) pure internal returns (uint) {	
        return SUB_491(a, b, "subtraction underflow");
    }

    function SUB_491(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	
        require(b <= a, errorMessage);
        return a - b;
    }

    function MUL_49(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	
        return Exp({mantissa: MUL_49(a.mantissa, b.mantissa) / expscale574});
    }

    function MUL_49(Exp memory a, uint b) pure internal returns (Exp memory) {	
        return Exp({mantissa: MUL_49(a.mantissa, b)});
    }

    function MUL_49(uint a, Exp memory b) pure internal returns (uint) {	
        return MUL_49(a, b.mantissa) / expscale574;
    }

    function MUL_49(Double memory a, Double memory b) pure internal returns (Double memory) {	
        return Double({mantissa: MUL_49(a.mantissa, b.mantissa) / doublescale189});
    }

    function MUL_49(Double memory a, uint b) pure internal returns (Double memory) {	
        return Double({mantissa: MUL_49(a.mantissa, b)});
    }

    function MUL_49(uint a, Double memory b) pure internal returns (uint) {	
        return MUL_49(a, b.mantissa) / doublescale189;
    }

    function MUL_49(uint a, uint b) pure internal returns (uint) {	
        return MUL_49(a, b, "multiplication overflow");
    }

    function MUL_49(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	
        if (a == 0 || b == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, errorMessage);
        return c;
    }

    function DIV_934(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	
        return Exp({mantissa: DIV_934(MUL_49(a.mantissa, expscale574), b.mantissa)});
    }

    function DIV_934(Exp memory a, uint b) pure internal returns (Exp memory) {	
        return Exp({mantissa: DIV_934(a.mantissa, b)});
    }

    function DIV_934(uint a, Exp memory b) pure internal returns (uint) {	
        return DIV_934(MUL_49(a, expscale574), b.mantissa);
    }

    function DIV_934(Double memory a, Double memory b) pure internal returns (Double memory) {	
        return Double({mantissa: DIV_934(MUL_49(a.mantissa, doublescale189), b.mantissa)});
    }

    function DIV_934(Double memory a, uint b) pure internal returns (Double memory) {	
        return Double({mantissa: DIV_934(a.mantissa, b)});
    }

    function DIV_934(uint a, Double memory b) pure internal returns (uint) {	
        return DIV_934(MUL_49(a, doublescale189), b.mantissa);
    }

    function DIV_934(uint a, uint b) pure internal returns (uint) {	
        return DIV_934(a, b, "divide by zero");
    }

    function DIV_934(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	
        require(b > 0, errorMessage);
        return a / b;
    }

    function FRACTION400(uint a, uint b) pure internal returns (Double memory) {	
        return Double({mantissa: DIV_934(MUL_49(a, doublescale189), b)});
    }
}



pragma solidity ^0.5.16;

                                                                                           
interface EIP20Interface {
    function NAME746() external view returns (string memory);	
    function SYMBOL355() external view returns (string memory);	
    function DECIMALS475() external view returns (uint8);	

                                                                                                                   
    function TOTALSUPPLY205() external view returns (uint256);	

                                                                                                                                                                            
    function BALANCEOF492(address owner) external view returns (uint256 balance);	

                                                                                                                                                                                                                                                           
    function TRANSFER827(address dst, uint256 amount) external returns (bool success);	

                                                                                                                                                                                                                                                                                                         
    function TRANSFERFROM598(address src, address dst, uint256 amount) external returns (bool success);	

                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function APPROVE393(address spender, uint256 amount) external returns (bool success);	

                                                                                                                                                                                                                                                                                                                                
    function ALLOWANCE530(address owner, address spender) external view returns (uint256 remaining);	

    event TRANSFER918(address indexed from, address indexed to, uint256 amount);	
    event APPROVAL948(address indexed owner, address indexed spender, uint256 amount);	
}



pragma solidity ^0.5.16;

                                                                                                                                                                                                                                    
interface EIP20NonStandardInterface {

                                                                                                                
    function TOTALSUPPLY205() external view returns (uint256);	

                                                                                                                                                                            
    function BALANCEOF492(address owner) external view returns (uint256 balance);	

    /
                      
                                                                                                   
                      
    /

                                                                                                                                                                                                     
    function TRANSFER827(address dst, uint256 amount) external;	

    /
                      
                                                                                                       
                      
    /

                                                                                                                                                                                                                                                   
    function TRANSFERFROM598(address src, address dst, uint256 amount) external;	

                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function APPROVE393(address spender, uint256 amount) external returns (bool success);	

                                                                                                                                                                                                                                                                                                            
    function ALLOWANCE530(address owner, address spender) external view returns (uint256 remaining);	

    event TRANSFER918(address indexed from, address indexed to, uint256 amount);	
    event APPROVAL948(address indexed owner, address indexed spender, uint256 amount);	
}



pragma solidity ^0.5.16;








                                                                                                     
contract CToken is CTokenInterface, Exponential, TokenErrorReporter {
                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INITIALIZE845(ComptrollerInterface comptroller_,	
                        InterestRateModel interestRateModel_,
                        uint initialExchangeRateMantissa_,
                        string memory name_,
                        string memory symbol_,
                        uint8 decimals_) public {
        require(msg.sender == admin, "only admin may initialize the market");
        require(accrualBlockNumber == 0 && borrowIndex == 0, "market may only be initialized once");

        
        initialExchangeRateMantissa = initialExchangeRateMantissa_;
        require(initialExchangeRateMantissa > 0, "initial exchange rate must be greater than zero.");

        
        uint err = _SETCOMPTROLLER696(comptroller_);
        require(err == uint(Error.NO_ERROR), "setting comptroller failed");

        
        accrualBlockNumber = GETBLOCKNUMBER3();
        borrowIndex = mantissaone581;

        
        err = _SETINTERESTRATEMODELFRESH997(interestRateModel_);
        require(err == uint(Error.NO_ERROR), "setting interest rate model failed");

        name = name_;
        symbol = symbol_;
        decimals = decimals_;

        
        _notEntered = true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function TRANSFERTOKENS524(address spender, address src, address dst, uint tokens) internal returns (uint) {	
                                          
        uint allowed = comptroller.TRANSFERALLOWED34(address(this), src, dst, tokens);
        if (allowed != 0) {
            return FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.TRANSFER_COMPTROLLER_REJECTION, allowed);
        }

                                         
        if (src == dst) {
            return FAIL199(Error.BAD_INPUT, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

                                                               
        uint startingAllowance = 0;
        if (spender == src) {
            startingAllowance = uint(-1);
        } else {
            startingAllowance = transferAllowances[src][spender];
        }

                                                                
        MathError mathErr;
        uint allowanceNew;
        uint srcTokensNew;
        uint dstTokensNew;

        (mathErr, allowanceNew) = SUBUINT134(startingAllowance, tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL199(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

        (mathErr, srcTokensNew) = SUBUINT134(accountTokens[src], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL199(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ENOUGH);
        }

        (mathErr, dstTokensNew) = ADDUINT378(accountTokens[dst], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL199(Error.MATH_ERROR, FailureInfo.TRANSFER_TOO_MUCH);
        }

                                 
        
        

        accountTokens[src] = srcTokensNew;
        accountTokens[dst] = dstTokensNew;

                                                      
        if (startingAllowance != uint(-1)) {
            transferAllowances[src][spender] = allowanceNew;
        }

                                      
        emit TRANSFER918(src, dst, tokens);

        comptroller.TRANSFERVERIFY44(address(this), src, dst, tokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                      
    function TRANSFER827(address dst, uint256 amount) external NONREENTRANT768 returns (bool) {	
        return TRANSFERTOKENS524(msg.sender, msg.sender, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM598(address src, address dst, uint256 amount) external NONREENTRANT768 returns (bool) {	
        return TRANSFERTOKENS524(msg.sender, src, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE393(address spender, uint256 amount) external returns (bool) {	
        address src = msg.sender;
        transferAllowances[src][spender] = amount;
        emit APPROVAL948(src, spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                           
    function ALLOWANCE530(address owner, address spender) external view returns (uint256) {	
        return transferAllowances[owner][spender];
    }

                                                                                                                                                                                
    function BALANCEOF492(address owner) external view returns (uint256) {	
        return accountTokens[owner];
    }

                                                                                                                                                                                                                                                 
    function BALANCEOFUNDERLYING498(address owner) external returns (uint) {	
        Exp memory exchangeRate = Exp({mantissa: EXCHANGERATECURRENT733()});
        (MathError mErr, uint balance) = MULSCALARTRUNCATE980(exchangeRate, accountTokens[owner]);
        require(mErr == MathError.NO_ERROR, "balance could not be calculated");
        return balance;
    }

                                                                                                                                                                                                                                                                                                                                           
    function GETACCOUNTSNAPSHOT488(address account) external view returns (uint, uint, uint, uint) {	
        uint cTokenBalance = accountTokens[account];
        uint borrowBalance;
        uint exchangeRateMantissa;

        MathError mErr;

        (mErr, borrowBalance) = BORROWBALANCESTOREDINTERNAL81(account);
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        (mErr, exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL100();
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        return (uint(Error.NO_ERROR), cTokenBalance, borrowBalance, exchangeRateMantissa);
    }

                                                                                                                                                  
    function GETBLOCKNUMBER3() internal view returns (uint) {	
        return block.number;
    }

                                                                                                                                                                   
    function BORROWRATEPERBLOCK133() external view returns (uint) {	
        return interestRateModel.GETBORROWRATE780(GETCASHPRIOR45(), totalBorrows, totalReserves);
    }

                                                                                                                                                                   
    function SUPPLYRATEPERBLOCK419() external view returns (uint) {	
        return interestRateModel.GETSUPPLYRATE477(GETCASHPRIOR45(), totalBorrows, totalReserves, reserveFactorMantissa);
    }

                                                                                                                                     
    function TOTALBORROWSCURRENT195() external NONREENTRANT768 returns (uint) {	
        require(ACCRUEINTEREST257() == uint(Error.NO_ERROR), "accrue interest failed");
        return totalBorrows;
    }

                                                                                                                                                                                                                                                                                     
    function BORROWBALANCECURRENT248(address account) external NONREENTRANT768 returns (uint) {	
        require(ACCRUEINTEREST257() == uint(Error.NO_ERROR), "accrue interest failed");
        return BORROWBALANCESTORED905(account);
    }

                                                                                                                                                                                                   
    function BORROWBALANCESTORED905(address account) public view returns (uint) {	
        (MathError err, uint result) = BORROWBALANCESTOREDINTERNAL81(account);
        require(err == MathError.NO_ERROR, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                
    function BORROWBALANCESTOREDINTERNAL81(address account) internal view returns (MathError, uint) {	
                                                                  
        MathError mathErr;
        uint principalTimesIndex;
        uint result;

                                               
        BorrowSnapshot storage borrowSnapshot = accountBorrows[account];

                                                                                                                                                                                         
        if (borrowSnapshot.principal == 0) {
            return (MathError.NO_ERROR, 0);
        }

                                                                                                                                                                                  
        (mathErr, principalTimesIndex) = MULUINT340(borrowSnapshot.principal, borrowIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        (mathErr, result) = DIVUINT381(principalTimesIndex, borrowSnapshot.interestIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        return (MathError.NO_ERROR, result);
    }

                                                                                                                                              
    function EXCHANGERATECURRENT733() public NONREENTRANT768 returns (uint) {	
        require(ACCRUEINTEREST257() == uint(Error.NO_ERROR), "accrue interest failed");
        return EXCHANGERATESTORED682();
    }

                                                                                                                                                                                                                                            
    function EXCHANGERATESTORED682() public view returns (uint) {	
        (MathError err, uint result) = EXCHANGERATESTOREDINTERNAL100();
        require(err == MathError.NO_ERROR, "exchangeRateStored: exchangeRateStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                          
    function EXCHANGERATESTOREDINTERNAL100() internal view returns (MathError, uint) {	
        uint _totalSupply = totalSupply;
        if (_totalSupply == 0) {
                                                                                                                               
            return (MathError.NO_ERROR, initialExchangeRateMantissa);
        } else {
                                                                                                                                                
            uint totalCash = GETCASHPRIOR45();
            uint cashPlusBorrowsMinusReserves;
            Exp memory exchangeRate;
            MathError mathErr;

            (mathErr, cashPlusBorrowsMinusReserves) = ADDTHENSUBUINT730(totalCash, totalBorrows, totalReserves);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            (mathErr, exchangeRate) = GETEXP332(cashPlusBorrowsMinusReserves, _totalSupply);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            return (MathError.NO_ERROR, exchangeRate.mantissa);
        }
    }

                                                                                                                                                             
    function GETCASH793() external view returns (uint) {	
        return GETCASHPRIOR45();
    }

                                                                                                                                                                                                                                          
    function ACCRUEINTEREST257() public returns (uint) {	
                                               
        uint currentBlockNumber = GETBLOCKNUMBER3();
        uint accrualBlockNumberPrior = accrualBlockNumber;

                                                   
        if (accrualBlockNumberPrior == currentBlockNumber) {
            return uint(Error.NO_ERROR);
        }

                                                     
        uint cashPrior = GETCASHPRIOR45();
        uint borrowsPrior = totalBorrows;
        uint reservesPrior = totalReserves;
        uint borrowIndexPrior = borrowIndex;

                                                        
        uint borrowRateMantissa = interestRateModel.GETBORROWRATE780(cashPrior, borrowsPrior, reservesPrior);
        require(borrowRateMantissa <= borrowratemaxmantissa267, "borrow rate is absurdly high");

                                                                           
        (MathError mathErr, uint blockDelta) = SUBUINT134(currentBlockNumber, accrualBlockNumberPrior);
        require(mathErr == MathError.NO_ERROR, "could not calculate block delta");

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

        Exp memory simpleInterestFactor;
        uint interestAccumulated;
        uint totalBorrowsNew;
        uint totalReservesNew;
        uint borrowIndexNew;

        (mathErr, simpleInterestFactor) = MULSCALAR106(Exp({mantissa: borrowRateMantissa}), blockDelta);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED, uint(mathErr));
        }

        (mathErr, interestAccumulated) = MULSCALARTRUNCATE980(simpleInterestFactor, borrowsPrior);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED, uint(mathErr));
        }

        (mathErr, totalBorrowsNew) = ADDUINT378(interestAccumulated, borrowsPrior);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED, uint(mathErr));
        }

        (mathErr, totalReservesNew) = MULSCALARTRUNCATEADDUINT577(Exp({mantissa: reserveFactorMantissa}), interestAccumulated, reservesPrior);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED, uint(mathErr));
        }

        (mathErr, borrowIndexNew) = MULSCALARTRUNCATEADDUINT577(simpleInterestFactor, borrowIndexPrior, borrowIndexPrior);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED, uint(mathErr));
        }

                                 
        
        

                                                                    
        accrualBlockNumber = currentBlockNumber;
        borrowIndex = borrowIndexNew;
        totalBorrows = totalBorrowsNew;
        totalReserves = totalReservesNew;

                                             
        emit ACCRUEINTEREST220(cashPrior, interestAccumulated, borrowIndexNew, totalBorrowsNew);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                               
    function MINTINTERNAL294(uint mintAmount) internal NONREENTRANT768 returns (uint, uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return (FAIL199(Error(error), FailureInfo.MINT_ACCRUE_INTEREST_FAILED), 0);
        }
        
        return MINTFRESH560(msg.sender, mintAmount);
    }

    struct MintLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint mintTokens;
        uint totalSupplyNew;
        uint accountTokensNew;
        uint actualMintAmount;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MINTFRESH560(address minter, uint mintAmount) internal returns (uint, uint) {	
                                      
        uint allowed = comptroller.MINTALLOWED296(address(this), minter, mintAmount);
        if (allowed != 0) {
            return (FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.MINT_COMPTROLLER_REJECTION, allowed), 0);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return (FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.MINT_FRESHNESS_CHECK), 0);
        }

        MintLocalVars memory vars;

        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL100();
        if (vars.mathErr != MathError.NO_ERROR) {
            return (FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr)), 0);
        }

                                 
        
        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        vars.actualMintAmount = DOTRANSFERIN24(minter, mintAmount);

                                                                                                                                                                             

        (vars.mathErr, vars.mintTokens) = DIVSCALARBYEXPTRUNCATE9(vars.actualMintAmount, Exp({mantissa: vars.exchangeRateMantissa}));
        require(vars.mathErr == MathError.NO_ERROR, "MINT_EXCHANGE_CALCULATION_FAILED");

                                                                                                                                                                                                                                                       
        (vars.mathErr, vars.totalSupplyNew) = ADDUINT378(totalSupply, vars.mintTokens);
        require(vars.mathErr == MathError.NO_ERROR, "MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED");

        (vars.mathErr, vars.accountTokensNew) = ADDUINT378(accountTokens[minter], vars.mintTokens);
        require(vars.mathErr == MathError.NO_ERROR, "MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED");

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[minter] = vars.accountTokensNew;

                                                        
        emit MINT819(minter, vars.actualMintAmount, vars.mintTokens);
        emit TRANSFER918(address(this), minter, vars.mintTokens);

                                      
        comptroller.MINTVERIFY951(address(this), minter, vars.actualMintAmount, vars.mintTokens);

        return (uint(Error.NO_ERROR), vars.actualMintAmount);
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEMINTERNAL576(uint redeemTokens) internal NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        
        return REDEEMFRESH432(msg.sender, redeemTokens, 0);
    }

                                                                                                                                                                                                                                                                                                                                                                             
    function REDEEMUNDERLYINGINTERNAL75(uint redeemAmount) internal NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        
        return REDEEMFRESH432(msg.sender, 0, redeemAmount);
    }

    struct RedeemLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint redeemTokens;
        uint redeemAmount;
        uint totalSupplyNew;
        uint accountTokensNew;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function REDEEMFRESH432(address payable redeemer, uint redeemTokensIn, uint redeemAmountIn) internal returns (uint) {	
        require(redeemTokensIn == 0 || redeemAmountIn == 0, "one of redeemTokensIn or redeemAmountIn must be zero");

        RedeemLocalVars memory vars;

                                                          
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL100();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

                                    
        if (redeemTokensIn > 0) {
                                                                                                                                                                                                                                           
            vars.redeemTokens = redeemTokensIn;

            (vars.mathErr, vars.redeemAmount) = MULSCALARTRUNCATE980(Exp({mantissa: vars.exchangeRateMantissa}), redeemTokensIn);
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED, uint(vars.mathErr));
            }
        } else {
                                                                                                                                                                                                                                  

            (vars.mathErr, vars.redeemTokens) = DIVSCALARBYEXPTRUNCATE9(redeemAmountIn, Exp({mantissa: vars.exchangeRateMantissa}));
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED, uint(vars.mathErr));
            }

            vars.redeemAmount = redeemAmountIn;
        }

                                        
        uint allowed = comptroller.REDEEMALLOWED958(address(this), redeemer, vars.redeemTokens);
        if (allowed != 0) {
            return FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.REDEEM_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.REDEEM_FRESHNESS_CHECK);
        }

                                                                                                                                                                                                                                               
        (vars.mathErr, vars.totalSupplyNew) = SUBUINT134(totalSupply, vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = SUBUINT134(accountTokens[redeemer], vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                               
        if (GETCASHPRIOR45() < vars.redeemAmount) {
            return FAIL199(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDEEM_TRANSFER_OUT_NOT_POSSIBLE);
        }

                                 
        
        

                                                                                                                                                                                                                                                                                                                                                                    
        DOTRANSFEROUT738(redeemer, vars.redeemAmount);

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[redeemer] = vars.accountTokensNew;

                                                          
        emit TRANSFER918(redeemer, address(this), vars.redeemTokens);
        emit REDEEM841(redeemer, vars.redeemAmount, vars.redeemTokens);

                                      
        comptroller.REDEEMVERIFY274(address(this), redeemer, vars.redeemAmount, vars.redeemTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                              
    function BORROWINTERNAL9(uint borrowAmount) internal NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.BORROW_ACCRUE_INTEREST_FAILED);
        }
        
        return BORROWFRESH142(msg.sender, borrowAmount);
    }

    struct BorrowLocalVars {
        MathError mathErr;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

                                                                                                                                                                                                                                                            
    function BORROWFRESH142(address payable borrower, uint borrowAmount) internal returns (uint) {	
                                        
        uint allowed = comptroller.BORROWALLOWED147(address(this), borrower, borrowAmount);
        if (allowed != 0) {
            return FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.BORROW_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.BORROW_FRESHNESS_CHECK);
        }

                                                                          
        if (GETCASHPRIOR45() < borrowAmount) {
            return FAIL199(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.BORROW_CASH_NOT_AVAILABLE);
        }

        BorrowLocalVars memory vars;

                                                                                                                                                                                                                                       
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL81(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountBorrowsNew) = ADDUINT378(vars.accountBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT378(totalBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        
        

                                                                                                                                                                                                                                                                                                                                                                
        DOTRANSFEROUT738(borrower, borrowAmount);

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                    
        emit BORROW882(borrower, borrowAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        comptroller.BORROWVERIFY493(address(this), borrower, borrowAmount);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                               
    function REPAYBORROWINTERNAL549(uint repayAmount) internal NONREENTRANT768 returns (uint, uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return (FAIL199(Error(error), FailureInfo.REPAY_BORROW_ACCRUE_INTEREST_FAILED), 0);
        }
        
        return REPAYBORROWFRESH696(msg.sender, msg.sender, repayAmount);
    }

                                                                                                                                                                                                                                                                                                                              
    function REPAYBORROWBEHALFINTERNAL699(address borrower, uint repayAmount) internal NONREENTRANT768 returns (uint, uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return (FAIL199(Error(error), FailureInfo.REPAY_BEHALF_ACCRUE_INTEREST_FAILED), 0);
        }
        
        return REPAYBORROWFRESH696(msg.sender, borrower, repayAmount);
    }

    struct RepayBorrowLocalVars {
        Error err;
        MathError mathErr;
        uint repayAmount;
        uint borrowerIndex;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
        uint actualRepayAmount;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                              
    function REPAYBORROWFRESH696(address payer, address borrower, uint repayAmount) internal returns (uint, uint) {	
                                             
        uint allowed = comptroller.REPAYBORROWALLOWED909(address(this), payer, borrower, repayAmount);
        if (allowed != 0) {
            return (FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.REPAY_BORROW_COMPTROLLER_REJECTION, allowed), 0);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return (FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.REPAY_BORROW_FRESHNESS_CHECK), 0);
        }

        RepayBorrowLocalVars memory vars;

                                                                              
        vars.borrowerIndex = accountBorrows[borrower].interestIndex;

                                                                              
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL81(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return (FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr)), 0);
        }

                                                                
        if (repayAmount == uint(-1)) {
            vars.repayAmount = vars.accountBorrows;
        } else {
            vars.repayAmount = repayAmount;
        }

                                 
        
        

                                                                                                                                                                                                                                                                                                                                                                                                                                                
        vars.actualRepayAmount = DOTRANSFERIN24(payer, vars.repayAmount);

                                                                                                                                                                                                                                                  
        (vars.mathErr, vars.accountBorrowsNew) = SUBUINT134(vars.accountBorrows, vars.actualRepayAmount);
        require(vars.mathErr == MathError.NO_ERROR, "REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED");

        (vars.mathErr, vars.totalBorrowsNew) = SUBUINT134(totalBorrows, vars.actualRepayAmount);
        require(vars.mathErr == MathError.NO_ERROR, "REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED");

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                         
        emit REPAYBORROW619(payer, borrower, vars.actualRepayAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        comptroller.REPAYBORROWVERIFY92(address(this), payer, borrower, vars.actualRepayAmount, vars.borrowerIndex);

        return (uint(Error.NO_ERROR), vars.actualRepayAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function LIQUIDATEBORROWINTERNAL570(address borrower, uint repayAmount, CTokenInterface cTokenCollateral) internal NONREENTRANT768 returns (uint, uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return (FAIL199(Error(error), FailureInfo.LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED), 0);
        }

        error = cTokenCollateral.ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return (FAIL199(Error(error), FailureInfo.LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED), 0);
        }

        
        return LIQUIDATEBORROWFRESH424(msg.sender, borrower, repayAmount, cTokenCollateral);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function LIQUIDATEBORROWFRESH424(address liquidator, address borrower, uint repayAmount, CTokenInterface cTokenCollateral) internal returns (uint, uint) {	
                                           
        uint allowed = comptroller.LIQUIDATEBORROWALLOWED683(address(this), address(cTokenCollateral), liquidator, borrower, repayAmount);
        if (allowed != 0) {
            return (FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_COMPTROLLER_REJECTION, allowed), 0);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return (FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_FRESHNESS_CHECK), 0);
        }

                                                                                       
        if (cTokenCollateral.accrualBlockNumber() != GETBLOCKNUMBER3()) {
            return (FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_COLLATERAL_FRESHNESS_CHECK), 0);
        }

                                           
        if (borrower == liquidator) {
            return (FAIL199(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_LIQUIDATOR_IS_BORROWER), 0);
        }

                                     
        if (repayAmount == 0) {
            return (FAIL199(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_ZERO), 0);
        }

                                      
        if (repayAmount == uint(-1)) {
            return (FAIL199(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX), 0);
        }


                                       
        (uint repayBorrowError, uint actualRepayAmount) = REPAYBORROWFRESH696(liquidator, borrower, repayAmount);
        if (repayBorrowError != uint(Error.NO_ERROR)) {
            return (FAIL199(Error(repayBorrowError), FailureInfo.LIQUIDATE_REPAY_BORROW_FRESH_FAILED), 0);
        }

                                 
        
        

                                                                              
        (uint amountSeizeError, uint seizeTokens) = comptroller.LIQUIDATECALCULATESEIZETOKENS351(address(this), address(cTokenCollateral), actualRepayAmount);
        require(amountSeizeError == uint(Error.NO_ERROR), "LIQUIDATE_COMPTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED");

                                                                       
        require(cTokenCollateral.BALANCEOF492(borrower) >= seizeTokens, "LIQUIDATE_SEIZE_TOO_MUCH");

        
        uint seizeError;
        if (address(cTokenCollateral) == address(this)) {
            seizeError = SEIZEINTERNAL66(address(this), liquidator, borrower, seizeTokens);
        } else {
            seizeError = cTokenCollateral.SEIZE0(liquidator, borrower, seizeTokens);
        }

                                                                                    
        require(seizeError == uint(Error.NO_ERROR), "token seizure failed");

                                             
        emit LIQUIDATEBORROW684(liquidator, borrower, actualRepayAmount, address(cTokenCollateral), seizeTokens);

                                      
        comptroller.LIQUIDATEBORROWVERIFY991(address(this), address(cTokenCollateral), liquidator, borrower, actualRepayAmount, seizeTokens);

        return (uint(Error.NO_ERROR), actualRepayAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function SEIZE0(address liquidator, address borrower, uint seizeTokens) external NONREENTRANT768 returns (uint) {	
        return SEIZEINTERNAL66(msg.sender, liquidator, borrower, seizeTokens);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function SEIZEINTERNAL66(address seizerToken, address liquidator, address borrower, uint seizeTokens) internal returns (uint) {	
                                       
        uint allowed = comptroller.SEIZEALLOWED654(address(this), seizerToken, liquidator, borrower, seizeTokens);
        if (allowed != 0) {
            return FAILOPAQUE20(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_SEIZE_COMPTROLLER_REJECTION, allowed);
        }

                                           
        if (borrower == liquidator) {
            return FAIL199(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER);
        }

        MathError mathErr;
        uint borrowerTokensNew;
        uint liquidatorTokensNew;

                                                                                                                                                                                                                                                                             
        (mathErr, borrowerTokensNew) = SUBUINT134(accountTokens[borrower], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED, uint(mathErr));
        }

        (mathErr, liquidatorTokensNew) = ADDUINT378(accountTokens[liquidator], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE20(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED, uint(mathErr));
        }

                                 
        
        

                                                                    
        accountTokens[borrower] = borrowerTokensNew;
        accountTokens[liquidator] = liquidatorTokensNew;

                                   
        emit TRANSFER918(borrower, liquidator, seizeTokens);

                                      
        comptroller.SEIZEVERIFY716(address(this), seizerToken, liquidator, borrower, seizeTokens);

        return uint(Error.NO_ERROR);
    }


                             

                                                                                                                                                                                                                                                                                                                                                                                                               
    function _SETPENDINGADMIN611(address payable newPendingAdmin) external returns (uint) {	
        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_ADMIN_OWNER_CHECK);
        }

        
        address oldPendingAdmin = pendingAdmin;

        
        pendingAdmin = newPendingAdmin;

        
        emit NEWPENDINGADMIN512(oldPendingAdmin, newPendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                        
    function _ACCEPTADMIN491() external returns (uint) {	
        
        if (msg.sender != pendingAdmin || msg.sender == address(0)) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.ACCEPT_ADMIN_PENDING_ADMIN_CHECK);
        }

        
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        
        admin = pendingAdmin;

        
        pendingAdmin = address(0);

        emit NEWADMIN610(oldAdmin, admin);
        emit NEWPENDINGADMIN512(oldPendingAdmin, pendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                   
    function _SETCOMPTROLLER696(ComptrollerInterface newComptroller) public returns (uint) {	
        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_COMPTROLLER_OWNER_CHECK);
        }

        ComptrollerInterface oldComptroller = comptroller;
        
        require(newComptroller.iscomptroller712(), "marker method returned false");

        
        comptroller = newComptroller;

        
        emit NEWCOMPTROLLER225(oldComptroller, newComptroller);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                 
    function _SETRESERVEFACTOR713(uint newReserveFactorMantissa) external NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED);
        }
        
        return _SETRESERVEFACTORFRESH36(newReserveFactorMantissa);
    }

                                                                                                                                                                                                                                                              
    function _SETRESERVEFACTORFRESH36(uint newReserveFactorMantissa) internal returns (uint) {	
        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_RESERVE_FACTOR_ADMIN_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.SET_RESERVE_FACTOR_FRESH_CHECK);
        }

        
        if (newReserveFactorMantissa > reservefactormaxmantissa510) {
            return FAIL199(Error.BAD_INPUT, FailureInfo.SET_RESERVE_FACTOR_BOUNDS_CHECK);
        }

        uint oldReserveFactorMantissa = reserveFactorMantissa;
        reserveFactorMantissa = newReserveFactorMantissa;

        emit NEWRESERVEFACTOR869(oldReserveFactorMantissa, newReserveFactorMantissa);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                  
    function _ADDRESERVESINTERNAL601(uint addAmount) internal NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.ADD_RESERVES_ACCRUE_INTEREST_FAILED);
        }

        
        (error, ) = _ADDRESERVESFRESH410(addAmount);
        return error;
    }

                                                                                                                                                                                                                                                                                                                                     
    function _ADDRESERVESFRESH410(uint addAmount) internal returns (uint, uint) {	
        
        uint totalReservesNew;
        uint actualAddAmount;

        
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return (FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.ADD_RESERVES_FRESH_CHECK), actualAddAmount);
        }

                                 
        
        

                                                                                                                                                                                                                                                                                                                                                                                                                                            

        actualAddAmount = DOTRANSFERIN24(msg.sender, addAmount);

        totalReservesNew = totalReserves + actualAddAmount;

                                
        require(totalReservesNew >= totalReserves, "add reserves unexpected overflow");

        
        totalReserves = totalReservesNew;

                                                                     
        emit RESERVESADDED940(msg.sender, actualAddAmount, totalReservesNew);

                                                
        return (uint(Error.NO_ERROR), actualAddAmount);
    }


                                                                                                                                                                                                                                               
    function _REDUCERESERVES580(uint reduceAmount) external NONREENTRANT768 returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.REDUCE_RESERVES_ACCRUE_INTEREST_FAILED);
        }
        
        return _REDUCERESERVESFRESH709(reduceAmount);
    }

                                                                                                                                                                                                                                                                      
    function _REDUCERESERVESFRESH709(uint reduceAmount) internal returns (uint) {	
        
        uint totalReservesNew;

        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.REDUCE_RESERVES_ADMIN_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.REDUCE_RESERVES_FRESH_CHECK);
        }

        
        if (GETCASHPRIOR45() < reduceAmount) {
            return FAIL199(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDUCE_RESERVES_CASH_NOT_AVAILABLE);
        }

        
        if (reduceAmount > totalReserves) {
            return FAIL199(Error.BAD_INPUT, FailureInfo.REDUCE_RESERVES_VALIDATION);
        }

                                 
        
        

        totalReservesNew = totalReserves - reduceAmount;
        
        require(totalReservesNew <= totalReserves, "reduce reserves unexpected underflow");

        
        totalReserves = totalReservesNew;

        
        DOTRANSFEROUT738(admin, reduceAmount);

        emit RESERVESREDUCED80(admin, reduceAmount, totalReservesNew);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _SETINTERESTRATEMODEL987(InterestRateModel newInterestRateModel) public returns (uint) {	
        uint error = ACCRUEINTEREST257();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL199(Error(error), FailureInfo.SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED);
        }
        
        return _SETINTERESTRATEMODELFRESH997(newInterestRateModel);
    }

                                                                                                                                                                                                                                                                                                                           
    function _SETINTERESTRATEMODELFRESH997(InterestRateModel newInterestRateModel) internal returns (uint) {	

        
        InterestRateModel oldInterestRateModel;

        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_INTEREST_RATE_MODEL_OWNER_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER3()) {
            return FAIL199(Error.MARKET_NOT_FRESH, FailureInfo.SET_INTEREST_RATE_MODEL_FRESH_CHECK);
        }

        
        oldInterestRateModel = interestRateModel;

        
        require(newInterestRateModel.isinterestratemodel312(), "marker method returned false");

        
        interestRateModel = newInterestRateModel;

        
        emit NEWMARKETINTERESTRATEMODEL107(oldInterestRateModel, newInterestRateModel);

        return uint(Error.NO_ERROR);
    }

                        

                                                                                                                                                                                                                           
    function GETCASHPRIOR45() internal view returns (uint);	

                                                                                                                                                                                                                                     
    function DOTRANSFERIN24(address from, uint amount) internal returns (uint);	

                                                                                                                                                                                                                                                                                                                                                                                        
    function DOTRANSFEROUT738(address payable to, uint amount) internal;	


                              

                                                                                            
    modifier NONREENTRANT768() {	
        require(_notEntered, "re-entered");
        _notEntered = false;
        _;
        _notEntered = true; 
    }
}



pragma solidity ^0.5.16;


contract PriceOracle {
                                                                              
    bool public constant ispriceoracle364 = true;	

                                                                                                                                                                                                                                                               
    function GETUNDERLYINGPRICE915(CToken cToken) external view returns (uint);	
}



pragma solidity ^0.5.16;



contract UnitrollerAdminStorage {
                                                            
    address public admin;

                                                                    
    address public pendingAdmin;

                                                        
    address public comptrollerImplementation;

                                                         
    address public pendingComptrollerImplementation;
}

contract ComptrollerV1Storage is UnitrollerAdminStorage {

                                                                              
    PriceOracle public oracle;

                                                                                                             
    uint public closeFactorMantissa;

                                                                                                            
    uint public liquidationIncentiveMantissa;

                                                                                                                     
    uint public maxAssets;

                                                                                              
    mapping(address => CToken[]) public accountAssets;

}

contract ComptrollerV2Storage is ComptrollerV1Storage {
    struct Market {
                                                        
        bool isListed;

                                                                                                                                                                                                                                                                            
        uint collateralFactorMantissa;

                                                                  
        mapping(address => bool) accountMembership;

                                                            
        bool isComped;
    }

                                                                                                                                         
    mapping(address => Market) public markets;


                                                                                                                                                                                                                                                                      
    address public pauseGuardian;
    bool public _mintGuardianPaused;
    bool public _borrowGuardianPaused;
    bool public transferGuardianPaused;
    bool public seizeGuardianPaused;
    mapping(address => bool) public mintGuardianPaused;
    mapping(address => bool) public borrowGuardianPaused;
}

contract ComptrollerV3Storage is ComptrollerV2Storage {
    struct CompMarketState {
                                                                                
        uint224 index;

                                                                  
        uint32 block;
    }

                                     
    CToken[] public allMarkets;

                                                                          
    uint public compRate;

                                                                           
    mapping(address => uint) public compSpeeds;

                                                            
    mapping(address => CompMarketState) public compSupplyState;

                                                            
    mapping(address => CompMarketState) public compBorrowState;

                                                                                                             
    mapping(address => mapping(address => uint)) public compSupplierIndex;

                                                                                                             
    mapping(address => mapping(address => uint)) public compBorrowerIndex;

                                                                     
    mapping(address => uint) public compAccrued;
}



pragma solidity ^0.5.16;


                                                                                                                                                                                                                          
contract Unitroller is UnitrollerAdminStorage, ComptrollerErrorReporter {

                                                                                         
    event NEWPENDINGIMPLEMENTATION605(address oldPendingImplementation, address newPendingImplementation);	

                                                                                                                                             
    event NEWIMPLEMENTATION476(address oldImplementation, address newImplementation);	

                                                                     
    event NEWPENDINGADMIN512(address oldPendingAdmin, address newPendingAdmin);	

                                                                                                    
    event NEWADMIN610(address oldAdmin, address newAdmin);	

    constructor() public {
        
        admin = msg.sender;
    }

                             
    function _SETPENDINGIMPLEMENTATION853(address newPendingImplementation) public returns (uint) {	

        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_IMPLEMENTATION_OWNER_CHECK);
        }

        address oldPendingImplementation = pendingComptrollerImplementation;

        pendingComptrollerImplementation = newPendingImplementation;

        emit NEWPENDINGIMPLEMENTATION605(oldPendingImplementation, pendingComptrollerImplementation);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                             
    function _ACCEPTIMPLEMENTATION549() public returns (uint) {	
        
        if (msg.sender != pendingComptrollerImplementation || pendingComptrollerImplementation == address(0)) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.ACCEPT_PENDING_IMPLEMENTATION_ADDRESS_CHECK);
        }

        
        address oldImplementation = comptrollerImplementation;
        address oldPendingImplementation = pendingComptrollerImplementation;

        comptrollerImplementation = pendingComptrollerImplementation;

        pendingComptrollerImplementation = address(0);

        emit NEWIMPLEMENTATION476(oldImplementation, comptrollerImplementation);
        emit NEWPENDINGIMPLEMENTATION605(oldPendingImplementation, pendingComptrollerImplementation);

        return uint(Error.NO_ERROR);
    }


                                                                                                                                                                                                                                                                                                                                                                                                               
    function _SETPENDINGADMIN611(address newPendingAdmin) public returns (uint) {	
        
        if (msg.sender != admin) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_ADMIN_OWNER_CHECK);
        }

        
        address oldPendingAdmin = pendingAdmin;

        
        pendingAdmin = newPendingAdmin;

        
        emit NEWPENDINGADMIN512(oldPendingAdmin, newPendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                        
    function _ACCEPTADMIN491() public returns (uint) {	
        
        if (msg.sender != pendingAdmin || msg.sender == address(0)) {
            return FAIL199(Error.UNAUTHORIZED, FailureInfo.ACCEPT_ADMIN_PENDING_ADMIN_CHECK);
        }

        
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        
        admin = pendingAdmin;

        
        pendingAdmin = address(0);

        emit NEWADMIN610(oldAdmin, admin);
        emit NEWPENDINGADMIN512(oldPendingAdmin, pendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                       
    function () payable external {
        
        (bool success, ) = comptrollerImplementation.delegatecall(msg.data);

        assembly {
              let free_mem_ptr := mload(0x40)
              returndatacopy(free_mem_ptr, 0, returndatasize)

              switch success
              case 0 { revert(free_mem_ptr, returndatasize) }
              default { return(free_mem_ptr, returndatasize) }
        }
    }
}