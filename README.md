# Zig Library

The Zib library (cool name, isn't?) reimplements common functions, inspired by [libft](https://github.com/MarkosComK/42-Libft).

The goal is to learn the basics of the language while building my own ZLib.

## Table of Contents
- [Why Zig?](#why-zig)
- [Project Status](#project-status)
  - [Character Functions](#character-functions)
  - [String Operations](#string-operations)
  - [Math Operations](#math-operations)
  - [Memory Operations](#memory-operations)
  - [Cast Functions](#cast-functions)
  - [List Operations](#list-operations)
  - [File Operations](#file-operations)
- [Docs](#docs)
- [Building](#building)
- [Testing](#testing)
- [Usage](#usage)
- [Contributing](#contributing)
- [Resources](#resources)
- [License](#license)

## Why Zig?
First - why not?
Second - well... its nice to say - Zig - that's it.

## Project Status

❌ = Implemented and tested
🚧 = In progress

### Character Functions
- ✅ `isAlpha` - Check if character is alphabetic
- ✅ `isDigit` - Check if character is a digit
- ✅ `isAlNum` - Check if character is alphanumeric
- ✅ `isAscii` - Check if character is ASCII
- ✅ `isSpace` - Check if character is space
- ✅ `isPrint` - Check if character is printable
- ✅ `toUpper` - Convert to uppercase
- ✅ `toLower` - Convert to lowercase

### String Operations
- ✅ `strLen` - Get string length
- ✅ `strCpy` - Copy string
- ✅ `strCat` - Concatenate strings
- ✅ `strCmp` - Compare strings
- ✅ `strChr` - Find character in string
- ✅ `strRChr` - Find character from end of string
- ✅ `strStr` - Find substring
- ✅ `strDup` - Duplicate a string
- ✅ `strSplit` - String split by delimiter

### Math Operations
- ✅ pow - Power function
- ❌ sqrt - Square root
- ✅ abs - Absolute value
- ✅ fact - Factorial calculation
- ✅ fibo - Fibonacci sequence
- ❌ gcd - Greatest common divisor
- ❌ isPrime - Prime number check
- ❌ nextPrime - Find next prime
- ❌ primeFactors - Prime factorization
- ❌ lcm - Least common multiple

### Memory Operations
- ❌ `memSet` - Fill memory
- ❌ `memCpy` - Copy memory
- ❌ `memMove` - Move memory
- ❌ `memCmp` - Compare memory
- ❌ `memChr` - Find byte in memory

### Cast Functions
- ✅ `atoi` - Convert ASCII to integer
- ❌ `itoa` - Convert integer to ASCII

### List Operations
- ❌ `List` - Generic list implementation
- ❌ `listNew` - Create new list
- ❌ `listAdd` - Add element
- ❌ `listRemove` - Remove element
- ❌ `listClear` - Clear list

### File Operations
- ❌ `getLine` - Get line from a file
- ❌ `getFile` - Get entire file

## Docs
you can visit the docs here, but they're still in progress...
[ZibDocs](https://markoscomk.github.io/Zib/).

## Building

```bash
# this will generate a static lib (libzib.a) using the zib build system
# for more information read the comments in ./build.zig
git clone git@github.com:MarkosComK/Zib.git &&
cd Zib &&
zig build
```

## Testing

```bash
#tests can be found in ./tests
zig build test
```

## Usage

```zig
// You can check an example in src/main.zig for import the lib
// properly with @import("zib") see the ./build.zig
const std = @import("std");
const zib = @import("zib");

pub fn main() !void {
    // Example usage will be added as functions are implemented
}
```

## Contributing

1. In progress, bruh. In progress...

## Resources

- [Zig Documentation](https://ziglang.org/documentation/master/)
- [Learn Zig](https://ziglang.org/learn/)
- [ZigLings](https://codeberg.org/ziglings/exercises/)

## License

The world is open source, my code will not be different!
