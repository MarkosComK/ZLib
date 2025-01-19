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

test "Char Function Tests" {
    std.debug.print("\n{s}{s:^60}{s}\n\n", .{ Color.BLUE, "===== Char Function Tests =====", Color.RESET });

    // isAlpha function tests
    const isAlpha_t1 = zib.char.isAlpha('A');
    const isAlpha_t2 = zib.char.isAlpha('z');
    const isAlpha_t3 = zib.char.isAlpha('5');

    printTestResult("{:^5}", "isAlpha('A')", true, isAlpha_t1, isAlpha_t1 == true);
    printTestResult("{:^5}", "isAlpha('z')", true, isAlpha_t2, isAlpha_t2 == true);
    printTestResult("{:^5}", "isAlpha('5')", false, isAlpha_t3, isAlpha_t3 == false);

    try testing.expect(isAlpha_t1);
    try testing.expect(isAlpha_t2);
    try testing.expect(!isAlpha_t3);

    // toUpper function tests
    const toUpper_t1 = zib.char.toUpper('A');
    const toUpper_t2 = zib.char.toUpper('z');
    const toUpper_t3 = zib.char.toUpper('5');

    printTestResult("{c:^5}", "toUpper('A')", 'A', toUpper_t1, toUpper_t1 == 'A');
    printTestResult("{c:^5}", "toUpper('z')", 'Z', toUpper_t2, toUpper_t2 == 'Z');
    printTestResult("{c:^5}", "toUpper('5')", '5', toUpper_t3, toUpper_t3 == '5');

    try testing.expectEqual(toUpper_t1, 'A');
    try testing.expectEqual(toUpper_t2, 'Z');
    try testing.expectEqual(toUpper_t3, '5');
}
