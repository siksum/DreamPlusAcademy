/**
 *Submitted for verification at Etherscan.io on 2020-07-23
*/

pragma solidity ^0.5.0;



/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract ValidatorManagerContract {
    using SafeMath for uint256;

    /
    /
    uint8 public threshold_num;
    uint8 public threshold_denom;

    /
    address[] public validators;

    /
    uint64[] public powers;

    /
    uint256 public totalPower;

    /
    /
    uint256 public nonce;

    /
    address public loomAddress;

    /
    /
    /
    event ValidatorSetChanged(address[] _validators, uint64[] _powers);

    /
    /
    /
    function getPowers() public view returns(uint64[] memory) {
        return powers;
    }

    /
    /
    /
    function getValidators() public view returns(address[] memory) {
        return validators;
    }

    /
    /
    /
    /
    /
    /
    /
    /
    constructor (
        address[] memory _validators,
        uint64[] memory _powers,
        uint8 _threshold_num,
        uint8 _threshold_denom,
        address _loomAddress
    ) 
        public 
    {
        threshold_num = _threshold_num;
        threshold_denom = _threshold_denom;
        require(threshold_num <= threshold_denom && threshold_num > 0, "Invalid threshold fraction.");
        loomAddress = _loomAddress;
        _rotateValidators(_validators, _powers);
    }

    /
    /
    /
    /
    /
    /
    /
    /
    function setLoom(
        address _loomAddress,
        uint256[] calldata _signersIndexes, 
        uint8[] calldata _v,
        bytes32[] calldata _r,
        bytes32[] calldata _s
    ) 
        external 
    {
        
        
        bytes32 message = keccak256(abi.encodePacked(_signersIndexes, _v, _r, _s));	

        
        checkThreshold(message, _signersIndexes, _v, _r, _s);

        
        loomAddress = _loomAddress;
        nonce++;
    }

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function setQuorum(
        uint8 _num,
        uint8 _denom,
        uint256[] calldata _signersIndexes, 
        uint8[] calldata _v,
        bytes32[] calldata _r,
        bytes32[] calldata _s
    ) 
        external 
    {
        require(_num <= _denom && _num > 0, "Invalid threshold fraction");

        
        
        bytes32 message = keccak256(abi.encodePacked(_signersIndexes, _v, _r, _s));	

        
        checkThreshold(message, _signersIndexes, _v, _r, _s);

        threshold_num = _num;
        threshold_denom = _denom;
        nonce++;
    }

    /
    /
    /
    /
    /
    /
    /
    /
    /
    /
    function rotateValidators(
        address[] calldata _newValidators, 
        uint64[] calldata  _newPowers,
        uint256[] calldata _signersIndexes, 
        uint8[] calldata _v,
        bytes32[] calldata _r,
        bytes32[] calldata _s
    ) 
        external 
    {
        
        
        bytes32 message = keccak256(abi.encodePacked(_newValidators, _newPowers, _signersIndexes, _v, _r, _s));	

        
        checkThreshold(message, _signersIndexes, _v, _r, _s);

        
        _rotateValidators(_newValidators, _newPowers);
        nonce++;
    }


    /
    /
    /
    /
    /
    /
    /
    function signedByValidator(
        bytes32 _message,
        uint256 _signersIndex,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) 
        public 
        view
    {
        
        
        
        
        address signer = ecrecover(_message, _v, _r, _s);
        require(validators[_signersIndex] == signer, "Message not signed by a validator");
    }

    /
    /
    /
    /
    /
    /
    /
    function checkThreshold(bytes32 _message, uint256[] memory _signersIndexes, uint8[] memory _v, bytes32[] memory _r, bytes32[] memory _s) public view {
        uint256 sig_length = _v.length;

        require(sig_length <= validators.length,
                "checkThreshold:: Cannot submit more signatures than existing validators"
        );

        require(sig_length > 0 && sig_length == _r.length && _r.length == _s.length && sig_length == _signersIndexes.length,
                "checkThreshold:: Incorrect number of params"
        );

        
        bytes32 hash = keccak256(abi.encodePacked(_signersIndexes, _v, _r, _s));	

        
        
        uint256 votedPower;
        for (uint256 i = 0; i < sig_length; i++) {
            if (i > 0) {
                require(_signersIndexes[i] > _signersIndexes[i-1]);
            }

            
            if (uint256(_s[i]) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
                continue;
            }
            address signer = ecrecover(hash, _v[i], _r[i], _s[i]);
            require(signer == validators[_signersIndexes[i]], "checkThreshold:: Recovered address is not a validator");

            votedPower = votedPower.add(powers[_signersIndexes[i]]);
        }

        require(votedPower * threshold_denom >= totalPower *
                threshold_num, "checkThreshold:: Not enough power from validators");
    }



    /
    /
    /
    /
    function _rotateValidators(address[] memory _validators, uint64[] memory _powers) internal {
        uint256 val_length = _validators.length;

        require(val_length == _powers.length, "_rotateValidators: Array lengths do not match!");

        require(val_length > 0, "Must provide more than 0 validators");

        uint256 _totalPower = 0;
        for (uint256 i = 0; i < val_length; i++) {
            _totalPower = _totalPower.add(_powers[i]);
        }

        
        totalPower = _totalPower;

        
        validators = _validators;
        powers = _powers;

        emit ValidatorSetChanged(_validators, _powers);
    }

    /
    /
    /
    /
    function createMessage(bytes32 hash)
    private
    view returns (bytes32)
    {
        return keccak256(
            abi.encodePacked(
                address(this),
                nonce,
                hash
            )
        );
    }

}