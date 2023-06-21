pragma solidity ^0.8.0;

contract LongestCommonSubstring {
    
    function lcs(string memory s1, string memory s2) public pure returns (string memory) {
        uint256 len1 = bytes(s1).length;
        uint256 len2 = bytes(s2).length;
        uint256[][] memory table = new uint256[][](len1+1);
        uint256 maxLength = 0;
        uint256 endIndex = 0;
        for (uint256 i = 0; i <= len1; i++) {
            table[i] = new uint256[](len2+1);
            for (uint256 j = 0; j <= len2; j++) {
                if (i == 0 || j == 0) {
                    table[i][j] = 0;
                } else if (bytes(s1)[i-1] == bytes(s2)[j-1]) {
                    table[i][j] = table[i-1][j-1] + 1;
                    if (table[i][j] > maxLength) {
                        maxLength = table[i][j];
                        endIndex = i-1;
                    }
                } else {
                    table[i][j] = 0;
                }
            }
        }
        if (maxLength == 0) {
            return "";
        }
        bytes memory longestSubstring = new bytes(maxLength);
        for (uint256 i = maxLength-1; i >=0; i--) {
            longestSubstring[i] = bytes(s1)[endIndex];
            endIndex--;
        }
        return string(longestSubstring);
    }
}