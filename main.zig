const zlib = @import("zlib.zig"); // Import your compiled library
const std = @import("std");

pub fn main() void {
    std.debug.print("testttttt {}\n", .{zlib.isAlpha('a')});
}
