/**
 *Submitted for verification at Etherscan.io on 2020-04-01
*/

/*
|| <11> Smart Co. Operating Agreement (SCOA) <11> ||

DEAR MSG.SENDER(S):

/ SCOA is a project in beta.

/// Entry into SCOA shall not create an attorney/client relationship.
//// Likewise, SCOA should not be construed as legal advice or replacement for professional counsel.
///

~presented by Open, ESQ || lexDAO LLC
*/

pragma solidity 0.5.14;

/***************
SMART CO. OPERATING AGREEMENT
> `Operating Agreement for Delaware Smart Co.`
***************/
contract OperatingAgreement {  
    address private proposedLexDAO;
    address payable internal lexDAO;
    uint256 internal filingFee;
    uint256 internal sigFee;
    uint256 internal version;
    string public emoji = "11";
    string internal terms;
    
    
    uint256 internal signature; 
    mapping (uint256 => Signature) internal sigs;
    
    struct Signature {  
        address signatory; 
        uint256 number;
        uint256 version;
        string terms;
        string details;
        bool filed;
    }
    
    event Amended(uint256 indexed version, string indexed terms);
    event Filed(address indexed signatory, uint256 indexed number, string indexed details);
    event Signed(address indexed signatory, uint256 indexed number, string indexed details);
    event Upgraded(address indexed signatory, uint256 indexed number, string indexed details);
    event LexDAOProposed(address indexed proposedLexDAO, string indexed details);
    event LexDAOTransferred(address indexed lexDAO, string indexed details);
    
    constructor (address payable _lexDAO, uint256 _filingFee, uint256 _sigFee, string memory _terms) public {
        lexDAO = _lexDAO;
        filingFee = _filingFee;
        sigFee = _sigFee;
        version = 1;
        terms = _terms;
    } 
    
    /***************
    SMART CO. FUNCTIONS
    ***************/
    function fileCo(uint256 number, string memory details) public payable {
        require(msg.value == filingFee);	
	    Signature storage sig = sigs[number];	
        require(msg.sender == sig.signatory);
	    
        sig.filed = true;
        
        address(lexDAO).transfer(msg.value);	
        
        emit Filed(msg.sender, number, details);
    } 
    
    function signTerms(string memory details) public payable {
        require(msg.value == sigFee);	
	    uint256 number = signature + 1; 	
	    signature = signature + 1;	
	    
        sigs[number] = Signature( 	
                msg.sender,
                number,
                version,	
                terms,	
                details,
                false);
        
        address(lexDAO).transfer(msg.value);	
        
        emit Signed(msg.sender, number, details);
    } 
    
    function upgradeSignature(uint256 number, string memory details) public payable {
        Signature storage sig = sigs[number];	
        require(msg.sender == sig.signatory);
        
        sig.version = version;	
        sig.terms = terms;	
        sig.details = details;
        
        address(lexDAO).transfer(msg.value);	
        
        emit Upgraded(msg.sender, number, details);
    } 
    
    /***************
    MGMT FUNCTIONS
    ***************/
    modifier onlyLexDAO() {
        require(msg.sender == lexDAO, "Sender not authorized.");
        _;
    }
    
    function amendTerms(string memory _terms) public onlyLexDAO {
        version = version + 1;	
        terms = _terms;	
        
        emit Amended(version, terms);	
    } 
    
    function newFilingFee(uint256 weiAmount) public onlyLexDAO {
        filingFee = weiAmount;	
    }
    
    function newSigFee(uint256 weiAmount) public onlyLexDAO {
        sigFee = weiAmount;	
    }
    
    function proposeLexDAO(address _proposedLexDAO, string memory details) public onlyLexDAO {
        proposedLexDAO = _proposedLexDAO; 	
        
        emit LexDAOProposed(proposedLexDAO, details);	
    }
    
    function transferLexDAO(string memory details) public {
        require(msg.sender == proposedLexDAO);	
        lexDAO = msg.sender; 	
        
        emit LexDAOTransferred(lexDAO, details);	
    }
}