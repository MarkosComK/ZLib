pub fn strChr(str: []const u8, chr: u8) ?usize {
    for (str, 0..) |c, i| {
        if (c == chr) {
            return (i);
        }
    }
    return (null);
}
