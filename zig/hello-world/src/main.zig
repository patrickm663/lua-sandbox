const std = @import("std");

pub fn main() !void {
    //const N: i16 = 20;
    //const a: i16 = 3;
    //const b: i16 = 5;
    //try ziggZagg(N, a, b);
    const n = try getUserInput();
    const p: i64 = countPrimes(n);
    std.debug.print("Number of primes less than or equal to {} is: {}", .{n, p});
}

fn ziggZagg(n: i16, a: u16, b: u16) !void {
    const stdout = std.io.getStdOut().writer();
    var i: i16 = 1;
    while (i <= n) : (i += 1) {
        if (i % (a*b) == 0) {
            try stdout.writeAll("ZiggZagg\n");
        } else if (i % a == 0) {
            try stdout.writeAll("Zigg\n");
        } else if (i % b == 0) {
            try stdout.writeAll("Zagg\n");
        } else {
            try stdout.print("{d}\n", .{i});
        }
    }
}

fn isPrime(n: u64) bool {
    if (n < 2) {
        return(false);
    } else if (n == 2) {
        return(true);
    } else {
        var i: u64 = 2;
        const limit: u64 = std.math.sqrt(n); 
        while (i <= limit) : (i += 1) {
            if (n % i == 0) {
                return(false);
            }
        }
        return(true);
    }
}

fn getUserInput() !u64 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [10]u8 = undefined;
    try stdout.print("Enter a number ", .{});
    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        return std.fmt.parseInt(u64, user_input, 10);
    } else {
        return @as(u64, 0);
    }
}

fn countPrimes(n: u64) i64 {
    if (n <= 1) {
        return 0;
    }
    var c :i64 = 0;
    var i :u64 = 0;
    while (i <= n) : (i += 1) {
        if (isPrime(i)) {
            c += 1;
        }
    }
    return c;
} 
