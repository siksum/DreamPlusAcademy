pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER775(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE489(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM60(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY7() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF599(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE579(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER890(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL499(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                   
library SafeMath {
                                                                                  
    function MUL36(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV74(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB610(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD668(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD922(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}





                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY7() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF599(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE579(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER775(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER658(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE489(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE551(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM60(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER658(from, to, value);
        _APPROVE551(from, msg.sender, _allowed[from][msg.sender].SUB610(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE740(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE551(msg.sender, spender, _allowed[msg.sender][spender].ADD668(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE710(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE551(msg.sender, spender, _allowed[msg.sender][spender].SUB610(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER658(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB610(value);
        _balances[to] = _balances[to].ADD668(value);
        emit TRANSFER890(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT302(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD668(value);
        _balances[account] = _balances[account].ADD668(value);
        emit TRANSFER890(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN359(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB610(value);
        _balances[account] = _balances[account].SUB610(value);
        emit TRANSFER890(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE551(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL499(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM795(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN359(account, value);
        _APPROVE551(account, msg.sender, _allowed[account][msg.sender].SUB610(value));
    }
}


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED763(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED763(address(0), _owner);
    }

                                                        
    function OWNER127() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER697() {	//inject NONSTANDARD NAMING
        require(ISOWNER870());
        _;
    }

                                                                                 
    function ISOWNER870() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP638() public ONLYOWNER697 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED763(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP436(address newOwner) public ONLYOWNER697 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP172(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP172(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED763(_owner, newOwner);
        _owner = newOwner;
    }
}




                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME346() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL348() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS958() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}






contract ClickGemToken is ERC20, Ownable, ERC20Detailed {
	uint public initialSupply = 120000000000;
	mapping (address => uint256) public freezeList;
	

	mapping (address => LockItem[]) public lockList;
	
    struct LockItem {
		uint256  time;
		uint256  amount;
	}
	
	constructor() public ERC20Detailed("ClickGem Token", "CGMT", 18) 
	{  
		_MINT302(msg.sender, initialSupply*1000000000000000000);
	}

	function FREEZE84(address freezeAddress) public ONLYOWNER697 returns (bool done)	//inject NONSTANDARD NAMING
	{
		freezeList[freezeAddress]=1;
		return ISFREEZE244(freezeAddress);
    	}

	function UNFREEZE479(address freezeAddress) public ONLYOWNER697 returns (bool done)	//inject NONSTANDARD NAMING
	{
		delete freezeList[freezeAddress];
		return !ISFREEZE244(freezeAddress); 
	}

	function ISFREEZE244(address freezeAddress) public view returns (bool isFreezed) 	//inject NONSTANDARD NAMING
	{
		return freezeList[freezeAddress]==1;
	}



	function ISLOCKED380(address lockedAddress) public view returns (bool isLockedAddress)	//inject NONSTANDARD NAMING
	{
		if(lockList[lockedAddress].length>0)
		{
		    for(uint i=0; i< lockList[lockedAddress].length; i++)
		    {
		        if(lockList[lockedAddress][i].time - now > 0)
		        return true;
		    }
		}
		return false;
	}

	function TRANSFER775(address _receiver, uint256 _amount) public returns (bool success)	//inject NONSTANDARD NAMING
	{
		require(!ISFREEZE244(msg.sender));
	    if(!ISLOCKED380(_receiver)){
		    uint256 remain = BALANCEOF599(msg.sender).SUB610(_amount);
		    require(remain>=GETLOCKEDAMOUNT688(msg.sender));
		}
        return ERC20.TRANSFER775(_receiver, _amount);
	}

	function TRANSFERANDLOCK120(address _receiver, uint256 _amount, uint256 time) public returns (bool success)	//inject NONSTANDARD NAMING
	{
        TRANSFER775(_receiver, _amount);
    	LockItem memory item = LockItem({amount:_amount, time:time+now});
		lockList[_receiver].push(item);
        return true;
	}
	
	function GETLOCKEDLISTSIZE42(address lockedAddress) public view returns(uint256 _lenght)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress].length;
	}
	
	function GETLOCKEDAMOUNTAT413(address lockedAddress, uint8 index) public view returns(uint256 _amount)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress][index].amount;
	}
	
	function GETLOCKEDTIMEAT31(address lockedAddress, uint8 index) public view returns(uint256 _time)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress][index].time.SUB610(now);
	}
	
	function GETLOCKEDAMOUNT688(address lockedAddress) public view returns(uint256 _amount)	//inject NONSTANDARD NAMING
	{
	    uint256 lockedAmount =0;
	    if(ISLOCKED380(lockedAddress))
	    {
	       for(uint8 j=0;j<lockList[lockedAddress].length;j++)
	       {
	        if(GETLOCKEDTIMEAT31(lockedAddress, j) > now )
	        {
	            lockedAmount=lockedAmount.ADD668(GETLOCKEDAMOUNTAT413(lockedAddress, j));
	        }
	       }
	    }
	    return lockedAmount;
	}


}