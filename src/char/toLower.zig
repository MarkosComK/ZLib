pub fn toLower(c: u8) u8 {
    if (c <= 'Z' and c >= 'A') {
        return (c + 32);
    } else {
        return (c);
    }
    unreachable;
}
