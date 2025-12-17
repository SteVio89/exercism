const std = @import("std");

const allLetter = "abcdefghijklmnopqrstuvwxyz";

pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) {
        return false;
    }
    for (allLetter) |letter| {
        const asUpper = std.ascii.toUpper(letter);
        if (!(std.mem.containsAtLeast(u8, str, 1, &.{letter}) or std.mem.containsAtLeast(u8, str, 1, &.{asUpper}))) {
            return false;
        }
    }
    return true;
}
