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

const std = @import("std");
const length = @import("./length.zig").length;
const duplicate = @import("./duplicate.zig").duplicate;
const Error = @import("./string.zig").Error;

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

pub fn split(allocator: std.mem.Allocator, str: []const u8, delimiter: u8) ![][]u8 {
    if (length(str) == 0) return Error.EmptyString;

    const words: usize = countWords(str, delimiter);
    const res: [][]u8 = try allocator.alloc([]u8, words);
    var start: usize = 0;
    var end: usize = 0;
    var copy: bool = false;
    var in_word: bool = false;
    var word: usize = 0;
    for (str, 0..) |char, i| {
        if (char == delimiter) {
            if (in_word) {
                end = i;
                copy = true;
            }
            in_word = false;
        } else if (!in_word) {
            in_word = true;
            start = i;
        }
        if (copy) {
            res[word] = try duplicate(allocator, str[start..end]);
            word += 1;
            start = end + 1;
            end = start;
            copy = false;
        }
    }
    return res;
}
