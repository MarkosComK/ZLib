//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 21:45:20                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 21:45:20                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const std = @import("std");
const zib = @import("zib");
const Color = @import("main_test.zig").Color;
const printTestResult = @import("main_test.zig").printTestResult;
const testing = std.testing;

test "String Functions tests" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const split: [][]u8 = try zib.str.strSplit(allocator, "--this-is-a-test--", '-');
    for (split, 0..) |word, i| {
        std.debug.print("split {s} i:{d}\n", .{ word, i });
    }
}
