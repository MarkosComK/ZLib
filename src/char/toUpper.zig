pub fn toUpper(c: u8) u8 {
    if (c <= 'z' and c >= 'a') {
        return (c - 32);
    } else {
        return (c);
    }
}
