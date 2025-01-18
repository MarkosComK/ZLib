const strLen = @import("strLen.zig").strLen;

pub fn strStr(haystack: []const u8, needle: []const u8) ?usize {
    const nLen: usize = strLen(needle);
    const hLen: usize = strLen(haystack);

    if (nLen == 0) return null;
    if (nLen >= hLen) return null;

    var i: usize = 0;

    while (i <= hLen - nLen) : (i += 1) {
        var match: usize = 0;
        var j: usize = 0;

        while (j < nLen) : (j += 1) {
            if (haystack[i + j] != needle[j]) {
                break;
            }
            match += 1;
        }
        if (match == nLen) return i;
    }
    return (null);
}
