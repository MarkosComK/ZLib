const zib = @import("zib.zig");
const std = @import("std");

pub fn main() void {
    // Character function tests
    const testChars = [_]u8{ 'A', 'z', '5', '!', ' ', 127, 128, 'M', 'q' };

    for (testChars) |char| {
        std.debug.print("Testing character: '{c}' (ASCII: {d})\n", .{ char, char });
        std.debug.print("isAlpha: {}\n", .{zib.char.isAlpha(char)});
        std.debug.print("isDigit: {}\n", .{zib.char.isDigit(char)});
        std.debug.print("isAlNum: {}\n", .{zib.char.isAlNum(char)});
        std.debug.print("isAscii: {}\n", .{zib.char.isAscii(char)});
        std.debug.print("isPrint: {}\n", .{zib.char.isPrint(char)});
        std.debug.print("toUpper: {c}\n", .{zib.char.toUpper(char)});
        std.debug.print("toLower: {c}\n", .{zib.char.toLower(char)});
        std.debug.print("\n", .{});
    }

    // String operation tests
    const str1 = "Hello";
    const str2 = " World!";
    var buffer: [20]u8 = undefined;

    std.debug.print("String Operations Tests:\n", .{});
    std.debug.print("strLen('{s}'): {}\n", .{ str1, zib.str.strLen(str1) });

    _ = zib.str.strCpy(&buffer, str1);
    std.debug.print("strCpy result: '{s}'\n", .{buffer});

    _ = zib.str.strCat(&buffer, str2);
    std.debug.print("strCat result: '{s}'\n", .{buffer});

    std.debug.print("strCmp('Hello', 'Hello'): {}\n", .{zib.str.strCmp("Hello", "Hello")});
    std.debug.print("strCmp('Hello', 'World'): {}\n", .{zib.str.strCmp("Hello", "World")});

    const char_to_find = 'H';
    const char_pos = zib.str.strChr(str1, char_to_find);
    std.debug.print("strChr('{s}', '{c}'): {?}\n", .{ str1, char_to_find, char_pos });

    const char_pos_r = zib.str.strRChr(str1, char_to_find);
    std.debug.print("strRChr('{s}', '{c}'): {?}\n", .{ str1, char_to_find, char_pos_r });

    //const substr = "lo";
    //const substr_pos = zlib.str.strStr(str1, substr);
    //std.debug.print("strStr('{s}', '{s}'): {?}\n", .{ str1, substr, substr_pos });
}
