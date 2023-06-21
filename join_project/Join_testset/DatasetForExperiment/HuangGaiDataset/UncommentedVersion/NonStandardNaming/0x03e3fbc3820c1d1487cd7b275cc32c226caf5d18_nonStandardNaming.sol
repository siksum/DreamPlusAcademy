                                                                 

pragma solidity ^0.5.16;

interface IERC165 {
    function SUPPORTSINTERFACE144(bytes4 interfaceId) external view returns (bool);	
}

pragma solidity ^0.5.16;

contract IERC721 is IERC165 {
    event TRANSFER855(address indexed from, address indexed to, uint256 indexed tokenId);	
    event APPROVAL930(address indexed owner, address indexed approved, uint256 indexed tokenId);	
    event APPROVALFORALL419(address indexed owner, address indexed operator, bool approved);	

    function BALANCEOF115(address owner) public view returns (uint256 balance);	
    function OWNEROF963(uint256 tokenId) public view returns (address owner);	
    function APPROVE127(address to, uint256 tokenId) public;	
    function GETAPPROVED174(uint256 tokenId) public view returns (address operator);	
    function SETAPPROVALFORALL881(address operator, bool _approved) public;	
    function ISAPPROVEDFORALL959(address owner, address operator) public view returns (bool);	
    function TRANSFERFROM308(address from, address to, uint256 tokenId) public;	
    function SAFETRANSFERFROM84(address from, address to, uint256 tokenId) public;	
    function SAFETRANSFERFROM84(address from, address to, uint256 tokenId, bytes memory data) public;	
}

pragma solidity ^0.5.16;

contract IERC721Receiver {
    function ONERC721RECEIVED239(address operator, address from, uint256 tokenId, bytes memory data)	
    public returns (bytes4);
}

pragma solidity ^0.5.16;

