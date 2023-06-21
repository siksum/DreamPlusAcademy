/**
 *Submitted for verification at Etherscan.io on 2020-04-28
*/

pragma solidity ^0.5.16;

/**
 *  @title IArbitrable
 *  @author Enrique Piqueras - <enrique@kleros.io>
 */


/** @title IArbitrable
 *  Arbitrable interface.
 *  When developing arbitrable contracts, we need to:
 *  -Define the action taken when a ruling is received by the contract.
 *  -Allow dispute creation. For this a function must call arbitrator.createDispute.value(_fee)(_choices,_extraData);
 */
interface IArbitrable {

    /** @dev To be raised when a ruling is given.
     *  @param _arbitrator The arbitrator giving the ruling.
     *  @param _disputeID ID of the dispute in the Arbitrator contract.
     *  @param _ruling The ruling which was given.
     */
    event Ruling(IArbitrator indexed _arbitrator, uint indexed _disputeID, uint _ruling);

    /** @dev Give a ruling for a dispute. Must be called by the arbitrator.
     *  The purpose of this function is to ensure that the address calling it has the right to rule on the contract.
     *  @param _disputeID ID of the dispute in the Arbitrator contract.
     *  @param _ruling Ruling given by the arbitrator. Note that 0 is reserved for "Not able/wanting to make a decision".
     */
    function rule(uint _disputeID, uint _ruling) external;
}


/**
 *  @title Arbitrator
 *  @author Cl1ment Lesaege - <clement@lesaege.com>
 */


/** @title Arbitrator
 *  Arbitrator abstract contract.
 *  When developing arbitrator contracts we need to:
 *  -Define the functions for dispute creation (createDispute) and appeal (appeal). Don't forget to store the arbitrated contract and the disputeID (which should be unique, may nbDisputes).
 *  -Define the functions for cost display (arbitrationCost and appealCost).
 *  -Allow giving rulings. For this a function must call arbitrable.rule(disputeID, ruling).
 */
interface IArbitrator {

    enum DisputeStatus {Waiting, Appealable, Solved}


    /** @dev To be emitted when a dispute is created.
     *  @param _disputeID ID of the dispute.
     *  @param _arbitrable The contract which created the dispute.
     */
    event DisputeCreation(uint indexed _disputeID, IArbitrable indexed _arbitrable);

    /** @dev To be emitted when a dispute can be appealed.
     *  @param _disputeID ID of the dispute.
     */
    event AppealPossible(uint indexed _disputeID, IArbitrable indexed _arbitrable);

    /** @dev To be emitted when the current ruling is appealed.
     *  @param _disputeID ID of the dispute.
     *  @param _arbitrable The contract which created the dispute.
     */
    event AppealDecision(uint indexed _disputeID, IArbitrable indexed _arbitrable);

    /** @dev Create a dispute. Must be called by the arbitrable contract.
     *  Must be paid at least arbitrationCost(_extraData).
     *  @param _choices Amount of choices the arbitrator can make in this dispute.
     *  @param _extraData Can be used to give additional info on the dispute to be created.
     *  @return disputeID ID of the dispute created.
     */
    function createDispute(uint _choices, bytes calldata _extraData) external payable returns(uint disputeID);

    /** @dev Compute the cost of arbitration. It is recommended not to increase it often, as it can be highly time and gas consuming for the arbitrated contracts to cope with fee augmentation.
     *  @param _extraData Can be used to give additional info on the dispute to be created.
     *  @return cost Amount to be paid.
     */
    function arbitrationCost(bytes calldata _extraData) external view returns(uint cost);

    /** @dev Appeal a ruling. Note that it has to be called before the arbitrator contract calls rule.
     *  @param _disputeID ID of the dispute to be appealed.
     *  @param _extraData Can be used to give extra info on the appeal.
     */
    function appeal(uint _disputeID, bytes calldata _extraData) external payable;

    /** @dev Compute the cost of appeal. It is recommended not to increase it often, as it can be higly time and gas consuming for the arbitrated contracts to cope with fee augmentation.
     *  @param _disputeID ID of the dispute to be appealed.
     *  @param _extraData Can be used to give additional info on the dispute to be created.
     *  @return cost Amount to be paid.
     */
    function appealCost(uint _disputeID, bytes calldata _extraData) external view returns(uint cost);

    /** @dev Compute the start and end of the dispute's current or next appeal period, if possible. If not known or appeal is impossible: should return (0, 0).
     *  @param _disputeID ID of the dispute.
     *  @return The start and end of the period.
     */
    function appealPeriod(uint _disputeID) external view returns(uint start, uint end);

    /** @dev Return the status of a dispute.
     *  @param _disputeID ID of the dispute to rule.
     *  @return status The status of the dispute.
     */
    function disputeStatus(uint _disputeID) external view returns(DisputeStatus status);

    /** @dev Return the current ruling of a dispute. This is useful for parties to know if they should appeal.
     *  @param _disputeID ID of the dispute.
     *  @return ruling The ruling which has been given or the one which will be given if there is no appeal.
     */
    function currentRuling(uint _disputeID) external view returns(uint ruling);

}



/** @title IEvidence
 *  ERC-1497: Evidence Standard
 */
interface IEvidence {

