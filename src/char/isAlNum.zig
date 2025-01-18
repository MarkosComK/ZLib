const zib = @import("char.zig");

pub fn isAlNum(c: u8) bool {
    return (zib.isAlpha(c) or zib.isDigit(c));
}
