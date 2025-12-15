const std = @import("std");

const Verse = struct {
    subject: []const u8,
    action: []const u8,
};

const verses = [_]Verse{
    .{ .subject = "house", .action = "Jack built" },
    .{ .subject = "malt", .action = "lay" },
    .{ .subject = "rat", .action = "ate" },
    .{ .subject = "cat", .action = "killed" },
    .{ .subject = "dog", .action = "worried" },
    .{ .subject = "cow with the crumpled horn", .action = "tossed" },
    .{ .subject = "maiden all forlorn", .action = "milked" },
    .{ .subject = "man all tattered and torn", .action = "kissed" },
    .{ .subject = "priest all shaven and shorn", .action = "married" },
    .{ .subject = "rooster that crowed in the morn", .action = "woke" },
    .{ .subject = "farmer sowing his corn", .action = "kept" },
    .{ .subject = "horse and the hound and the horn", .action = "belonged to" },
};

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var stream = std.io.fixedBufferStream(buffer);
    var writer = stream.writer();

    for (start_verse..end_verse + 1) |verse_number| {
        if (verse_number > start_verse) {
            _ = writer.write("\n") catch unreachable;
        }

        _ = writer.write("This is the ") catch unreachable;
        _ = writer.write(verses[verse_number - 1].subject) catch unreachable;

        if (verse_number == 1) {
            _ = writer.write(" that ") catch unreachable;
            _ = writer.write(verses[verse_number - 1].action) catch unreachable;
            _ = writer.write(".") catch unreachable;
            continue;
        }

        _ = writer.write(" that ") catch unreachable;
        _ = writer.write(verses[verse_number - 1].action) catch unreachable;

        var i = verse_number - 1;
        while (i > 1) : (i -= 1) {
            _ = writer.write(" the ") catch unreachable;
            _ = writer.write(verses[i - 1].subject) catch unreachable;
            _ = writer.write(" that ") catch unreachable;
            _ = writer.write(verses[i - 1].action) catch unreachable;
        }

        _ = writer.write(" in the ") catch unreachable;
        _ = writer.write(verses[0].subject) catch unreachable;
        _ = writer.write(" that ") catch unreachable;
        _ = writer.write(verses[0].action) catch unreachable;
        _ = writer.write(".") catch unreachable;
    }

    return stream.getWritten();
}
