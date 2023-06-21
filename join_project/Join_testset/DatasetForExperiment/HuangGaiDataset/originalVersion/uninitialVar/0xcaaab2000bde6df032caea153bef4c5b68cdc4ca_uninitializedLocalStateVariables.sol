/**
 *Submitted for verification at Etherscan.io on 2020-08-28
*/

pragma solidity 0.5.12;

library SafeMath {
    function add(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x + y) >= x, "ds-math-add-overflow");
    }

    function sub(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

    function div(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y > 0, "ds-math-div-overflow");
        z = x / y;
    }
}

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ERC20SafeTransfer {
    function doTransferOut(
        address _token,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        IERC20 token ;	//inject UNINIT LOCAL/STATE VAR

        bool result;

        token.transfer(_to, _amount);

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
        return result;
    }

    function doTransferFrom(
        address _token,
        address _from,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        IERC20 token ;	//inject UNINIT LOCAL/STATE VAR

        bool result;

        token.transferFrom(_from, _to, _amount);

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
        return result;
    }

    function doApprove(
        address _token,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        IERC20 token ;	//inject UNINIT LOCAL/STATE VAR

        bool result;

        token.approve(_to, _amount);

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
        return result;
    }
}

interface DFStore {
    function getFeeRate(uint ct) external view returns (uint);
    function getMinBurnAmount() external view returns (uint);
}

interface IUniswapV2Router {
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}


interface DFProtocolView {
    function getPrice(uint _tokenIdx) external view returns (uint);
    function getFeeRate(uint _processIdx) external view returns (uint);
}

interface DFProtocol{
    function deposit(address _tokenID, uint _feeTokenIdx, uint _tokenAmount) external returns (uint);
    function destroy(uint _feeTokenIdx, uint _usdxAmount) external;
}

interface Curve {
    function exchange_underlying(int128 inputIndex, int128 outputIndex, uint256 inputAmount, uint256 minOutput) external;
}

interface IChi {
    function freeFromUpTo(address from, uint256 value) external returns (uint256 freed);
}

contract Ownable {
    address internal _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() external view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}



