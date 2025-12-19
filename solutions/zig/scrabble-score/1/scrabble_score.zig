pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;
    for (s) |c| {
        switch (c) {
            'A', 'a', 'E', 'e', 'I', 'i', 'O', 'o', 'U', 'u', 'L', 'l', 'N', 'n', 'R', 'r', 'S', 's', 'T', 't' => {
                sum += 1;
            },
            'D', 'd', 'G', 'g' => {
                sum += 2;
            },
            'B', 'b', 'C', 'c', 'M', 'm', 'P', 'p' => {
                sum += 3;
            },
            'F', 'f', 'H', 'h', 'V', 'v', 'W', 'w', 'Y', 'y' => {
                sum += 4;
            },
            'K', 'k' => {
                sum += 5;
            },
            'J', 'j', 'X', 'x' => {
                sum += 8;
            },
            'Q', 'q', 'Z', 'z' => {
                sum += 10;
            },
            else => {},
        }
    }
    return sum;
}
