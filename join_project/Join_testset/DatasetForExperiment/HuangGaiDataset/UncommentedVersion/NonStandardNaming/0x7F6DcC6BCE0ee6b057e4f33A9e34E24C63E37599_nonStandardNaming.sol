                                                                 
















pragma solidity 0.5.12;

interface DSPauseAbstract {
    function DELAY291() external view returns (uint256);	
    function PLOT329(address, bytes32, bytes calldata, uint256) external;	
    function EXEC710(address, bytes32, bytes calldata, uint256) external returns (bytes memory);	
}

interface VatAbstract {
    function FILE637(bytes32, uint256) external;	
    function FILE637(bytes32, bytes32, uint256) external;	
}

contract SpellAction {

    
    
    
    
    

    address constant mcd_vat508 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	

    
    uint256 constant thousand2 = 10 ** 3;	
    uint256 constant million486  = 10 ** 6;	
    uint256 constant wad354      = 10 ** 18;	
    uint256 constant ray248      = 10 ** 27;	
    uint256 constant rad147      = 10 ** 45;	

    function EXECUTE619() external {	
                                            

        
        
        VatAbstract(mcd_vat508).FILE637("Line", 708 * million486 * rad147);

        
        
        
        
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

    
    
    
    string constant public description900 =	
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

    
    
    
    
    
    
    

    function SCHEDULE376() public {	
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY291();
        pause.PLOT329(action, tag, sig, eta);
    }

    function CAST918() public                 {	
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC710(action, tag, sig, eta);
    }
}