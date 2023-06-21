                                                                 

// Copyright (C) 2020 Maker Ecosystem Growth Holdings, INC.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity 0.5.12;

interface DSPauseAbstract {
    function DELAY291() external view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT329(address, bytes32, bytes calldata, uint256) external;	//inject NONSTANDARD NAMING
    function EXEC710(address, bytes32, bytes calldata, uint256) external returns (bytes memory);	//inject NONSTANDARD NAMING
}

interface VatAbstract {
    function FILE637(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE637(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {

    // MAINNET ADDRESSES
    //
    // The contracts in this list should correspond to MCD core contracts, verify
    // against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.1.0/contracts.json

    address constant mcd_vat508 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING

    // Decimals & precision
    uint256 constant thousand2 = 10 ** 3;	//inject NONSTANDARD NAMING
    uint256 constant million486  = 10 ** 6;	//inject NONSTANDARD NAMING
    uint256 constant wad354      = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray248      = 10 ** 27;	//inject NONSTANDARD NAMING
    uint256 constant rad147      = 10 ** 45;	//inject NONSTANDARD NAMING

    function EXECUTE619() external {	//inject NONSTANDARD NAMING
                                            

        // set the global debt ceiling to 708,000,000
        // 588 (current DC) + 120 (ETH-A increase)
        VatAbstract(mcd_vat508).FILE637("Line", 708 * million486 * rad147);

        // Set the ETH-A debt ceiling
        //
        // Existing debt: 420 million
        // New debt ceiling: 540 million
        uint256 ETH_A_LINE = 540 * million486 * rad147;
        VatAbstract(mcd_vat508).FILE637("ETH-A", "line", ETH_A_LINE);

    }
}

contract DssSpell {
    DSPauseAbstract public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
    address         public action;
    bytes32         public tag;
    uint256         public eta;
    bytes           public sig;
    uint256         public expiration;
    bool            public done;

    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/community/b95693cd9ac1150669e4477fd1a5faef1c79bf98/governance/votes/Executive%20vote%20-%20September%202%2C%202020.md -q -O - 2>/dev/null)"
    string constant public description900 =	//inject NONSTANDARD NAMING
        "2020-09-02 MakerDAO Executive Spell | Hash: 0xf870017b12e881587834d2de36a5cebe4c53e0d120efcc1fdbb4002bd2f15317";

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = now + 30 days;
    }

    // modifier officeHours {
    //     uint day = (now / 1 days + 3) % 7;
    //     require(day < 5, "Can only be cast on a weekday");
    //     uint hour = now / 1 hours % 24;
    //     require(hour >= 14 && hour < 21, "Outside office hours");
    //     _;
    // }

    function SCHEDULE376() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY291();
        pause.PLOT329(action, tag, sig, eta);
    }

    function CAST918() public                 {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC710(action, tag, sig, eta);
    }
}