//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-20 20:41:10                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-20 20:20:19                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const strLen = @import("strLen.zig").strLen;
const std = @import("std");

//first we need to count words using delimiter
//remember that we can have spaces before and after string so jump them
//
//"--this-----is-a-split--example-"
fn countWords(str: []const u8, delimiter: u8) usize {
    var words: usize = 0;
    var in_word: bool = false;

    for (str) |char| {
        if (char == delimiter) {
            in_word = false;
        } else if (!in_word) {
            words += 1;
            in_word = true;
        }
    }
    return words;
}

//pub fn strSplit(allocator: std.mem.Allocator, str: []const u8, delimiter: u8) ![][]const u8 {
//   if (strLen(str) == 0) return null;
//
//   const words: usize = countWords(str, delimiter);
//   var split: [][]u8 = allocator.alloc([]u8, words);
//}

pub fn main() !void {
    //const gpa = std.heap.GeneralPurposeAllocator(.{}){};
    //const allocator = gpa.allocator();
    //strSplit(&allocator, "--this-is-a-test--");
    const string = "this-is----a----test";
    std.debug.print("words = {d}\n", .{countWords(string, '-')});
}
