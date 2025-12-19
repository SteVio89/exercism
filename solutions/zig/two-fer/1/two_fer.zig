const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const first_part = "One for ";
    const input = name orelse "you";
    const second_part = ", one for me.";
    const result = try std.fmt.bufPrint(buffer, "{s}{s}{s}", .{ first_part, input, second_part });
    return result;
}
