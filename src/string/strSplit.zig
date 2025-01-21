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

const strLen = @import("./strLen.zig").strLen;
const strDup = @import("./strDup.zig").strDup;
const StrError = @import("./string.zig").StrError;
const std = @import("std");

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

pub fn strSplit(allocator: std.mem.Allocator, str: []const u8, delimiter: u8) ![][]u8 {
    if (strLen(str) == 0) return StrError.EmptyString;

    const words: usize = countWords(str, delimiter);
    const split: [][]u8 = try allocator.alloc([]u8, words);
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
            split[word] = try strDup(allocator, str[start..end]);
            word += 1;
            start = end + 1;
            end = start;
            copy = false;
        }
    }
    return split;
}
