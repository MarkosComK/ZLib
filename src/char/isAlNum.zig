const zlib = @import("char.zig");

pub fn isAlNum(c: u8) bool {
    return (zlib.isAlpha(c) or zlib.isDigit(c));
}
