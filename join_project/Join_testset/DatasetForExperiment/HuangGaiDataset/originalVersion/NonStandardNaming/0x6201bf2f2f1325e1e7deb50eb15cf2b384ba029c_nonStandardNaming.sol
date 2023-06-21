                                                                 

pragma solidity ^0.5.16;

                                                                                                                                                                             

                                                                                                                                                                                                   
contract CarefulMath {

    enum MathError {
        NO_ERROR,
        DIVISION_BY_ZERO,
        INTEGER_OVERFLOW,
        INTEGER_UNDERFLOW
    }

                                                                               
    function MULUINT487(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
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

                                                                                   
    function DIVUINT630(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b == 0) {
            return (MathError.DIVISION_BY_ZERO, 0);
        }

        return (MathError.NO_ERROR, a / b);
    }

                                                                                                                           
    function SUBUINT765(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b <= a) {
            return (MathError.NO_ERROR, a - b);
        } else {
            return (MathError.INTEGER_UNDERFLOW, 0);
        }
    }

                                                                         
    function ADDUINT426(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;

        if (c >= a) {
            return (MathError.NO_ERROR, c);
        } else {
            return (MathError.INTEGER_OVERFLOW, 0);
        }
    }

                                                         
    function ADDTHENSUBUINT526(uint a, uint b, uint c) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err0, uint sum) = ADDUINT426(a, b);

        if (err0 != MathError.NO_ERROR) {
            return (err0, 0);
        }

        return SUBUINT765(sum, c);
    }
}

interface ControllerInterface {

    function ISCONTROLLER60() external view returns (bool);	//inject NONSTANDARD NAMING

