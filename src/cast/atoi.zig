//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 16:31:14                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 16:31:14                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const isSpace = @import("../char/isSpace.zig").isSpace;
const isDigit = @import("../char/isDigit.zig").isDigit;
const isPrint = @import("../char/isPrint.zig").isPrint;

pub fn atoi(str: []const u8) i32 {
    var i: usize = 0;
    var neg: i8 = 1;
    var res: i32 = 0;

    for (str) |char| {
        if (isSpace(char)) {
            i += 1;
        } else break;
    }
    if (str[i] == '-' or str[i] == '+') {
        if (str[i] == '-') {
            neg = -1;
        }
        while (str[i] == '-' or str[i] == '+') : (i += 1) {}
    }
    for (str[i..]) |char| {
        if (isDigit(char)) {
            res = res * 10 + char - 48;
        } else break;
    }
    return (res * neg);
}
