                                                                 

pragma solidity 0.5.17;

interface IMoloch {
    function GETPROPOSALFLAGS713(uint256 proposalId) external view returns (bool[6] memory);	//inject NONSTANDARD NAMING
    
    function SUBMITPROPOSAL221(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        string calldata details
    ) external returns (uint256);
    
    function WITHDRAWBALANCE715(address token, uint256 amount) external;	//inject NONSTANDARD NAMING
}

contract Minion {
    IMoloch public mol;
    address public molochApprovedToken;
    string public constant minion_action_details167 = '{"isMinion": true, "title":"MINION", "description":"';	//inject NONSTANDARD NAMING
    mapping (uint256 => Action) public actions; // proposalId => Action

    struct Action {
        uint256 value;
        address to;
        address proposer;
        bool executed;
        bytes data;
    }

    event ACTIONPROPOSED944(uint256 proposalId, address proposer);	//inject NONSTANDARD NAMING
    event ACTIONEXECUTED9(uint256 proposalId, address executor);	//inject NONSTANDARD NAMING

    constructor(address _moloch, address _molochApprovedToken) public {
        mol = IMoloch(_moloch);
        molochApprovedToken = _molochApprovedToken;
    }

    // withdraw funds from the moloch
    function DOWITHDRAW306(address _token, uint256 _amount) public {	//inject NONSTANDARD NAMING
        mol.WITHDRAWBALANCE715(_token, _amount);
    }

    function PROPOSEACTION126(	//inject NONSTANDARD NAMING
        address _actionTo,
        uint256 _actionValue,
        bytes memory _actionData,
        string memory _description
    )
        public
        returns (uint256)
    {
        // No calls to zero address allows us to check that Minion submitted
        // the proposal without getting the proposal struct from the moloch
        require(_actionTo != address(0), "Minion::invalid _actionTo");

        string memory details = string(abi.encodePacked(minion_action_details167, _description, '"}'));

        uint256 proposalId = mol.SUBMITPROPOSAL221(
            address(this),
            0,
            0,
            0,
            molochApprovedToken,
            0,
            molochApprovedToken,
            details
        );

        Action memory action = Action({
            value: _actionValue,
            to: _actionTo,
            proposer: msg.sender,
            executed: false,
            data: _actionData
        });

        actions[proposalId] = action;

        emit ACTIONPROPOSED944(proposalId, msg.sender);
        return proposalId;
    }

    function EXECUTEACTION483(uint256 _proposalId) public returns (bytes memory) {	//inject NONSTANDARD NAMING
        Action memory action = actions[_proposalId];
        bool[6] memory flags = mol.GETPROPOSALFLAGS713(_proposalId);

        // minion did not submit this proposal
        require(action.to != address(0), "Minion::invalid _proposalId");
        // can't call arbitrary functions on parent moloch
        require(action.to != address(mol), "Minion::invalid target");
        require(!action.executed, "Minion::action executed");
        require(address(this).balance >= action.value, "Minion::insufficient eth");
        require(flags[2], "Minion::proposal not passed");

        // execute call
        actions[_proposalId].executed = true;
        (bool success, bytes memory retData) = action.to.call.value(action.value)(action.data);
        require(success, "Minion::call failure");
        emit ACTIONEXECUTED9(_proposalId, msg.sender);
        return retData;
    }

    function() external payable { }
}