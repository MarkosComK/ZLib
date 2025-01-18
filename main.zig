const zlib = @import("zlib.zig");
const std = @import("std");

pub fn main() void {
    const testChars = [_]u8{ 'A', 'z', '5', '!', ' ', 127, 128, 'M', 'q' };

    for (testChars) |char| {
        std.debug.print("Testing character: '{c}' (ASCII: {d})\n", .{ char, char });
        std.debug.print("isAlpha: {}\n", .{zlib.char.isAlpha(char)});
        std.debug.print("isDigit: {}\n", .{zlib.char.isDigit(char)});
        std.debug.print("isAlNum: {}\n", .{zlib.char.isAlNum(char)});
        std.debug.print("isAscii: {}\n", .{zlib.char.isAscii(char)});
        std.debug.print("isPrint: {}\n", .{zlib.char.isPrint(char)});
        std.debug.print("toUpper: {c}\n", .{zlib.char.toUpper(char)});
        std.debug.print("toLower: {c}\n", .{zlib.char.toLower(char)});
        std.debug.print("\n", .{});
    }
}
