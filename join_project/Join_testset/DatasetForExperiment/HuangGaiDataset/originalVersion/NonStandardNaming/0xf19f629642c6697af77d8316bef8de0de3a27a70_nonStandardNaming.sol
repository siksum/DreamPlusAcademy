pragma solidity ^0.5.10;

                
                                                 
                                                                        
                                                                             
                                                                         
                                                                               
                                                                       
                                                                               
                                                               
contract Owned {

    address public owner;
    address public newOwnerCandidate;

    event OWNERSHIPREQUESTED189(address indexed by, address indexed to);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED658(address indexed from, address indexed to);	//inject NONSTANDARD NAMING
    event OWNERSHIPREMOVED540();	//inject NONSTANDARD NAMING

                                                                                
    constructor() public {
        owner = msg.sender;
    }

                                                                           
                
    modifier ONLYOWNER505() {	//inject NONSTANDARD NAMING
        require (msg.sender == owner);
        _;
    }
    
                                                                                
                                                                                
                                          
                                                                             
                  
                                                                             
    function PROPOSEOWNERSHIP509(address _newOwnerCandidate) public ONLYOWNER505 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = _newOwnerCandidate;
        emit OWNERSHIPREQUESTED189(msg.sender, newOwnerCandidate);
    }

                                                                          
                              
    function ACCEPTOWNERSHIP892() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);

        address oldOwner = owner;
        owner = newOwnerCandidate;
        newOwnerCandidate = address(0);

        emit OWNERSHIPTRANSFERRED658(oldOwner, owner);
    }

                                                                              
                                                                             
                                                                                
                                                     
    function CHANGEOWNERSHIP937(address _newOwner) public ONLYOWNER505 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));

        address oldOwner = owner;
        owner = _newOwner;
        newOwnerCandidate = address(0);

        emit OWNERSHIPTRANSFERRED658(oldOwner, owner);
    }

                                                                              
                                                                               
                                                                               
                                                                            
                                                                       
    function REMOVEOWNERSHIP369(address _dac) public ONLYOWNER505 {	//inject NONSTANDARD NAMING
        require(_dac == address(0xdAc0000000000000000000000000000000000000));
        owner = address(0);
        newOwnerCandidate = address(0);
        emit OWNERSHIPREMOVED540();     
    }
} 

                                                                      
                                                                           
                                                                               
                                                                             
                    
contract Escapable is Owned {
    address public escapeHatchCaller;
    address payable public escapeHatchDestination;
    mapping (address=>bool) private escapeBlacklist; // Token contract addresses

                                                                            
                            
                                                                              
                                                                          
                                                                            
                                                          
                                                                            
                                                                                
                                                    
                                                    
    constructor(address _escapeHatchCaller, address payable _escapeHatchDestination) public {
        escapeHatchCaller = _escapeHatchCaller;
        escapeHatchDestination = _escapeHatchDestination;
    }

                                                                        
                                                                           
    modifier ONLYESCAPEHATCHCALLEROROWNER459 {	//inject NONSTANDARD NAMING
        require ((msg.sender == escapeHatchCaller)||(msg.sender == owner));
        _;
    }

                                                                             
                                                                               
                                                                               
                                                                           
    function BLACKLISTESCAPETOKEN80(address _token) internal {	//inject NONSTANDARD NAMING
        escapeBlacklist[_token] = true;
        emit ESCAPEHATCHBLACKISTEDTOKEN756(_token);
    }

                                                                       
                                                     
                                                                               
                                             
    function ISTOKENESCAPABLE907(address _token) view public returns (bool) {	//inject NONSTANDARD NAMING
        return !escapeBlacklist[_token];
    }

                                                                               
                                                                    
                                                    
    function ESCAPEHATCH73(address _token) public ONLYESCAPEHATCHCALLEROROWNER459 {   	//inject NONSTANDARD NAMING
        require(escapeBlacklist[_token]==false);

        uint256 balance;

                                
        if (_token == address(0)) {
            balance = address(this).balance;
            escapeHatchDestination.transfer(balance);
            emit ESCAPEHATCHCALLED166(_token, balance);
            return;
        }
                                 
        ERC20 token = ERC20(_token);
        balance = token.BALANCEOF879(address(this));
        require(token.TRANSFER614(escapeHatchDestination, balance));
        emit ESCAPEHATCHCALLED166(_token, balance);
    }

                                                                    
                                                                        
                                                                               
                                                                                 
                                                          
    function CHANGEHATCHESCAPECALLER16(address _newEscapeHatchCaller) public ONLYESCAPEHATCHCALLEROROWNER459 {	//inject NONSTANDARD NAMING
        escapeHatchCaller = _newEscapeHatchCaller;
    }

    event ESCAPEHATCHBLACKISTEDTOKEN756(address token);	//inject NONSTANDARD NAMING
    event ESCAPEHATCHCALLED166(address token, uint amount);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

                                            
                          
                                                                               
                               

contract DAppNodePackageDirectory is Owned,Escapable {

                                                                                
                                                                               
                                                               
                                           
    struct DAppNodePackage {
        uint128 position;
        uint128 status;
        string name;
    }

    bytes32 public featured;
    DAppNodePackage[] DAppNodePackages;

    event PACKAGEADDED506(uint indexed idPackage, string name);	//inject NONSTANDARD NAMING
    event PACKAGEUPDATED908(uint indexed idPackage, string name);	//inject NONSTANDARD NAMING
    event STATUSCHANGED637(uint idPackage, uint128 newStatus);	//inject NONSTANDARD NAMING
    event POSITIONCHANGED582(uint idPackage, uint128 newPosition);	//inject NONSTANDARD NAMING
    event FEATUREDCHANGED444(bytes32 newFeatured);	//inject NONSTANDARD NAMING

                                                                            
                            
                                                                              
                                                                          
                                                                            
                                                          
                                                                            
                                                                                
                                                    
                                                    
    constructor(
        address _escapeHatchCaller,
        address payable _escapeHatchDestination
    ) 
        Escapable(_escapeHatchCaller, _escapeHatchDestination)
        public
    {
    }

                                          
                                               
                                           
                                                       
                                                
    function ADDPACKAGE561 (	//inject NONSTANDARD NAMING
        string memory name,
        uint128 status,
        uint128 position
    ) public ONLYOWNER505 returns(uint idPackage) {
        idPackage = DAppNodePackages.length++;
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.name = name;
        if (position == 0) {
            c.position = uint128(1000 * (idPackage + 1));
        } else {
            c.position = position;
        }
        c.status = status;
        // An event to notify that a new package has been added
        emit PACKAGEADDED506(idPackage, name);
    }

                                         
                                                            
                                                   
                                           
                                                       
    function UPDATEPACKAGE216 (	//inject NONSTANDARD NAMING
        uint idPackage,
        string memory name,
        uint128 status,
        uint128 position
    ) public ONLYOWNER505 {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.name = name;
        c.position = position;
        c.status = status;
        // An event to notify that a package has been updated
        emit PACKAGEUPDATED908(idPackage, name);
    }

                                                       
                                                            
                                                      
    function CHANGESTATUS670(	//inject NONSTANDARD NAMING
        uint idPackage,
        uint128 newStatus
    ) public ONLYOWNER505 {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.status = newStatus;
        emit STATUSCHANGED637(idPackage, newStatus);
    }

                                                       
                                                            
                                                                   
    function CHANGEPOSITION91(	//inject NONSTANDARD NAMING
        uint idPackage,
        uint128 newPosition
    ) public ONLYOWNER505 {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.position = newPosition;
        emit POSITIONCHANGED582(idPackage, newPosition);
    }
    
    
                                                           
                                                              
                                                              
    function SWITCHPOSITION276(	//inject NONSTANDARD NAMING
        uint idPackage1,
        uint idPackage2
    ) public ONLYOWNER505 {
        require(idPackage1 < DAppNodePackages.length);
        require(idPackage2 < DAppNodePackages.length);

        DAppNodePackage storage p1 = DAppNodePackages[idPackage1];
        DAppNodePackage storage p2 = DAppNodePackages[idPackage2];
        
        uint128 tmp = p1.position;
        p1.position = p2.position;
        p2.position = tmp;
        emit POSITIONCHANGED582(idPackage1, p1.position);
        emit POSITIONCHANGED582(idPackage2, p2.position);

    }

                                                    
                                                                 
                                                                
    function CHANGEFEATURED984(	//inject NONSTANDARD NAMING
        bytes32 _featured
    ) public ONLYOWNER505 {
        featured = _featured;
        emit FEATUREDCHANGED444(_featured);
    }

                                                             
                                                            
                                                
                                                
    function GETPACKAGE66(uint idPackage) public view returns (	//inject NONSTANDARD NAMING
        string memory name,
        uint128 status,
        uint128 position
    ) {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        name = c.name;
        status = c.status;
        position = c.position;
    }

                                                                           
                                                     
    function NUMBEROFDAPPNODEPACKAGES316() view public returns (uint) {	//inject NONSTANDARD NAMING
        return DAppNodePackages.length;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           








                                                                                                                                                   
contract ERC20 {
  
                                           
    function TOTALSUPPLY495() public view returns (uint256 supply);	//inject NONSTANDARD NAMING

                                                                           
    function BALANCEOF879(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                             
    function TRANSFER614(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                                
    function TRANSFERFROM797(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                                              
    function APPROVE163(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                                       
    function ALLOWANCE882(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER61(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL96(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

}