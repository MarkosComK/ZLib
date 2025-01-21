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

    // Length Operations
    {
        const len_normal = zib.str.length("Hello");
        const len_empty = zib.str.length("");
        const len_single = zib.str.length("H");
        const len_special = zib.str.length("Hello\n\t");

        printTestResult("{any}", "length_basic_string", 5, len_normal, len_normal == 5);
        printTestResult("{any}", "length_empty_string", 0, len_empty, len_empty == 0);
        printTestResult("{any}", "length_single_char", 1, len_single, len_single == 1);
        printTestResult("{any}", "length_with_escapes", 7, len_special, len_special == 7);

        try expectEqual(len_normal, 5);
        try expectEqual(len_empty, 0);
        try expectEqual(len_single, 1);
        try expectEqual(len_special, 7);
    }

    // Comparison Operations
    {
        const cmp_identical = zib.str.compare("Hello", "Hello");
        const cmp_case_sensitive = zib.str.compare("Hello", "hello");
        const cmp_empty = zib.str.compare("", "");
        const cmp_single = zib.str.compare("A", "A");

        printTestResult("{any:^14}", "compare_identical_strings", true, cmp_identical, cmp_identical);
        printTestResult("{any:^14}", "compare_case_sensitive", false, cmp_case_sensitive, !cmp_case_sensitive);
        printTestResult("{any:^14}", "compare_empty_strings", true, cmp_empty, cmp_empty);
        printTestResult("{any:^14}", "compare_single_char", true, cmp_single, cmp_single);

        try expect(cmp_identical);
        try expect(!cmp_case_sensitive);
        try expect(cmp_empty);
        try expect(cmp_single);
    }

    // Copy Operations
    {
        var normal_buffer: [10]u8 = undefined;
        var single_buffer: [1]u8 = undefined;
        var empty_buffer: [1]u8 = undefined;

        _ = try zib.str.copy(&normal_buffer, "Hello");
        _ = try zib.str.copy(&single_buffer, "A");
        _ = try zib.str.copy(&empty_buffer, "");

        printTestResult("{s:^14}", "copy_basic_string", "Hello", normal_buffer[0..5], std.mem.eql(u8, normal_buffer[0..5], "Hello"));
        printTestResult("{s:^14}", "copy_single_char", "A", single_buffer[0..1], std.mem.eql(u8, single_buffer[0..1], "A"));
        printTestResult("{s:^14}", "copy_empty_string", "", empty_buffer[0..0], std.mem.eql(u8, empty_buffer[0..0], ""));

        try expect(std.mem.eql(u8, normal_buffer[0..5], "Hello"));
        try expect(std.mem.eql(u8, single_buffer[0..1], "A"));
        try expect(std.mem.eql(u8, empty_buffer[0..0], ""));
    }

    // Concatenation Operations
    {
        var normal_buffer: [20]u8 = [_]u8{0} ** 20;
        var exact_buffer: [10]u8 = [_]u8{0} ** 10;
        var small_buffer: [5]u8 = [_]u8{0} ** 5;

        // Basic concatenation
        _ = try zib.str.copy(&normal_buffer, "Hello");
        _ = try zib.str.concat(normal_buffer[0..20], " World");
        printTestResult("{s:^14}", "concat_basic_strings", "Hello World", normal_buffer[0..11], std.mem.eql(u8, normal_buffer[0..11], "Hello World"));

        // Exact size buffer
        _ = try zib.str.copy(&exact_buffer, "Hi");
        _ = try zib.str.concat(exact_buffer[0..], " Test");
        printTestResult("{s:^14}", "concat_exact_buffer", "Hi Test", exact_buffer[0..7], std.mem.eql(u8, exact_buffer[0..7], "Hi Test"));

        // Error case with small buffer
        _ = try zib.str.copy(&small_buffer, "Hi");
        const concat_error = zib.str.concat(small_buffer[0..], " World");
        printTestResult("{any:^14}", "concat_buffer_too_small", error.BufferTooSmall, concat_error, concat_error == error.BufferTooSmall);

        try std.testing.expectEqualSlices(u8, "Hello World", normal_buffer[0..11]);
        try std.testing.expectError(error.BufferTooSmall, concat_error);
    }
}
