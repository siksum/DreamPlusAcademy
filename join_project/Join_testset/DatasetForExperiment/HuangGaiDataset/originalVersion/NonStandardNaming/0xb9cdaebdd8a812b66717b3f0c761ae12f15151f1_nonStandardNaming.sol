pragma solidity ^0.5.7;

// Wesion Service Nodes Fund

                         
contract Ownable {
    address internal _owner;

    event OWNERSHIPTRANSFERRED303(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED303(address(0), _owner);
    }

                                                        
    function OWNER248() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER723() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP298(address newOwner) external ONLYOWNER723 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED303(_owner, newOwner);
    }

                                                                                                                                                                                                                      
    function RESCUETOKENS384(address tokenAddr, address receiver, uint256 amount) external ONLYOWNER723 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF897(address(this));

        require(balance >= amount);
        assert(_token.TRANSFER130(receiver, amount));
    }

                                          
    function WITHDRAWETHER144(address payable to, uint256 amount) external ONLYOWNER723 {	//inject NONSTANDARD NAMING
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
}


                                                                                   
interface IERC20{
    function BALANCEOF897(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER130(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}


                                           
contract WesionServiceNodesFund is Ownable{
    IERC20 public Wesion;

    event DONATE6(address indexed account, uint256 amount);	//inject NONSTANDARD NAMING

                                       
    constructor() public {
        Wesion = IERC20(0x2c1564A74F07757765642ACef62a583B38d5A213);
    }

                                  
    function () external payable {
        emit DONATE6(msg.sender, msg.value);
    }

                                           
    function TRANSFERWESION636(address to, uint256 amount) external ONLYOWNER723 {	//inject NONSTANDARD NAMING
        assert(Wesion.TRANSFER130(to, amount));
    }

                                          
    function BATCHTRANSFER229(address[] memory accounts, uint256[] memory values) public ONLYOWNER723 {	//inject NONSTANDARD NAMING
        require(accounts.length == values.length);
        for (uint256 i = 0; i < accounts.length; i++) {
            assert(Wesion.TRANSFER130(accounts[i], values[i]));
        }
    }

                                              
    function SETWESIONADDRESS941(address _WesionAddr) public ONLYOWNER723 {	//inject NONSTANDARD NAMING
        Wesion = IERC20(_WesionAddr);
    }
}