const strLen = @import("strLen.zig").strLen;

pub fn strRChr(str: []const u8, chr: u8) ?usize {
    var i: u8 = strLen(str) - 1;

    while (i >= 0) : (i -= 1) {
        if (str[i] == chr) {
            return (i);
        }
    }
    return (null);
}
