// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LCSubstringSolver {
   function getLCSLength(string memory str1, string memory str2) external pure returns (uint256 length) {
       uint m = bytes(str1).length;
       uint n = bytes(str2).length;
       //length = 0;
       uint[][] memory dp = new uint[][](m + 1);
       for (uint i = 0; i <= m; i++) {
           dp[i] = new uint[](n + 1);
           for (uint j = 0; j <= n; j++) {
               if (i == 0 || j == 0) {
                   dp[i][j] = 0;
               } else if (bytes(str1)[i - 1] == bytes(str2)[j - 1]) {
                   dp[i][j] = dp[i - 1][j - 1] + 1;
                   if (dp[i][j] > length) {
                       length = dp[i][j];
                   }
               } else {
                   dp[i][j] = 0;
               }
           }
       }
       return length;
   }
}