    /** @dev To be emitted when meta-evidence is submitted.
     *  @param _metaEvidenceID Unique identifier of meta-evidence.
     *  @param _evidence A link to the meta-evidence JSON.
     */
    event MetaEvidence(uint indexed _metaEvidenceID, string _evidence);

    /** @dev To be raised when evidence is submitted. Should point to the resource (evidences are not to be stored on chain due to gas considerations).
     *  @param _arbitrator The arbitrator of the contract.
     *  @param _evidenceGroupID Unique identifier of the evidence group the evidence belongs to.
     *  @param _party The address of the party submiting the evidence. Note that 0x0 refers to evidence not submitted by any party.
     *  @param _evidence A URI to the evidence JSON file whose name should be its keccak256 hash followed by .json.
     */
    event Evidence(IArbitrator indexed _arbitrator, uint indexed _evidenceGroupID, address indexed _party, string _evidence);

    /** @dev To be emitted when a dispute is created to link the correct meta-evidence to the disputeID.
     *  @param _arbitrator The arbitrator of the contract.
     *  @param _disputeID ID of the dispute in the Arbitrator contract.
     *  @param _metaEvidenceID Unique identifier of meta-evidence.
     *  @param _evidenceGroupID Unique identifier of the evidence group that is linked to this dispute.
     */
    event Dispute(IArbitrator indexed _arbitrator, uint indexed _disputeID, uint _metaEvidenceID, uint _evidenceGroupID);

}

/**
 *  @authors: [@mtsalenc]
 *  @reviewers: [@clesaege]
 *  @auditors: []
 *  @bounties: []
 *  @deployments: []
 */


/**
 * @title CappedMath
 * @dev Math operations with caps for under and overflow.
 */
library CappedMath {
    uint constant private UINT_MAX = 2**256 - 1;

    /**
     * @dev Adds two unsigned integers, returns 2^256 - 1 on overflow.
     */
    function addCap(uint _a, uint _b) internal pure returns (uint) {
        uint c = _a + _b;
        return c >= _a ? c : UINT_MAX;
    }

    /**
     * @dev Subtracts two integers, returns 0 on underflow.
     */
    function subCap(uint _a, uint _b) internal pure returns (uint) {
        if (_b > _a)
            return 0;
        else
            return _a - _b;
    }

    /**
     * @dev Multiplies two unsigned integers, returns 2^256 - 1 on overflow.
     */
    function mulCap(uint _a, uint _b) internal pure returns (uint) {
        
        
        
        if (_a == 0)
            return 0;

        uint c = _a * _b;
        return c / _a == _b ? c : UINT_MAX;
    }
}


/**
 *  @authors: [@unknownunknown1, @mtsalenc]
 *  @reviewers: [@clesaege*, @ferittuncer*, @satello*]
 *  @auditors: []
 *  @bounties: []
 *  @deployments: []
 */


no-block-members */
no-send */ 

/**
 *  @title GeneralizedTCR
 *  This contract is a curated registry for any types of items. Just like a TCR contract it features the request-challenge protocol and appeal fees crowdfunding.
 */
