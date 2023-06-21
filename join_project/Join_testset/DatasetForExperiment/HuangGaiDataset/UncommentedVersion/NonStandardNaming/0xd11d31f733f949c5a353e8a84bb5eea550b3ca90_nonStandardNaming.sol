                                                                 

pragma solidity ^0.5.15;

interface IERC20 {
    function TOTALSUPPLY848() external view returns (uint256);	
    function BALANCEOF874(address account) external view returns (uint256);	
    function TRANSFER471(address recipient, uint256 amount) external returns (bool);	
    function ALLOWANCE585(address owner, address spender) external view returns (uint256);	
    function APPROVE404(address spender, uint256 amount) external returns (bool);	
    function TRANSFERFROM103(address sender, address recipient, uint256 amount) external returns (bool);	
    event TRANSFER393(address indexed from, address indexed to, uint256 value);	
    event APPROVAL641(address indexed owner, address indexed spender, uint256 value);	
}

contract Context {
    constructor () internal { }
    

    function _MSGSENDER340() internal view returns (address payable) {	
        return msg.sender;
    }

    function _MSGDATA419() internal view returns (bytes memory) {	
        this; 
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED346(address indexed previousOwner, address indexed newOwner);	

    constructor() internal {
        _owner = _MSGSENDER340();
        emit OWNERSHIPTRANSFERRED346(address(0), _owner);
    }

    function OWNER767() public view returns (address) {	
        return _owner;
    }

    modifier ONLYOWNER576() {	
        require(ISOWNER719(), "Ownable: caller is not the owner");
        _;
    }

    function ISOWNER719() public view returns (bool) {	
        return _MSGSENDER340() == _owner;
    }

    function RENOUNCEOWNERSHIP817() public ONLYOWNER576 {	
        emit OWNERSHIPTRANSFERRED346(_owner, address(0));
        _owner = address(0);
    }

    function TRANSFEROWNERSHIP576(address newOwner) public ONLYOWNER576 {	
        _TRANSFEROWNERSHIP521(newOwner);
    }

    function _TRANSFEROWNERSHIP521(address newOwner) internal {	
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED346(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    function TOTALSUPPLY848() public view returns (uint256) {	
        return _totalSupply;
    }

    function BALANCEOF874(address account) public view returns (uint256) {	
        return _balances[account];
    }

    function TRANSFER471(address recipient, uint256 amount) public returns (bool) {	
        _TRANSFER221(_MSGSENDER340(), recipient, amount);
        return true;
    }

    function ALLOWANCE585(address owner, address spender) public view returns (uint256) {	
        return _allowances[owner][spender];
    }

    function APPROVE404(address spender, uint256 amount) public returns (bool) {	
        _APPROVE847(_MSGSENDER340(), spender, amount);
        return true;
    }

    function TRANSFERFROM103(address sender, address recipient, uint256 amount) public returns (bool) {	
        _TRANSFER221(sender, recipient, amount);
        _APPROVE847(sender, _MSGSENDER340(), _allowances[sender][_MSGSENDER340()].SUB447(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE747(address spender, uint256 addedValue) public returns (bool) {	
        _APPROVE847(_MSGSENDER340(), spender, _allowances[_MSGSENDER340()][spender].ADD844(addedValue));
        return true;
    }

    function DECREASEALLOWANCE275(address spender, uint256 subtractedValue) public returns (bool) {	
        _APPROVE847(_MSGSENDER340(), spender, _allowances[_MSGSENDER340()][spender].SUB447(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER221(address sender, address recipient, uint256 amount) internal {	
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB447(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD844(amount);
        emit TRANSFER393(sender, recipient, amount);
    }

    function _MINT5(address account, uint256 amount) internal {	
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD844(amount);
        _balances[account] = _balances[account].ADD844(amount);
        emit TRANSFER393(address(0), account, amount);
    }

    function _BURN268(address account, uint256 amount) internal {	
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB447(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB447(amount);
        emit TRANSFER393(account, address(0), amount);
    }

    function _APPROVE847(address owner, address spender, uint256 amount) internal {	
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL641(owner, spender, amount);
    }

    function _BURNFROM949(address account, uint256 amount) internal {	
        _BURN268(account, amount);
        _APPROVE847(account, _MSGSENDER340(), _allowances[account][_MSGSENDER340()].SUB447(amount, "ERC20: burn amount exceeds allowance"));
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

    function NAME22() public view returns (string memory) {	
        return _name;
    }

    function SYMBOL25() public view returns (string memory) {	
        return _symbol;
    }

    function DECIMALS356() public view returns (uint8) {	
        return _decimals;
    }
}

library SafeMath {
    function ADD844(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB447(uint256 a, uint256 b) internal pure returns (uint256) {	
        return SUB447(a, b, "SafeMath: subtraction overflow");
    }

    function SUB447(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function MUL35(uint256 a, uint256 b) internal pure returns (uint256) {	
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV475(uint256 a, uint256 b) internal pure returns (uint256) {	
        return DIV475(a, b, "SafeMath: division by zero");
    }

    function DIV475(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }

    function MOD300(uint256 a, uint256 b) internal pure returns (uint256) {	
        return MOD300(a, b, "SafeMath: modulo by zero");
    }

    function MOD300(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT76(address account) internal view returns (bool) {	
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

    function TOPAYABLE355(address account) internal pure returns (address payable) {	
        return address(uint160(account));
    }

    function SENDVALUE955(address payable recipient, uint256 amount) internal {	
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER766(IERC20 token, address to, uint256 value) internal {	
        CALLOPTIONALRETURN195(token, abi.encodeWithSelector(token.TRANSFER471.selector, to, value));
    }

    function SAFETRANSFERFROM535(IERC20 token, address from, address to, uint256 value) internal {	
        CALLOPTIONALRETURN195(token, abi.encodeWithSelector(token.TRANSFERFROM103.selector, from, to, value));
    }

    function SAFEAPPROVE541(IERC20 token, address spender, uint256 value) internal {	
        require((value == 0) || (token.ALLOWANCE585(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN195(token, abi.encodeWithSelector(token.APPROVE404.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE9(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE585(address(this), spender).ADD844(value);
        CALLOPTIONALRETURN195(token, abi.encodeWithSelector(token.APPROVE404.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE120(IERC20 token, address spender, uint256 value) internal {	
        uint256 newAllowance = token.ALLOWANCE585(address(this), spender).SUB447(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN195(token, abi.encodeWithSelector(token.APPROVE404.selector, spender, newAllowance));
    }

    function CALLOPTIONALRETURN195(IERC20 token, bytes memory data) private {	
        require(address(token).ISCONTRACT76(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface WETH {
    function DEPOSIT444() external payable;	
    function WITHDRAW854(uint wad) external;	
    event DEPOSIT716(address indexed dst, uint wad);	
    event WITHDRAWAL620(address indexed src, uint wad);	
}

interface Controller {
    function WITHDRAW854(address, uint) external;	
    function BALANCEOF874(address) external view returns (uint);	
    function EARN631(address, uint) external;	
    function REWARDS863() external view returns (address);	
}

contract VaultETH {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    IERC20 public token;
    IERC20 public YFToken; 

    uint public min = 9500;
    uint public constant max555 = 10000;	

    uint public earnLowerlimit; 

    address public governance;
    address public controller;

    struct Player {
          uint256 stake;     
          uint256 payout;    
          uint256 total_out; 
    }
    mapping(address => Player) public player_; 

    struct Global {
          uint256 total_stake;        
          uint256 total_out;          
          uint256 earnings_per_share; 
    }
    mapping(uint256 => Global) public global_; 
    mapping (address => uint256) public deposittime;
    uint256 constant internal magnitude966 = 10**40; 

    address constant public yf705 = address(0x96F9632b25f874769969ff91219fCCb6ceDf26D2);	

    string public getName;

    constructor (address _token) public {
        token = IERC20(_token);
        getName = string(abi.encodePacked("yf:Vault:", ERC20Detailed(_token).NAME22()));

        YFToken = IERC20(yf705);
        governance = tx.origin;
        controller = 0xcC8d36211374a08fC61d74ed2E48e22b922C9D7C;
    }

    function BALANCE82() public view returns (uint) {	
        return token.BALANCEOF874(address(this))
               .ADD844(Controller(controller).BALANCEOF874(address(token)));
    }

    function SETMIN472(uint _min) external {	
        require(msg.sender == governance, "!governance");
        min = _min;
    }

    
    function SETGOVERNANCE780(address _governance) public {	
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    
    function SETTOKEN550(address _token) public {	
        require(msg.sender == governance, "!governance");
        token = IERC20(_token);
    }

    
    function SETCONTROLLER269(address _controller) public {	
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }

    function SETEARNLOWERLIMIT176(uint256 _earnLowerlimit) public{	
        require(msg.sender == governance, "!governance");
        earnLowerlimit = _earnLowerlimit;
    }

    
    
    function AVAILABLE632() public view returns (uint) {	
        return token.BALANCEOF874(address(this)).MUL35(min).DIV475(max555);
    }

    
    function EARN631() public {	
        uint _bal = AVAILABLE632(); 
        token.SAFETRANSFER766(controller, _bal); 
        Controller(controller).EARN631(address(token), _bal); 
    }

    
    function DEPOSIT444() public payable {	
        
        
        
        
        

        uint amount = msg.value;
        WETH(address(token)).DEPOSIT444.value(amount)(); 
        
        player_[msg.sender].stake = player_[msg.sender].stake.ADD844(amount);
        
        if (global_[0].earnings_per_share != 0) {
            player_[msg.sender].payout = player_[msg.sender].payout.ADD844(
                global_[0].earnings_per_share.MUL35(amount).SUB447(1).DIV475(magnitude966).ADD844(1) 
            );
        }
        
        global_[0].total_stake = global_[0].total_stake.ADD844(amount);
        
        if (token.BALANCEOF874(address(this)) > earnLowerlimit){
            EARN631();
        }
        
        deposittime[msg.sender] = now;
    }

    
    
    function WITHDRAW854(uint amount) external {	
        CLAIM575(); 
        require(amount <= player_[msg.sender].stake, "!balance");
        uint r = amount;

        
        uint b = token.BALANCEOF874(address(this));
        if (b < r) { 
            uint _withdraw = r.SUB447(b);
            Controller(controller).WITHDRAW854(address(token), _withdraw); 
            uint _after = token.BALANCEOF874(address(this));
            uint _diff = _after.SUB447(b);
            if (_diff < _withdraw) { 
                r = b.ADD844(_diff);
            }
        }
        
        player_[msg.sender].payout = player_[msg.sender].payout.SUB447(
              global_[0].earnings_per_share.MUL35(amount).DIV475(magnitude966)
        );
        
        player_[msg.sender].stake = player_[msg.sender].stake.SUB447(amount);
        global_[0].total_stake = global_[0].total_stake.SUB447(amount);

        
        WETH(address(token)).WITHDRAW854(r);
        address(msg.sender).transfer(r);
    }

    
    function MAKE_PROFIT59(uint256 amount) public {	
        require(amount > 0, "not 0");
        YFToken.SAFETRANSFERFROM535(msg.sender, address(this), amount); 
        global_[0].earnings_per_share = global_[0].earnings_per_share.ADD844(
            amount.MUL35(magnitude966).DIV475(global_[0].total_stake)
        );
        
        global_[0].total_out = global_[0].total_out.ADD844(amount);
    }

    
    function CAL_OUT171(address user) public view returns (uint256) {	
        uint256 _cal = global_[0].earnings_per_share.MUL35(player_[user].stake).DIV475(magnitude966);
        if (_cal < player_[user].payout) {
            return 0;
        } else {
            return _cal.SUB447(player_[user].payout);
        }
    }

    
    function CAL_OUT_PENDING499(uint256 _pendingBalance,address user) public view returns (uint256) {	
        uint256 _earnings_per_share = global_[0].earnings_per_share.ADD844(
            _pendingBalance.MUL35(magnitude966).DIV475(global_[0].total_stake)
        );
  
        uint256 _cal = _earnings_per_share.MUL35(player_[user].stake).DIV475(magnitude966);
        _cal = _cal.SUB447(CAL_OUT171(user));
        if (_cal < player_[user].payout) {
            return 0;
        } else {
            return _cal.SUB447(player_[user].payout);
        }
    }

    
    function CLAIM575() public {	
        uint256 out = CAL_OUT171(msg.sender);
        player_[msg.sender].payout = global_[0].earnings_per_share.MUL35(player_[msg.sender].stake).DIV475(magnitude966);
        player_[msg.sender].total_out = player_[msg.sender].total_out.ADD844(out);

        if (out > 0) {
            uint256 _depositTime = now - deposittime[msg.sender];
            if (_depositTime < 1 days) { 
                uint256 actually_out = _depositTime.MUL35(out).MUL35(1e18).DIV475(1 days).DIV475(1e18);
                uint256 to_team = out.SUB447(actually_out);
                YFToken.SAFETRANSFER766(Controller(controller).REWARDS863(), to_team);
                out = actually_out;
            }
            YFToken.SAFETRANSFER766(msg.sender, out);
        }
    }

    
    function () external payable {
        if (msg.sender != address(token)) {
            DEPOSIT444();
        }
    }
}