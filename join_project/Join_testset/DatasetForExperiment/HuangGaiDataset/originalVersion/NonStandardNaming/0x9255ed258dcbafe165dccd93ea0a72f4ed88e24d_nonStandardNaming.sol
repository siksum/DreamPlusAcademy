                                                                 

                                                                 

pragma solidity ^0.5.12;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal {

    }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER759() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA870() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                       
interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                        
    function SUPPORTSINTERFACE341(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

                                                                   
contract IERC721 is IERC165 {
    event TRANSFER203(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL229(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL686(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF156(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                
    function OWNEROF281(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                       
    function SAFETRANSFERFROM88(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                              
    function TRANSFERFROM799(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function APPROVE879(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function GETAPPROVED228(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL701(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL406(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING


    function SAFETRANSFERFROM88(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}

                                                                                                                                                        
contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function ONERC721RECEIVED206(address operator, address from, uint256 tokenId, bytes memory data)	//inject NONSTANDARD NAMING
    public returns (bytes4);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD741(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB259(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB259(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB259(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL99(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV887(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV887(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV887(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD578(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD578(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD578(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT293(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE448(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE943(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
library Counters {
    using SafeMath for uint256;

    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function CURRENT527(Counter storage counter) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return counter._value;
    }

    function INCREMENT282(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value += 1;
    }

    function DECREMENT542(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value = counter._value.SUB259(1);
    }
}

                                                                                                                                                                           
contract ERC165 is IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc1654 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE728(_interface_id_erc1654);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE341(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE728(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

                                                                                                                            
contract ERC721 is Context, ERC165, IERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
    bytes4 private constant _erc721_received932 = 0x150b7a02;	//inject NONSTANDARD NAMING

    // Mapping from token ID to owner
    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping (address => Counters.Counter) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    bytes4 private constant _interface_id_erc721871 = 0x80ac58cd;	//inject NONSTANDARD NAMING

    constructor () public {
        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE728(_interface_id_erc721871);
    }

                                                                                                                                                                                                     
    function BALANCEOF156(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC721: balance query for the zero address");

        return _ownedTokensCount[owner].CURRENT527();
    }

                                                                                                                                                                                                                    
    function OWNEROF281(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");

        return owner;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE879(address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        address owner = OWNEROF281(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(_MSGSENDER759() == owner || ISAPPROVEDFORALL406(owner, _MSGSENDER759()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _tokenApprovals[tokenId] = to;
        emit APPROVAL229(owner, to, tokenId);
    }

                                                                                                                                                                                                                                                                                      
    function GETAPPROVED228(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        require(_EXISTS60(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

                                                                                                                                                                                                                                                                                              
    function SETAPPROVALFORALL701(address to, bool approved) public {	//inject NONSTANDARD NAMING
        require(to != _MSGSENDER759(), "ERC721: approve to caller");

        _operatorApprovals[_MSGSENDER759()][to] = approved;
        emit APPROVALFORALL686(_MSGSENDER759(), to, approved);
    }

                                                                                                                                                                                                                                                                                                                           
    function ISAPPROVEDFORALL406(address owner, address operator) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operatorApprovals[owner][operator];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function TRANSFERFROM799(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        //solhint-disable-next-line max-line-length
        require(_ISAPPROVEDOROWNER890(_MSGSENDER759(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _TRANSFERFROM423(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SAFETRANSFERFROM88(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        SAFETRANSFERFROM88(from, to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function SAFETRANSFERFROM88(address from, address to, uint256 tokenId, bytes memory _data) public {	//inject NONSTANDARD NAMING
        require(_ISAPPROVEDOROWNER890(_MSGSENDER759(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _SAFETRANSFERFROM412(from, to, tokenId, _data);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _SAFETRANSFERFROM412(address from, address to, uint256 tokenId, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        _TRANSFERFROM423(from, to, tokenId);
        require(_CHECKONERC721RECEIVED740(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

                                                                                                                                                                                            
    function _EXISTS60(uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _ISAPPROVEDOROWNER890(address spender, uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(_EXISTS60(tokenId), "ERC721: operator query for nonexistent token");
        address owner = OWNEROF281(tokenId);
        return (spender == owner || GETAPPROVED228(tokenId) == spender || ISAPPROVEDFORALL406(owner, spender));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _SAFEMINT718(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _SAFEMINT718(to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SAFEMINT718(address to, uint256 tokenId, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        _MINT526(to, tokenId);
        require(_CHECKONERC721RECEIVED740(address(0), to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

                                                                                                                                                                                                                                              
    function _MINT526(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_EXISTS60(tokenId), "ERC721: token already minted");

        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to].INCREMENT282();

        emit TRANSFER203(address(0), to, tokenId);
    }

                                                                                                                                                                                                                                                                     
    function _BURN25(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF281(tokenId) == owner, "ERC721: burn of token that is not own");

        _CLEARAPPROVAL374(tokenId);

        _ownedTokensCount[owner].DECREMENT542();
        _tokenOwner[tokenId] = address(0);

        emit TRANSFER203(owner, address(0), tokenId);
    }

                                                                                                                                                                              
    function _BURN25(uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _BURN25(OWNEROF281(tokenId), tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                  
    function _TRANSFERFROM423(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF281(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _CLEARAPPROVAL374(tokenId);

        _ownedTokensCount[from].DECREMENT542();
        _ownedTokensCount[to].INCREMENT282();

        _tokenOwner[tokenId] = to;

        emit TRANSFER203(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function _CHECKONERC721RECEIVED740(address from, address to, uint256 tokenId, bytes memory _data)	//inject NONSTANDARD NAMING
        internal returns (bool)
    {
        if (!to.ISCONTRACT293()) {
            return true;
        }

        bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED206(_MSGSENDER759(), from, tokenId, _data);
        return (retval == _erc721_received932);
    }

                                                                                                                                                           
    function _CLEARAPPROVAL374(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }
}

                                                                                                                                        
contract IERC721Enumerable is IERC721 {
    function TOTALSUPPLY275() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOKENOFOWNERBYINDEX79(address owner, uint256 index) public view returns (uint256 tokenId);	//inject NONSTANDARD NAMING

    function TOKENBYINDEX383(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                                                                         
contract ERC721Enumerable is Context, ERC165, ERC721, IERC721Enumerable {
    // Mapping from owner to list of owned token IDs
    mapping(address => uint256[]) private _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] private _allTokens;

    // Mapping from token id to position in the allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;

                                                                                                                                                                                                                                                                                                         
    bytes4 private constant _interface_id_erc721_enumerable556 = 0x780e9d63;	//inject NONSTANDARD NAMING

                                                 
    constructor () public {
        // register the supported interface to conform to ERC721Enumerable via ERC165
        _REGISTERINTERFACE728(_interface_id_erc721_enumerable556);
    }

                                                                                                                                                                                                                                                                                                                                                                               
    function TOKENOFOWNERBYINDEX79(address owner, uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < BALANCEOF156(owner), "ERC721Enumerable: owner index out of bounds");
        return _ownedTokens[owner][index];
    }

                                                                                                                                                  
    function TOTALSUPPLY275() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allTokens.length;
    }

                                                                                                                                                                                                                                                                                                                                           
    function TOKENBYINDEX383(uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < TOTALSUPPLY275(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

                                                                                                                                                                                                                                                                                                                                                                                
    function _TRANSFERFROM423(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._TRANSFERFROM423(from, to, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION413(from, tokenId);

        _ADDTOKENTOOWNERENUMERATION671(to, tokenId);
    }

                                                                                                                                                                                                                                                          
    function _MINT526(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._MINT526(to, tokenId);

        _ADDTOKENTOOWNERENUMERATION671(to, tokenId);

        _ADDTOKENTOALLTOKENSENUMERATION114(tokenId);
    }

                                                                                                                                                                                                                                                                            
    function _BURN25(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN25(owner, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION413(owner, tokenId);
        // Since tokenId will be deleted, we can clear its slot in _ownedTokensIndex to trigger a gas refund
        _ownedTokensIndex[tokenId] = 0;

        _REMOVETOKENFROMALLTOKENSENUMERATION98(tokenId);
    }

                                                                                                                                                                                                      
    function _TOKENSOFOWNER772(address owner) internal view returns (uint256[] storage) {	//inject NONSTANDARD NAMING
        return _ownedTokens[owner];
    }

                                                                                                                                                                                                                                                                                               
    function _ADDTOKENTOOWNERENUMERATION671(address to, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

                                                                                                                                                                                            
    function _ADDTOKENTOALLTOKENSENUMERATION114(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _REMOVETOKENFROMOWNERENUMERATION413(address from, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _ownedTokens[from].length.SUB259(1);
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        _ownedTokens[from].length--;

        // Note that _ownedTokensIndex[tokenId] hasn't been cleared: it still points to the old slot (now occupied by
        // lastTokenId, or just over the end of the array if the token was the last one).
    }

                                                                                                                                                                                                                                                                                         
    function _REMOVETOKENFROMALLTOKENSENUMERATION98(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length.SUB259(1);
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        _allTokens.length--;
        _allTokensIndex[tokenId] = 0;
    }
}

                                                                                                                                     
contract IERC721Metadata is IERC721 {
    function NAME761() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL786() external view returns (string memory);	//inject NONSTANDARD NAMING
    function TOKENURI32(uint256 tokenId) external view returns (string memory);	//inject NONSTANDARD NAMING
}

contract ERC721Metadata is Context, ERC165, ERC721, IERC721Metadata {
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;
                                                                                                                                                                                                                                                                  
    bytes4 private constant _interface_id_erc721_metadata368 = 0x5b5e139f;	//inject NONSTANDARD NAMING

                                                
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;

        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE728(_interface_id_erc721_metadata368);
    }

                                                                                                  
    function NAME761() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                      
    function SYMBOL786() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }


                                                                                                                                                                                                 
     
                                                                                                                                                                                                                                                                                                                                                                        

                                                                                                                                                                                                                                        
    function _SETTOKENURI723(uint256 tokenId, string memory uri) internal {	//inject NONSTANDARD NAMING
        require(_EXISTS60(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = uri;
    }

                                                                                                                                                                                                                                                                                              
    function _BURN25(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN25(owner, tokenId);

        // Clear metadata (if any)
        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }
}

                                                                                                                                                                                                                                                                                
contract ERC721Full is ERC721, ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }
}

library Random
{
                                                                                                                                                                                                                                                                                                                                    
    function INIT580(uint256 earliestBlock, uint256 latestBlock, uint256 seed) internal view returns (bytes32[] memory) {	//inject NONSTANDARD NAMING
        require(block.number-1 >= latestBlock && latestBlock >= earliestBlock, "Random.init: invalid block interval");
        bytes32[] memory pool = new bytes32[](latestBlock-earliestBlock+2);
        bytes32 salt = keccak256(abi.encodePacked(block.number,seed));
        for(uint256 i = 0; i <= latestBlock-earliestBlock; i++) {
            // Add some salt to each blockhash so that we don't reuse those hash chains
            // when this function gets called again in another block.
            pool[i+1] = keccak256(abi.encodePacked(blockhash(earliestBlock+i),salt));
        }
        return pool;
    }

                                                                      
    function INITLATEST121(uint256 num, uint256 seed) internal view returns (bytes32[] memory) {	//inject NONSTANDARD NAMING
        return INIT580(block.number-num, block.number-1, seed);
    }

                                                                                           
    function NEXT680(bytes32[] memory pool) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(pool.length > 1, "Random.next: invalid pool");
        uint256 roundRobinIdx = uint256(pool[0]) % (pool.length-1) + 1;
        bytes32 hash = keccak256(abi.encodePacked(pool[roundRobinIdx]));
        pool[0] = bytes32(uint256(pool[0])+1);
        pool[roundRobinIdx] = hash;
        return uint256(hash);
    }

                                                                                                        
    function UNIFORM487(bytes32[] memory pool, int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        require(a <= b, "Random.uniform: invalid interval");
        return int256(NEXT680(pool)%uint256(b-a+1))+a;
    }
}


contract CryptoMorphMint is ERC721Full {
    using SafeMath for uint256;

    mapping (uint256 => uint) internal idToSymmetry;
    mapping (uint256 => uint) internal idToColors;

    constructor() ERC721Full("CryptoMorphMint", "CMMINT") public {
        _REGISTERTOKEN218(1, 1);
        _REGISTERTOKEN218(1, 2);
        _REGISTERTOKEN218(2, 2);
        _REGISTERTOKEN218(2, 3);
        _REGISTERTOKEN218(3, 3);
        _REGISTERTOKEN218(3, 4);
        _REGISTERTOKEN218(4, 4);
        _REGISTERTOKEN218(4, 5);
        _REGISTERTOKEN218(5, 5);
        _REGISTERTOKEN218(5, 6);
        _REGISTERTOKEN218(6, 6);
        _REGISTERTOKEN218(6, 7);
        _REGISTERTOKEN218(7, 7);
        _REGISTERTOKEN218(7, 8);
        _REGISTERTOKEN218(8, 8);
        _REGISTERTOKEN218(8, 9);
        _REGISTERTOKEN218(7, 9);
        _REGISTERTOKEN218(7, 10);
        _REGISTERTOKEN218(6, 10);
        _REGISTERTOKEN218(6, 11);
        _REGISTERTOKEN218(5, 11);
        _REGISTERTOKEN218(5, 12);
        _REGISTERTOKEN218(4, 12);
        _REGISTERTOKEN218(4, 13);
        _REGISTERTOKEN218(3, 13);
        _REGISTERTOKEN218(3, 14);
        _REGISTERTOKEN218(2, 14);
        _REGISTERTOKEN218(2, 15);
        _REGISTERTOKEN218(1, 15);
        _REGISTERTOKEN218(1, 16);
    }

    function GETRANDOMCOLORS226(uint256 seed) internal view returns (uint256 colorsID) {	//inject NONSTANDARD NAMING

      bytes32[] memory pool = Random.INITLATEST121(4, seed);

      uint256 colorsRNG = uint256(Random.UNIFORM487(pool, 1, 10000));
      if (colorsRNG <= 100) {
        colorsID = 1;
      } else if (colorsRNG <= 500) {
        colorsID = 2;
      } else if (colorsRNG <= 1000) {
        colorsID = 3;
      } else if (colorsRNG <= 3000) {
        colorsID = 4;
      } else if (colorsRNG <= 7000) {
        colorsID = 5;
      } else if (colorsRNG <= 9000) {
        colorsID = 6;
      } else if (colorsRNG <= 9500) {
        colorsID = 7;
      } else if (colorsRNG <= 9900) {
        colorsID = 8;
      } else {
        colorsID = 1;
      }
    }

    function GETRANDOMSYMMETRY700(uint256 seed) internal view returns (uint256 symmetryID) {	//inject NONSTANDARD NAMING

      bytes32[] memory pool = Random.INITLATEST121(5, seed);

      uint256 symmetryRNG = uint256(Random.UNIFORM487(pool, 1, 10000));

      if (symmetryRNG <= 100) {
        symmetryID = 1;
      } else if (symmetryRNG <= 500) {
        symmetryID = 2;
      } else if (symmetryRNG <= 1000) {
        symmetryID = 3;
      } else if (symmetryRNG <= 1500) {
        symmetryID = 4;
      } else if (symmetryRNG <= 2000) {
        symmetryID = 5;
      } else if (symmetryRNG <= 2500) {
        symmetryID = 6;
      } else if (symmetryRNG <= 3000) {
        symmetryID = 7;
      } else if (symmetryRNG <= 3500) {
        symmetryID = 8;
      } else if (symmetryRNG <= 4000) {
        symmetryID = 9;
      } else if (symmetryRNG <= 5000) {
        symmetryID = 10;
      } else if (symmetryRNG <= 6000) {
        symmetryID = 11;
      } else if (symmetryRNG <= 7000) {
        symmetryID = 12;
      } else if (symmetryRNG <= 8000) {
        symmetryID = 13;
      } else if (symmetryRNG <= 9000) {
        symmetryID = 14;
      } else if (symmetryRNG <= 9500) {
        symmetryID = 15;
      } else if (symmetryRNG <= 9900) {
        symmetryID = 16;
      } else {
        symmetryID = 1;
      }
    }

    function _REGISTERTOKEN218(uint256 colors, uint256 symmetry) private {	//inject NONSTANDARD NAMING
        uint256 tokenId = TOTALSUPPLY275();
        idToSymmetry[tokenId] = symmetry;
        idToColors[tokenId] = colors;
        _MINT526(msg.sender, tokenId);
    }

    uint public constant tokenlimit691 = 9999;	//inject NONSTANDARD NAMING

    function CREATECRYPTOMORPH441(uint256 seed) public payable {	//inject NONSTANDARD NAMING

      if (TOTALSUPPLY275() < 1000) {
        require(msg.value == 6 finney);
      } else if (TOTALSUPPLY275() < 2000) {
        require(msg.value == 8 finney);
      } else if (TOTALSUPPLY275() < 3000) {
        require(msg.value == 10 finney);
      } else if (TOTALSUPPLY275() < 4000) {
        require(msg.value == 15 finney);
      } else if (TOTALSUPPLY275() < 5000) {
        require(msg.value == 20 finney);
      } else if (TOTALSUPPLY275() < 6000) {
        require(msg.value == 25 finney);
      } else if (TOTALSUPPLY275() < 7000) {
        require(msg.value == 30 finney);
      } else if (TOTALSUPPLY275() < 8000) {
        require(msg.value == 35 finney);
      } else if (TOTALSUPPLY275() < 9000) {
        require(msg.value == 40 finney);
      } else {
        require(msg.value == 45 finney);
      }

      require(TOTALSUPPLY275() <= tokenlimit691, "CryptoMorph Mint sale has completed. They are now only available on the secondary market. ");

      address(0xaa02859173c1f351Ffb4f015A98Fa66200d95687).transfer(msg.value);

      uint256 symmetry = GETRANDOMSYMMETRY700(seed);
      uint256 colors = GETRANDOMCOLORS226(seed);

      _REGISTERTOKEN218(colors, symmetry);
    }

   function INTEGERTOSTRING292(uint _i) internal pure	//inject NONSTANDARD NAMING
      returns (string memory) {

      if (_i == 0) {
         return "0";
      }
      uint j = _i;
      uint len;

      while (j != 0) {
         len++;
         j /= 10;
      }
      bytes memory bstr = new bytes(len);
      uint k = len - 1;

      while (_i != 0) {
         bstr[k--] = byte(uint8(48 + _i % 10));
         _i /= 10;
      }
      return string(bstr);
   }


    function TOKENURI32(uint256 id) external view returns (string memory) {	//inject NONSTANDARD NAMING
        require(_EXISTS60(id), "ERC721Metadata: URI query for nonexistent token");
        return string(abi.encodePacked("https://ChainScrape3.damo1884.repl.co/api/mint?id=", INTEGERTOSTRING292(id)));
    }

    function GETSYMMETRY953(uint id) public view returns (uint256 symmetry) {	//inject NONSTANDARD NAMING
        return idToSymmetry[id];
    }

    function GETCOLORS438(uint id) public view returns (uint256 colors) {	//inject NONSTANDARD NAMING
        return idToColors[id];
    }
}