    function ENTERMARKETS79(address[] calldata aTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET784(address aToken) external returns (uint);	//inject NONSTANDARD NAMING

    function MINTALLOWED668(address aToken, address minter, uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function MINTVERIFY923(address aToken, address minter, uint mintAmount, uint mintTokens) external;	//inject NONSTANDARD NAMING

    function REDEEMALLOWED673(address aToken, address redeemer, uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMVERIFY287(address aToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	//inject NONSTANDARD NAMING

    function BORROWALLOWED157(address aToken, address borrower, uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWVERIFY218(address aToken, address borrower, uint borrowAmount) external;	//inject NONSTANDARD NAMING

    function REPAYBORROWALLOWED81(	//inject NONSTANDARD NAMING
        address aToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
        
    function REPAYBORROWVERIFY165(	//inject NONSTANDARD NAMING
        address aToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED93(	//inject NONSTANDARD NAMING
        address aTokenBorrowed,
        address aTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
        
    function LIQUIDATEBORROWVERIFY364(	//inject NONSTANDARD NAMING
        address aTokenBorrowed,
        address aTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED293(	//inject NONSTANDARD NAMING
        address aTokenCollateral,
        address aTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
        
    function SEIZEVERIFY379(	//inject NONSTANDARD NAMING
        address aTokenCollateral,
        address aTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED563(address aToken, address src, address dst, uint transferTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERVERIFY711(address aToken, address src, address dst, uint transferTokens) external;	//inject NONSTANDARD NAMING

                                                

    function LIQUIDATECALCULATESEIZETOKENS780(	//inject NONSTANDARD NAMING
        address aTokenBorrowed,
        address aTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}


contract ControllerErrorReporter {

    event FAILURE226(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING


    function FAIL679(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE226(uint(err), uint(info), 0);

        return uint(err);
    }

    function FAILOPAQUE535(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE226(uint(err), uint(info), opaqueError);

        return uint(err);
    }
    
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        CONTROLLER_MISMATCH,
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
        ZUNUSED
    }

    
}

contract TokenErrorReporter {

    event FAILURE226(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING

    function FAIL679(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE226(uint(err), uint(info), 0);

        return uint(err);
    }

    function FAILOPAQUE535(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE226(uint(err), uint(info), opaqueError);

        return uint(err);
    }
    
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        BAD_INPUT,
        CONTROLLER_REJECTION,
        CONTROLLER_CALCULATION_ERROR,
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
        BORROW_CONTROLLER_REJECTION,
        LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED,
        LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED,
        LIQUIDATE_COLLATERAL_FRESHNESS_CHECK,
        LIQUIDATE_CONTROLLER_REJECTION,
        LIQUIDATE_CONTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED,
        LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX,
        LIQUIDATE_CLOSE_AMOUNT_IS_ZERO,
        LIQUIDATE_FRESHNESS_CHECK,
        LIQUIDATE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_REPAY_BORROW_FRESH_FAILED,
        LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED,
        LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED,
        LIQUIDATE_SEIZE_CONTROLLER_REJECTION,
        LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_SEIZE_TOO_MUCH,
        MINT_ACCRUE_INTEREST_FAILED,
        MINT_CONTROLLER_REJECTION,
        MINT_EXCHANGE_CALCULATION_FAILED,
        MINT_EXCHANGE_RATE_READ_FAILED,
        MINT_FRESHNESS_CHECK,
        MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED,
        MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED,
        MINT_TRANSFER_IN_FAILED,
        MINT_TRANSFER_IN_NOT_POSSIBLE,
        REDEEM_ACCRUE_INTEREST_FAILED,
        REDEEM_CONTROLLER_REJECTION,
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
        REPAY_BORROW_CONTROLLER_REJECTION,
        REPAY_BORROW_FRESHNESS_CHECK,
        REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE,
        SET_COLLATERAL_FACTOR_OWNER_CHECK,
        SET_COLLATERAL_FACTOR_VALIDATION,
        SET_CONTROLLER_OWNER_CHECK,
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
        TRANSFER_CONTROLLER_REJECTION,
        TRANSFER_NOT_ALLOWED,
        TRANSFER_NOT_ENOUGH,
        TRANSFER_TOO_MUCH
    }


}


contract Exponential is CarefulMath {
    uint constant expscale648 = 1e18;	//inject NONSTANDARD NAMING
    uint constant halfexpscale459 = expscale648/2;	//inject NONSTANDARD NAMING
    uint constant mantissaone550 = expscale648;	//inject NONSTANDARD NAMING

    struct Exp {
        uint mantissa;
    }

    function GETEXP893(uint num, uint denom) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledNumerator) = MULUINT487(num, expscale648);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        (MathError err1, uint rational) = DIVUINT630(scaledNumerator, denom);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: rational}));
    }

    function ADDEXP590(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = ADDUINT426(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

    function SUBEXP250(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = SUBUINT765(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

    function MULSCALAR971(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledMantissa) = MULUINT487(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: scaledMantissa}));
    }

    function MULSCALARTRUNCATE313(Exp memory a, uint scalar) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR971(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE829(product));
    }

    function MULSCALARTRUNCATEADDUINT132(Exp memory a, uint scalar, uint addend) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR971(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return ADDUINT426(TRUNCATE829(product), addend);
    }

    function DIVSCALAR705(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint descaledMantissa) = DIVUINT630(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: descaledMantissa}));
    }

    function DIVSCALARBYEXP667(uint scalar, Exp memory divisor) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                 
        (MathError err0, uint numerator) = MULUINT487(expscale648, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }
        return GETEXP893(numerator, divisor.mantissa);
    }

    function DIVSCALARBYEXPTRUNCATE295(uint scalar, Exp memory divisor) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory fraction) = DIVSCALARBYEXP667(scalar, divisor);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE829(fraction));
    }

    function MULEXP695(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING

        (MathError err0, uint doubleScaledProduct) = MULUINT487(a.mantissa, b.mantissa);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        // We add half the scale before dividing so that we get rounding instead of truncation.
        //  See "Listing 6" and text above it at https://accu.org/index.php/journals/1717
        // Without this change, a result like 6.6...e-19 will be truncated to 0 instead of being rounded to 1e-18.
        (MathError err1, uint doubleScaledProductWithHalfScale) = ADDUINT426(halfexpscale459, doubleScaledProduct);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        (MathError err2, uint product) = DIVUINT630(doubleScaledProductWithHalfScale, expscale648);
        // The only error `div` can return is MathError.DIVISION_BY_ZERO but we control `expScale` and it is not zero.
        assert(err2 == MathError.NO_ERROR);

        return (MathError.NO_ERROR, Exp({mantissa: product}));
    }

    function MULEXP695(uint a, uint b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return MULEXP695(Exp({mantissa: a}), Exp({mantissa: b}));
    }

    function MULEXP3734(Exp memory a, Exp memory b, Exp memory c) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory ab) = MULEXP695(a, b);
        if (err != MathError.NO_ERROR) {
            return (err, ab);
        }
        return MULEXP695(ab, c);
    }

    function DIVEXP649(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return GETEXP893(a.mantissa, b.mantissa);
    }

    function TRUNCATE829(Exp memory exp) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        // Note: We are not using careful math here as we're performing a division that cannot fail
        return exp.mantissa / expscale648;
    }

    function LESSTHANEXP489(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa < right.mantissa; //TODO: Add some simple tests and this in another PR yo.
    }

    function LESSTHANOREQUALEXP433(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa <= right.mantissa;
    }

    function ISZEROEXP310(Exp memory value) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return value.mantissa == 0;
    }
}

                                                                                           
interface EIP20Interface {

                                                                                                                   
    function TOTALSUPPLY336() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                            
    function BALANCEOF502(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                           
    function TRANSFER513(address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                         
    function TRANSFERFROM433(address src, address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function APPROVE77(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                
    function ALLOWANCE1000(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER905(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL533(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                         
interface EIP20NonStandardInterface {

    function TOTALSUPPLY336() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF502(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

    function TRANSFER513(address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

    function TRANSFERFROM433(address src, address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

    function APPROVE77(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

    function ALLOWANCE1000(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER905(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL533(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                             
contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () public {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT343() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "re-entered");
    }
}


interface InterestRateModel {

    function GETBORROWRATE902(uint cash, uint borrows, uint reserves) external view returns (uint, uint);	//inject NONSTANDARD NAMING

    function ISINTERESTRATEMODEL684() external view returns (bool);	//inject NONSTANDARD NAMING
}


contract AToken is EIP20Interface, Exponential, TokenErrorReporter, ReentrancyGuard {
                                                                                        
    bool public constant isatoken535 = true;	//inject NONSTANDARD NAMING

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint public decimals;

                                                                                            
    uint constant borrowratemaxmantissa718 = 5e14;	//inject NONSTANDARD NAMING

                                                                                              
    uint constant reservefactormaxmantissa630 = 1e18;	//inject NONSTANDARD NAMING

                                                              
    address payable public admin;

                                                                      
    address payable public pendingAdmin;

                                                                              
    ControllerInterface public controller;

                                                                                         
    InterestRateModel public interestRateModel;

                                                                                                                    
    uint public initialExchangeRateMantissa;

                                                                                    
    uint public reserveFactorMantissa;

                                                                             
    uint public accrualBlockNumber;

                                                                                                   
    uint public borrowIndex;

                                                                                                   
    uint public totalBorrows;

                                                                                             
    uint public totalReserves;

                                                                    
    uint256 public totalSupply;

                                                                                 
    mapping (address => uint256) accountTokens;

                                                                                  
    mapping (address => mapping (address => uint256)) transferAllowances;

                                                                                                                                                                                                                                                                                            
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

                                                                                          
    mapping(address => BorrowSnapshot) accountBorrows;


                           

                                                                     
    event ACCRUEINTEREST202(uint interestAccumulated, uint borrowIndex, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                   
    event MINT297(address minter, uint mintAmount, uint mintTokens);	//inject NONSTANDARD NAMING

                                                                     
    event REDEEM194(address redeemer, uint redeemAmount, uint redeemTokens);	//inject NONSTANDARD NAMING

                                                                        
    event BORROW877(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                    
    event REPAYBORROW552(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                        
    event LIQUIDATEBORROW829(address liquidator, address borrower, uint repayAmount, address aTokenCollateral, uint seizeTokens);	//inject NONSTANDARD NAMING


                          

                                                                         
    event NEWPENDINGADMIN90(address oldPendingAdmin, address newPendingAdmin);	//inject NONSTANDARD NAMING

                                                                                                        
    event NEWADMIN719(address oldAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                       
    event NEWCONTROLLER768(ControllerInterface oldController, ControllerInterface newController);	//inject NONSTANDARD NAMING

                                                                              
    event NEWMARKETINTERESTRATEMODEL804(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);	//inject NONSTANDARD NAMING

                                                                               
    event NEWRESERVEFACTOR274(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);	//inject NONSTANDARD NAMING

                                                                          
    event RESERVESREDUCED592(address admin, uint reduceAmount, uint newTotalReserves);	//inject NONSTANDARD NAMING

    constructor( ) public { 
        admin = msg.sender;

        // Set initial exchange rate
        initialExchangeRateMantissa = uint(200000000000000000000000000);

        // Initialize block number and borrow index (block number mocks depend on controller being set)
        accrualBlockNumber = GETBLOCKNUMBER521();
        borrowIndex = mantissaone550;

        name = string("Artem SushiToken");
        symbol = string("aSUSHI");
        decimals = uint(8);
    }

    function TRANSFERTOKENS932(address spender, address src, address dst, uint tokens) internal returns (uint) {	//inject NONSTANDARD NAMING
                                          
        uint allowed = controller.TRANSFERALLOWED563(address(this), src, dst, tokens);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.TRANSFER_CONTROLLER_REJECTION, allowed);
        }

                                         
        if (src == dst) {
            return FAIL679(Error.BAD_INPUT, FailureInfo.TRANSFER_NOT_ALLOWED);
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

        (mathErr, allowanceNew) = SUBUINT765(startingAllowance, tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL679(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

        (mathErr, srcTokensNew) = SUBUINT765(accountTokens[src], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL679(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ENOUGH);
        }

        (mathErr, dstTokensNew) = ADDUINT426(accountTokens[dst], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL679(Error.MATH_ERROR, FailureInfo.TRANSFER_TOO_MUCH);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

        accountTokens[src] = srcTokensNew;
        accountTokens[dst] = dstTokensNew;

                                                      
        if (startingAllowance != uint(-1)) {
            transferAllowances[src][spender] = allowanceNew;
        }

                                      
        emit TRANSFER905(src, dst, tokens);

                                                                                 
        controller.TRANSFERVERIFY711(address(this), src, dst, tokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                      
    function TRANSFER513(address dst, uint256 amount) external NONREENTRANT343 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS932(msg.sender, msg.sender, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM433(address src, address dst, uint256 amount) external NONREENTRANT343 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS932(msg.sender, src, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE77(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        address src = msg.sender;
        transferAllowances[src][spender] = amount;
        emit APPROVAL533(src, spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                           
    function ALLOWANCE1000(address owner, address spender) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return transferAllowances[owner][spender];
    }

                                                                                                                                                                                
    function BALANCEOF502(address owner) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return accountTokens[owner];
    }

                                                                                                                                                                                                                                                 
    function BALANCEOFUNDERLYING213(address owner) external returns (uint) {	//inject NONSTANDARD NAMING
        Exp memory exchangeRate = Exp({mantissa: EXCHANGERATECURRENT64()});
        (MathError mErr, uint balance) = MULSCALARTRUNCATE313(exchangeRate, accountTokens[owner]);
        require(mErr == MathError.NO_ERROR);
        return balance;
    }

                                                                                                                                                                                                                                                                                                                                          
    function GETACCOUNTSNAPSHOT131(address account) external view returns (uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint aTokenBalance = accountTokens[account];
        uint borrowBalance;
        uint exchangeRateMantissa;

        MathError mErr;

        (mErr, borrowBalance) = BORROWBALANCESTOREDINTERNAL211(account);
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        (mErr, exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL438();
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        return (uint(Error.NO_ERROR), aTokenBalance, borrowBalance, exchangeRateMantissa);
    }

                                                                                                                                                  
    function GETBLOCKNUMBER521() internal view returns (uint) {	//inject NONSTANDARD NAMING
        return block.number;
    }

                                                                                                                                                                   
    function BORROWRATEPERBLOCK933() external view returns (uint) {	//inject NONSTANDARD NAMING
        (uint opaqueErr, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE902(GETCASHPRIOR935(), totalBorrows, totalReserves);
        require(opaqueErr == 0, "borrowRatePerBlock: interestRateModel.borrowRate failed"); // semi-opaque
        return borrowRateMantissa;
    }

                                                                                                                                                                   
    function SUPPLYRATEPERBLOCK324() external view returns (uint) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                
        uint exchangeRateMantissa = EXCHANGERATESTORED667();

        (uint e0, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE902(GETCASHPRIOR935(), totalBorrows, totalReserves);
        require(e0 == 0, "supplyRatePerBlock: calculating borrowRate failed"); // semi-opaque

        (MathError e1, Exp memory underlying) = MULSCALAR971(Exp({mantissa: exchangeRateMantissa}), totalSupply);
        require(e1 == MathError.NO_ERROR, "supplyRatePerBlock: calculating underlying failed");

        (MathError e2, Exp memory borrowsPer) = DIVSCALARBYEXP667(totalBorrows, underlying);
        require(e2 == MathError.NO_ERROR, "supplyRatePerBlock: calculating borrowsPer failed");

        (MathError e3, Exp memory oneMinusReserveFactor) = SUBEXP250(Exp({mantissa: mantissaone550}), Exp({mantissa: reserveFactorMantissa}));
        require(e3 == MathError.NO_ERROR, "supplyRatePerBlock: calculating oneMinusReserveFactor failed");

        (MathError e4, Exp memory supplyRate) = MULEXP3734(Exp({mantissa: borrowRateMantissa}), oneMinusReserveFactor, borrowsPer);
        require(e4 == MathError.NO_ERROR, "supplyRatePerBlock: calculating supplyRate failed");

        return supplyRate.mantissa;
    }

                                                                                                                                     
    function TOTALBORROWSCURRENT515() external NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST666() == uint(Error.NO_ERROR), "accrue interest failed");
        return totalBorrows;
    }

                                                                                                                                                                                                                                                                                     
    function BORROWBALANCECURRENT867(address account) external NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST666() == uint(Error.NO_ERROR), "accrue interest failed");
        return BORROWBALANCESTORED615(account);
    }

                                                                                                                                                                                                   
    function BORROWBALANCESTORED615(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = BORROWBALANCESTOREDINTERNAL211(account);
        require(err == MathError.NO_ERROR, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                
    function BORROWBALANCESTOREDINTERNAL211(address account) internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
                                                                  
        MathError mathErr;
        uint principalTimesIndex;
        uint result;

                                               
        BorrowSnapshot storage borrowSnapshot = accountBorrows[account];

                                                                                                                                                                                         
        if (borrowSnapshot.principal == 0) {
            return (MathError.NO_ERROR, 0);
        }

                                                                                                                                                                                  
        (mathErr, principalTimesIndex) = MULUINT487(borrowSnapshot.principal, borrowIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        (mathErr, result) = DIVUINT630(principalTimesIndex, borrowSnapshot.interestIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        return (MathError.NO_ERROR, result);
    }

                                                                                                                                              
    function EXCHANGERATECURRENT64() public NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST666() == uint(Error.NO_ERROR), "accrue interest failed");
        return EXCHANGERATESTORED667();
    }

                                                                                                                                                                                                                                            
    function EXCHANGERATESTORED667() public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = EXCHANGERATESTOREDINTERNAL438();
        require(err == MathError.NO_ERROR, "exchangeRateStored: exchangeRateStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                          
    function EXCHANGERATESTOREDINTERNAL438() internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (totalSupply == 0) {
                                                                                                                               
            return (MathError.NO_ERROR, initialExchangeRateMantissa);
        } else {
                                                                                                                                                
            uint totalCash = GETCASHPRIOR935();
            uint cashPlusBorrowsMinusReserves;
            Exp memory exchangeRate;
            MathError mathErr;

            (mathErr, cashPlusBorrowsMinusReserves) = ADDTHENSUBUINT526(totalCash, totalBorrows, totalReserves);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            (mathErr, exchangeRate) = GETEXP893(cashPlusBorrowsMinusReserves, totalSupply);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            return (MathError.NO_ERROR, exchangeRate.mantissa);
        }
    }

                                                                                                                                                             
    function GETCASH561() external view returns (uint) {	//inject NONSTANDARD NAMING
        return GETCASHPRIOR935();
    }

    struct AccrueInterestLocalVars {
        MathError mathErr;
        uint opaqueErr;
        uint borrowRateMantissa;
        uint currentBlockNumber;
        uint blockDelta;

        Exp simpleInterestFactor;

        uint interestAccumulated;
        uint totalBorrowsNew;
        uint totalReservesNew;
        uint borrowIndexNew;
    }
    
    
                                                                                                                                                                                                                                                  
    function ACCRUEINTEREST666() public returns (uint) {	//inject NONSTANDARD NAMING
        AccrueInterestLocalVars memory vars;

                                                        
        (vars.opaqueErr, vars.borrowRateMantissa) = interestRateModel.GETBORROWRATE902(GETCASHPRIOR935(), totalBorrows, totalReserves);

        require(vars.borrowRateMantissa <= borrowratemaxmantissa718, "borrow rate is absurdly high");
        if (vars.opaqueErr != 0) {
            return FAILOPAQUE535(Error.INTEREST_RATE_MODEL_ERROR, FailureInfo.ACCRUE_INTEREST_BORROW_RATE_CALCULATION_FAILED, vars.opaqueErr);
        }

                                               
        vars.currentBlockNumber = GETBLOCKNUMBER521();

                                                                           
        (vars.mathErr, vars.blockDelta) = SUBUINT765(vars.currentBlockNumber, accrualBlockNumber);
        assert(vars.mathErr == MathError.NO_ERROR); // Block delta should always succeed and if it doesn't, blow up.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        (vars.mathErr, vars.simpleInterestFactor) = MULSCALAR971(Exp({mantissa: vars.borrowRateMantissa}), vars.blockDelta);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.interestAccumulated) = MULSCALARTRUNCATE313(vars.simpleInterestFactor, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT426(vars.interestAccumulated, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalReservesNew) = MULSCALARTRUNCATEADDUINT132(Exp({mantissa: reserveFactorMantissa}), vars.interestAccumulated, totalReserves);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.borrowIndexNew) = MULSCALARTRUNCATEADDUINT132(vars.simpleInterestFactor, borrowIndex, borrowIndex);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                    
        accrualBlockNumber = vars.currentBlockNumber;
        borrowIndex = vars.borrowIndexNew;
        totalBorrows = vars.totalBorrowsNew;
        totalReserves = vars.totalReservesNew;

                                             
        emit ACCRUEINTEREST202(vars.interestAccumulated, vars.borrowIndexNew, totalBorrows);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                       
    function MINTINTERNAL987(uint mintAmount) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL679(Error(error), FailureInfo.MINT_ACCRUE_INTEREST_FAILED);
        }
        // mintFresh emits the actual Mint event if successful and logs on errors, so we don't need to
        return MINTFRESH106(msg.sender, mintAmount);
    }

    struct MintLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint mintTokens;
        uint totalSupplyNew;
        uint accountTokensNew;
    }
    
                                                                                                                                                                                                                                                                                                                                                                                                                             
    function MINTFRESH106(address minter, uint mintAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                      
        uint allowed = controller.MINTALLOWED668(address(this), minter, mintAmount);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.MINT_CONTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.MINT_FRESHNESS_CHECK);
        }

        MintLocalVars memory vars;

                                           
        vars.err = CHECKTRANSFERIN251(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL679(vars.err, FailureInfo.MINT_TRANSFER_IN_NOT_POSSIBLE);
        }

                                                                                                                                                                       
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL438();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.mintTokens) = DIVSCALARBYEXPTRUNCATE295(mintAmount, Exp({mantissa: vars.exchangeRateMantissa}));
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                                                                                                                                                                                                                       
        (vars.mathErr, vars.totalSupplyNew) = ADDUINT426(totalSupply, vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = ADDUINT426(accountTokens[minter], vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                  
        vars.err = DOTRANSFERIN434(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL679(vars.err, FailureInfo.MINT_TRANSFER_IN_FAILED);
        }

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[minter] = vars.accountTokensNew;

                                                        
        emit MINT297(minter, mintAmount, vars.mintTokens);
        emit TRANSFER905(address(this), minter, vars.mintTokens);

                                      
        controller.MINTVERIFY923(address(this), minter, mintAmount, vars.mintTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEMINTERNAL714(uint redeemTokens) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted redeem failed
            return FAIL679(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        // redeemFresh emits redeem-specific logs on errors, so we don't need to
        return REDEEMFRESH205(msg.sender, redeemTokens, 0);
    }

                                                                                                                                                                                                                                                                                                                                                     
    function REDEEMUNDERLYINGINTERNAL84(uint redeemAmount) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted redeem failed
            return FAIL679(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        // redeemFresh emits redeem-specific logs on errors, so we don't need to
        return REDEEMFRESH205(msg.sender, 0, redeemAmount);
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function REDEEMFRESH205(address payable redeemer, uint redeemTokensIn, uint redeemAmountIn) internal returns (uint) {	//inject NONSTANDARD NAMING
        require(redeemTokensIn == 0 || redeemAmountIn == 0, "one of redeemTokensIn or redeemAmountIn must be zero");

        RedeemLocalVars memory vars;

                                                          
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL438();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

                                    
        if (redeemTokensIn > 0) {
                                                                                                                                                                                                                                           
            vars.redeemTokens = redeemTokensIn;

            (vars.mathErr, vars.redeemAmount) = MULSCALARTRUNCATE313(Exp({mantissa: vars.exchangeRateMantissa}), redeemTokensIn);
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED, uint(vars.mathErr));
            }
        } else {
                                                                                                                                                                                                                                  

            (vars.mathErr, vars.redeemTokens) = DIVSCALARBYEXPTRUNCATE295(redeemAmountIn, Exp({mantissa: vars.exchangeRateMantissa}));
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED, uint(vars.mathErr));
            }

            vars.redeemAmount = redeemAmountIn;
        }

                                        
        uint allowed = controller.REDEEMALLOWED673(address(this), redeemer, vars.redeemTokens);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.REDEEM_CONTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.REDEEM_FRESHNESS_CHECK);
        }

                                                                                                                                                                                                                                               
        (vars.mathErr, vars.totalSupplyNew) = SUBUINT765(totalSupply, vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = SUBUINT765(accountTokens[redeemer], vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                               
        if (GETCASHPRIOR935() < vars.redeemAmount) {
            return FAIL679(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDEEM_TRANSFER_OUT_NOT_POSSIBLE);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                  
        vars.err = DOTRANSFEROUT315(redeemer, vars.redeemAmount);
        require(vars.err == Error.NO_ERROR, "redeem transfer out failed");

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[redeemer] = vars.accountTokensNew;

                                                          
        emit TRANSFER905(redeemer, address(this), vars.redeemTokens);
        emit REDEEM194(redeemer, vars.redeemAmount, vars.redeemTokens);

                                      
        controller.REDEEMVERIFY287(address(this), redeemer, vars.redeemAmount, vars.redeemTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                              
    function BORROWINTERNAL676(uint borrowAmount) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL679(Error(error), FailureInfo.BORROW_ACCRUE_INTEREST_FAILED);
        }
        // borrowFresh emits borrow-specific logs on errors, so we don't need to
        return BORROWFRESH508(msg.sender, borrowAmount);
    }

    struct BorrowLocalVars {
        Error err;
        MathError mathErr;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

                                                                                                                                                                                                                                                            
    function BORROWFRESH508(address payable borrower, uint borrowAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                        
        uint allowed = controller.BORROWALLOWED157(address(this), borrower, borrowAmount);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.BORROW_CONTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.BORROW_FRESHNESS_CHECK);
        }

                                                                          
        if (GETCASHPRIOR935() < borrowAmount) {
            return FAIL679(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.BORROW_CASH_NOT_AVAILABLE);
        }

        BorrowLocalVars memory vars;

                                                                                                                                                                                                                                       
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL211(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountBorrowsNew) = ADDUINT426(vars.accountBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT426(totalBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                              
        vars.err = DOTRANSFEROUT315(borrower, borrowAmount);
        require(vars.err == Error.NO_ERROR, "borrow transfer out failed");

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                    
        emit BORROW877(borrower, borrowAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        controller.BORROWVERIFY218(address(this), borrower, borrowAmount);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                  
    function REPAYBORROWINTERNAL797(uint repayAmount) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL679(Error(error), FailureInfo.REPAY_BORROW_ACCRUE_INTEREST_FAILED);
        }
        // repayBorrowFresh emits repay-borrow-specific logs on errors, so we don't need to
        return REPAYBORROWFRESH398(msg.sender, msg.sender, repayAmount);
    }

                                                                                                                                                                                                                                                                                 
    function REPAYBORROWBEHALFINTERNAL944(address borrower, uint repayAmount) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL679(Error(error), FailureInfo.REPAY_BEHALF_ACCRUE_INTEREST_FAILED);
        }
        // repayBorrowFresh emits repay-borrow-specific logs on errors, so we don't need to
        return REPAYBORROWFRESH398(msg.sender, borrower, repayAmount);
    }

    struct RepayBorrowLocalVars {
        Error err;
        MathError mathErr;
        uint repayAmount;
        uint borrowerIndex;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

                                                                                                                                                                                                                                                                                                                                                                                 
    function REPAYBORROWFRESH398(address payer, address borrower, uint repayAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                             
        uint allowed = controller.REPAYBORROWALLOWED81(address(this), payer, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.REPAY_BORROW_CONTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.REPAY_BORROW_FRESHNESS_CHECK);
        }

        RepayBorrowLocalVars memory vars;

                                                                              
        vars.borrowerIndex = accountBorrows[borrower].interestIndex;

                                                                              
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL211(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                                
        if (repayAmount == uint(-1)) {
            vars.repayAmount = vars.accountBorrows;
        } else {
            vars.repayAmount = repayAmount;
        }

                                           
        vars.err = CHECKTRANSFERIN251(payer, vars.repayAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL679(vars.err, FailureInfo.REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE);
        }

                                                                                                                                                                                                                                      
        (vars.mathErr, vars.accountBorrowsNew) = SUBUINT765(vars.accountBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = SUBUINT765(totalBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                   
        vars.err = DOTRANSFERIN434(payer, vars.repayAmount);
        require(vars.err == Error.NO_ERROR, "repay borrow transfer in failed");

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                         
        emit REPAYBORROW552(payer, borrower, vars.repayAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        controller.REPAYBORROWVERIFY165(address(this), payer, borrower, vars.repayAmount, vars.borrowerIndex);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function LIQUIDATEBORROWINTERNAL22(address borrower, uint repayAmount, AToken aTokenCollateral) internal NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted liquidation failed
            return FAIL679(Error(error), FailureInfo.LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED);
        }

        error = aTokenCollateral.ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted liquidation failed
            return FAIL679(Error(error), FailureInfo.LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED);
        }

        // liquidateBorrowFresh emits borrow-specific logs on errors, so we don't need to
        return LIQUIDATEBORROWFRESH947(msg.sender, borrower, repayAmount, aTokenCollateral);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function LIQUIDATEBORROWFRESH947(address liquidator, address borrower, uint repayAmount, AToken aTokenCollateral) internal returns (uint) {	//inject NONSTANDARD NAMING
                                           
        uint allowed = controller.LIQUIDATEBORROWALLOWED93(address(this), address(aTokenCollateral), liquidator, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.LIQUIDATE_CONTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_FRESHNESS_CHECK);
        }

                                                                                       
        if (aTokenCollateral.accrualBlockNumber() != GETBLOCKNUMBER521()) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_COLLATERAL_FRESHNESS_CHECK);
        }

                                           
        if (borrower == liquidator) {
            return FAIL679(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_LIQUIDATOR_IS_BORROWER);
        }

                                     
        if (repayAmount == 0) {
            return FAIL679(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_ZERO);
        }

                                      
        if (repayAmount == uint(-1)) {
            return FAIL679(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX);
        }

                                                                              
        (uint amountSeizeError, uint seizeTokens) = controller.LIQUIDATECALCULATESEIZETOKENS780(address(this), address(aTokenCollateral), repayAmount);
        if (amountSeizeError != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_CALCULATION_ERROR, FailureInfo.LIQUIDATE_CONTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED, amountSeizeError);
        }

                                                                     
        if (seizeTokens > aTokenCollateral.BALANCEOF502(borrower)) {
            return FAIL679(Error.TOKEN_INSUFFICIENT_BALANCE, FailureInfo.LIQUIDATE_SEIZE_TOO_MUCH);
        }

                                       
        uint repayBorrowError = REPAYBORROWFRESH398(liquidator, borrower, repayAmount);
        if (repayBorrowError != uint(Error.NO_ERROR)) {
            return FAIL679(Error(repayBorrowError), FailureInfo.LIQUIDATE_REPAY_BORROW_FRESH_FAILED);
        }

                                                                                    
        uint seizeError = aTokenCollateral.SEIZE74(liquidator, borrower, seizeTokens);
        require(seizeError == uint(Error.NO_ERROR), "token seizure failed");

                                             
        emit LIQUIDATEBORROW829(liquidator, borrower, repayAmount, address(aTokenCollateral), seizeTokens);

                                      
        controller.LIQUIDATEBORROWVERIFY364(address(this), address(aTokenCollateral), liquidator, borrower, repayAmount, seizeTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function SEIZE74(address liquidator, address borrower, uint seizeTokens) external NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
                                       
        uint allowed = controller.SEIZEALLOWED293(address(this), msg.sender, liquidator, borrower, seizeTokens);
        if (allowed != 0) {
            return FAILOPAQUE535(Error.CONTROLLER_REJECTION, FailureInfo.LIQUIDATE_SEIZE_CONTROLLER_REJECTION, allowed);
        }

                                           
        if (borrower == liquidator) {
            return FAIL679(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER);
        }

        MathError mathErr;
        uint borrowerTokensNew;
        uint liquidatorTokensNew;

                                                                                                                                                                                                                                                                             
        (mathErr, borrowerTokensNew) = SUBUINT765(accountTokens[borrower], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED, uint(mathErr));
        }

        (mathErr, liquidatorTokensNew) = ADDUINT426(accountTokens[liquidator], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE535(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED, uint(mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                    
        accountTokens[borrower] = borrowerTokensNew;
        accountTokens[liquidator] = liquidatorTokensNew;

                                   
        emit TRANSFER905(borrower, liquidator, seizeTokens);

                                      
        controller.SEIZEVERIFY379(address(this), msg.sender, liquidator, borrower, seizeTokens);

        return uint(Error.NO_ERROR);
    }


                             

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SETPENDINGADMIN46(address payable newPendingAdmin) external returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller = admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_ADMIN_OWNER_CHECK);
        }

        // Save current value, if any, for inclusion in log
        address oldPendingAdmin = pendingAdmin;

        // Store pendingAdmin with value newPendingAdmin
        pendingAdmin = newPendingAdmin;

        // Emit NewPendingAdmin(oldPendingAdmin, newPendingAdmin)
        emit NEWPENDINGADMIN90(oldPendingAdmin, newPendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                        
    function _ACCEPTADMIN357() external returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is pendingAdmin and pendingAdmin 1 address(0)
        if (msg.sender != pendingAdmin || msg.sender == address(0)) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.ACCEPT_ADMIN_PENDING_ADMIN_CHECK);
        }

        // Save current values for inclusion in log
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        // Store admin with value pendingAdmin
        admin = pendingAdmin;

        // Clear the pending value
        pendingAdmin = address(0);

        emit NEWADMIN719(oldAdmin, admin);
        emit NEWPENDINGADMIN90(oldPendingAdmin, pendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                 
    function _SETCONTROLLER608(ControllerInterface newController) public returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.SET_CONTROLLER_OWNER_CHECK);
        }

        ControllerInterface oldController = controller;
        
        // Ensure invoke controller.isController() returns true
        require(newController.ISCONTROLLER60(), "marker method returned false");

        // Set market's controller to newController
        controller = newController;

        // Emit NewControllerr(oldController, newController)
        emit NEWCONTROLLER768(oldController, newController);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                 
    function _SETRESERVEFACTOR113(uint newReserveFactorMantissa) external NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted reserve factor change failed.
            return FAIL679(Error(error), FailureInfo.SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED);
        }
        // _setReserveFactorFresh emits reserve-factor-specific logs on errors, so we don't need to.
        return _SETRESERVEFACTORFRESH554(newReserveFactorMantissa);
    }

                                                                                                                                                                                                                                                              
    function _SETRESERVEFACTORFRESH554(uint newReserveFactorMantissa) internal returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.SET_RESERVE_FACTOR_ADMIN_CHECK);
        }

        // Verify market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            // TODO: static_assert + no error code?
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.SET_RESERVE_FACTOR_FRESH_CHECK);
        }

        // Check newReserveFactor 1 maxReserveFactor
        if (newReserveFactorMantissa > reservefactormaxmantissa630) {
            return FAIL679(Error.BAD_INPUT, FailureInfo.SET_RESERVE_FACTOR_BOUNDS_CHECK);
        }

        uint oldReserveFactorMantissa = reserveFactorMantissa;
        reserveFactorMantissa = newReserveFactorMantissa;

        emit NEWRESERVEFACTOR274(oldReserveFactorMantissa, newReserveFactorMantissa);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                               
    function _REDUCERESERVES424(uint reduceAmount) external NONREENTRANT343 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted reduce reserves failed.
            return FAIL679(Error(error), FailureInfo.REDUCE_RESERVES_ACCRUE_INTEREST_FAILED);
        }
        // _reduceReservesFresh emits reserve-reduction-specific logs on errors, so we don't need to.
        return _REDUCERESERVESFRESH811(reduceAmount);
    }

                                                                                                                                                                                                                                                                      
    function _REDUCERESERVESFRESH811(uint reduceAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        Error err;
        // totalReserves - reduceAmount
        uint totalReservesNew;

        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.REDUCE_RESERVES_ADMIN_CHECK);
        }

        // We fail gracefully unless market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            // TODO: static_assert + no error code?
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.REDUCE_RESERVES_FRESH_CHECK);
        }

        // Fail gracefully if protocol has insufficient underlying cash
        if (GETCASHPRIOR935() < reduceAmount) {
            return FAIL679(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDUCE_RESERVES_CASH_NOT_AVAILABLE);
        }

        // Check reduceAmount 1 reserves[n] (totalReserves)
        // TODO: I'm following the spec literally here but I think we should we just use SafeMath instead and fail on an error (which would be underflow)
        if (reduceAmount > totalReserves) {
            return FAIL679(Error.BAD_INPUT, FailureInfo.REDUCE_RESERVES_VALIDATION);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

        totalReservesNew = totalReserves - reduceAmount;
        // We checked reduceAmount <= totalReserves above, so this should never revert.
        require(totalReservesNew <= totalReserves, "reduce reserves unexpected underflow");

        // Store reserves[n+1] = reserves[n] - reduceAmount
        totalReserves = totalReservesNew;

        // invoke doTransferOut(reduceAmount, admin)
        err = DOTRANSFEROUT315(admin, reduceAmount);
        // we revert on the failure of this command
        require(err == Error.NO_ERROR, "reduce reserves transfer out failed");

        emit RESERVESREDUCED592(admin, reduceAmount, totalReservesNew);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _SETINTERESTRATEMODEL396(InterestRateModel newInterestRateModel) public returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST666();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted change of interest rate model failed
            return FAIL679(Error(error), FailureInfo.SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED);
        }
        // _setInterestRateModelFresh emits interest-rate-model-update-specific logs on errors, so we don't need to.
        return _SETINTERESTRATEMODELFRESH285(newInterestRateModel);
    }

    function _SETINTERESTRATEMODEL_INIT509(InterestRateModel newInterestRateModel) public returns (uint) {	//inject NONSTANDARD NAMING
        if (msg.sender != admin) {
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.SET_INTEREST_RATE_MODEL_FRESH_CHECK);
        }
        // _setInterestRateModelFresh emits interest-rate-model-update-specific logs on errors, so we don't need to.
        interestRateModel = newInterestRateModel;
        _SETINTERESTRATEMODELFRESH285(interestRateModel);
    }
    
                                                                                                                                                                                                                                                                                                                           
    function _SETINTERESTRATEMODELFRESH285(InterestRateModel newInterestRateModel) internal returns (uint) {	//inject NONSTANDARD NAMING

        // Used to store old model for use in the event that is emitted on success
        InterestRateModel oldInterestRateModel;

        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.SET_INTEREST_RATE_MODEL_OWNER_CHECK);
        }

        // We fail gracefully unless market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER521()) {
            // TODO: static_assert + no error code?
            return FAIL679(Error.MARKET_NOT_FRESH, FailureInfo.SET_INTEREST_RATE_MODEL_FRESH_CHECK);
        }

        // Track the market's current interest rate model
        oldInterestRateModel = interestRateModel;

        // Ensure invoke newInterestRateModel.isInterestRateModel() returns true
        require(newInterestRateModel.ISINTERESTRATEMODEL684(), "marker method returned false");

        // Set the interest rate model to newInterestRateModel
        interestRateModel = newInterestRateModel;

        // Emit NewMarketInterestRateModel(oldInterestRateModel, newInterestRateModel)
        emit NEWMARKETINTERESTRATEMODEL804(oldInterestRateModel, newInterestRateModel);

        return uint(Error.NO_ERROR);
    }

    
                        

                                                                                                                                                                                                                           
    function GETCASHPRIOR935() internal view returns (uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                              
    function CHECKTRANSFERIN251(address from, uint amount) internal view returns (Error);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                        
    function DOTRANSFERIN434(address from, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                        
    function DOTRANSFEROUT315(address payable to, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING
}



contract AErc20 is AToken {

                                                               
    address public underlying;

                            

                                                                                                                                                                                                                                                                                                                                                       
    function MINT306(uint mintAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return MINTINTERNAL987(mintAmount);
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEM520(uint redeemTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMINTERNAL714(redeemTokens);
    }

                                                                                                                                                                                                                                                                                                                                                     
    function REDEEMUNDERLYING32(uint redeemAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMUNDERLYINGINTERNAL84(redeemAmount);
    }

                                                                                                                                                                                                                                                              
    function BORROW722(uint borrowAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return BORROWINTERNAL676(borrowAmount);
    }

                                                                                                                                                                                                  
    function REPAYBORROW879(uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REPAYBORROWINTERNAL797(repayAmount);
    }

                                                                                                                                                                                                                                                                                 
    function REPAYBORROWBEHALF439(address borrower, uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REPAYBORROWBEHALFINTERNAL944(borrower, repayAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function LIQUIDATEBORROW190(address borrower, uint repayAmount, AToken aTokenCollateral) external returns (uint) {	//inject NONSTANDARD NAMING
        return LIQUIDATEBORROWINTERNAL22(borrower, repayAmount, aTokenCollateral);
    }

                        

                                                                                                                                                                                                                                  
    function GETCASHPRIOR935() internal view returns (uint) {	//inject NONSTANDARD NAMING
        EIP20Interface token = EIP20Interface(underlying);
        return token.BALANCEOF502(address(this));
    }

                                                                                                                                                                                                                              
    function CHECKTRANSFERIN251(address from, uint amount) internal view returns (Error) {	//inject NONSTANDARD NAMING
        EIP20Interface token = EIP20Interface(underlying);

        if (token.ALLOWANCE1000(from, address(this)) < amount) {
            return Error.TOKEN_INSUFFICIENT_ALLOWANCE;
        }

        if (token.BALANCEOF502(from) < amount) {
            return Error.TOKEN_INSUFFICIENT_BALANCE;
        }

        return Error.NO_ERROR;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DOTRANSFERIN434(address from, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        EIP20NonStandardInterface token = EIP20NonStandardInterface(underlying);
        bool result;

        token.TRANSFERFROM433(from, address(this), amount);

        // solium-disable-next-line security/no-inline-assembly
        assembly {
            switch returndatasize()
                case 0 {                      // This is a non-standard ERC-20
                    result := not(0)          // set result to true
                }
                case 32 {                     // This is a complaint ERC-20
                    returndatacopy(0, 0, 32)
                    result := mload(0)        // Set `result = returndata` of external call
                }
                default {                     // This is an excessively non-compliant ERC-20, revert.
                    revert(0, 0)
                }
        }

        if (!result) {
            return Error.TOKEN_TRANSFER_IN_FAILED;
        }

        return Error.NO_ERROR;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function DOTRANSFEROUT315(address payable to, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        EIP20NonStandardInterface token = EIP20NonStandardInterface(underlying);
        bool result;

        token.TRANSFER513(to, amount);

        // solium-disable-next-line security/no-inline-assembly
        assembly {
            switch returndatasize()
                case 0 {                      // This is a non-standard ERC-20
                    result := not(0)          // set result to true
                }
                case 32 {                     // This is a complaint ERC-20
                    returndatacopy(0, 0, 32)
                    result := mload(0)        // Set `result = returndata` of external call
                }
                default {                     // This is an excessively non-compliant ERC-20, revert.
                    revert(0, 0)
                }
        }

        if (!result) {
            return Error.TOKEN_TRANSFER_OUT_FAILED;
        }

        return Error.NO_ERROR;
    }
    
    function _SETUNDERLYING779(address newunderlying) public returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL679(Error.UNAUTHORIZED, FailureInfo.SET_CONTROLLER_OWNER_CHECK);
        }

        // Set market's controller to newController
        underlying = newunderlying;
        EIP20Interface(underlying).TOTALSUPPLY336(); // Sanity check the underlying
        
        return uint(Error.NO_ERROR);
    } 
}