contract swapUSDx is ERC20SafeTransfer, Ownable {
    using SafeMath for uint256;
    uint256 private BASE ;	//inject UNINIT LOCAL/STATE VAR


    event SwapUSDx(address targetToken, uint256 inputAmount, uint256 outputAmount);

    constructor () public {
        _owner = msg.sender;
    }

    IChi public chi ;	//inject UNINIT LOCAL/STATE VAR


    address internal USDx ;	//inject UNINIT LOCAL/STATE VAR

    address internal DF ;	//inject UNINIT LOCAL/STATE VAR


    address internal DFEngineContract ;	//inject UNINIT LOCAL/STATE VAR

    DFProtocol internal DFProtocolContract ;	//inject UNINIT LOCAL/STATE VAR

    DFProtocolView internal DFProtocolViewContract ;	//inject UNINIT LOCAL/STATE VAR

    DFStore internal DFStoreContract ;	//inject UNINIT LOCAL/STATE VAR


    address internal yPool ;	//inject UNINIT LOCAL/STATE VAR

    address internal paxPool ;	//inject UNINIT LOCAL/STATE VAR

    address internal sUSD ;	//inject UNINIT LOCAL/STATE VAR


    address internal uniswapRouter ;	//inject UNINIT LOCAL/STATE VAR


    address[] public underlyingTokens ;	//inject UNINIT LOCAL/STATE VAR


    address internal USDT ;	//inject UNINIT LOCAL/STATE VAR


    modifier discountCHI {
        uint256 gasStart ;	//inject UNINIT LOCAL/STATE VAR

        _;
        uint256 gasSpent ;	//inject UNINIT LOCAL/STATE VAR

        chi.freeFromUpTo(msg.sender, (gasSpent + 14154) / 41947);
    }

    /**
     * @dev Based on current DF price and the amount of USDx, calculate how many DF does the
     *      `msg.sender` need when destroies USDx.
     * @param _amount Total amount of USDx would be destroied.
     */
    function getDFAmount(uint256 _amount) internal view returns (uint256) {
        // 0 means DF
        uint256 _dfPrice ;	//inject UNINIT LOCAL/STATE VAR

        // 1 means this processing is `destroy`
        uint256 _rate ;	//inject UNINIT LOCAL/STATE VAR

        uint256 _dfAmount ;	//inject UNINIT LOCAL/STATE VAR

        return _dfAmount;
    }

    /**
     * @dev Calculate how many USDx will the `msg.sender` cost when wants to get a specific
     *      amount of DF.
     * @param _amount Total amount of DF would be cost.
     */
    function getSpendingUSDxAmount(uint256 _amount) internal view returns (uint256) {
        address[] memory _path = new address[](2);
        _path[0] = USDx;
        _path[1] = DF;
        uint[] memory _returnAmounts = IUniswapV2Router(uniswapRouter).getAmountsIn(_amount, _path);
        return _returnAmounts[0];
    }

    /**
     * @dev Uses this function to prepare for all authority needed.
     */
    function multiApprove() external onlyOwner discountCHI returns (bool) {
        // When swaps USDx to DF in the uniswap.
        require(doApprove(USDx, uniswapRouter, uint256(-1)), "multiApprove: approve uniswap failed!");
        // When destroy USDx.
        // - 1. DF.approve(DFEngineContract, -1)
        require(doApprove(DF, DFEngineContract, uint256(-1)), "multiApprove: DF approves DFEngine failed!");
        // - 2. USDx.approve(DFEngineContract, -1)
        require(doApprove(USDx, DFEngineContract, uint256(-1)), "multiApprove: USDx approves DFEngine failed!");
        // When swaps token to get USDC
        require(doApprove(underlyingTokens[0], paxPool, uint256(-1)), "multiApprove: PAX approves paxpool failed!");
        require(doApprove(underlyingTokens[1], yPool, uint256(-1)), "multiApprove: TUSD approves ypool failed!");
        // When swaps token to get USDT
        require(doApprove(underlyingTokens[2], sUSD, uint256(-1)), "multiApprove: USDC approves sUSD failed!");
    }

    /**
     * @dev Swaps USDx to DF in the Uniswap.
     * @param _inputAmount Amount of USDx to swap to get DF.
     */
    function swapUSDxToDF(uint256 _inputAmount) internal {
        uint256 _dfAmount ;	//inject UNINIT LOCAL/STATE VAR

        uint256 _expectedUSDxAmount ;	//inject UNINIT LOCAL/STATE VAR

        uint256 _usdxAmount  ;	//inject UNINIT LOCAL/STATE VAR


        address[] memory _path = new address[](2);
        _path[0] = USDx;
        _path[1] = DF;

        // swap parts of USDx to DF.
        IUniswapV2Router(uniswapRouter).swapExactTokensForTokens(
            _usdxAmount,
            _dfAmount,
            _path,
            address(this),
            block.timestamp + 3600
        );
    }

    /**
     * @dev Gets the final amount of target token when swaps.
     * @param _targetToken Asset that swaps to get.
     * @param _inputAmount Amount to swap.
     * @param _minReturn Minimum amount to get when swaps.
     */
    function getAmountOut(address _targetToken, uint256 _inputAmount, uint256 _minReturn) external returns (uint256) {
        // transfer USDx from user to this contract.
        require(
            doTransferFrom(
                USDx,
                msg.sender,
                address(this),
                _inputAmount
            ),
            "swap: USDx transferFrom failed!"
        );

        swapUSDxToDF(_inputAmount);

        // destroy the remaining USDx with DF.
        DFProtocolContract.destroy(0, IERC20(USDx).balanceOf(address(this)));

        if (_targetToken == underlyingTokens[2]){
            // TUSD -> USDC
            uint256 _totalAmount ;	//inject UNINIT LOCAL/STATE VAR

            Curve(yPool).exchange_underlying(int128(3), int128(1), _totalAmount,uint256(0));
            // PAX -> USDC
            _totalAmount = IERC20(underlyingTokens[0]).balanceOf(address(this));
            Curve(paxPool).exchange_underlying(int128(3), int128(1), _totalAmount,uint256(0));
        } else if (_targetToken == USDT) {
            // USDC -> USDT
            uint256 _totalAmount ;	//inject UNINIT LOCAL/STATE VAR

            Curve(sUSD).exchange_underlying(int128(1), int128(2), _totalAmount,uint256(0));
            // TUSD -> USDT
            _totalAmount = IERC20(underlyingTokens[1]).balanceOf(address(this));
            Curve(yPool).exchange_underlying(int128(3), int128(2), _totalAmount,uint256(0));
            // PAX -> USDC
            _totalAmount = IERC20(underlyingTokens[0]).balanceOf(address(this));
            Curve(paxPool).exchange_underlying(int128(3), int128(2), _totalAmount,uint256(0));
        }

        uint256 _finalBalance ;	//inject UNINIT LOCAL/STATE VAR

        // transfer target token to caller`msg.sender`
        require(doTransferOut(_targetToken, msg.sender, _finalBalance), "swap: Transfer targetToken out failed!");
        require(doTransferOut(DF, msg.sender, IERC20(DF).balanceOf(address(this))), "swap: Transfer DF out failed!");

        emit SwapUSDx(_targetToken, _inputAmount, _finalBalance);
        return _finalBalance;
    }

    /**
     * @dev Swaps token to get target token.
     * @param _targetToken Asset that swaps to get.
     * @param _inputAmount Amount to swap.
     * @param _minReturn Minimum amount to get when swaps.
     */
    function swapUSDxTo(address _targetToken, uint256 _inputAmount, uint256 _minReturn) public discountCHI returns (uint256) {
        // transfer USDx from user to this contract.
        require(
            doTransferFrom(
                USDx,
                msg.sender,
                address(this),
                _inputAmount
            ),
            "swap: USDx transferFrom failed!"
        );

        swapUSDxToDF(_inputAmount);

        // destroy the remaining USDx with DF.
        DFProtocolContract.destroy(0, IERC20(USDx).balanceOf(address(this)));

        if (_targetToken == underlyingTokens[2]){
            // TUSD -> USDC
            uint256 _totalAmount ;	//inject UNINIT LOCAL/STATE VAR

            Curve(yPool).exchange_underlying(int128(3), int128(1), _totalAmount, uint256(0));
            // PAX -> USDC
            _totalAmount = IERC20(underlyingTokens[0]).balanceOf(address(this));
            Curve(paxPool).exchange_underlying(int128(3), int128(1), _totalAmount, uint256(0));
        } else if (_targetToken == USDT) {
            // USDC -> USDT
            uint256 _totalAmount ;	//inject UNINIT LOCAL/STATE VAR

            Curve(sUSD).exchange_underlying(int128(1), int128(2), _totalAmount, uint256(0));
            // TUSD -> USDT
            _totalAmount = IERC20(underlyingTokens[1]).balanceOf(address(this));
            Curve(yPool).exchange_underlying(int128(3), int128(2), _totalAmount, uint256(0));
            // PAX -> USDC
            _totalAmount = IERC20(underlyingTokens[0]).balanceOf(address(this));
            Curve(paxPool).exchange_underlying(int128(3), int128(2), _totalAmount, uint256(0));
        }

        uint256 _finalBalance ;	//inject UNINIT LOCAL/STATE VAR

        require(_finalBalance >= _minReturn, "swap: Too large slippage to succeed!");
        // transfer target token to caller`msg.sender`
        require(doTransferOut(_targetToken, msg.sender, _finalBalance), "swap: Transfer targetToken out failed!");
        require(doTransferOut(DF, msg.sender, IERC20(DF).balanceOf(address(this))), "swap: Transfer DF out failed!");

        emit SwapUSDx(_targetToken, _inputAmount, _finalBalance);
        return _finalBalance;
    }

    /**
     * @dev Transfer unexpected toke out, but only for owner.
     */
    function transferOut(address _token, address _to, uint256 _amount) external onlyOwner {
        require(
            doTransferOut(
                _token,
                _to,
                _amount
            ),
            "transferOut: Transfer token out failed!"
        );
    }

}