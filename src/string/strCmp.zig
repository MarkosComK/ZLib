const zlib = @import("string.zig");

pub fn strCmp(s1: []const u8, s2: []const u8) bool {
    if (zlib.strLen(s1) != zlib.strLen(s2))
        return false;
    for (s1, s2) |c1, c2| {
        if (c1 != c2)
            return (false);
    }
    return (true);
}
