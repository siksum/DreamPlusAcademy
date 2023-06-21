# Vulnerable_Smart_Contract

## 사례 ListUp

- re-entrancy list: https://github.com/pcaversaccio/reentrancy-attacks
- SCV list in Defi: https://github.com/sirhashalot/SCV-List/blob/main/README.md
- SCV list: https://github.com/kadenzipfel/smart-contract-vulnerabilities/tree/master/vulnerabilities

### Access Control Exploit

### [Real World]

- Value DeFi (v)
  https://bscscan.com/address/0x7a8ac384d3a9086afcc13eb58e90916f17affc89#code
  https://bscscan.com/address/0xD4BBF439d3EAb5155Ca7c0537E583088fB4CFCe8#code
- DAO Maker (v)
  - 소스 공개 x
  - bytecode decompile
    https://etherscan.io/bytecode-decompiler?a=0xf17ca0e0f24a5fa27944275fa0cedec24fbf8ee2
- Safemoon (v)
  https://bscscan.com/address/0xeb11a0a0bef1ac028b8c2d4cd64138dd5938ca7a#code%23L1737
- LaunchZone (v)
  - 소스 공개 x
- Visor Finance (v)
  https://etherscan.io/address/0xc9f27a50f82571c1c8423a42970613b8dbda14ef#code
- Dexible (v)
  https://etherscan.io/address/0x33e690aEa97E4Ef25F0d140F1bf044d663091DAf#code
- joyn (v)
  https://github.com/code-423n4/2022-03-joyn/blob/main/core-contracts/contracts/CoreCollection.sol#L78-L97
- Rikkei Finance (v)
  https://bscscan.com/address/0xd55f01b4b51b7f48912cd8ca3cdd8070a1a9dba5#code%23F1%23L29
- Ragnarok Online Invasion (v)
  https://www.bscscan.com/address/0xe48b75dc1b131fd3a8364b0580f76efd04cf6e9c#code#L175
- UERII Token (v)
  https://etherscan.io/address/0x418c24191ae947a78c99fdc0e45a1f96afb254be#code%23L493
- Parity Multisig (v)
  https://etherscan.io/address/0x863df6bfa4469f3ead0be8f9f2aae51c91a907b4#code
- Crema
- Poly Network
- DODO

### [Example]

- bank.sol
  https://gist.github.com/RealJohnnyTime/23066d3ac3c6f93738567432f5522e82#file-access-control-solidity-sol
- whitelist.sol
  https://goerli.etherscan.io/address/0x53bd8eafb67605c22a9e1a327aab6479583844f9#code

### Price Oracle

[Price Oracle List]

1. Chainlink - Chainlink provides reliable and accurate price data for a wide range of assets through its decentralized price oracle network.
2. Band Protocol - Band Protocol offers a decentralized price oracle platform that aggregates data from various sources to ensure accurate pricing.
3. Tellor - Tellor provides an easy-to-use decentralized oracle solution for fetching data from off-chain sources, including price data.
4. API3 - API3 is a decentralized API platform that can be used to fetch off-chain data, including real-time price data.
5. Uma - Uma offers a decentralized oracle platform that provides on-demand pricing for various assets using its Optimistic Oracle mechanism.

- Aave V3
  https://medium.com/@hacxyk/aave-v3s-price-oracle-manipulation-vulnerability-168e44e9e374
- BonqDAO
  https://medium.com/immunefi/hack-analysis-bonqdao-february-2023-ef6aab0086d6
- Sturdy
  https://ftmscan.com/address/0xa26a6F2eB4Bc7005aF8eA5a1dd5B7bc1d8973592#code
- Sense -> oracle data 조작가능함(근데 oracle 구현 소스의 취약점은 아닌 것 같음)
  https://github.com/sense-finance/space-v1/commit/3d8f53e5d9788670b2f8d29786024fb361aa642a

### Math Mistake
- Wyvern
  https://github.com/wyvernprotocol/wyvern-v3/blob/master/contracts/lib/ArrayUtils.sol


### Re-entrancy

### [Real World]

[dforce audit report]
github: https://github.com/dforce-network/documents/tree/master/audit_report
docs: https://docs.dforce.network/
medium: https://medium.com/dforcenet

- Lendf.me (dForce) - read only
  https://github.com/OpenZeppelin/exploit-uniswap/tree/master/contracts
  https://etherscan.io/address/0x0eEe3E3828A45f7601D5F54bF49bB01d1A9dF5ea#code
- dForce
  https://etherscan.io/bytecode-decompiler?a=0x538359785a8d5ab1a741a0ba94f26a800759d91d
- dForce Network (v)
  https://arbiscan.io/address/0x6eb2dc694eb516b16dc9fbc678c60052bbdd7d80#code
- The DAO (v)
- Sentiment (v) - read only
  https://github.com/balancer/balancer-v2-monorepo/blob/554b907aa49391210db7a6b032c48a7e24455ca9/pkg/vault/contracts/PoolBalances.sol#L108
- Orion
  https://etherscan.io/address/0xb5599f568D3f3e6113B286d010d2BCa40A7745AA#code
- Dynamic
  https://bscscan.com/address/0xa7B5eabC3Ee82c585f5F4ccC26b81c3Bd62Ff3a9#code
