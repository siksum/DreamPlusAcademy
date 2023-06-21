// pragma solidity ^0.8.0;

// contract LongestCommonSubstring {
//     function longestCommonSubstring(string memory str1, string memory str2) public pure returns (uint length) {
//         bytes memory s1 = bytes(str1);
//         bytes memory s2 = bytes(str2);
//         uint m = s1.length;
//         uint n = s2.length;
//         uint[][] lcss = new uint[][](m+1);
//         uint maxLength = 0;
//         uint endIndex = m;
//         for (uint i = 0; i < m+1; i++) {
//             lcss[i] = new uint[](n+1);
//             for (uint j = 0; j < n+1; j++) {
//                 if (i == 0 || j == 0) {
//                     lcss[i][j] = 0;
//                 } else if (s1[i-1] == s2[j-1]) {
//                     lcss[i][j] = lcss[i-1][j-1] + 1;
//                     if (lcss[i][j] > maxLength) {
//                         maxLength = lcss[i][j];
//                         endIndex = i-1;
//                     }
//                 } else {
//                     lcss[i][j] = 0;
//                 }
//             }
//         }
//     }
// }
