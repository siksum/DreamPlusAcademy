{"MultiplierCBD.sol":{"content":"// Written by Ermin Nurovic \u003ccontact@multiplierpay.com\u003e\r\n\r\npragma solidity ^0.5.8;\r\n\r\nimport \"./Ownable.sol\";\r\nimport \"./SafeMath.sol\";\r\nimport \"./ReentrancyGuard.sol\";\r\n\r\ncontract CreateBuyDistribute is Ownable, ReentrancyGuard {\r\n\r\n    using SafeMath for uint256;\r\n    using SafeMath for uint32;\r\n    using SafeMath for uint8;\r\n\r\n    uint256 public dayOfLastActivity;\r\n    uint8 public numberOfAddressesToPay;\r\n    uint8 public randomPayCreatorOnceEvery;\r\n\r\n    // Buyer details including how much buyer has paid for a product and when the buyer has either contributed or\r\n    // had the dividend paid out.\r\n    struct Buyer {\r\n    \tuint256 contribution;\r\n    \tuint256 totalAtPurchase;\r\n    \tuint256 dividendPaid;\r\n    \taddress payable buyerNext;  // next buyer for creating circular linked list allowing Buyer payout\r\n        address payable buyerPrev;  // previous buyer for creating circular linked list allowing Buyer payout\r\n    }\r\n\r\n    // Product details including the creator cut percentage and nested with the Buyers.\r\n    struct Product {\r\n        address payable creator;\r\n        address payable buyerNextPayout;\r\n        address payable buyerPrevPayout;\r\n        bytes32 productName1;\r\n        bytes32 productName2;\r\n        uint256 productPrice;\r\n        uint256 totalPaid;\r\n        uint256 creatorPaidAmount;\r\n        uint256 leftoverDividend;\r\n        uint256 totalAtLeftoverUpdate;\r\n        uint256 ownerPaidAmount;\r\n        uint32 dayOfLastActivity;\r\n        uint32 creatorCut;\r\n        uint32 multiplier;\r\n        mapping (address =\u003e Buyer) buyer;\r\n    }\r\n\r\n    mapping (address =\u003e Product) public product;\r\n    mapping (address =\u003e address) public productNext;\r\n    mapping (address =\u003e address) public productPrev;\r\n\r\n    constructor() public {\r\n        numberOfAddressesToPay = 5;\r\n        randomPayCreatorOnceEvery = 1;\r\n        dayOfLastActivity = now.div(1 days).sub(182);\r\n    }\r\n\r\n    event productCreated(address productAddress, bytes32 name1, bytes32 name2, uint8 creatorCut, uint8 multiplier, uint256 price);\r\n    event productBought(address productAddress, address buyerAddress, uint256 totalPaid, uint256 totalAtPurchase);\r\n    event productDeleted(address productAddress);\r\n    event buyerClosed(address productAddress, address buyerAddress);\r\n\r\n    function endContract() external onlyOwner {\r\n        require((now.div(1 days)) \u003e= (dayOfLastActivity.add(182)));\r\n        selfdestruct(msg.sender);\r\n    }\r\n\r\n    function payAddresses(uint8 _numberOfAddressesToPay, uint8 _randomPayCreatorOnceEvery) external onlyOwner {\r\n        numberOfAddressesToPay = _numberOfAddressesToPay;\r\n        randomPayCreatorOnceEvery = _randomPayCreatorOnceEvery;\r\n    }\r\n\r\n    function getBuyer(address _productAddress, address _buyerAddress) external view returns (uint256 contribution, uint256 totalAtPurchase, uint256 dividendPaid, address buyerPrev) {\r\n        contribution = product[_productAddress].buyer[_buyerAddress].contribution;\r\n        totalAtPurchase = product[_productAddress].buyer[_buyerAddress].totalAtPurchase;\r\n        dividendPaid = product[_productAddress].buyer[_buyerAddress].dividendPaid;\r\n        buyerPrev = product[_productAddress].buyer[_buyerAddress].buyerPrev;\r\n        // buyerNext = product[_productAddress].buyer[_buyerAddress].buyerNext;\r\n    }\r\n\r\n    function productPrice(address _productAddress, uint256 _productPrice) external {\r\n        require((msg.sender == product[_productAddress].creator) \u0026\u0026 (_productPrice \u003e= 1000));\r\n        product[_productAddress].productPrice = _productPrice;\r\n    }\r\n\r\n    function getCreatorAddress(address _productAddress) external view returns (address payable) {\r\n        return product[_productAddress].creator;\r\n    }\r\n\r\n    //Creates a new product\r\n    function createProduct(bytes32 _productName1, bytes32 _productName2, uint _productPrice, uint8 _creatorCut, uint8 _buyerMultiplier) public {\r\n        require(_buyerMultiplier \u003e= 2 \u0026\u0026 _buyerMultiplier \u003c= 5);\r\n        require(_creatorCut \u003e= 0 \u0026\u0026 _creatorCut \u003c= 80);\r\n        require(_productPrice \u003e= 1000);\r\n\r\n        dayOfLastActivity = now.div(1 days);\r\n\r\n        ProductStorage productAddress = new ProductStorage();\r\n        if (!(productPrev[address(0)] == address(0))) { // not the first product ever created\r\n            productNext[productPrev[address(0)]] = address(productAddress);\r\n            productPrev[address(productAddress)] = productPrev[address(0)];\r\n            productPrev[address(0)] = address(productAddress);\r\n        } else { // first product ever\r\n            productPrev[address(0)] = address(productAddress);\r\n            productNext[address(0)] = address(productAddress);\r\n        }\r\n        product[address(productAddress)].productName1 = _productName1;\r\n        product[address(productAddress)].productName2 = _productName2;\r\n        product[address(productAddress)].productPrice = _productPrice;\r\n        product[address(productAddress)].creatorCut = _creatorCut;\r\n        product[address(productAddress)].multiplier = _buyerMultiplier;\r\n        product[address(productAddress)].buyerNextPayout = address(0);\r\n        product[address(productAddress)].buyerPrevPayout = address(0);\r\n        product[address(productAddress)].creator = msg.sender;\r\n        product[address(productAddress)].dayOfLastActivity = uint32(now.div(1 days));\r\n\r\n        emit productCreated(address(productAddress), _productName1, _productName2, _creatorCut, _buyerMultiplier, _productPrice);\r\n    }\r\n\r\n    function deleteProduct(address payable _productAddress) public {\r\n        require(((now.div(1 days)) \u003e= (product[_productAddress].dayOfLastActivity.add(182))) ||\r\n        ((product[_productAddress].creator == msg.sender) \u0026\u0026 (product[_productAddress].totalPaid == 0)));\r\n        // remove product from linked list\r\n        productPrev[productNext[_productAddress]] =\r\n        productPrev[productPrev[productNext[_productAddress]]];\r\n        productNext[productPrev[_productAddress]] =\r\n        productNext[productNext[productPrev[_productAddress]]];\r\n        delete productNext[_productAddress];\r\n        delete productPrev[_productAddress];\r\n        // Delete buyer mappings from product\r\n        address buyerToDelete = address(0);\r\n        address buyerToDeleteNext = product[_productAddress].buyer[buyerToDelete].buyerNext;\r\n        buyerToDelete = buyerToDeleteNext;\r\n        buyerToDeleteNext = product[_productAddress].buyer[buyerToDelete].buyerNext;\r\n        do {\r\n            delete product[_productAddress].buyer[buyerToDelete];\r\n            buyerToDelete = buyerToDeleteNext;\r\n            buyerToDeleteNext = product[_productAddress].buyer[buyerToDelete].buyerNext;\r\n        } while(buyerToDeleteNext != address(0));\r\n        // Set totalPaid to 0 for re-entrancy protection\r\n        product[_productAddress].totalPaid = 0;\r\n        product[_productAddress].totalAtLeftoverUpdate = 0;\r\n        // pay creator with any leftover funds\r\n        ProductStorage PS = ProductStorage(_productAddress);\r\n        PS.payTo(address(PS).balance, product[_productAddress].creator);\r\n        // delete product struct\r\n        delete product[_productAddress];\r\n        // delete product contract\r\n        PS.close();\r\n\r\n        emit productDeleted(_productAddress);\r\n    }\r\n\r\n    // Used for buying a product then calls function to pay dividend to other buyers.\r\n    function buyProduct(address payable _productAddress, address payable _buyerAddress, uint _value) external nonReentrant {\r\n        require(product[_productAddress].creator != address(0));\r\n        require(_value \u003e= product[_productAddress].productPrice);\r\n        require(msg.sender == _productAddress);\r\n\r\n        uint contributionValue;\r\n        contributionValue = _value.mul((uint8(100).sub(product[_productAddress].creatorCut).sub(3)));\r\n        contributionValue = contributionValue.div(100);\r\n\r\n        if (product[_productAddress].buyer[_buyerAddress].contribution == 0) {\r\n            // Buyer had not bought this product before.\r\n            if (product[_productAddress].buyer[address(0)].buyerNext == address(0)) {\r\n                // First ever buyer of this product.\r\n                product[_productAddress].buyer[address(0)].buyerNext = _buyerAddress;\r\n                product[_productAddress].buyer[address(0)].buyerPrev = _buyerAddress;\r\n            } else {\r\n                product[_productAddress].buyer[\r\n                    product[_productAddress].buyer[address(0)].buyerPrev\r\n                ].buyerNext = _buyerAddress;\r\n                product[_productAddress].buyer[_buyerAddress].buyerPrev = product[_productAddress].buyer[address(0)].buyerPrev;\r\n                product[_productAddress].buyer[address(0)].buyerPrev = _buyerAddress;\r\n            }\r\n\r\n            // Record product total for first time buyer\r\n            product[_productAddress].buyer[_buyerAddress].totalAtPurchase = product[_productAddress].totalPaid;\r\n\r\n        } else {\r\n            // Buyer has purchased this product before.\r\n            uint _newTotalAtPurchase;\r\n            _newTotalAtPurchase = product[_productAddress].totalPaid.sub(product[_productAddress].buyer[_buyerAddress].totalAtPurchase);\r\n            _newTotalAtPurchase = _newTotalAtPurchase.sub(product[_productAddress].buyer[_buyerAddress].contribution);\r\n            _newTotalAtPurchase = _newTotalAtPurchase.mul(contributionValue);\r\n            _newTotalAtPurchase = _newTotalAtPurchase.div(product[_productAddress].buyer[_buyerAddress].contribution.add(contributionValue));\r\n            _newTotalAtPurchase = _newTotalAtPurchase.add(product[_productAddress].buyer[_buyerAddress].totalAtPurchase);\r\n            product[_productAddress].buyer[_buyerAddress].totalAtPurchase = _newTotalAtPurchase;\r\n        }\r\n        // Add buyer contribution value\r\n        product[_productAddress].buyer[_buyerAddress].contribution = product[_productAddress].buyer[_buyerAddress].contribution.add(contributionValue);\r\n\r\n        // Add contribution to the total product contribution\r\n        product[_productAddress].totalPaid = product[_productAddress].totalPaid.add(contributionValue);\r\n\r\n        // Update day of last activity for product\r\n        product[_productAddress].dayOfLastActivity = uint32(now.div(1 days));\r\n\r\n        // Pay creator cut every random number of transactions\r\n        uint randomPayCreator;\r\n        if (randomPayCreatorOnceEvery \u003e 0) {\r\n            randomPayCreator = uint(keccak256(abi.encodePacked(now, _productAddress))) % randomPayCreatorOnceEvery;\r\n        }\r\n        if ((randomPayCreator == 1) || (randomPayCreatorOnceEvery == 1)) {\r\n            payCreatorCut(_productAddress);\r\n        } else {\r\n            randomPayCreator = 0;\r\n        }\r\n\r\n        // Pay dividend to previous buyers\r\n        if (numberOfAddressesToPay \u003e 0) {\r\n            uint8 _didPay;\r\n            address payable _buyerNext = product[_productAddress].buyerNextPayout;\r\n            address payable _buyerPrev = product[_productAddress].buyerPrevPayout;\r\n            // Cycle in both direction of previous buyers to pay out\r\n            for (uint i = 0; i \u003c (numberOfAddressesToPay.sub(randomPayCreator)); i++) {\r\n                _didPay = 0;\r\n                if (uint(keccak256(abi.encodePacked(now, _productAddress, i))) % 2 == 1) {\r\n                    _buyerNext = product[_productAddress].buyer[_buyerNext].buyerNext;\r\n                    if(_buyerNext != address(0)) {\r\n                        _didPay = payDividendToBuyer(_productAddress, _buyerNext);\r\n                    }\r\n                } else {\r\n                    _buyerPrev = product[_productAddress].buyer[_buyerPrev].buyerPrev;\r\n                    if(_buyerPrev != address(0)) {\r\n                        _didPay = payDividendToBuyer(_productAddress, _buyerPrev);\r\n                    }\r\n                }\r\n                i += _didPay;\r\n            }\r\n            product[_productAddress].buyerNextPayout = _buyerNext;\r\n            product[_productAddress].buyerPrevPayout = _buyerPrev;\r\n        }\r\n\r\n        emit productBought(_productAddress, _buyerAddress, product[_productAddress].totalPaid, product[_productAddress].buyer[_buyerAddress].totalAtPurchase);\r\n    }\r\n\r\n    // Pay dividend to buyer\r\n    function payDividendToBuyer(address payable _productAddress, address payable _buyerAddress) public returns (uint8 didPay) {\r\n        didPay = 0;\r\n        if (product[_productAddress].buyer[_buyerAddress].contribution \u003e 0) {\r\n            uint totalPaidAdjusted = product[_productAddress].totalPaid.add(product[_productAddress].leftoverDividend.mul(product[_productAddress].totalPaid.sub(product[_productAddress].totalAtLeftoverUpdate)).div(product[_productAddress].totalPaid));\r\n            uint dividend = product[_productAddress].buyer[_buyerAddress].totalAtPurchase.div(2);\r\n            dividend = dividend.add(product[_productAddress].buyer[_buyerAddress].contribution.div(4));\r\n            dividend = dividend.mul(product[_productAddress].multiplier.mul(105)).div(100 - product[_productAddress].creatorCut - 3);\r\n            if (totalPaidAdjusted \u003e dividend) {\r\n                dividend = totalPaidAdjusted.sub(dividend);\r\n                dividend = dividend.mul(product[_productAddress].buyer[_buyerAddress].contribution);\r\n                dividend = dividend.div(totalPaidAdjusted);\r\n                dividend = dividend.mul(product[_productAddress].multiplier.mul(105)).div(100 - product[_productAddress].creatorCut - 3);\r\n                if (dividend \u003e product[_productAddress].buyer[_buyerAddress].dividendPaid) { // buyer has some dividend owing. pay the buyer\r\n                    dividend = dividend.sub(product[_productAddress].buyer[_buyerAddress].dividendPaid);\r\n                    product[_productAddress].buyer[_buyerAddress].dividendPaid = product[_productAddress].buyer[_buyerAddress].dividendPaid.add(dividend);\r\n                    ProductStorage PS = ProductStorage(_productAddress);\r\n                    if (PS.payTo(dividend, _buyerAddress)) {\r\n                        didPay = 1;\r\n                    } else {\r\n                        product[_productAddress].buyer[_buyerAddress].dividendPaid = product[_productAddress].buyer[_buyerAddress].dividendPaid.sub(dividend);\r\n                        didPay = 0;\r\n                    }\r\n                }\r\n            } else didPay = 0;\r\n            // check if buyer\u0027s dividend is paid out past the multiplier limit\r\n            uint maximumToBePaid = product[_productAddress].buyer[_buyerAddress].contribution.mul(product[_productAddress].multiplier.mul(100)).div(100 - product[_productAddress].creatorCut - 3);\r\n            // check if buyer should be closed out\r\n            if (product[_productAddress].buyer[_buyerAddress].dividendPaid \u003e= maximumToBePaid) {  // pay back  multiplier amount before closing out buyer\r\n                // move remaining funds to a side pot\r\n                uint originalLeftoverDividend = product[_productAddress].leftoverDividend;\r\n                maximumToBePaid = maximumToBePaid.mul(105).div(100);\r\n                product[_productAddress].leftoverDividend = originalLeftoverDividend.add(maximumToBePaid).sub(product[_productAddress].buyer[_buyerAddress].dividendPaid);\r\n                product[_productAddress].totalAtLeftoverUpdate = (product[_productAddress].totalAtLeftoverUpdate.mul(originalLeftoverDividend).div(product[_productAddress].leftoverDividend)).add((product[_productAddress].totalPaid.mul(maximumToBePaid.sub(product[_productAddress].buyer[_buyerAddress].dividendPaid)).div(product[_productAddress].leftoverDividend)));\r\n                // delete buyer details\r\n                deleteBuyer(_productAddress, _buyerAddress);\r\n                emit buyerClosed(_productAddress, _buyerAddress);\r\n            }\r\n\r\n        }\r\n        return didPay;\r\n    }\r\n\r\n    // Pay the creator\u0027s cut as per the percentage cut specified in the product\r\n    function payCreatorCut(address payable _productAddress) public {\r\n        uint payCreatorAmount = product[_productAddress].totalPaid.div(100 - product[_productAddress].creatorCut - 3);\r\n        payCreatorAmount = payCreatorAmount.mul(product[_productAddress].creatorCut);\r\n        payCreatorAmount = payCreatorAmount.sub(product[_productAddress].creatorPaidAmount);\r\n        product[_productAddress].creatorPaidAmount = product[_productAddress].creatorPaidAmount.add(payCreatorAmount);\r\n        ProductStorage PS = ProductStorage(_productAddress);\r\n        PS.payTo(payCreatorAmount, product[_productAddress].creator);\r\n    }\r\n\r\n    // Pay the owner\u0027s cut\r\n    function payOwnerCut(address payable _productAddress) public {\r\n        uint payOwnerAmount = product[_productAddress].totalPaid.div(100 - product[_productAddress].creatorCut - 3);\r\n        payOwnerAmount = payOwnerAmount.mul(3);\r\n        payOwnerAmount = payOwnerAmount.sub(product[_productAddress].ownerPaidAmount);\r\n        product[_productAddress].ownerPaidAmount = product[_productAddress].creatorPaidAmount.add(payOwnerAmount);\r\n        ProductStorage PS = ProductStorage(_productAddress);\r\n        PS.payTo(payOwnerAmount, owner());\r\n    }\r\n\r\n    // Delete a buyer from ProductStorage, close the mapping link gap\r\n    function deleteBuyer(address _productAddress, address _buyerAddress) private {\r\n        product[_productAddress].buyer[\r\n            product[_productAddress].buyer[_buyerAddress].buyerNext\r\n        ].buyerPrev =\r\n        product[_productAddress].buyer[\r\n            product[_productAddress].buyer[\r\n                product[_productAddress].buyer[_buyerAddress].buyerNext\r\n            ].buyerPrev\r\n        ].buyerPrev;\r\n\r\n        product[_productAddress].buyer[\r\n            product[_productAddress].buyer[_buyerAddress].buyerPrev\r\n        ].buyerNext =\r\n        product[_productAddress].buyer[\r\n            product[_productAddress].buyer[\r\n                product[_productAddress].buyer[_buyerAddress].buyerPrev\r\n            ].buyerNext\r\n        ].buyerNext;\r\n\r\n        delete product[_productAddress].buyer[_buyerAddress];\r\n    }\r\n}\r\n\r\ncontract ProductStorage {\r\n\r\n    CreateBuyDistribute public CBD;\r\n\r\n    constructor() public {\r\n        CBD = CreateBuyDistribute(msg.sender);\r\n    }\r\n\r\n    function () external payable {\r\n        CBD.buyProduct(address(this), msg.sender, msg.value);\r\n    }\r\n\r\n    function payFrom(address payable _fromAddress) external payable {\r\n        CBD.buyProduct(address(this), _fromAddress, msg.value);\r\n    }\r\n\r\n    function payTo(uint _value,address payable _address) external returns (bool transferred) {\r\n        require(msg.sender == address(CBD));\r\n        if (!_address.send(_value)) {\r\n            return false;\r\n        } else return true;\r\n    }\r\n\r\n    function close() public {\r\n        require(msg.sender == address(CBD));\r\n        selfdestruct(CBD.getCreatorAddress(address(this)));\r\n    }\r\n}\r\n"},"Ownable.sol":{"content":"pragma solidity ^0.5.8;\r\n\r\n/**\r\n * @title Ownable\r\n * @dev The Ownable contract has an owner address, and provides basic authorization control\r\n * functions, this simplifies the implementation of \"user permissions\".\r\n */\r\ncontract Ownable {\r\n  address payable private _owner;\r\n\r\n  event OwnershipTransferred(\r\n    address indexed previousOwner,\r\n    address indexed newOwner\r\n  );\r\n\r\n  /**\r\n   * @dev The Ownable constructor sets the original `owner` of the contract to the sender\r\n   * account.\r\n   */\r\n  constructor() public {\r\n    _owner = msg.sender;\r\n    emit OwnershipTransferred(address(0), _owner);\r\n  }\r\n\r\n  /**\r\n   * @return the address of the owner.\r\n   */\r\n  function owner() public view returns(address payable) {\r\n    return _owner;\r\n  }\r\n\r\n  /**\r\n   * @dev Throws if called by any account other than the owner.\r\n   */\r\n  modifier onlyOwner() {\r\n    require(isOwner());\r\n    _;\r\n  }\r\n\r\n  /**\r\n   * @return true if `msg.sender` is the owner of the contract.\r\n   */\r\n  function isOwner() public view returns(bool) {\r\n    return msg.sender == _owner;\r\n  }\r\n\r\n  /**\r\n   * @dev Allows the current owner to relinquish control of the contract.\r\n   * @notice Renouncing to ownership will leave the contract without an owner.\r\n   * It will not be possible to call the functions with the `onlyOwner`\r\n   * modifier anymore.\r\n   */\r\n//   function renounceOwnership() public onlyOwner {\r\n//     emit OwnershipTransferred(_owner, address(0));\r\n//     _owner = address(0);\r\n//   }\r\n\r\n  /**\r\n   * @dev Allows the current owner to transfer control of the contract to a newOwner.\r\n   * @param newOwner The address to transfer ownership to.\r\n   */\r\n  function transferOwnership(address payable newOwner) public onlyOwner {\r\n    _transferOwnership(newOwner);\r\n  }\r\n\r\n  /**\r\n   * @dev Transfers control of the contract to a newOwner.\r\n   * @param newOwner The address to transfer ownership to.\r\n   */\r\n  function _transferOwnership(address payable newOwner) internal {\r\n    require(newOwner != address(0));\r\n    emit OwnershipTransferred(_owner, newOwner);\r\n    _owner = newOwner;\r\n  }\r\n}\r\n"},"ReentrancyGuard.sol":{"content":"pragma solidity ^0.5.8;\r\n\r\n/**\r\n * @title Helps contracts guard against reentrancy attacks.\r\n * @author Remco Bloemen \u003cremco@21.com\u003e, Eenae \u003calexey@mixbytes.io\u003e\r\n * @dev If you mark a function `nonReentrant`, you should also\r\n * mark it `external`.\r\n */\r\ncontract ReentrancyGuard {\r\n    /// @dev counter to allow mutex lock with only one SSTORE operation\r\n    uint256 private _guardCounter;\r\n\r\n    constructor () internal {\r\n        // The counter starts at one to prevent changing it from zero to a non-zero\r\n        // value, which is a more expensive operation.\r\n        _guardCounter = 1;\r\n    }\r\n\r\n    /**\r\n     * @dev Prevents a contract from calling itself, directly or indirectly.\r\n     * Calling a `nonReentrant` function from another `nonReentrant`\r\n     * function is not supported. It is possible to prevent this from happening\r\n     * by making the `nonReentrant` function external, and make it call a\r\n     * `private` function that does the actual work.\r\n     */\r\n    modifier nonReentrant() {\r\n        _guardCounter += 1;\r\n        uint256 localCounter = _guardCounter;\r\n        _;\r\n        require(localCounter == _guardCounter);\r\n    }\r\n}\r\n"},"SafeMath.sol":{"content":"pragma solidity ^0.5.8;\r\n\r\n/**\r\n * @title SafeMath\r\n * @dev Unsigned math operations with safety checks that revert on error\r\n */\r\nlibrary SafeMath {\r\n    /**\r\n     * @dev Multiplies two unsigned integers, reverts on overflow.\r\n     */\r\n    function mul(uint256 a, uint256 b) internal pure returns (uint256) {\r\n        // Gas optimization: this is cheaper than requiring \u0027a\u0027 not being zero, but the\r\n        // benefit is lost if \u0027b\u0027 is also tested.\r\n        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522\r\n        if (a == 0) {\r\n            return 0;\r\n        }\r\n\r\n        uint256 c = a * b;\r\n        require(c / a == b);\r\n\r\n        return c;\r\n    }\r\n\r\n    /**\r\n     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.\r\n     */\r\n    function div(uint256 a, uint256 b) internal pure returns (uint256) {\r\n        // Solidity only automatically asserts when dividing by 0\r\n        require(b \u003e 0);\r\n        uint256 c = a / b;\r\n        // assert(a == b * c + a % b); // There is no case in which this doesn\u0027t hold\r\n\r\n        return c;\r\n    }\r\n\r\n    /**\r\n     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).\r\n     */\r\n    function sub(uint256 a, uint256 b) internal pure returns (uint256) {\r\n        require(b \u003c= a);\r\n        uint256 c = a - b;\r\n\r\n        return c;\r\n    }\r\n\r\n    /**\r\n     * @dev Adds two unsigned integers, reverts on overflow.\r\n     */\r\n    function add(uint256 a, uint256 b) internal pure returns (uint256) {\r\n        uint256 c = a + b;\r\n        require(c \u003e= a);\r\n\r\n        return c;\r\n    }\r\n\r\n    /**\r\n     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),\r\n     * reverts when dividing by zero.\r\n     */\r\n    // function mod(uint256 a, uint256 b) internal pure returns (uint256) {\r\n    //     require(b != 0);\r\n    //     return a % b;\r\n    // }\r\n}\r\n"}}