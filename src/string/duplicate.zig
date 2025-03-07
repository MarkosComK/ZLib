//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 18:25:10                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 18:25:19                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const Allocator = @import("std").mem.Allocator;
const length = @import("../string/length.zig").length;
const copy = @import("../string/copy.zig").copy;
const Error = @import("string.zig").Error;

pub fn duplicate(allocator: Allocator, str: []const u8) Error![]u8 {
    var dup: []u8 = try allocator.alloc(u8, length(str));
    dup = try copy(dup, str);
    return dup;
}
