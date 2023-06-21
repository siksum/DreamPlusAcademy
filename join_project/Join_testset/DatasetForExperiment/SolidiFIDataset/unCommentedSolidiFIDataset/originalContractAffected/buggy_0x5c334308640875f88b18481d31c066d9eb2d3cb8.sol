/**
 *Submitted for verification at Etherscan.io on 2019-12-13
*/

pragma solidity ^0.5.8;

interface GemLike {
    function approve(address, uint) external;
    function transfer(address, uint) external;
    function transferFrom(address, address, uint) external;
    function deposit() external payable;
    function withdraw(uint) external;
}

interface ManagerLike {
    function cdpCan(address, uint, address) external view returns (uint);
    function ilks(uint) external view returns (bytes32);
    function owns(uint) external view returns (address);
    function urns(uint) external view returns (address);
    function vat() external view returns (address);
    function open(bytes32, address) external returns (uint);
    function give(uint, address) external;
    function cdpAllow(uint, address, uint) external;
    function urnAllow(address, uint) external;
    function frob(uint, int, int) external;
    function flux(uint, address, uint) external;
    function move(uint, address, uint) external;
    function exit(
        address,
        uint,
        address,
        uint
    ) external;
    function quit(uint, address) external;
    function enter(address, uint) external;
    function shift(uint, uint) external;
}

interface VatLike {
    function can(address, address) external view returns (uint);
    function ilks(bytes32) external view returns (uint, uint, uint, uint, uint);
    function dai(address) external view returns (uint);
    function urns(bytes32, address) external view returns (uint, uint);
    function frob(
        bytes32,
        address,
        address,
        address,
        int,
        int
    ) external;
    function hope(address) external;
    function move(address, address, uint) external;
    function gem(bytes32, address) external view returns (uint);

}

interface GemJoinLike {
    function dec() external returns (uint);
    function gem() external returns (GemLike);
    function join(address, uint) external payable;
    function exit(address, uint) external;
}

interface DaiJoinLike {
    function vat() external returns (VatLike);
    function dai() external returns (GemLike);
    function join(address, uint) external payable;
    function exit(address, uint) external;
}

interface JugLike {
    function drip(bytes32) external returns (uint);
}

interface oracleInterface {
    function read() external view returns (bytes32);
}

interface UniswapExchange {
    function getEthToTokenOutputPrice(uint256 tokensBought) external view returns (uint256 ethSold);
    function getTokenToEthOutputPrice(uint256 ethBought) external view returns (uint256 tokensSold);
    function tokenToTokenSwapOutput(
        uint256 tokensBought,
        uint256 maxTokensSold,
        uint256 maxEthSold,
        uint256 deadline,
        address tokenAddr
        ) external returns (uint256  tokensSold);
}


interface TokenInterface {
    function allowance(address, address) external view returns (uint);
    function balanceOf(address) external view returns (uint);
    function approve(address, uint) external;
    function transfer(address, uint) external returns (bool);
    function transferFrom(address, address, uint) external returns (bool);
    function deposit() external payable;
    function withdraw(uint) external;
}

interface KyberInterface {
    function trade(
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
        ) external payable returns (uint);

    function getExpectedRate(
        address src,
        address dest,
        uint srcQty
        ) external view returns (uint, uint);
}

interface SplitSwapInterface {
    function getBest(address src, address dest, uint srcAmt) external view returns (uint bestExchange, uint destAmt);
    function ethToDaiSwap(uint splitAmt, uint slippageAmt) external payable returns (uint destAmt);
    function daiToEthSwap(uint srcAmt, uint splitAmt, uint slippageAmt) external returns (uint destAmt);
}

interface InstaMcdAddress {
    function manager() external view returns (address);
    function dai() external view returns (address);
    function daiJoin() external view returns (address);
    function vat() external view returns (address);
    function jug() external view returns (address);
    function ethAJoin() external view returns (address);
}


