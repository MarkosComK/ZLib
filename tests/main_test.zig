const std = @import("std");

// Import all test files
comptime {
    _ = @import("char_test.zig");
    _ = @import("math_test.zig");
    _ = @import("string_test.zig");
    _ = @import("cast_test.zig");
}
