//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 12:41:10                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 13:20:19                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

//char------------------------------------------------------------------------//
pub const char = @import("../char/char.zig");

//strError--------------------------------------------------------------------//
pub const Error = error{
    EmptyString,
    InvalidDelimiter,
    BufferTooSmall,
    OutOfMemory,
};

//String---------------------------------------------------------------------//
pub const length = @import("length.zig").length;
pub const copy = @import("copy.zig").copy;
pub const concat = @import("concat.zig").concat;
pub const compare = @import("compare.zig").compare;
pub const find = @import("find.zig").find;
pub const findR = @import("findR.zig").findR;
pub const contains = @import("contains.zig").contains;
pub const duplicate = @import("duplicate.zig").duplicate;
pub const split = @import("split.zig").split;
