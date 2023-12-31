// Copyright (C) 2020 Zerion Inc. <https://zerion.io>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

pragma solidity 0.6.5;
pragma experimental ABIEncoderV2;

import { ERC20 } from "../../ERC20.sol";
import { ProtocolAdapter } from "../ProtocolAdapter.sol";


/**
 * @dev StakingRewards contract interface.
 * Only the functions required for YearnStakingV1Adapter contract are added.
 * The StakingRewards contract is available here
 * github.com/Synthetixio/synthetix/blob/master/contracts/StakingRewards.sol.
 */
interface StakingRewards {
    function earned(address) external view returns (uint256);
}


/**
 * @title Adapter for C.R.E.A.M. protocol.
 * @dev Implementation of ProtocolAdapter interface.
 * @author Igor Sobolev <sobolev@zerion.io>
 */
contract CreamStakingAdapter is ProtocolAdapter {

    string public constant override adapterType = "Asset";

    string public constant override tokenType = "ERC20";

    address internal constant BALANCER_CREAM_WETH = 0x5a82503652d05B21780f33178FDF53d31c29B916;
    address internal constant UNISWAP_CREAM_WETH = 0xddF9b7a31b32EBAF5c064C80900046C9e5b7C65F;
    address internal constant CREAM_CREAM_USDC = 0x4Fd2d9d6eF05E13Bf0B167509151A4EC3D4d4b93;
    address internal constant CREAM_CREAM_WETH = 0xa49b3c7C260ce8A7C665e20Af8aA6E099A86cf8A;
    address internal constant CREAM_CRCREAM_CRYFI = 0xA65405e0dD378C65308deAE51dA9e3BcEBb81261;
    address internal constant CREAM_CRYETH_CRYYCRV = 0xB3284F2F22563F27cEF2912637b6A00F162317c4;
    address internal constant CREAM_CRYETH_WETH = 0x6a3B875854f5518E85Ef97620c5e7de75bbc3fA0;
    address internal constant CREAM_YYCRV_USDC = 0x661b94d96ADb18646e791A06576F7905a8d1BEF6;
    address internal constant CREAM_YFI_USDC = 0x7350c6D00D63AB5988250aea347f277c19BEA785;
    address internal constant CREAM_UNI_WETH = 0x02566303A0E860EC66D3B79168459978B1b00C8e;
    address internal constant CREAM_UNI_CREAM = 0x408e75C26e6182476940ece5b0Ba6491b4F13359;
    address internal constant CREAM_CYUSD_CREAM = 0xaAF841fd6409c136FA4b960e22A92B45B26c9b41;
    address internal constant CYUSD = 0x1D09144F3479bb805CB7c92346987420BcbDC10C;
    address internal constant CRCREAM = 0x892B14321a4FCba80669aE30Bd0cd99a7ECF6aC0;
    address internal constant CREAM = 0x2ba592F78dB6436527729929AAf6c908497cB200;

    address internal constant BALANCER_CREAM_WETH_POOL = 0xCcD5cb3401704AF8462a4FFE708a180d3C5c4Da0;
    address internal constant BALANCER_CREAM_WETH_POOL_2 = 0xc29E89845fA794Aa0A0B8823de23B760c3d766F5;
    address internal constant UNISWAP_CREAM_WETH_POOL = 0x65bC20147E2cA6F3bf0819c38E519F8792043b36;
    address internal constant CREAM_CREAM_USDC_POOL = 0x1676fc274B65966ED0c6438a26d34c6C92A5981C;
    address internal constant CREAM_CREAM_WETH_POOL = 0x43a8ecE49718E22D21077000768afF91849BCEfF;
    address internal constant CREAM_CRCREAM_CRYFI_POOL = 0xCC5f8cA88cAbA27f15746aeb481F0C446991F863;
    address internal constant CREAM_CRYETH_CRYYCRV_POOL = 0xD032BfeDC68CE5067E3E0b766Dbcf653ceEA541a;
    address internal constant CREAM_CRYETH_WETH_POOL = 0xCF679b2E16498a866Bd4CBda60d42f208084c6E1;
    address internal constant CREAM_YYCRV_USDC_POOL = 0xB8c3a282De181889EF20488e73e7A149a8C1bFe1;
    address internal constant CREAM_YFI_USDC_POOL = 0x2aB765c2B4A4E197fBAE769f86870F2310A04D61;
    address internal constant CREAM_UNI_WETH_POOL = 0xe539416a21F6D7eF7e143f1435484d333c274480;
    address internal constant CREAM_UNI_CREAM_POOL = 0x1E5fe7bAd3672D0d0cc041B7154331EE461C3349;
    address internal constant CREAM_CYUSD_CREAM_POOL = 0xAE76E0D0C4767E94Eb2898f42A96696Ae0061cEA;
    address internal constant CREAM_1_YEAR_POOL = 0x780F75ad0B02afeb6039672E6a6CEDe7447a8b45;
    address internal constant CREAM_2_YEAR_POOL = 0xBdc3372161dfd0361161e06083eE5D52a9cE7595;
    address internal constant CREAM_3_YEAR_POOL = 0xD5586C1804D2e1795f3FBbAfB1FBB9099ee20A6c;
    address internal constant CREAM_4_YEAR_POOL = 0xE618C25f580684770f2578FAca31fb7aCB2F5945;
    address internal constant CYUSD_POOL = 0x0b471a71c3f6d4aADc7eb20AaB7D730Ae385e150;
    address internal constant CRCREAM_POOL = 0x3ba3C0e8a9E5F4a01ce8e086B3d8e8a603a2129E;

    /**
     * @return Amount of staked tokens / rewards earned after staking for a given account.
     * @dev Implementation of ProtocolAdapter interface function.
     */
    function getBalance(address token, address account) external view override returns (uint256) {
        if (token == CREAM) {
            uint256 totalRewards = 0;

            totalRewards += ERC20(CREAM_1_YEAR_POOL).balanceOf(account);
            totalRewards += ERC20(CREAM_2_YEAR_POOL).balanceOf(account);
            totalRewards += ERC20(CREAM_3_YEAR_POOL).balanceOf(account);
            totalRewards += ERC20(CREAM_4_YEAR_POOL).balanceOf(account);

            totalRewards += StakingRewards(BALANCER_CREAM_WETH_POOL).earned(account);
            totalRewards += StakingRewards(BALANCER_CREAM_WETH_POOL_2).earned(account);
            totalRewards += StakingRewards(UNISWAP_CREAM_WETH_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CREAM_USDC_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CREAM_WETH_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CRCREAM_CRYFI_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CRYETH_CRYYCRV_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CRYETH_WETH_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_YYCRV_USDC_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_YFI_USDC_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_UNI_WETH_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_UNI_CREAM_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_CYUSD_CREAM_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_1_YEAR_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_2_YEAR_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_3_YEAR_POOL).earned(account);
            totalRewards += StakingRewards(CREAM_4_YEAR_POOL).earned(account);
            totalRewards += StakingRewards(CYUSD_POOL).earned(account);
            totalRewards += StakingRewards(CRCREAM_POOL).earned(account);

            return totalRewards;
        } else if (token == BALANCER_CREAM_WETH) {
            uint256 totalBalance = 0;

            totalBalance += ERC20(BALANCER_CREAM_WETH_POOL).balanceOf(account);
            totalBalance += ERC20(BALANCER_CREAM_WETH_POOL_2).balanceOf(account);

            return totalBalance;
        } else if (token == UNISWAP_CREAM_WETH) {
            return ERC20(UNISWAP_CREAM_WETH_POOL).balanceOf(account);
        } else if (token == CREAM_CREAM_USDC) {
            return ERC20(CREAM_CREAM_USDC_POOL).balanceOf(account);
        } else if (token == CREAM_CREAM_WETH) {
            return ERC20(CREAM_CREAM_WETH_POOL).balanceOf(account);
        } else if (token == CREAM_CRCREAM_CRYFI) {
            return ERC20(CREAM_CRCREAM_CRYFI_POOL).balanceOf(account);
        } else if (token == CREAM_CRYETH_CRYYCRV) {
            return ERC20(CREAM_CRYETH_CRYYCRV_POOL).balanceOf(account);
        } else if (token == CREAM_CRYETH_WETH) {
            return ERC20(CREAM_CRYETH_WETH_POOL).balanceOf(account);
        } else if (token == CREAM_YYCRV_USDC) {
            return ERC20(CREAM_YYCRV_USDC_POOL).balanceOf(account);
        } else if (token == CREAM_YFI_USDC) {
            return ERC20(CREAM_YFI_USDC_POOL).balanceOf(account);
        } else if (token == CRCREAM) {
            return ERC20(CRCREAM_POOL).balanceOf(account);
        } else if (token == CREAM_UNI_WETH) {
            return ERC20(CREAM_UNI_WETH_POOL).balanceOf(account);
        } else if (token == CREAM_UNI_CREAM) {
            return ERC20(CREAM_UNI_CREAM_POOL).balanceOf(account);
        } else if (token == CREAM_CYUSD_CREAM) {
            return ERC20(CREAM_CYUSD_CREAM_POOL).balanceOf(account);
        } else if (token == CYUSD) {
            return ERC20(CYUSD_POOL).balanceOf(account);
        } else {
            return 0;
        }
    }
}