- Paribus
  https://arbiscan.io/address/0x375Ae76F0450293e50876D0e5bDC3022CAb23198#code
- Abracadabra Money white hat
  https://arbiscan.io/address/0x1aDDD80E6039594eE970E5872D247bf0414C8903#code
- 2Pi Network
  https://optimistic.etherscan.io/address/0x6a5143b943578C18b9D28e7Acc123BBd7aac3282#code
- Midas Capital
  https://polygonscan.com/address/0xe150e792e0a18C9984a0630f051a607dEe3c265d#code
- Jaypeggers
  https://etherscan.io/address/0xf2919D1D80Aff2940274014bef534f7791906FF2#code
- Defrost Finance
  https://snowtrace.io/address/0xfF152e21C5A511c478ED23D1b89Bb9391bE6de96#code
- n00dleSwap
  https://etherscan.io/address/0x3561081260186E69369E6C32F280836554292E08#code
- QuickSwap Lend
  https://polygonscan.com/address/0x3dC7E6FF0fB79770FA6FB05d1ea4deACCe823943#code
- Thunder Brawl
  https://bscscan.com/address/0xae191Ca19F0f8E21d754c6CAb99107eD62B6fe53#code
- DFX Finance
  https://etherscan.io/address/0x46161158b1947D9149E066d6d31AF1283b2d377C#code
- Ownly
  https://www.bscscan.com/address/0x421f30419D6c1D7573C1F57546A631f2f89D7E92#code
- Fei Protocol
  https://etherscan.io/address/0x26267e41CeCa7C8E0f143554Af707336f27Fa051#code
- BNB Brokers
  https://bscscan.com/address/0x2C67f86D91BA3cA559c6d2825d9dbD00C5A90e4B#code
- Voltage Finance
  https://explorer.fuse.io/address/0xa722c13135930332Eb3d749B2F0906559D2C5b99/contracts#address-tabs
- Hundred Finance
  https://gnosisscan.io/address/0x8e15a22853A0A60a0FBB0d875055A8E66cff0235#contracts
- Paraluni
  https://bscscan.com/address/0x633Fa755a83B015cCcDc451F82C57EA0Bd32b4B4#code
- Bacon Protocol
  https://etherscan.io/address/0xb8919522331C59f5C16bDfAA6A121a6E03A91F62#code
- HyperBears
  https://etherscan.io/address/0x14e0a1F310E2B7E321c91f58847e98b8C802f6eF#code
- Grim Finance
  https://ftmscan.com/address/0x660184CE8AF80e0B1e5A1172A16168b15f4136bF#code
- CreatureToadz
  https://etherscan.io/address/0xA4631A191044096834Ce65d1EE86b16b171D8080#code
- C.R.E.A.M Finance
  https://etherscan.io/address/0xD06527D5e56A3495252A528C4987003b712860eE#code
- XSURGE
  https://www.bscscan.com/address/0xE1E1Aa58983F6b8eE8E4eCD206ceA6578F036c21#code
- Sanshu Inu
  https://etherscan.io/address/0x35C674C288577Df3e9b5dafEF945795b741c7810#code
- DeFiPie
  https://bscscan.com/address/0xd6eAC7cf547002d289dC85954Ec0ABE217A9b80D#code
- PolyDex
  https://polygonscan.com/address/0x28151Ba48963019ddB509FbB6D5761F3494b3828#code
- Iron Finance
  https://polygonscan.com/address/0xa37DD1f62661EB18c338f18Cf797cff8b5102d8e#code
- BurgerSwap
  https://bscscan.com/address/0x7ac55ac530f2C29659573Bde0700c6758D69e677#code
- Rari Capital
  https://etherscan.io/address/0x67B66C99D3Eb37Fa76Aa3Ed1ff33E8e39F0b9c7A#code
- Akropolis
  https://etherscan.io/address/0x73fC3038B4cD8FfD07482b92a52Ea806505e5748#code
  exploit: https://github.com/ethereumvex/Akropolis-delphi-exploit
- SpankChain
  https://etherscan.io/address/0xf91546835f756DA0c10cFa0CDA95b15577b84aA7#code
- Revest Finance
  https://etherscan.io/address/0x2320A28f52334d62622cc2EaFa15DE55F9987eD9#code
- Siren Protocol
  https://polygonscan.com/address/0xC3F7250f458E86a4BD19D0819550aC0b17902BdC#code
- Omni Protocol -> double reentrancy
  https://etherscan.io/address/0x2F131C4DAd4Be81683ABb966b4DE05a549144443#code
  https://etherscan.io/address/0x50c7a557d408a5f5a7fdbe1091831728ae7eba45#code
  PoC: https://github.com/immunefi-team/hack-analysis-pocs/blob/main/src/omni-july-2022/Attacker.sol
- Curve
  https://chainsecurity.com/curve-lp-oracle-manipulation-post-mortem/
- Mai Finance (Read-Only Re-Entrancy)
  https://medium.com/@ambergroup/mai-finances-oracle-manipulation-vulnerability-explained-55e4b5cc2b82

### [Example]

- https://github.com/dappuniversity/Reentrancy-attack-Smart-Contract-Security/tree/master
