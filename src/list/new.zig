//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-25 19:30:10                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-25 13:31:19                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const Node = @import("./list.zig").Node;
const Error = @import("./list.zig").Error;
const std = @import("std");

pub fn new(comptime T: type, allocator: std.mem.Allocator, data: T) Error!*Node(T) {
    const node: *Node(T) = try allocator.create(Node(T));
    node.* = .{
        .next = null,
        .data = data,
    };
    return node;
}