library SafeMath {
    function MUL529(uint256 a, uint256 b) internal pure returns (uint256) {	
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }

    function DIV215(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function SUB945(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b <= a);
        uint256 c = a - b;
        return c;
    }

    function ADD190(uint256 a, uint256 b) internal pure returns (uint256) {	
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MOD417(uint256 a, uint256 b) internal pure returns (uint256) {	
        require(b != 0);
        return a % b;
    }
}

pragma solidity ^0.5.16;

library Address {
    function ISCONTRACT615(address account) internal view returns (bool) {	
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

pragma solidity ^0.5.16;

contract ERC165 is IERC165 {
    bytes4 private constant _interface_id_erc165431 = 0x01ffc9a7;	
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        _REGISTERINTERFACE598(_interface_id_erc165431);
    }

    function SUPPORTSINTERFACE144(bytes4 interfaceId) external view returns (bool) {	
        return _supportedInterfaces[interfaceId];
    }

    function _REGISTERINTERFACE598(bytes4 interfaceId) internal {	
        require(interfaceId != 0xffffffff);
        _supportedInterfaces[interfaceId] = true;
    }
}

pragma solidity ^0.5.16;

contract ERC721 is ERC165, IERC721 {
    using SafeMath for uint256;
    using Address for address;

    bytes4 private constant _erc721_received752 = 0x150b7a02;	
    mapping (uint256 => address) private _tokenOwner;
    mapping (uint256 => address) private _tokenApprovals;
    mapping (address => uint256) private _ownedTokensCount;
    mapping (address => mapping (address => bool)) private _operatorApprovals;
    bytes4 private constant _interface_id_erc721544 = 0x80ac58cd;	

    constructor () public {
        _REGISTERINTERFACE598(_interface_id_erc721544);
    }

    function BALANCEOF115(address owner) public view returns (uint256) {	
        require(owner != address(0));
        return _ownedTokensCount[owner];
    }

    function OWNEROF963(uint256 tokenId) public view returns (address) {	
        address owner = _tokenOwner[tokenId];
        require(owner != address(0));
        return owner;
    }

    function APPROVE127(address to, uint256 tokenId) public {	
        address owner = OWNEROF963(tokenId);
        require(to != owner);
        require(msg.sender == owner || ISAPPROVEDFORALL959(owner, msg.sender));

        _tokenApprovals[tokenId] = to;
        emit APPROVAL930(owner, to, tokenId);
    }

    function GETAPPROVED174(uint256 tokenId) public view returns (address) {	
        require(_EXISTS816(tokenId));
        return _tokenApprovals[tokenId];
    }

    function SETAPPROVALFORALL881(address to, bool approved) public {	
        require(to != msg.sender);
        _operatorApprovals[msg.sender][to] = approved;
        emit APPROVALFORALL419(msg.sender, to, approved);
    }

    function ISAPPROVEDFORALL959(address owner, address operator) public view returns (bool) {	
        return _operatorApprovals[owner][operator];
    }

    function TRANSFERFROM308(address from, address to, uint256 tokenId) public {	
        require(_ISAPPROVEDOROWNER678(msg.sender, tokenId));
        _TRANSFERFROM605(from, to, tokenId);
    }

    function SAFETRANSFERFROM84(address from, address to, uint256 tokenId) public {	
        SAFETRANSFERFROM84(from, to, tokenId, "");
    }

    function SAFETRANSFERFROM84(address from, address to, uint256 tokenId, bytes memory _data) public {	
        TRANSFERFROM308(from, to, tokenId);
        require(_CHECKONERC721RECEIVED864(from, to, tokenId, _data));
    }

    function _EXISTS816(uint256 tokenId) internal view returns (bool) {	
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _ISAPPROVEDOROWNER678(address spender, uint256 tokenId) internal view returns (bool) {	
        address owner = OWNEROF963(tokenId);
        return (spender == owner || GETAPPROVED174(tokenId) == spender || ISAPPROVEDFORALL959(owner, spender));
    }

    function _MINT293(address to, uint256 tokenId) internal {	
        require(to != address(0));
        require(!_EXISTS816(tokenId));

        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to] = _ownedTokensCount[to].ADD190(1);

        emit TRANSFER855(address(0), to, tokenId);
    }

    function _TRANSFERFROM605(address from, address to, uint256 tokenId) internal {	
        require(OWNEROF963(tokenId) == from);
        require(to != address(0));

        _CLEARAPPROVAL965(tokenId);

        _ownedTokensCount[from] = _ownedTokensCount[from].SUB945(1);
        _ownedTokensCount[to] = _ownedTokensCount[to].ADD190(1);
        _tokenOwner[tokenId] = to;

        emit TRANSFER855(from, to, tokenId);
    }

    function _CHECKONERC721RECEIVED864(address from, address to, uint256 tokenId, bytes memory _data)	
        internal returns (bool)
    {
        if (!to.ISCONTRACT615()) {
            return true;
        }

        bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED239(msg.sender, from, tokenId, _data);
        return (retval == _erc721_received752);
    }

    function _CLEARAPPROVAL965(uint256 tokenId) private {	
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }

    function UINT2STR531(uint i) internal pure returns (string memory){	
        if (i == 0) return "0";
        uint j = i;
        uint length;
        while (j != 0){
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length - 1;
        while (i != 0){
            bstr[k--] = byte(uint8(48 + i % 10));
            i /= 10;
        }
        return string(bstr);
    }

    function STRCONCAT808(string memory _a, string memory _b) internal pure returns (string memory) {	
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        string memory ab = new string(_ba.length + _bb.length);
        bytes memory bab = bytes(ab);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) bab[k++] = _ba[i];
        for (uint j = 0; j < _bb.length; j++) bab[k++] = _bb[j];
        return string(bab);
    }

}

pragma solidity ^0.5.16;

contract IERC721Enumerable is IERC721 {
    function TOTALSUPPLY82() public view returns (uint256);	
    function TOKENOFOWNERBYINDEX792(address owner, uint256 index) public view returns (uint256 tokenId);	
    function TOKENBYINDEX259(uint256 index) public view returns (uint256);	
}

pragma solidity ^0.5.16;

contract ERC721Enumerable is ERC165, ERC721, IERC721Enumerable {

    mapping(address => uint256[]) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;
    uint256[] private _allTokens;
    mapping(uint256 => uint256) private _allTokensIndex;
    bytes4 private constant _interface_id_erc721_enumerable764 = 0x780e9d63;	

    constructor () public {
        _REGISTERINTERFACE598(_interface_id_erc721_enumerable764);
    }

    function TOKENOFOWNERBYINDEX792(address owner, uint256 index) public view returns (uint256) {	
        require(index < BALANCEOF115(owner));
        return _ownedTokens[owner][index];
    }

    function TOTALSUPPLY82() public view returns (uint256) {	
        return _allTokens.length;
    }

    function TOKENBYINDEX259(uint256 index) public view returns (uint256) {	
        require(index < TOTALSUPPLY82());
        return _allTokens[index];
    }

    function _TRANSFERFROM605(address from, address to, uint256 tokenId) internal {	
        super._TRANSFERFROM605(from, to, tokenId);
        _REMOVETOKENFROMOWNERENUMERATION324(from, tokenId);
        _ADDTOKENTOOWNERENUMERATION66(to, tokenId);
    }

    function _MINT293(address to, uint256 tokenId) internal {	
        super._MINT293(to, tokenId);
        _ADDTOKENTOOWNERENUMERATION66(to, tokenId);
        _ADDTOKENTOALLTOKENSENUMERATION481(tokenId);
    }

    function _TOKENSOFOWNER73(address owner) internal view returns (uint256[] storage) {	
        return _ownedTokens[owner];
    }

    function _ADDTOKENTOOWNERENUMERATION66(address to, uint256 tokenId) private {	
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

    function _ADDTOKENTOALLTOKENSENUMERATION481(uint256 tokenId) private {	
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function _REMOVETOKENFROMOWNERENUMERATION324(address from, uint256 tokenId) private {	
        uint256 lastTokenIndex = _ownedTokens[from].length.SUB945(1);
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];
            _ownedTokens[from][tokenIndex] = lastTokenId;
            _ownedTokensIndex[lastTokenId] = tokenIndex;
        }

        _ownedTokens[from].length--;
    }

    function _REMOVETOKENFROMALLTOKENSENUMERATION766(uint256 tokenId) private {	

        uint256 lastTokenIndex = _allTokens.length.SUB945(1);
        uint256 tokenIndex = _allTokensIndex[tokenId];
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId;
        _allTokensIndex[lastTokenId] = tokenIndex;

        _allTokens.length--;
        _allTokensIndex[tokenId] = 0;
    }
}

pragma solidity ^0.5.16;

contract IERC721Metadata is IERC721 {
    function NAME649() external view returns (string memory);	
    function SYMBOL749() external view returns (string memory);	
    function TOKENURI919(uint256 tokenId) external view returns (string memory);	
}


pragma solidity ^0.5.16;

contract ERC721Metadata is ERC165, ERC721, IERC721Metadata {

    string private _name;
    string private _symbol;

    bytes4 private constant _interface_id_erc721_metadata962 = 0x5b5e139f;	

    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _REGISTERINTERFACE598(_interface_id_erc721_metadata962);
    }

    function NAME649() external view returns (string memory) {	
        return _name;
    }

    function SYMBOL749() external view returns (string memory) {	
        return _symbol;
    }

    function TOKENURI919(uint256 tokenId) external view returns (string memory) {	
        require(_EXISTS816(tokenId));
        string memory infoUrl;
        infoUrl = STRCONCAT808('https:
        return infoUrl;
    }
}

pragma solidity ^0.5.16;

contract ERC721Full is ERC721, ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
    }
}

