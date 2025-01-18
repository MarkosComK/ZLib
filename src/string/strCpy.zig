pub fn strCpy(dst: []u8, src: []const u8) []u8 {
    for (src, 0..) |char, index| {
        dst[index] = char;
    }
    return (dst);
}
