const std = @import("std");
/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (0..s.len) |index|{
        const pos = s.len - 1 - index;
        if (pos < 0) { //empty strings
            buffer[0] = s[index];
        } else {
            buffer[pos] = s[index];
        }
    }
    return buffer[0..s.len];
}
