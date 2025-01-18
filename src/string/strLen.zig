const zlib = @import("string.zig").char;

pub fn strLen(str: []const u8) u8 {
    var len: u8 = 0;

    for (str) |char| {
        if (zlib.isPrint(char))
            len += 1;
    }
    return (len);
}
