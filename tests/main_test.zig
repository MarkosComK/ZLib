const std = @import("std");

pub const Color = struct {
    pub const RED = "\x1b[31m";
    pub const GREEN = "\x1b[32m";
    pub const YELLOW = "\x1b[33m";
    pub const BLUE = "\x1b[34m";
    pub const RESET = "\x1b[0m";
};

pub fn printTestResult(comptime format: []const u8, test_name: []const u8, expected: anytype, actual: anytype, passed: bool) void {
    const status = if (passed) Color.GREEN ++ "PASS" ++ Color.RESET else Color.RED ++ "FAIL" ++ Color.RESET;
    std.debug.print("{s:^12} | {s:<0} Expected: | " ++ Color.YELLOW ++ format ++ Color.RESET ++
        " | Actual: | " ++ Color.GREEN ++ format ++ Color.RESET ++
        " | {s}\n", .{ test_name, "", expected, actual, status });
}

// Import all test files
comptime {
    _ = @import("char_test.zig");
    _ = @import("math_test.zig");
    _ = @import("string_test.zig");
    _ = @import("cast_test.zig");
}