pragma solidity ^0.5.16;

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    function ADD190(Role storage role, address account) internal {	
        require(account != address(0));
        require(!HAS361(role, account));

        role.bearer[account] = true;
    }

    function REMOVE147(Role storage role, address account) internal {	
        require(account != address(0));
        require(HAS361(role, account));

        role.bearer[account] = false;
    }

    function HAS361(Role storage role, address account) internal view returns (bool) {	
        require(account != address(0));
        return role.bearer[account];
    }
}

pragma solidity ^0.5.16;


contract MinterRole {
    using Roles for Roles.Role;
    event MINTERADDED355(address indexed account);	
    event MINTERREMOVED84(address indexed account);	

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER947(msg.sender);
    }

    modifier ONLYMINTER648() {	
        require(ISMINTER759(msg.sender));
        _;
    }

    function ISMINTER759(address account) public view returns (bool) {	
        return _minters.HAS361(account);
    }

    function ADDMINTER458(address account) public ONLYMINTER648 {	
        _ADDMINTER947(account);
    }

    function RENOUNCEMINTER211() public {	
        _REMOVEMINTER645(msg.sender);
    }

    function _ADDMINTER947(address account) internal {	
        _minters.ADD190(account);
        emit MINTERADDED355(account);
    }

    function _REMOVEMINTER645(address account) internal {	
        _minters.REMOVE147(account);
        emit MINTERREMOVED84(account);
    }
}

