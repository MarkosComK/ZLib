//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 12:41:02                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 13:20:10                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================

const zib = @import("zib.zig");
const std = @import("std");

pub fn main() void {
    // Character function tests
    const testChars = [_]u8{ 'A', 'z', '5', '!', ' ', 127, 128, 'M', 'q' };
    for (testChars) |char| {
        std.debug.print("Testing character: '{c}' (ASCII: {d})\n", .{ char, char });
        std.debug.print("isAlpha: {}\n", .{zib.char.isAlpha(char)});
        std.debug.print("isDigit: {}\n", .{zib.char.isDigit(char)});
        std.debug.print("isAlNum: {}\n", .{zib.char.isAlNum(char)});
        std.debug.print("isAscii: {}\n", .{zib.char.isAscii(char)});
        std.debug.print("isPrint: {}\n", .{zib.char.isPrint(char)});
        std.debug.print("toUpper: {c}\n", .{zib.char.toUpper(char)});
        std.debug.print("toLower: {c}\n", .{zib.char.toLower(char)});
        std.debug.print("\n", .{});
    }

    // String operation tests
    const str1 = "Hello";
    const str2 = " World!";
    var buffer: [20]u8 = undefined;
    std.debug.print("String Operations Tests:\n", .{});
    std.debug.print("strLen('{s}'): {}\n", .{ str1, zib.str.strLen(str1) });
    _ = zib.str.strCpy(&buffer, str1);
    std.debug.print("strCpy result: '{s}'\n", .{buffer});
    _ = zib.str.strCat(&buffer, str2);
    std.debug.print("strCat result: '{s}'\n", .{buffer});
    std.debug.print("strCmp('Hello', 'Hello'): {}\n", .{zib.str.strCmp("Hello", "Hello")});
    std.debug.print("strCmp('Hello', 'World'): {}\n", .{zib.str.strCmp("Hello", "World")});
    const char_to_find = 'H';
    const char_pos = zib.str.strChr(str1, char_to_find);
    std.debug.print("strChr('{s}', '{c}'): {?}\n", .{ str1, char_to_find, char_pos });
    const char_pos_r = zib.str.strRChr(str1, char_to_find);
    std.debug.print("strRChr('{s}', '{c}'): {?}\n", .{ str1, char_to_find, char_pos_r });
    const substr = "lo";
    const substr_pos = zib.str.strStr(str1, substr);
    std.debug.print("strStr('{s}', '{s}'): {?}\n", .{ str1, substr, substr_pos });

    // Power function tests
    std.debug.print("\nPower Function Tests:\n", .{});
    std.debug.print("pow(2, 3): {}\n", .{zib.math.pow(2, 3)}); // Should be 8
    std.debug.print("pow(5, 0): {}\n", .{zib.math.pow(5, 0)}); // Should be 1
    std.debug.print("pow(-2, 3): {}\n", .{zib.math.pow(-2, 3)}); // Should be -8
    //
    // // Square root tests
    // std.debug.print("\nSquare Root Tests:\n", .{});
    // std.debug.print("sqrt(16): {}\n", .{zib.math.sqrt(16)});      // Should be 4
    // std.debug.print("sqrt(2): {}\n", .{zib.math.sqrt(2)});        // Should be ~1.414
    // std.debug.print("sqrt(0): {}\n", .{zib.math.sqrt(0)});        // Should be 0
    //
    // // Absolute value tests
    // std.debug.print("\nAbsolute Value Tests:\n", .{});
    // std.debug.print("abs(-42): {}\n", .{zib.math.abs(-42)});      // Should be 42
    // std.debug.print("abs(42): {}\n", .{zib.math.abs(42)});        // Should be 42
    // std.debug.print("abs(0): {}\n", .{zib.math.abs(0)});          // Should be 0
    //
    // // Factorial tests
    // std.debug.print("\nFactorial Tests:\n", .{});
    // std.debug.print("factorial(5): {}\n", .{zib.math.factorial(5)});   // Should be 120
    // std.debug.print("factorial(0): {}\n", .{zib.math.factorial(0)});   // Should be 1
    // std.debug.print("factorial(1): {}\n", .{zib.math.factorial(1)});   // Should be 1
    //
    // // Fibonacci tests
    // std.debug.print("\nFibonacci Tests:\n", .{});
    // std.debug.print("fibonacci(0): {}\n", .{zib.math.fibonacci(0)});   // Should be 0
    // std.debug.print("fibonacci(1): {}\n", .{zib.math.fibonacci(1)});   // Should be 1
    // std.debug.print("fibonacci(10): {}\n", .{zib.math.fibonacci(10)}); // Should be 55
    //
    // // GCD tests
    // std.debug.print("\nGCD Tests:\n", .{});
    // std.debug.print("gcd(48, 18): {}\n", .{zib.math.gcd(48, 18)});    // Should be 6
    // std.debug.print("gcd(54, 24): {}\n", .{zib.math.gcd(54, 24)});    // Should be 6
    // std.debug.print("gcd(7, 13): {}\n", .{zib.math.gcd(7, 13)});      // Should be 1
    //
    // // Prime number tests
    // std.debug.print("\nPrime Number Tests:\n", .{});
    // std.debug.print("isPrime(17): {}\n", .{zib.math.isPrime(17)});     // Should be true
    // std.debug.print("isPrime(4): {}\n", .{zib.math.isPrime(4)});       // Should be false
    // std.debug.print("isPrime(2): {}\n", .{zib.math.isPrime(2)});       // Should be true
    //
    // // Next prime tests
    // std.debug.print("\nNext Prime Tests:\n", .{});
    // std.debug.print("nextPrime(17): {}\n", .{zib.math.nextPrime(17)}); // Should be 19
    // std.debug.print("nextPrime(2): {}\n", .{zib.math.nextPrime(2)});   // Should be 3
    // std.debug.print("nextPrime(18): {}\n", .{zib.math.nextPrime(18)}); // Should be 19
    //
    // // Prime factorization tests
    // std.debug.print("\nPrime Factorization Tests:\n", .{});
    // var factors = zib.math.primeFactors(84);
    // std.debug.print("primeFactors(84): ", .{});
    // for (factors) |factor| {
    //     std.debug.print("{} ", .{factor});                              // Should be 2 2 3 7
    // }
    // std.debug.print("\n", .{});
    //
    // // LCM tests
    // std.debug.print("\nLCM Tests:\n", .{});
    // std.debug.print("lcm(15, 20): {}\n", .{zib.math.lcm(15, 20)});    // Should be 60
    // std.debug.print("lcm(12, 18): {}\n", .{zib.math.lcm(12, 18)});    // Should be 36
    // std.debug.print("lcm(7, 13): {}\n", .{zib.math.lcm(7, 13)});      // Should be 91
}
