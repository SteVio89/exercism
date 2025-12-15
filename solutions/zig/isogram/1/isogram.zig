const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    for (str, 0..) |character, i| {
        if (character == ' ' or character == '-') {
            continue;
        }
        var countSame = std.mem.count(u8, str[i+1..], &.{character});
        if (countSame > 0) {
            return false;
        }
        if (std.ascii.isLower(character)) {
            const asUpper = std.ascii.toUpper(character);
            countSame = std.mem.count(u8, str[i+1..], &.{asUpper});
        } else {
            const asLower = std.ascii.toLower(character);
            countSame = std.mem.count(u8, str[i+1..], &.{asLower});
        }
        if (countSame > 0) {
            return false;
        }
    }
    return true;
}
