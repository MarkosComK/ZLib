const std = @import("std");

pub const Color = struct {
    pub const RED = "\x1b[31m";
    pub const GREEN = "\x1b[32m";
    pub const YELLOW = "\x1b[33m";
    pub const BLUE = "\x1b[34m";
    pub const RESET = "\x1b[0m";
};

// Import all test files
comptime {
    _ = @import("char_test.zig");
    _ = @import("math_test.zig");
    _ = @import("string_test.zig");
    _ = @import("cast_test.zig");
}
