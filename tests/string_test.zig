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
const expect = testing.expect;
const expectEqual = testing.expectEqual;

test "String Function Tests" {
    std.debug.print("\n{s}{s:^60}{s}\n\n", .{ Color.BLUE, "===== String Function Tests =====", Color.RESET });

    // strLen tests
    {
        const len_t1 = zib.str.length("Hello");
        const len_t2 = zib.str.length("");
        const len_t3 = zib.str.length("H");
        const len_t4 = zib.str.length("Hello\n\t");

        printTestResult("{d:^5}", "strLen normal", 5, len_t1, len_t1 == 5);
        printTestResult("{d:^5}", "strLen empty", 0, len_t2, len_t2 == 0);
        printTestResult("{d:^5}", "strLen single", 1, len_t3, len_t3 == 1);
        printTestResult("{d:^5}", "strLen special", 7, len_t4, len_t4 == 7);

        try expectEqual(len_t1, 5);
        try expectEqual(len_t2, 0);
        try expectEqual(len_t3, 1);
        try expectEqual(len_t4, 7);
    }

    // strCmp tests
    {
        const cmp_t1 = zib.str.compare("Hello", "Hello");
        const cmp_t2 = zib.str.compare("Hello", "hello");
        const cmp_t3 = zib.str.compare("", "");
        const cmp_t4 = zib.str.compare("A", "A");

        printTestResult("{:^5}", "strCmp equal", true, cmp_t1, cmp_t1 == true);
        printTestResult("{:^5}", "strCmp case", false, cmp_t2, cmp_t2 == false);
        printTestResult("{:^5}", "strCmp empty", true, cmp_t3, cmp_t3 == true);
        printTestResult("{:^5}", "strCmp single", true, cmp_t4, cmp_t4 == true);

        try expect(cmp_t1);
        try expect(!cmp_t2);
        try expect(cmp_t3);
        try expect(cmp_t4);
    }

    // strCpy tests
    {
        var buffer1: [10]u8 = undefined;
        var buffer2: [1]u8 = undefined;
        _ = try zib.str.copy(&buffer1, "Hello");
        _ = try zib.str.copy(&buffer2, "A");

        printTestResult("{s:^5}", "strCpy normal", "Hello", buffer1[0..5], std.mem.eql(u8, buffer1[0..5], "Hello"));
        printTestResult("{s:^5}", "strCpy single", "A", buffer2[0..1], std.mem.eql(u8, buffer2[0..1], "A"));

        try expect(std.mem.eql(u8, buffer1[0..5], "Hello"));
        try expect(std.mem.eql(u8, buffer2[0..1], "A"));
    }

    // strCat tests
    {
        var buffer: [20]u8 = [_]u8{0} ** 20;
        var short_buf: [5]u8 = [_]u8{0} ** 5;

        // Fill initial content
        const hello = "Hello";
        _ = try zib.str.copy(buffer[0..5], hello);

        // Test normal concatenation
        _ = try zib.str.concat(buffer[0..20], " World");
        try std.testing.expectEqualSlices(u8, "Hello World", buffer[0..11]);

        // Test error case with small buffer
        const result_error = zib.str.concat(short_buf[0..], " World");
        try std.testing.expectError(error.BufferTooSmall, result_error);
    }
}