contract DSMath {

    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "math-not-safe");
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp28); 
        pastBlockTime_tmstmp28 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp24); 
        pastBlockTime_tmstmp24 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

    function toInt(uint x) internal pure returns (int y) {
        y = int(x);
        require(y >= 0, "int-overflow");
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function toRad(uint wad) internal pure returns (uint rad) {
        rad = mul(wad, 10 ** 27);
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

}


contract Helpers is DSMath {

    /**
     * @dev get MakerDAO MCD Address contract
     */
    function getMcdAddresses() public pure returns (address mcd) {
        mcd = 0xF23196DF1C440345DE07feFbe556a5eF0dcD29F0;
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev get MakerDAO Oracle for ETH price
     */
    function getOracleAddress() public pure returns (address oracle) {
        oracle = 0x729D19f657BD0614b4985Cf1D82531c67569197B;
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp36); 
        pastBlockTime_tmstmp36 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    /**
     * @dev get ethereum address for trade
     */
    function getAddressETH() public pure returns (address eth) {
        eth = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev get dai address for trade
     */
    function getAddressDAI() public pure returns (address dai) {
        dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    /**
     * @dev get admin address
     */
    function getAddressSplitSwap() public pure returns (address payable splitSwap) {
        splitSwap = 0xc51a5024280d6AB2596e4aFFe1BDf6bDc2318da2;
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    function getVaultStats(uint cup) internal view returns (uint ethCol, uint daiDebt, uint usdPerEth) {
        address manager = InstaMcdAddress(getMcdAddresses()).manager();
        address urn = ManagerLike(manager).urns(cup);
        bytes32 ilk = ManagerLike(manager).ilks(cup);
        (ethCol, daiDebt) = VatLike(ManagerLike(manager).vat()).urns(ilk, urn);
        (,uint rate,,,) = VatLike(ManagerLike(manager).vat()).ilks(ilk);
        daiDebt = rmul(daiDebt, rate);
        usdPerEth = uint(oracleInterface(getOracleAddress()).read());
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

}


contract MakerHelpers is Helpers {

  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  event LogLock(uint vaultId, uint amtETH, address owner);
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp32); 
        pastBlockTime_tmstmp32 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }
  event LogFree(uint vaultId, uint amtETH, address owner);
  uint256 bugv_tmstmp2 = block.timestamp;
  event LogDraw(uint vaultId, uint daiAmt, address owner);
  uint256 bugv_tmstmp5 = block.timestamp;
  event LogWipe(uint vaultId, uint daiAmt, address owner);

    function setAllowance(TokenInterface _token, address _spender) internal {
        if (_token.allowance(address(this), _spender) != uint(-1)) {
            _token.approve(_spender, uint(-1));
        }
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp4); 
        pastBlockTime_tmstmp4 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function _getDrawDart(
        address vat,
        address jug,
        address urn,
        bytes32 ilk,
        uint wad
    ) internal returns (int dart)
    {
        
        uint rate = JugLike(jug).drip(ilk);

        
        uint dai = VatLike(vat).dai(urn);

        
        if (dai < mul(wad, RAY)) {
            
            dart = toInt(sub(mul(wad, RAY), dai) / rate);
            
            dart = mul(uint(dart), rate) < mul(wad, RAY) ? dart + 1 : dart;
        }
    }

    function _getWipeDart(
        address vat,
        uint dai,
        address urn,
        bytes32 ilk
    ) internal view returns (int dart)
    {
        
        (, uint rate,,,) = VatLike(vat).ilks(ilk);
        
        (, uint art) = VatLike(vat).urns(ilk, urn);

        
        dart = toInt(dai / rate);
        
        dart = uint(dart) <= art ? - dart : - toInt(art);
    }

    function joinDaiJoin(address urn, uint wad) internal {
        address daiJoin = InstaMcdAddress(getMcdAddresses()).daiJoin();
        
        
        
        DaiJoinLike(daiJoin).dai().approve(daiJoin, wad);
        
        DaiJoinLike(daiJoin).join(urn, wad);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    function lock(uint cdpNum, uint wad) internal {
        if (wad > 0) {
            address ethJoin = InstaMcdAddress(getMcdAddresses()).ethAJoin();
            address manager = InstaMcdAddress(getMcdAddresses()).manager();

            
            GemJoinLike(ethJoin).gem().deposit.value(wad)();
            
            GemJoinLike(ethJoin).gem().approve(address(ethJoin), wad);
            
            GemJoinLike(ethJoin).join(address(this), wad);
            
            VatLike(ManagerLike(manager).vat()).frob(
                ManagerLike(manager).ilks(cdpNum),
                ManagerLike(manager).urns(cdpNum),
                address(this),
                address(this),
                toInt(wad),
                0
            );
            
            emit LogLock(
                cdpNum,
                wad,
                address(this)
            );
        }
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp20); 
        pastBlockTime_tmstmp20 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function free(uint cdp, uint wad) internal {
        if (wad > 0) {
            address ethJoin = InstaMcdAddress(getMcdAddresses()).ethAJoin();
            address manager = InstaMcdAddress(getMcdAddresses()).manager();

            
            ManagerLike(manager).frob(
                cdp,
                -toInt(wad),
                0
            );
            
            ManagerLike(manager).flux(
                cdp,
                address(this),
                wad
            );
            
            GemJoinLike(ethJoin).exit(address(this), wad);
            
            GemJoinLike(ethJoin).gem().withdraw(wad);
            

            emit LogFree(
                cdp,
                wad,
                address(this)
            );
        }
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

    function draw(uint cdp, uint wad) internal {
        if (wad > 0) {
            address manager = InstaMcdAddress(getMcdAddresses()).manager();
            address jug = InstaMcdAddress(getMcdAddresses()).jug();
            address daiJoin = InstaMcdAddress(getMcdAddresses()).daiJoin();
            address urn = ManagerLike(manager).urns(cdp);
            address vat = ManagerLike(manager).vat();
            bytes32 ilk = ManagerLike(manager).ilks(cdp);
            
            ManagerLike(manager).frob(
                cdp,
                0,
                _getDrawDart(
                    vat,
                    jug,
                    urn,
                    ilk,
                    wad
                )
            );
            
            ManagerLike(manager).move(
                cdp,
                address(this),
                toRad(wad)
            );
            
            if (VatLike(vat).can(address(this), address(daiJoin)) == 0) {
                VatLike(vat).hope(daiJoin);
            }
            
            DaiJoinLike(daiJoin).exit(address(this), wad);

            emit LogDraw(
                cdp,
                wad,
                address(this)
            );
        }
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; 
	require(msg.value == 10 ether); 
        require(now != pastBlockTime_tmstmp8); 
        pastBlockTime_tmstmp8 = now;       
        if(now % 15 == 0) { 
            msg.sender.transfer(address(this).balance);
        }
    }

    function wipe(uint cdp, uint wad) internal {
        if (wad > 0) {
            address manager = InstaMcdAddress(getMcdAddresses()).manager();
            address vat = ManagerLike(manager).vat();
            address urn = ManagerLike(manager).urns(cdp);
            bytes32 ilk = ManagerLike(manager).ilks(cdp);

            address own = ManagerLike(manager).owns(cdp);
            if (own == address(this) || ManagerLike(manager).cdpCan(own, cdp, address(this)) == 1) {
                
                joinDaiJoin(urn, wad);
                
                ManagerLike(manager).frob(
                    cdp,
                    0,
                    _getWipeDart(
                        vat,
                        VatLike(vat).dai(urn),
                        urn,
                        ilk
                    )
                );
            } else {
                
                joinDaiJoin(address(this), wad);
                
                VatLike(vat).frob(
                    ilk,
                    urn,
                    address(this),
                    address(this),
                    0,
                    _getWipeDart(
                        vat,
                        wad * RAY,
                        urn,
                        ilk
                    )
                );
            }

            emit LogWipe(
                cdp,
                wad,
                address(this)
            );

        }
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

}


contract GetDetails is MakerHelpers {

    function getMax(uint cdpID) public view returns (uint maxColToFree, uint maxDaiToDraw, uint ethInUSD) {
        (uint ethCol, uint daiDebt, uint usdPerEth) = getVaultStats(cdpID);
        uint colToUSD = sub(wmul(ethCol, usdPerEth), 10);
        uint minColNeeded = add(wmul(daiDebt, 1500000000000000000), 10);
        maxColToFree = wdiv(sub(colToUSD, minColNeeded), usdPerEth);
        uint maxDebtLimit = sub(wdiv(colToUSD, 1500000000000000000), 10);
        maxDaiToDraw = sub(maxDebtLimit, daiDebt);
        ethInUSD = usdPerEth;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function getSave(uint cdpID, uint ethToSwap) public view returns (uint finalEthCol, uint finalDaiDebt, uint finalColToUSD, bool canSave) {
        (uint ethCol, uint daiDebt, uint usdPerEth) = getVaultStats(cdpID);
        (finalEthCol, finalDaiDebt, finalColToUSD, canSave) = checkSave(
            ethCol,
            daiDebt,
            usdPerEth,
            ethToSwap
        );
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    function getLeverage(
        uint cdpID,
        uint daiToSwap
    ) public view returns (
        uint finalEthCol,
        uint finalDaiDebt,
        uint finalColToUSD,
        bool canLeverage
    )
    {
        (uint ethCol, uint daiDebt, uint usdPerEth) = getVaultStats(cdpID);
        (finalEthCol, finalDaiDebt, finalColToUSD, canLeverage) = checkLeverage(
            ethCol,
            daiDebt,
            usdPerEth,
            daiToSwap
        );
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function checkSave(
        uint ethCol,
        uint daiDebt,
        uint usdPerEth,
        uint ethToSwap
    ) internal view returns
    (
        uint finalEthCol,
        uint finalDaiDebt,
        uint finalColToUSD,
        bool canSave
    )
    {
        uint colToUSD = sub(wmul(ethCol, usdPerEth), 10);
        uint minColNeeded = add(wmul(daiDebt, 1500000000000000000), 10);
        uint colToFree = wdiv(sub(colToUSD, minColNeeded), usdPerEth);
        if (ethToSwap < colToFree) {
            colToFree = ethToSwap;
        }
        (, uint expectedDAI) = SplitSwapInterface(getAddressSplitSwap()).getBest(getAddressETH(), getAddressDAI(), colToFree);
        if (expectedDAI < daiDebt) {
            finalEthCol = sub(ethCol, colToFree);
            finalDaiDebt = sub(daiDebt, expectedDAI);
            finalColToUSD = wmul(finalEthCol, usdPerEth);
            canSave = true;
        } else {
            finalEthCol = 0;
            finalDaiDebt = 0;
            finalColToUSD = 0;
            canSave = false;
        }
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function checkLeverage(
        uint ethCol,
        uint daiDebt,
        uint usdPerEth,
        uint daiToSwap
    ) internal view returns
    (
        uint finalEthCol,
        uint finalDaiDebt,
        uint finalColToUSD,
        bool canLeverage
    )
    {
        uint colToUSD = sub(wmul(ethCol, usdPerEth), 10);
        uint maxDebtLimit = sub(wdiv(colToUSD, 1500000000000000000), 10);
        uint debtToBorrow = sub(maxDebtLimit, daiDebt);
        if (daiToSwap < debtToBorrow) {
            debtToBorrow = daiToSwap;
        }
        (, uint expectedETH) = SplitSwapInterface(getAddressSplitSwap()).getBest(getAddressDAI(), getAddressETH(), debtToBorrow);
        if (ethCol != 0) {
            finalEthCol = add(ethCol, expectedETH);
            finalDaiDebt = add(daiDebt, debtToBorrow);
            finalColToUSD = wmul(finalEthCol, usdPerEth);
            canLeverage = true;
        } else {
            finalEthCol = 0;
            finalDaiDebt = 0;
            finalColToUSD = 0;
            canLeverage = false;
        }
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

}


contract Save is GetDetails {

    /**
     * @param what 2 for SAVE & 3 for LEVERAGE
     */
  uint256 bugv_tmstmp1 = block.timestamp;
  event LogTrade(
        uint what, 
        address src,
        uint srcAmt,
        address dest,
        uint destAmt,
        address beneficiary,
        uint minConversionRate,
        address affiliate
    );

  uint256 bugv_tmstmp4 = block.timestamp;
  event LogSaveVault(
        uint vaultId,
        uint srcETH,
        uint destDAI
    );

  uint256 bugv_tmstmp3 = block.timestamp;
  event LogLeverageVault(
        uint vaultId,
        uint srcDAI,
        uint destETH
    );


    function save(
        uint cdpID,
        uint colToSwap,
        uint splitAmt,
        uint slippageAmt
    ) public
    {
        (uint ethCol, uint daiDebt, uint usdPerEth) = getVaultStats(cdpID);
        uint colToFree = getColToFree(ethCol, daiDebt, usdPerEth);
        require(colToFree != 0, "no-collatral-to-free");
        if (colToSwap < colToFree) {
            colToFree = colToSwap;
        }
        free(cdpID, colToFree);
        uint ethToSwap = address(this).balance;
        ethToSwap = ethToSwap < colToFree ? ethToSwap : colToFree;
        uint destAmt = SplitSwapInterface(getAddressSplitSwap()).ethToDaiSwap.value(ethToSwap)(splitAmt, slippageAmt);
        uint finalDebt = sub(daiDebt, destAmt);
        require(finalDebt >= 20*10**18 || finalDebt == 0, "Final Debt should be min 20Dai.");
        wipe(cdpID, destAmt);

        emit LogSaveVault(cdpID, ethToSwap, destAmt);
    }

    function leverage(
        uint cdpID,
        uint daiToSwap,
        uint splitAmt,
        uint slippageAmt
    ) public
    {
        (uint ethCol, uint daiDebt, uint usdPerEth) = getVaultStats(cdpID);
        uint debtToBorrow = getDebtToBorrow(ethCol, daiDebt, usdPerEth);
        require(debtToBorrow != 0, "No-debt-to-borrow");
        if (daiToSwap < debtToBorrow) {
            debtToBorrow = daiToSwap;
        }
        draw(cdpID, debtToBorrow);
        TokenInterface(getAddressDAI()).approve(getAddressSplitSwap(), debtToBorrow);
        uint destAmt = SplitSwapInterface(getAddressSplitSwap()).daiToEthSwap(debtToBorrow, splitAmt, slippageAmt);
        lock(cdpID, destAmt);

        emit LogLeverageVault(cdpID, debtToBorrow, destAmt);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function getColToFree(uint ethCol, uint daiDebt, uint usdPerEth) internal pure returns (uint colToFree) {
        uint colToUSD = sub(wmul(ethCol, usdPerEth), 10);
        uint minColNeeded = add(wmul(daiDebt, 1500000000000000000), 10);
        colToFree = sub(wdiv(sub(colToUSD, minColNeeded), usdPerEth), 10);
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

    function getDebtToBorrow(uint ethCol, uint daiDebt, uint usdPerEth) internal pure returns (uint debtToBorrow) {
        uint colToUSD = sub(wmul(ethCol, usdPerEth), 10);
        uint maxDebtLimit = sub(wdiv(colToUSD, 1500000000000000000), 10);
        debtToBorrow = sub(maxDebtLimit, daiDebt);
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}


contract InstaMcdSave is Save {
    function() external payable {}
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
}