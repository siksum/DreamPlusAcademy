// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LCS {
    function getLCSLength(string calldata str1, string calldata str2) public  returns (uint length) {
        // bytes memory s1 = bytes(str1);
        // bytes memory s2 = bytes(str2);
        uint m = bytes(str1).length;
        uint n = bytes(str2).length;
        uint[][] memory dp = new uint[][](m+1);

        for (uint i = 0; i <= m; ++i) {
            unchecked{
                 dp[i] = new uint[](n+1);
            }
           
        }
        for (uint i = 1; i <= m; ++i) {
            for (uint j = 1; j <= n; ++j) {
                if (bytes(str1)[i-1] == bytes(str2)[j-1]) {
                    unchecked{
                        dp[i][j] = dp[i-1][j-1] + 1;
                    }
                }
            }
            
        }
        
        length = dp[m][n];
        //return length;
    }
}