pragma solidity ^0.5.16;

contract ERC721Mintable is ERC721, MinterRole {

    function MINT640(address to, uint256 tokenId) public ONLYMINTER648 returns (bool) {	
        _MINT293(to, tokenId);
        return true;
    }
}


pragma solidity ^0.5.16;

contract Ownable {
    address private _owner;
    event OWNERSHIPTRANSFERRED762(address indexed previousOwner, address indexed newOwner);	

    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED762(address(0), _owner);
    }

    function OWNER459() public view returns (address) {	
        return _owner;
    }

    modifier ONLYOWNER722() {	
        require(ISOWNER410());
        _;
    }

    function ISOWNER410() public view returns (bool) {	
        return msg.sender == _owner;
    }

    function RENOUNCEOWNERSHIP134() public ONLYOWNER722 {	
        emit OWNERSHIPTRANSFERRED762(_owner, address(0));
        _owner = address(0);
    }

    function TRANSFEROWNERSHIP502(address newOwner) public ONLYOWNER722 {	
        _TRANSFEROWNERSHIP831(newOwner);
    }

    function _TRANSFEROWNERSHIP831(address newOwner) internal {	
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED762(_owner, newOwner);
        _owner = newOwner;
    }
}


pragma solidity ^0.5.16;

contract dfimoney is ERC721Full, ERC721Mintable, Ownable {
    using SafeMath for uint256;
    uint256 private tid = 10001;

    constructor (string memory _name, string memory _symbol) public
        ERC721Mintable()
        ERC721Full(_name, _symbol){
    }

    function TRANSFER637(address _to, uint256 _tokenId) public {	
        SAFETRANSFERFROM84(msg.sender, _to, _tokenId);
    }

    function TRANSFERALL628(address _to, uint256[] memory _tokenId) public {	
        for (uint i = 0; i < _tokenId.length; i++) {
            SAFETRANSFERFROM84(msg.sender, _to, _tokenId[i]);
        }
    }

    function BATCHMINT463(address _to, uint256[] memory _tokenId) public ONLYMINTER648{	
        for (uint i = 0; i < _tokenId.length; i++) {
            _MINT293(_to, _tokenId[i]);
        }
    }

    function BATCHADDRMINT884(address[] memory _to, uint256 _tokenId) public ONLYMINTER648{	
        for (uint i = 0; i < _to.length; i++) {
            _MINT293(_to[i], _tokenId.ADD190(i));
        }
    }

    function CLAIM891() public {	
        _MINT293(msg.sender,tid);
        tid = tid.ADD190(1);
    }

    function RESET945(uint256 _newtid) public ONLYMINTER648{	
        tid = _newtid;
    }

    function GETTID924() external view returns (uint256) {	
        return tid;
    }

    function DRAW89() public ONLYOWNER722{	
        msg.sender.transfer(address(this).balance);
    }

    function () external{
        CLAIM891();
    }

}