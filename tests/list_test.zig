//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-25 19:57:20                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-25 22:58:20                    |
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

test "Lists Function Tests" {
    std.debug.print("\n{s}{s:^60}{s}\n\n", .{ Color.BLUE, "===== Lists Function Tests =====", Color.RESET });
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // List New
    {
        const node1 = try zib.list.new([]const u8, allocator, "Node1");
        const node2 = try zib.list.new([]const u8, allocator, "Node2");
        const node3 = try zib.list.new([]const u8, allocator, "Node3");

        defer {
            allocator.destroy(node3);
            allocator.destroy(node1); //free order doesn't matter
            allocator.destroy(node2);
            if (gpa.deinit() == .leak) std.debug.print("List: LEAKS!!\n", .{});
        }

        printTestResult("{s}", "new([]const u8, alloc, 'Node1')", "Node1", node1.data, zib.str.compare("Node1", node1.data) == true);
        printTestResult("{s}", "new([]const u8, alloc, 'Node2')", "Node2", node2.data, zib.str.compare("Node2", node2.data) == true);
        printTestResult("{s}", "new([]const u8, alloc, 'Node3')", "Node3", node3.data, zib.str.compare("Node3", node3.data) == true);

        // Point each node to next
        node1.next = node2;
        node2.next = node3;
        var current: *zib.list.Node([]const u8) = node1;
        var i: usize = 0;
        while (true) {
            std.debug.print("Node{d}.data: {s}\n", .{ i, current.data });
            if (current.next == null) break;
            current = current.next.?;
            i += 1;
        }

        try expectEqual(node1.data, "Node1");
        try expectEqual(node2.data, "Node2");
        try expectEqual(node3.data, "Node3");
    }
}
