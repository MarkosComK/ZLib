const std = @import("std");
const zib = @import("zib");
const Color = @import("main_test.zig").Color;
const testing = std.testing;

fn printTestResult(comptime format: []const u8, test_name: []const u8, expected: anytype, actual: anytype, passed: bool) void {
    const status = if (passed) Color.GREEN ++ "PASS" ++ Color.RESET else Color.RED ++ "FAIL" ++ Color.RESET;
    std.debug.print("{s:^12} | {s:<0} Expected: | " ++ Color.YELLOW ++ format ++ Color.RESET ++
        " | Actual: | " ++ Color.GREEN ++ format ++ Color.RESET ++
        " | {s}\n", .{ test_name, "", expected, actual, status });
}

test "Math Function Tests" {
    std.debug.print("\n{s}{s:^60}{s}\n\n", .{ Color.BLUE, "===== Math Function Tests =====", Color.RESET });

    // Power function tests
    const pow_test1 = zib.math.pow(2, 3);
    const pow_test2 = zib.math.pow(5, 0);
    const pow_test3 = zib.math.pow(-2, 3);

    printTestResult("{d:^5}", "pow(2, 3)", 8, pow_test1, pow_test1 == 8);
    printTestResult("{d:^5}", "pow(5, 0)", 1, pow_test2, pow_test2 == 1);
    printTestResult("{d:^5}", "pow(-2, 3)", -8, pow_test3, pow_test3 == -8);

    try testing.expectEqual(pow_test1, 8);
    try testing.expectEqual(pow_test2, 1);
    try testing.expectEqual(pow_test3, -8);

    // Square root tests
    const sqrt_test1 = zib.math.sqrt(16);
    const sqrt_test2 = zib.math.sqrt(0);

    printTestResult("{d:^5}", "sqrt(16)", 4, sqrt_test1, sqrt_test1 == 4);
    printTestResult("{d:^5}", "sqrt(0)", 0, sqrt_test2, sqrt_test2 == 0);

    try testing.expectEqual(sqrt_test1, 4);
    try testing.expectEqual(sqrt_test2, 0);

    // Absolute value tests
    const abs_test1 = zib.math.abs(-42);
    const abs_test2 = zib.math.abs(42);

    printTestResult("{d:^5}", "abs(-42)", 42, abs_test1, abs_test1 == 42);
    printTestResult("{d:^5}", "abs(42)", 42, abs_test2, abs_test2 == 42);

    try testing.expectEqual(abs_test1, 42);
    try testing.expectEqual(abs_test2, 42);
}
