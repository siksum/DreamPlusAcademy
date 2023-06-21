/**
 *Submitted for verification at Etherscan.io on 2020-08-18
*/

//                                              111111   1111    1 111111 
//                                             1111  111 11 11   1 11   1 
//                                             1111  111111  11 1111111   
//                                             111   1111111  11111111  1 
//                                             1 11111111111   11111111111
//                                             1 111111 1 11   1 1 11 11 1
//                                               1 1 11 1 11   1 11 1 1  1
//1 1 1 1     1   1 1    1   
// 111 11  111111   1     11    111 11  111  11111  111 11     111111   111       1111    1     111111111111     11111  111111  
//1111 1111111  111111 1 111   1111 1111111 111 1111111 111   1111 11  111111     11 11   1    11111  111 11    111 1111111  111
//111111111111  111111 1 11    1111111111111111111111111111   111    1 111  111  111  11 111   11111 1111 11   111111111111  111
//111 111 111   111111 1 11    111 111 1111111  111111 111    1111 1111111111111 1111  11111   11111 1111 1    111  111111   111
//111111111 111111111111111    1111111111111111111111111111   1 11111 1 11   11111111   1111   1111  1111 1    111111111 1111111
// 1 111111 111111 1 111 1      1 1111111   11   1  1 11111   1 11 1  1 11   11111 11   1 1    11    1 11       11   1 1 111111 
// 1 111 1  1 1 11   1 1 1      1 111 1 1 1  1   1  1 111 1     1  1     1   11 11 11   1 11    1 1    1         1   1   1 1 11 
// 1  11 11 1 1 1    1   1      1  11 1 1 11 1   1  1  11 1   1          1   1      1   1 1     1 1  1         1 1   1 1 1 1 1  
// 1  1  1    1 1      1        1  1  1 1        1  1  1  1   1 1            1  1         1     1                    1     1 1  
//
//                        _                                  _                                             _          
//             _  ___   _| |_        _   ___   ___   ___   _| |_        _  ___   ___   ___   ___   ___   _| |_    ___ 
//            / |/ _ \ /    _)      / | / _ \ / _ \ / _ \ /    _)      / |/ _ \ / _ \ / _ \ / _ \ / _ \ /    _)  (__ \
//            - | | | ( (| |_       - || | | | | | | | | ( (| |_       - | | | | | | | | | | | | | | | ( (| |_     / /
//            | | | | |\_    \      | || | | | | | | | | |\_    \      | | | | | | | | | | | | | | | | |\_    \   |_| 
//            | | |_| | _| |) )     | || |_| | |_| | |_| | _| |) )     | | |_| | |_| | |_| | |_| | |_| | _| |) )   _  
//            |_|\___/ (_   _/      |_( )___/ \___/ \___/ (_   _/      |_|\___/ \___( )___/ \___/ \___/ (_   _/   (_) 
//                       |_|          |/                    |_|                     |/                    |_|         
                                                                                                                                                               
pragma solidity ^0.5.7;

contract ONE {
    // Track how many tokens are owned by each address.
    mapping (address => uint256) public balanceOf;

    // Modify this section
    string public name = "ONE";
    string public symbol = "ONE";
    uint8 public decimals = 8;
    uint256 public totalSupply = 1 * (uint256(10) ** decimals);

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);

        balanceOf[msg.sender] -= value;  // deduct from sender's balance
        balanceOf[to] += value;          // add to recipient's balance
        emit Transfer(msg.sender, to, value);
        return true;
    }

    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}