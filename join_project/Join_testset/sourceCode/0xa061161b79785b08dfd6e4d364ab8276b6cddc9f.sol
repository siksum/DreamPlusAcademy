{"multisend.sol":{"content":"pragma solidity ^0.4.24;\n\nimport \u0027./SafeMath.sol\u0027;\nimport \u0027./Ownable.sol\u0027;\n\ncontract ERC20Basic {\n    function totalSupply() public view returns (uint256);\n    function balanceOf(address who) public view returns (uint256);\n    function transfer(address to, uint256 value) public returns (bool);\n    event Transfer(address indexed from, address indexed to, uint256 value);\n}\n\ncontract ERC20 is ERC20Basic {\n    function allowance(address owner, address spender) public view returns (uint256);\n    function transferFrom(address from, address to, uint256 value) public returns (bool);\n    function approve(address spender, uint256 value) public returns (bool);\n    event Approval(address indexed owner, address indexed spender, uint256 value);\n}\n\ncontract Multisend is Ownable {\n    using SafeMath for uint256;\n\n    uint256 public fee;\n    uint256 public arrayLimit;\n    \n    event Transfer(address indexed _sender, address indexed _recipient, uint256 _amount);\n    event Refund(uint256 _refund);\n    event Payload(string _payload);\n    event Withdraw(address _owner, uint256 _balance);\n\n    constructor(uint256 _fee,uint256 _arrayLimit) public {\n        fee = _fee; \n        arrayLimit = _arrayLimit;\n    }\n    \n    function sendCoin(address[] recipients, uint256[] amounts, string payload) public payable {\n        require(recipients.length == amounts.length);\n        require(recipients.length \u003c= arrayLimit);\n        require((msg.data.length - 4) % 32 == 0);\n        uint256 totalAmount = fee;\n        for(uint256 i = 0; i \u003c recipients.length; i++) {\n            totalAmount = SafeMath.add(totalAmount, amounts[i]);\n        }\n        require(msg.value \u003e= totalAmount);\n        uint256 refund = SafeMath.sub(msg.value, totalAmount);\n        for(i = 0; i \u003c recipients.length; i++) {\n            recipients[i].transfer(amounts[i]);\n            emit Transfer(msg.sender, recipients[i],amounts[i]);\n        }\n        if (refund \u003e 0) {\n            msg.sender.transfer(refund);\n            emit Refund(refund);\n        }\n        emit Payload(payload);\n    }\n\n    function sendToken(address token, address[] recipients, uint256[] amounts, string payload) public payable {\n        require(msg.value \u003e= fee);\n        require(recipients.length == amounts.length);\n        require(recipients.length \u003c= arrayLimit);\n        require((msg.data.length - 4) % 32 == 0);\n        ERC20 erc20token = ERC20(token);\n        for (uint256 i = 0; i \u003c recipients.length; i++) {\n            erc20token.transferFrom(msg.sender, recipients[i], amounts[i]);\n        }\n        uint256 refund = SafeMath.sub(msg.value, fee);\n        if (refund \u003e 0) {\n            msg.sender.transfer(refund);\n            emit Refund(refund);\n        }\n        emit Payload(payload);\n    }\n\n    function withdraw() public onlyOwner {\n        uint256 balance = address(this).balance;\n        owner.transfer(balance);\n        emit Withdraw(owner, balance);\n    }\n\n    function setFee(uint256 _fee) public onlyOwner {\n        fee = _fee;\n    }\n\n    function setArrayLimit(uint256 _arrayLimit) public onlyOwner {\n        arrayLimit = _arrayLimit;\n    }\n}\n"},"Ownable.sol":{"content":"pragma solidity ^0.4.24;\n\n\n/**\n * @title Ownable\n * @dev The Ownable contract has an owner address, and provides basic authorization control\n * functions, this simplifies the implementation of \"user permissions\".\n */\ncontract Ownable {\n  address public owner;\n\n\n  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);\n\n\n  /**\n   * @dev The Ownable constructor sets the original `owner` of the contract to the sender\n   * account.\n   */\n  /*@CTK owner_set_on_success\n    @pre __reverted == false -\u003e __post.owner == owner\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  constructor() public {\n    owner = msg.sender;\n  }\n\n  /**\n   * @dev Throws if called by any account other than the owner.\n   */\n  modifier onlyOwner() {\n    require(msg.sender == owner);\n    _;\n  }\n\n  /**\n   * @dev Allows the current owner to transfer control of the contract to a newOwner.\n   * @param newOwner The address to transfer ownership to.\n   */\n  /*@CTK transferOwnership\n    @post __reverted == false -\u003e (msg.sender == owner -\u003e __post.owner == newOwner)\n    @post (owner != msg.sender) -\u003e (__reverted == true)\n    @post (newOwner == address(0)) -\u003e (__reverted == true)\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  function transferOwnership(address newOwner) public onlyOwner {\n    require(newOwner != address(0));\n    emit OwnershipTransferred(owner, newOwner);\n    owner = newOwner;\n  }\n\n}\n"},"SafeMath.sol":{"content":"pragma solidity ^0.4.24;\n\n\n/**\n * @title SafeMath\n * @dev Math operations with safety checks that throw on error\n */\nlibrary SafeMath {\n\n  /**\n  * @dev Multiplies two numbers, throws on overflow.\n  */\n\n  /*@CTK SafeMath_mul\n    @tag spec\n    @post __reverted == __has_assertion_failure\n    @post __has_assertion_failure == __has_overflow\n    @post __reverted == false -\u003e c == a * b\n    @post msg == msg__post\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {\n    if (a == 0) {\n      return 0;\n    }\n    c = a * b;\n    assert(c / a == b);\n    return c;\n  }\n\n  /**\n  * @dev Integer division of two numbers, truncating the quotient.\n  */\n  /*@CTK SafeMath_div\n    @tag spec\n    @pre b != 0\n    @post __reverted == __has_assertion_failure\n    @post __has_overflow == true -\u003e __has_assertion_failure == true\n    @post __reverted == false -\u003e __return == a / b\n    @post msg == msg__post\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  function div(uint256 a, uint256 b) internal pure returns (uint256) {\n    // assert(b \u003e 0); // Solidity automatically throws when dividing by 0\n    // uint256 c = a / b;\n    // assert(a == b * c + a % b); // There is no case in which this doesn\u0027t hold\n    return a / b;\n  }\n\n  /**\n  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).\n  */\n  /*@CTK SafeMath_sub\n    @tag spec\n    @post __reverted == __has_assertion_failure\n    @post __has_overflow == true -\u003e __has_assertion_failure == true\n    @post __reverted == false -\u003e __return == a - b\n    @post msg == msg__post\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  function sub(uint256 a, uint256 b) internal pure returns (uint256) {\n    assert(b \u003c= a);\n    return a - b;\n  }\n\n  /**\n  * @dev Adds two numbers, throws on overflow.\n  */\n  /*@CTK SafeMath_add\n    @tag spec\n    @post __reverted == __has_assertion_failure\n    @post __has_assertion_failure == __has_overflow\n    @post __reverted == false -\u003e c == a + b\n    @post msg == msg__post\n   */\n  /* CertiK Smart Labelling, for more details visit: https://certik.org */\n  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {\n    c = a + b;\n    assert(c \u003e= a);\n    return c;\n  }\n}\n"}}