contract GeneralizedTCR is IArbitrable, IEvidence {
    using CappedMath for uint;

    

    enum Status {
        Absent, 
        Registered, 
        RegistrationRequested, 
        ClearingRequested 
    }

    enum Party {
        None, 
        Requester, 
        Challenger 
    }

    

    struct Item {
        bytes data; 
        Status status; 
        Request[] requests; 
    }

    
    
    
    
    struct Request {
        bool disputed; 
        uint disputeID; 
        uint submissionTime; 
        bool resolved; 
        address payable[3] parties; 
        Round[] rounds; 
        Party ruling; 
        IArbitrator arbitrator; 
        bytes arbitratorExtraData; 
        Status requestType; 
        uint metaEvidenceID; 
    }

    struct Round {
        uint[3] amountPaid; 
        bool[3] hasPaid; 
        uint feeRewards; 
        mapping(address => uint[3]) contributions; 
    }

    struct RequestID {
        bytes32 itemID; 
        uint requestIndex; 
    }

    

    IArbitrator public arbitrator; 
    bytes public arbitratorExtraData; 

    uint RULING_OPTIONS = 2; 

    address public governor; 
    uint public submissionBaseDeposit; 
    uint public removalBaseDeposit; 
    uint public submissionChallengeBaseDeposit; 
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  uint public removalChallengeBaseDeposit; 
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {
      }
	else
      {
      }
}
  uint public challengePeriodDuration; 
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {
      }
	else
      {
      }
}
  uint public metaEvidenceUpdates; 

    
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  uint public winnerStakeMultiplier; 
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  uint public loserStakeMultiplier; 
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  uint public sharedStakeMultiplier; 
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint public constant MULTIPLIER_DIVISOR = 10000; 

  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  bytes32[] public itemList; 
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  mapping(bytes32 => Item) public items; 
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(address => mapping(uint => bytes32)) public arbitratorDisputeIDToItem;  
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(bytes32 => uint) public itemIDtoIndex; 
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  mapping(uint => RequestID) public evidenceGroupIDToRequestID; 

     

    modifier onlyGovernor {require(msg.sender == governor, "The caller must be the governor."); _;}

    

    /**
     *  @dev Emitted when a party makes a request, raises a dispute or when a request is resolved.
     *  @param _itemID The ID of the affected item.
     *  @param _requestIndex The index of the request.
     *  @param _roundIndex The index of the round.
     *  @param _disputed Whether the request is disputed.
     *  @param _resolved Whether the request is executed.
     */
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  event ItemStatusChange(
      bytes32 indexed _itemID,
      uint indexed _requestIndex,
      uint indexed _roundIndex,
      bool _disputed,
      bool _resolved
    );

    /**
     *  @dev Emitted when someone submits an item for the first time.
     *  @param _itemID The ID of the new item.
     *  @param _submitter The address of the requester.
     *  @param _evidenceGroupID Unique identifier of the evidence group the evidence belongs to.
     *  @param _data The item data.
     */
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event ItemSubmitted(
      bytes32 indexed _itemID,
      address indexed _submitter,
      uint indexed _evidenceGroupID,
      bytes _data
    );

    /**
     *  @dev Emitted when someone submits a request.
     *  @param _itemID The ID of the affected item.
     *  @param _requestIndex The index of the latest request.
     *  @param _requestType Whether it is a registration or a removal request.
     */
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event RequestSubmitted(
      bytes32 indexed _itemID,
      uint indexed _requestIndex,
      Status indexed _requestType
    );

    /**
     *  @dev Emitted when a party contributes to an appeal.
     *  @param _itemID The ID of the item.
     *  @param _contributor The address making the contribution.
     *  @param _request The index of the request.
     *  @param _round The index of the round receiving the contribution.
     *  @param _amount The amount of the contribution.
     *  @param _side The party receiving the contribution.
     */
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event AppealContribution(
        bytes32 indexed _itemID,
        address indexed _contributor,
        uint indexed _request,
        uint _round,
        uint _amount,
        Party _side
    );

    /** @dev Emitted when one of the parties successfully paid its appeal fees.
     *  @param _itemID The ID of the item.
     *  @param _request The index of the request.
     *  @param _round The index of the round.
     *  @param _side The side that is fully funded.
     */
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event HasPaidAppealFee(
      bytes32 indexed _itemID,
      uint indexed _request,
      uint indexed _round,
      Party _side
    );

    /** @dev Emitted when the address of the connected TCR is set. The connected TCR is an instance of the Generalized TCR contract where each item is the address of a TCR related to this one.
     *  @param _connectedTCR The address of the connected TCR.
     */
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event ConnectedTCRSet(address indexed _connectedTCR);

    /**
     *  @dev Deploy the arbitrable curated registry.
     *  @param _arbitrator Arbitrator to resolve potential disputes. The arbitrator is trusted to support appeal periods and not reenter.
     *  @param _arbitratorExtraData Extra data for the trusted arbitrator contract.
     *  @param _connectedTCR The address of the TCR that stores related TCR addresses. This parameter can be left empty.
     *  @param _registrationMetaEvidence The URI of the meta evidence object for registration requests.
     *  @param _clearingMetaEvidence The URI of the meta evidence object for clearing requests.
     *  @param _governor The trusted governor of this contract.
     *  @param _submissionBaseDeposit The base deposit to submit an item.
     *  @param _removalBaseDeposit The base deposit to remove an item.
     *  @param _submissionChallengeBaseDeposit The base deposit to challenge a submission.
     *  @param _removalChallengeBaseDeposit The base deposit to challenge a removal request.
     *  @param _challengePeriodDuration The time in seconds parties have to challenge a request.
     *  @param _stakeMultipliers Multipliers of the arbitration cost in basis points (see MULTIPLIER_DIVISOR) as follows:
     *  - The multiplier applied to each party's fee stake for a round when there is no winner/loser in the previous round (e.g. when it's the first round or the arbitrator refused to arbitrate).
     *  - The multiplier applied to the winner's fee stake for the subsequent round.
     *  - The multiplier applied to the loser's fee stake for the subsequent round.
     */
    constructor(
        IArbitrator _arbitrator,
        bytes memory _arbitratorExtraData,
        address _connectedTCR,
        string memory _registrationMetaEvidence,
        string memory _clearingMetaEvidence,
        address _governor,
        uint _submissionBaseDeposit,
        uint _removalBaseDeposit,
        uint _submissionChallengeBaseDeposit,
        uint _removalChallengeBaseDeposit,
        uint _challengePeriodDuration,
        uint[3] memory _stakeMultipliers
    ) public {
        emit MetaEvidence(0, _registrationMetaEvidence);
        emit MetaEvidence(1, _clearingMetaEvidence);
        emit ConnectedTCRSet(_connectedTCR);

        arbitrator = _arbitrator;
        arbitratorExtraData = _arbitratorExtraData;
        governor = _governor;
        submissionBaseDeposit = _submissionBaseDeposit;
        removalBaseDeposit = _removalBaseDeposit;
        submissionChallengeBaseDeposit = _submissionChallengeBaseDeposit;
        removalChallengeBaseDeposit = _removalChallengeBaseDeposit;
        challengePeriodDuration = _challengePeriodDuration;
        sharedStakeMultiplier = _stakeMultipliers[0];
        winnerStakeMultiplier = _stakeMultipliers[1];
        loserStakeMultiplier = _stakeMultipliers[2];
    }
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}

    

    
    
    

    /** @dev Submit a request to register an item. Accepts enough ETH to cover the deposit, reimburses the rest.
     *  @param _item The data describing the item.
     */
    function addItem(bytes calldata _item) external payable {
        bytes32 itemID = keccak256(_item);
        require(items[itemID].status == Status.Absent, "Item must be absent to be added.");
        requestStatusChange(_item, submissionBaseDeposit);
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    /** @dev Submit a request to remove an item from the list. Accepts enough ETH to cover the deposit, reimburses the rest.
     *  @param _itemID The ID of the item to remove.
     *  @param _evidence A link to an evidence using its URI. Ignored if not provided.
     */
    function removeItem(bytes32 _itemID,  string calldata _evidence) external payable {
        require(items[_itemID].status == Status.Registered, "Item must be registered to be removed.");
        Item storage item = items[_itemID];

        
        if (bytes(_evidence).length > 0) {
            
            uint requestIndex = item.requests.length;
            uint evidenceGroupID = uint(keccak256(abi.encodePacked(_itemID, requestIndex)));
            evidenceGroupIDToRequestID[evidenceGroupID] = RequestID(_itemID, requestIndex);

            emit Evidence(arbitrator, evidenceGroupID, msg.sender, _evidence);
        }

        requestStatusChange(item.data, removalBaseDeposit);
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {
      }
	else
      {
      }
}

    /** @dev Challenges the request of the item. Accepts enough ETH to cover the deposit, reimburses the rest.
     *  @param _itemID The ID of the item which request to challenge.
     *  @param _evidence A link to an evidence using its URI. Ignored if not provided.
     */
    function challengeRequest(bytes32 _itemID, string calldata _evidence) external payable {
        Item storage item = items[_itemID];

        require(
            item.status == Status.RegistrationRequested || item.status == Status.ClearingRequested,
            "The item must have a pending request."
        );

        Request storage request = item.requests[item.requests.length - 1];
        require(now - request.submissionTime <= challengePeriodDuration, "Challenges must occur during the challenge period.");
        require(!request.disputed, "The request should not have already been disputed.");

        request.parties[uint(Party.Challenger)] = msg.sender;

        Round storage round = request.rounds[0];
        uint arbitrationCost = request.arbitrator.arbitrationCost(request.arbitratorExtraData);
        uint challengerBaseDeposit = item.status == Status.RegistrationRequested
            ? submissionChallengeBaseDeposit
            : removalChallengeBaseDeposit;
        uint totalCost = arbitrationCost.addCap(challengerBaseDeposit);
        contribute(round, Party.Challenger, msg.sender, msg.value, totalCost);
        require(round.amountPaid[uint(Party.Challenger)] >= totalCost, "You must fully fund your side.");
        round.hasPaid[uint(Party.Challenger)] = true;

        
        request.disputeID = request.arbitrator.createDispute.value(arbitrationCost)(RULING_OPTIONS, request.arbitratorExtraData);
        arbitratorDisputeIDToItem[address(request.arbitrator)][request.disputeID] = _itemID;
        request.disputed = true;
        request.rounds.length++;
        round.feeRewards = round.feeRewards.subCap(arbitrationCost);

        uint evidenceGroupID = uint(keccak256(abi.encodePacked(_itemID, item.requests.length - 1)));
        emit Dispute(
            request.arbitrator,
            request.disputeID,
            request.metaEvidenceID,
            evidenceGroupID
        );

        if (bytes(_evidence).length > 0) {
            evidenceGroupIDToRequestID[evidenceGroupID] = RequestID(_itemID, item.requests.length - 1);
            emit Evidence(request.arbitrator, evidenceGroupID, msg.sender, _evidence);
        }
    }

    /** @dev Takes up to the total amount required to fund a side of an appeal. Reimburses the rest. Creates an appeal if both sides are fully funded.
     *  @param _itemID The ID of the item which request to fund.
     *  @param _side The recipient of the contribution.
     */
    function fundAppeal(bytes32 _itemID, Party _side) external payable {
        require(_side == Party.Requester || _side == Party.Challenger, "Invalid party.");
        require(
            items[_itemID].status == Status.RegistrationRequested || items[_itemID].status == Status.ClearingRequested,
            "The item must have a pending request."
        );
        Request storage request = items[_itemID].requests[items[_itemID].requests.length - 1];
        require(request.disputed, "A dispute must have been raised to fund an appeal.");
        (uint appealPeriodStart, uint appealPeriodEnd) = request.arbitrator.appealPeriod(request.disputeID);
        require(
            now >= appealPeriodStart && now < appealPeriodEnd,
            "Contributions must be made within the appeal period."
        );

        
        uint multiplier;
        {
            Party winner = Party(request.arbitrator.currentRuling(request.disputeID));
            Party loser;
            if (winner == Party.Requester)
                loser = Party.Challenger;
            else if (winner == Party.Challenger)
                loser = Party.Requester;
            require(_side != loser || (now-appealPeriodStart < (appealPeriodEnd-appealPeriodStart)/2), "The loser must contribute during the first half of the appeal period.");


            if (_side == winner)
                multiplier = winnerStakeMultiplier;
            else if (_side == loser)
                multiplier = loserStakeMultiplier;
            else
                multiplier = sharedStakeMultiplier;
        }
        

        Round storage round = request.rounds[request.rounds.length - 1];
        uint appealCost = request.arbitrator.appealCost(request.disputeID, request.arbitratorExtraData);
        uint totalCost = appealCost.addCap((appealCost.mulCap(multiplier)) / MULTIPLIER_DIVISOR);
        uint contribution = contribute(round, _side, msg.sender, msg.value, totalCost);

        emit AppealContribution(
            _itemID,
            msg.sender,
            items[_itemID].requests.length - 1,
            request.rounds.length - 1,
            contribution,
            _side
        );

        if (round.amountPaid[uint(_side)] >= totalCost) {
            round.hasPaid[uint(_side)] = true;
            emit HasPaidAppealFee(_itemID, items[_itemID].requests.length - 1, request.rounds.length - 1, _side);
        }

        
        if (round.hasPaid[uint(Party.Challenger)] && round.hasPaid[uint(Party.Requester)]) {
            request.arbitrator.appeal.value(appealCost)(request.disputeID, request.arbitratorExtraData);
            request.rounds.length++;
            round.feeRewards = round.feeRewards.subCap(appealCost);
        }
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    /** @dev Reimburses contributions if no disputes were raised. If a dispute was raised, sends the fee stake rewards and reimbursements proportionally to the contributions made to the winner of a dispute.
     *  @param _beneficiary The address that made contributions to a request.
     *  @param _itemID The ID of the item submission to withdraw from.
     *  @param _request The request from which to withdraw from.
     *  @param _round The round from which to withdraw from.
     */
    function withdrawFeesAndRewards(address payable _beneficiary, bytes32 _itemID, uint _request, uint _round) public {
        Item storage item = items[_itemID];
        Request storage request = item.requests[_request];
        Round storage round = request.rounds[_round];
        require(request.resolved, "Request must be resolved.");

        uint reward;
        if (!round.hasPaid[uint(Party.Requester)] || !round.hasPaid[uint(Party.Challenger)]) {
            
            reward = round.contributions[_beneficiary][uint(Party.Requester)] + round.contributions[_beneficiary][uint(Party.Challenger)];
        } else if (request.ruling == Party.None) {
            
            uint rewardRequester = round.amountPaid[uint(Party.Requester)] > 0
                ? (round.contributions[_beneficiary][uint(Party.Requester)] * round.feeRewards) / (round.amountPaid[uint(Party.Challenger)] + round.amountPaid[uint(Party.Requester)])
                : 0;
            uint rewardChallenger = round.amountPaid[uint(Party.Challenger)] > 0
                ? (round.contributions[_beneficiary][uint(Party.Challenger)] * round.feeRewards) / (round.amountPaid[uint(Party.Challenger)] + round.amountPaid[uint(Party.Requester)])
                : 0;

            reward = rewardRequester + rewardChallenger;
        } else {
            
            reward = round.amountPaid[uint(request.ruling)] > 0
                ? (round.contributions[_beneficiary][uint(request.ruling)] * round.feeRewards) / round.amountPaid[uint(request.ruling)]
                : 0;

        }
        round.contributions[_beneficiary][uint(Party.Requester)] = 0;
        round.contributions[_beneficiary][uint(Party.Challenger)] = 0;

        _beneficiary.send(reward);
    }

    /** @dev Executes an unchallenged request if the challenge period has passed.
     *  @param _itemID The ID of the item to execute.
     */
    function executeRequest(bytes32 _itemID) external {
        Item storage item = items[_itemID];
        Request storage request = item.requests[item.requests.length - 1];
        require(
            now - request.submissionTime > challengePeriodDuration,
            "Time to challenge the request must pass."
        );
        require(!request.disputed, "The request should not be disputed.");

        if (item.status == Status.RegistrationRequested)
            item.status = Status.Registered;
        else if (item.status == Status.ClearingRequested)
            item.status = Status.Absent;
        else
            revert("There must be a request.");

        request.resolved = true;
        emit ItemStatusChange(_itemID, item.requests.length - 1, request.rounds.length - 1, false, true);

        withdrawFeesAndRewards(request.parties[uint(Party.Requester)], _itemID, item.requests.length - 1, 0); 
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /** @dev Give a ruling for a dispute. Can only be called by the arbitrator. TRUSTED.
     *  Accounts for the situation where the winner loses a case due to paying less appeal fees than expected.
     *  @param _disputeID ID of the dispute in the arbitrator contract.
     *  @param _ruling Ruling given by the arbitrator. Note that 0 is reserved for "Refused to arbitrate".
     */
    function rule(uint _disputeID, uint _ruling) public {
        Party resultRuling = Party(_ruling);
        bytes32 itemID = arbitratorDisputeIDToItem[msg.sender][_disputeID];
        Item storage item = items[itemID];

        Request storage request = item.requests[item.requests.length - 1];
        Round storage round = request.rounds[request.rounds.length - 1];
        require(_ruling <= RULING_OPTIONS, "Invalid ruling option");
        require(address(request.arbitrator) == msg.sender, "Only the arbitrator can give a ruling");
        require(!request.resolved, "The request must not be resolved.");

        
        if (round.hasPaid[uint(Party.Requester)] == true) 
            resultRuling = Party.Requester;
        else if (round.hasPaid[uint(Party.Challenger)] == true)
            resultRuling = Party.Challenger;

        emit Ruling(IArbitrator(msg.sender), _disputeID, uint(resultRuling));
        executeRuling(_disputeID, uint(resultRuling));
    }
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  
        subpot_unchk22= 0;
}

    /** @dev Submit a reference to evidence. EVENT.
     *  @param _itemID The ID of the item which the evidence is related to.
     *  @param _evidence A link to an evidence using its URI.
     */
    function submitEvidence(bytes32 _itemID, string calldata _evidence) external {
        Item storage item = items[_itemID];
        Request storage request = item.requests[item.requests.length - 1];
        require(!request.resolved, "The dispute must not already be resolved.");

        uint evidenceGroupID = uint(keccak256(abi.encodePacked(_itemID, item.requests.length - 1)));
        evidenceGroupIDToRequestID[evidenceGroupID] = RequestID(_itemID, item.requests.length - 1);
        emit Evidence(request.arbitrator, evidenceGroupID, msg.sender, _evidence);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  
        subpot_unchk10= 0;
}

    
    
    

    /** @dev Change the duration of the challenge period.
     *  @param _challengePeriodDuration The new duration of the challenge period.
     */
    function changeTimeToChallenge(uint _challengePeriodDuration) external onlyGovernor {
        challengePeriodDuration = _challengePeriodDuration;
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  
        subpot_unchk34= 0;
}

    /** @dev Change the base amount required as a deposit to submit an item.
     *  @param _submissionBaseDeposit The new base amount of wei required to submit an item.
     */
    function changeSubmissionBaseDeposit(uint _submissionBaseDeposit) external onlyGovernor {
        submissionBaseDeposit = _submissionBaseDeposit;
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  
        subpot_unchk46= 0;
}

    /** @dev Change the base amount required as a deposit to remove an item.
     *  @param _removalBaseDeposit The new base amount of wei required to remove an item.
     */
    function changeRemovalBaseDeposit(uint _removalBaseDeposit) external onlyGovernor {
        removalBaseDeposit = _removalBaseDeposit;
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /** @dev Change the base amount required as a deposit to challenge a submission.
     *  @param _submissionChallengeBaseDeposit The new base amount of wei required to challenge a submission.
     */
    function changeSubmissionChallengeBaseDeposit(uint _submissionChallengeBaseDeposit) external onlyGovernor {
        submissionChallengeBaseDeposit = _submissionChallengeBaseDeposit;
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    /** @dev Change the base amount required as a deposit to challenge a removal request.
     *  @param _removalChallengeBaseDeposit The new base amount of wei required to challenge a removal request.
     */
    function changeRemovalChallengeBaseDeposit(uint _removalChallengeBaseDeposit) external onlyGovernor {
        removalChallengeBaseDeposit = _removalChallengeBaseDeposit;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /** @dev Change the governor of the curated registry.
     *  @param _governor The address of the new governor.
     */
    function changeGovernor(address _governor) external onlyGovernor {
        governor = _governor;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    /** @dev Change the proportion of arbitration fees that must be paid as fee stake by parties when there is no winner or loser.
     *  @param _sharedStakeMultiplier Multiplier of arbitration fees that must be paid as fee stake. In basis points.
     */
    function changeSharedStakeMultiplier(uint _sharedStakeMultiplier) external onlyGovernor {
        sharedStakeMultiplier = _sharedStakeMultiplier;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    /** @dev Change the proportion of arbitration fees that must be paid as fee stake by the winner of the previous round.
     *  @param _winnerStakeMultiplier Multiplier of arbitration fees that must be paid as fee stake. In basis points.
     */
    function changeWinnerStakeMultiplier(uint _winnerStakeMultiplier) external onlyGovernor {
        winnerStakeMultiplier = _winnerStakeMultiplier;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /** @dev Change the proportion of arbitration fees that must be paid as fee stake by the party that lost the previous round.
     *  @param _loserStakeMultiplier Multiplier of arbitration fees that must be paid as fee stake. In basis points.
     */
    function changeLoserStakeMultiplier(uint _loserStakeMultiplier) external onlyGovernor {
        loserStakeMultiplier = _loserStakeMultiplier;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    /** @dev Change the arbitrator to be used for disputes that may be raised. The arbitrator is trusted to support appeal periods and not reenter.
     *  @param _arbitrator The new trusted arbitrator to be used in disputes.
     *  @param _arbitratorExtraData The extra data used by the new arbitrator.
     */
    function changeArbitrator(IArbitrator _arbitrator, bytes calldata _arbitratorExtraData) external onlyGovernor {
        arbitrator = _arbitrator;
        arbitratorExtraData = _arbitratorExtraData;
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    /** @dev Change the address of connectedTCR, the Generalized TCR instance that stores addresses of TCRs related to this one.
     *  @param _connectedTCR The address of the connectedTCR contract to use.
     */
    function changeConnectedTCR(address _connectedTCR) external onlyGovernor {
        emit ConnectedTCRSet(_connectedTCR);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /** @dev Update the meta evidence used for disputes.
     *  @param _registrationMetaEvidence The meta evidence to be used for future registration request disputes.
     *  @param _clearingMetaEvidence The meta evidence to be used for future clearing request disputes.
     */
    function changeMetaEvidence(string calldata _registrationMetaEvidence, string calldata _clearingMetaEvidence) external onlyGovernor {
        metaEvidenceUpdates++;
        emit MetaEvidence(2 * metaEvidenceUpdates, _registrationMetaEvidence);
        emit MetaEvidence(2 * metaEvidenceUpdates + 1, _clearingMetaEvidence);
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {
      }
	else
      {
      }
}

    

    /** @dev Submit a request to change item's status. Accepts enough ETH to cover the deposit, reimburses the rest.
     *  @param _item The data describing the item.
     *  @param _baseDeposit The base deposit for the request.
     */
    function requestStatusChange(bytes memory _item, uint _baseDeposit) internal {
        bytes32 itemID = keccak256(_item);
        Item storage item = items[itemID];

        
        uint evidenceGroupID = uint(keccak256(abi.encodePacked(itemID, item.requests.length)));
        if (item.requests.length == 0) {
            item.data = _item;
            itemList.push(itemID);
            itemIDtoIndex[itemID] = itemList.length - 1;

            emit ItemSubmitted(itemID, msg.sender, evidenceGroupID, item.data);
        }

        Request storage request = item.requests[item.requests.length++];
        if (item.status == Status.Absent) {
            item.status = Status.RegistrationRequested;
            request.metaEvidenceID = 2 * metaEvidenceUpdates;
        } else if (item.status == Status.Registered) {
            item.status = Status.ClearingRequested;
            request.metaEvidenceID = 2 * metaEvidenceUpdates + 1;
        }

        request.parties[uint(Party.Requester)] = msg.sender;
        request.submissionTime = now;
        request.arbitrator = arbitrator;
        request.arbitratorExtraData = arbitratorExtraData;
        request.requestType = item.status;

        Round storage round = request.rounds[request.rounds.length++];

        uint arbitrationCost = request.arbitrator.arbitrationCost(request.arbitratorExtraData);
        uint totalCost = arbitrationCost.addCap(_baseDeposit);
        contribute(round, Party.Requester, msg.sender, msg.value, totalCost);
        require(round.amountPaid[uint(Party.Requester)] >= totalCost, "You must fully fund your side.");
        round.hasPaid[uint(Party.Requester)] = true;

        emit ItemStatusChange(itemID, item.requests.length - 1, request.rounds.length - 1, false, false);
        emit RequestSubmitted(itemID, item.requests.length - 1, item.status);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    /** @dev Returns the contribution value and remainder from available ETH and required amount.
     *  @param _available The amount of ETH available for the contribution.
     *  @param _requiredAmount The amount of ETH required for the contribution.
     *  @return taken The amount of ETH taken.
     *  @return remainder The amount of ETH left from the contribution.
     */
    function calculateContribution(uint _available, uint _requiredAmount)
        internal
        pure
        returns(uint taken, uint remainder)
    {
        if (_requiredAmount > _available)
            return (_available, 0); 
        else
            return (_requiredAmount, _available - _requiredAmount);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    /** @dev Make a fee contribution.
     *  @param _round The round to contribute.
     *  @param _side The side for which to contribute.
     *  @param _contributor The contributor.
     *  @param _amount The amount contributed.
     *  @param _totalRequired The total amount required for this side.
     *  @return The amount of appeal fees contributed.
     */
    function contribute(Round storage _round, Party _side, address payable _contributor, uint _amount, uint _totalRequired) internal returns (uint) {
        
        uint contribution; 
        uint remainingETH; 
        (contribution, remainingETH) = calculateContribution(_amount, _totalRequired.subCap(_round.amountPaid[uint(_side)]));
        _round.contributions[_contributor][uint(_side)] += contribution;
        _round.amountPaid[uint(_side)] += contribution;
        _round.feeRewards += contribution;

        
        _contributor.send(remainingETH); 

        return contribution;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    /** @dev Execute the ruling of a dispute.
     *  @param _disputeID ID of the dispute in the arbitrator contract.
     *  @param _ruling Ruling given by the arbitrator. Note that 0 is reserved for "Refused to arbitrate".
     */
    function executeRuling(uint _disputeID, uint _ruling) internal {
        bytes32 itemID = arbitratorDisputeIDToItem[msg.sender][_disputeID];
        Item storage item = items[itemID];
        Request storage request = item.requests[item.requests.length - 1];

        Party winner = Party(_ruling);

        if (winner == Party.Requester) { 
            if (item.status == Status.RegistrationRequested)
                item.status = Status.Registered;
            else if (item.status == Status.ClearingRequested)
                item.status = Status.Absent;
        } else {
            if (item.status == Status.RegistrationRequested)
                item.status = Status.Absent;
            else if (item.status == Status.ClearingRequested)
                item.status = Status.Registered;
        }

        request.resolved = true;
        request.ruling = Party(_ruling);

        emit ItemStatusChange(itemID, item.requests.length - 1, request.rounds.length - 1, true, true);

        
        if (winner == Party.None) {
            withdrawFeesAndRewards(request.parties[uint(Party.Requester)], itemID, item.requests.length - 1, 0);
            withdrawFeesAndRewards(request.parties[uint(Party.Challenger)], itemID, item.requests.length - 1, 0);
        } else {
            withdrawFeesAndRewards(request.parties[uint(winner)], itemID, item.requests.length - 1, 0);
        }
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    
    
    

    /** @dev Returns the number of items that were submitted. Includes items that never made it to the list or were later removed.
     *  @return count The number of items on the list.
     */
    function itemCount() external view returns (uint count) {
        return itemList.length;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    /** @dev Gets the contributions made by a party for a given round of a request.
     *  @param _itemID The ID of the item.
     *  @param _request The request to query.
     *  @param _round The round to query.
     *  @param _contributor The address of the contributor.
     *  @return The contributions.
     */
    function getContributions(
        bytes32 _itemID,
        uint _request,
        uint _round,
        address _contributor
    ) external view returns(uint[3] memory contributions) {
        Item storage item = items[_itemID];
        Request storage request = item.requests[_request];
        Round storage round = request.rounds[_round];
        contributions = round.contributions[_contributor];
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    /** @dev Returns item's information. Includes length of requests array.
     *  @param _itemID The ID of the queried item.
     *  @return The item information.
     */
    function getItemInfo(bytes32 _itemID)
        external
        view
        returns (
            bytes memory data,
            Status status,
            uint numberOfRequests
        )
    {
        Item storage item = items[_itemID];
        return (
            item.data,
            item.status,
            item.requests.length
        );
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    /** @dev Gets information on a request made for the item.
     *  @param _itemID The ID of the queried item.
     *  @param _request The request to be queried.
     *  @return The request information.
     */
    function getRequestInfo(bytes32 _itemID, uint _request)
        external
        view
        returns (
            bool disputed,
            uint disputeID,
            uint submissionTime,
            bool resolved,
            address payable[3] memory parties,
            uint numberOfRounds,
            Party ruling,
            IArbitrator arbitrator,
            bytes memory arbitratorExtraData,
            Status requestType,
            uint metaEvidenceID
        )
    {
        Request storage request = items[_itemID].requests[_request];
        return (
            request.disputed,
            request.disputeID,
            request.submissionTime,
            request.resolved,
            request.parties,
            request.rounds.length,
            request.ruling,
            request.arbitrator,
            request.arbitratorExtraData,
            request.requestType,
            request.metaEvidenceID
        );
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    /** @dev Gets the information of a round of a request.
     *  @param _itemID The ID of the queried item.
     *  @param _request The request to be queried.
     *  @param _round The round to be queried.
     *  @return The round information.
     */
    function getRoundInfo(bytes32 _itemID, uint _request, uint _round)
        external
        view
        returns (
            bool appealed,
            uint[3] memory amountPaid,
            bool[3] memory hasPaid,
            uint feeRewards
        )
    {
        Item storage item = items[_itemID];
        Request storage request = item.requests[_request];
        Round storage round = request.rounds[_round];
        return (
            _round != (request.rounds.length - 1),
            round.amountPaid,
            round.hasPaid,
            round.feeRewards
        );
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
}

/**
 *  @authors: [@mtsalenc]
 *  @reviewers: []
 *  @auditors: []
 *  @bounties: []
 *  @deployments: []
 */

pragma solidity ^0.5.16;

/**
 *  @title BatchWithdraw
 *  Withdraw fees and rewards from contributions to disputes rounds in batches.
 */
contract BatchWithdraw {

    /** @dev Withdraws rewards and reimbursements of multiple rounds at once. This function is O(n) where n is the number of rounds. This could exceed gas limits, therefore this function should be used only as a utility and not be relied upon by other contracts.
     *  @param _address The address of the GTCR.
     *  @param _contributor The address that made contributions to the request.
     *  @param _itemID The ID of the item with funds to be withdrawn.
     *  @param _request The request from which to withdraw contributions.
     *  @param _cursor The round from where to start withdrawing.
     *  @param _count The number of rounds to iterate. If set to 0 or a value larger than the number of rounds, iterates until the last round.
     */
    function batchRoundWithdraw(
        address _address,
        address payable _contributor,
        bytes32 _itemID,
        uint _request,
        uint _cursor,
        uint _count
    ) public {
        GeneralizedTCR gtcr = GeneralizedTCR(_address);
        (,,,,,uint numberOfRounds,,,,,) = gtcr.getRequestInfo(_itemID, _request);
        for (uint i = _cursor; i < numberOfRounds && (_count == 0 || i < _count); i++)
            gtcr.withdrawFeesAndRewards(_contributor, _itemID, _request, i);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    /** @dev Withdraws rewards and reimbursements of multiple requests at once. This function is O(n*m) where n is the number of requests and m is the number of rounds to withdraw per request. This could exceed gas limits, therefore this function should be used only as a utility and not be relied upon by other contracts.
     *  @param _address The address of the GTCR.
     *  @param _contributor The address that made contributions to the request.
     *  @param _itemID The ID of the item with funds to be withdrawn.
     *  @param _cursor The request from which to start withdrawing.
     *  @param _count The number of requests to iterate. If set to 0 or a value larger than the number of request, iterates until the last request.
     *  @param _roundCursor The round of each request from where to start withdrawing.
     *  @param _roundCount The number of rounds to iterate on each request. If set to 0 or a value larger than the number of rounds a request has, iteration for that request will stop at the last round.
     */
    function batchRequestWithdraw(
        address _address,
        address payable _contributor,
        bytes32 _itemID,
        uint _cursor,
        uint _count,
        uint _roundCursor,
        uint _roundCount
    ) external {
        GeneralizedTCR gtcr = GeneralizedTCR(_address);
        (
            ,
            ,
            uint numberOfRequests
        ) = gtcr.getItemInfo(_itemID);
        for (uint i = _cursor; i < numberOfRequests && (_count == 0 || i < _count); i++)
            batchRoundWithdraw(_address, _contributor, _itemID, i, _roundCursor, _roundCount);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
}