/*
 * Kryptium Oracle Smart Contract v.1.0.0
 * Copyright 1 2018 Kryptium Team <info@kryptium.io>
 * Author: Giannis Zarifis <jzarifis@kryptium.io>
 * 
 * The Oracle smart contract is used by the House smart contract (and, in turn, 
 * the betting app) as a 1trusted source of truth1 for upcoming events and their 
 * outcomes. It is managed by an entity trusted by the owner of the House.
 *
 * This program is free to use according the Terms and Conditions available at
 * <https://kryptium.io/terms-and-conditions/>. You cannot resell it or copy any
 * part of it or modify it without permission from the Kryptium Team.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT 
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the Terms and Conditions for more details.
 */

pragma solidity ^0.5.0;

/**
 * SafeMath
 * Math operations with safety checks that throw on error
 */
contract SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b != 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function mulByFraction(uint256 number, uint256 numerator, uint256 denominator) internal pure returns (uint256) {
        return div(mul(number, numerator), denominator);
    }
}

contract Owned {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0x0));
        owner = newOwner;
    }
}

/*
 * Kryptium Oracle Smart Contract.  
 */
contract Oracle is SafeMath, Owned {

    enum EventOutputType { stringarray, numeric }

    uint private eventNextId;
    uint private subcategoryNextId;

    struct Event { 
        uint id;
        string  title;
        uint  startDateTime;   
        uint  endDateTime;
        uint  subcategoryId;   
        uint  categoryId;   
        uint closeDateTime;     
        uint freezeDateTime;
        bool isCancelled;
        string announcement;
        uint totalAvailableOutputs;
    } 

    struct EventOutcome {
        uint256 outcome1;
        uint256 outcome2;
        uint256 outcome3;
        uint256 outcome4;
        uint256 outcome5;
        uint256 outcome6;
    }



    struct EventOutput {
        bool isSet;
        string title;
        uint possibleResultsCount;
        EventOutputType  eventOutputType;
        string announcement; 
        uint decimals;
    }


    struct OracleData { 
        string  name;
        string  creatorName;
        uint  closeBeforeStartTime;   
        uint  closeEventOutcomeTime;
        uint version;      
    } 

    struct Subcategory {
        uint id;
        uint  categoryId; 
        string name;
        string country;
        bool hidden;
    }

    OracleData public oracleData;  

    // This creates an array with all sucategories
    mapping (uint => Subcategory) public subcategories;

    // This creates an array with all events
    mapping (uint => Event) public events;

    // Event output possible results
    mapping (uint =>mapping (uint => mapping (uint => bytes32))) public eventOutputPossibleResults;  

    // Event output Outcome
    mapping (uint => mapping (uint => EventOutput)) public eventOutputs;

    //Event output outcome
    mapping (uint => mapping (uint => uint)) public eventOutcome;

    //Event output outcome numeric
    mapping (uint => mapping (uint => EventOutcome)) public eventNumericOutcomes;



    // Notifies clients that a new Oracle was launched
    event OracleCreated();

    // Notifies clients that the details of an Oracle were changed
    event OraclePropertiesUpdated();    

    // Notifies clients that an Oracle subcategory was added
    event OracleSubcategoryAdded(uint id);    

    // Notifies clients that an Oracle subcategory was changed
    event OracleSubcategoryUpdated(uint id);    
    
    // Notifies clients that an Oracle Event was changed
    event UpcomingEventUpdated(uint id,uint closeDateTime);



    /**
     * Constructor function
     * Initializes Oracle contract
     */
    constructor(string memory oracleName, string memory oracleCreatorName, uint closeBeforeStartTime, uint closeEventOutcomeTime, uint version) public {
        oracleData.name = oracleName;
        oracleData.creatorName = oracleCreatorName;
        oracleData.closeBeforeStartTime = closeBeforeStartTime;
        oracleData.closeEventOutcomeTime = closeEventOutcomeTime;
        oracleData.version = version;
        emit OracleCreated();
    }

     /**
     * Update Oracle Data function
     *
     * Updates Oracle Data
     */
    function updateOracleNames(string memory newName, string memory newCreatorName) onlyOwner public {
        oracleData.name = newName;
        oracleData.creatorName = newCreatorName;
        emit OraclePropertiesUpdated();
    }    

     /**
     * Update Oracle Time Constants function
     *
     * Updates Oracle Time Constants
     */
    function setTimeConstants(uint closeBeforeStartTime, uint closeEventOutcomeTime) onlyOwner public {
        oracleData.closeBeforeStartTime = closeBeforeStartTime;
        oracleData.closeEventOutcomeTime = closeEventOutcomeTime;
        emit OraclePropertiesUpdated();
    }      


    /**
     * Adds an Oracle Subcategory
     */
    function setSubcategory(uint id, uint categoryId, string memory name,string memory country,bool hidden) onlyOwner public {
        if (id==0) {
            subcategoryNextId += 1;
            id = subcategoryNextId;
        }
        subcategories[id].id = id;
        subcategories[id].categoryId = categoryId;
        subcategories[id].name = name;
        subcategories[id].country = country;
        subcategories[id].hidden = hidden;
        emit OracleSubcategoryAdded(id);
    }  

    /**
     * Hides an Oracle Subcategory
     */
    function hideSubcategory(uint id) onlyOwner public {
        subcategories[id].hidden = true;
        emit OracleSubcategoryUpdated(id);
    }   


    /**
     * Adds an Upcoming Event
     */
    function addUpcomingEvent(uint id, string memory title, uint startDateTime, uint endDateTime, uint subcategoryId, uint categoryId, string memory outputTitle, EventOutputType eventOutputType, bytes32[] memory _possibleResults,uint decimals) onlyOwner public {        
        if (id==0) {
            eventNextId += 1;
            id = eventNextId;
        }
        
        uint closeDateTime = startDateTime - oracleData.closeBeforeStartTime * 1 minutes;
        uint freezeDateTime = endDateTime + oracleData.closeEventOutcomeTime * 1 minutes;
        require(closeDateTime >= now,"Close time should be greater than now");
        events[id].id = id;
        events[id].title = title;
        events[id].startDateTime = startDateTime;
        events[id].endDateTime = endDateTime;
        events[id].subcategoryId = subcategoryId;
        events[id].categoryId = categoryId;
        events[id].closeDateTime = closeDateTime;
        events[id].freezeDateTime = freezeDateTime;
        eventOutputs[id][0].title = outputTitle;
        eventOutputs[id][0].possibleResultsCount = _possibleResults.length;
        eventOutputs[id][0].eventOutputType = eventOutputType;
        eventOutputs[id][0].decimals = decimals;
        for (uint j = 0; j<_possibleResults.length; j++) {
            eventOutputPossibleResults[id][0][j] = _possibleResults[j];            
        }
        if (events[id].totalAvailableOutputs < 1) {
            events[id].totalAvailableOutputs = 1;
        }      
        emit UpcomingEventUpdated(id,closeDateTime);
    }  

    /**
     * Adds a new output to existing an Upcoming Event
     */
    function addUpcomingEventOutput(uint id, string memory outputTitle, EventOutputType eventOutputType, bytes32[] memory _possibleResults,uint decimals) onlyOwner public {
        require(events[id].closeDateTime >= now,"Close time should be greater than now");
        eventOutputs[id][events[id].totalAvailableOutputs].title = outputTitle;
        eventOutputs[id][events[id].totalAvailableOutputs].possibleResultsCount = _possibleResults.length;
        eventOutputs[id][events[id].totalAvailableOutputs].eventOutputType = eventOutputType;
        eventOutputs[id][events[id].totalAvailableOutputs].decimals = decimals;
        for (uint j = 0; j<_possibleResults.length; j++) {
            eventOutputPossibleResults[id][events[id].totalAvailableOutputs][j] = _possibleResults[j];
        }  
        events[id].totalAvailableOutputs += 1;             
        emit UpcomingEventUpdated(id,events[id].closeDateTime);
    }

    /**
     * Updates an Upcoming Event
     */
    function updateUpcomingEvent(uint id, string memory title, uint startDateTime, uint endDateTime, uint subcategoryId, uint categoryId) onlyOwner public {
        uint closeDateTime = startDateTime - oracleData.closeBeforeStartTime * 1 minutes;
        uint freezeDateTime = endDateTime + oracleData.closeEventOutcomeTime * 1 minutes;
        events[id].title = title;
        events[id].startDateTime = startDateTime;
        events[id].endDateTime = endDateTime;
        events[id].subcategoryId = subcategoryId;
        events[id].categoryId = categoryId;
        events[id].closeDateTime = closeDateTime;
        events[id].freezeDateTime = freezeDateTime;
        if (closeDateTime < now) {
            events[id].isCancelled = true;
        }  
        emit UpcomingEventUpdated(id,closeDateTime); 
    }     

    /**
     * Cancels an Upcoming Event
     */
    function cancelUpcomingEvent(uint id) onlyOwner public {
        require(events[id].freezeDateTime >= now,"Freeze time should be greater than now");
        events[id].isCancelled = true;
        emit UpcomingEventUpdated(id,events[id].closeDateTime); 
    }  


    /**
     * Set the numeric type outcome of Event output
     */
    function setEventOutcomeNumeric(uint eventId, uint outputId, string memory announcement, bool setEventAnnouncement, uint256 outcome1, uint256 outcome2,uint256 outcome3,uint256 outcome4, uint256 outcome5, uint256 outcome6) onlyOwner public {
        require(events[eventId].freezeDateTime > now,"Freeze time should be greater than now");
        require(!events[eventId].isCancelled,"Cancelled Event");
        require(eventOutputs[eventId][outputId].eventOutputType == EventOutputType.numeric,"Required numeric Event type");
        eventNumericOutcomes[eventId][outputId].outcome1 = outcome1;
        eventNumericOutcomes[eventId][outputId].outcome2 = outcome2;
        eventNumericOutcomes[eventId][outputId].outcome3 = outcome3;
        eventNumericOutcomes[eventId][outputId].outcome4 = outcome4;
        eventNumericOutcomes[eventId][outputId].outcome5 = outcome5;
        eventNumericOutcomes[eventId][outputId].outcome6 = outcome6;
        eventOutputs[eventId][outputId].isSet = true;
        eventOutputs[eventId][outputId].announcement = announcement;
        if (setEventAnnouncement) {
            events[eventId].announcement = announcement;
        }     
        emit UpcomingEventUpdated(eventId,events[eventId].closeDateTime); 
    }  

     /**
     * Set the outcome of Event output
     */
    function setEventOutcome(uint eventId, uint outputId, string memory announcement, bool setEventAnnouncement, uint _eventOutcome ) onlyOwner public {
        require(events[eventId].freezeDateTime > now,"Freeze time should be greater than now");
        require(!events[eventId].isCancelled,"Cancelled Event");
        require(eventOutputs[eventId][outputId].eventOutputType == EventOutputType.stringarray,"Required array of options Event type");
        eventOutputs[eventId][outputId].isSet = true;
        eventOutcome[eventId][outputId] = _eventOutcome;
        eventOutputs[eventId][outputId].announcement = announcement;
        if (setEventAnnouncement) {
            events[eventId].announcement = announcement;
        } 
        emit UpcomingEventUpdated(eventId,events[eventId].closeDateTime); 
    } 


    /**
     * set a new freeze datetime of an Event
     */
    function freezeEventOutcome(uint id, uint newFreezeDateTime) onlyOwner public {
        require(!events[id].isCancelled,"Cancelled Event");
        if (newFreezeDateTime > now) {
            events[id].freezeDateTime = newFreezeDateTime;
        } else {
            events[id].freezeDateTime = now;
        }
        emit UpcomingEventUpdated(id,events[id].closeDateTime);
    } 

    /**
     * Get event outcome numeric
     */
    function getEventOutcomeNumeric(uint eventId, uint outputId) public view returns(uint256 outcome1, uint256 outcome2,uint256 outcome3,uint256 outcome4, uint256 outcome5, uint256 outcome6) {
        require(eventOutputs[eventId][outputId].isSet && eventOutputs[eventId][outputId].eventOutputType==EventOutputType.numeric);
        return (eventNumericOutcomes[eventId][outputId].outcome1,eventNumericOutcomes[eventId][outputId].outcome2,eventNumericOutcomes[eventId][outputId].outcome3,eventNumericOutcomes[eventId][outputId].outcome4,eventNumericOutcomes[eventId][outputId].outcome5,eventNumericOutcomes[eventId][outputId].outcome6);
    }

    /**
     * Get event outcome
     */
    function getEventOutcome(uint eventId, uint outputId) public view returns(uint outcome) {
        require(eventOutputs[eventId][outputId].isSet && eventOutputs[eventId][outputId].eventOutputType==EventOutputType.stringarray);
        return (eventOutcome[eventId][outputId]);
    }

     /**
     * Get event outcome is Set
     */
    function getEventOutcomeIsSet(uint eventId, uint outputId) public view returns(bool isSet) {
        return (eventOutputs[eventId][outputId].isSet);
    }


    /**
     * Get event Info for Houses
     */
    function getEventForHousePlaceBet(uint id) public view returns(uint closeDateTime, uint freezeDateTime, bool isCancelled) {
        return (events[id].closeDateTime,events[id].freezeDateTime, events[id].isCancelled);
    }


}