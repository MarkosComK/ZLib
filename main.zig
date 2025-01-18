const zlib = @import("zlib.zig"); // Import your compiled library
const std = @import("std");

pub fn main() void {
    const char: u8 = 'A';
    std.debug.print("c:{c} isAlpha: {}\n", .{ char, zlib.char.isAlpha(char) });
    std.debug.print("c:{c} isDigit: {}\n", .{ char, zlib.char.isDigit(char) });
}
