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
- ✅ `char.isAlpha` - Check if character is alphabetic
- ✅ `char.isDigit` - Check if character is a digit
- ✅ `char.isAlNum` - Check if character is alphanumeric
- ✅ `char.isAscii` - Check if character is ASCII
- ✅ `char.isSpace` - Check if character is space
- ✅ `char.isPrint` - Check if character is printable
- ✅ `char.toUpper` - Convert to uppercase
- ✅ `char.toLower` - Convert to lowercase

### String Operations
- ✅ `str.length` - Get string length
- ✅ `str.copy` - Copy string
- ✅ `str.concat` - Concatenate strings
- ✅ `str.compare` - Compare strings
- ✅ `str.find` - Find character in string
- ✅ `str.findR` - Find character from end of string
- ✅ `str.contains` - Find substring
- ✅ `str.duplicate` - Duplicate a string
- ✅ `str.split` - String split by delimiter

### Math Operations
- ✅ `math.pow` - Power function
- ❌ `math.sqrt` - Square root
- ✅ `math.abs` - Absolute value
- ✅ `math.fact` - Factorial calculation
- ✅ `math.fibo` - Fibonacci sequence
- ❌ `math.gcd` - Greatest common divisor
- ✅ `math.isPrime` - Prime number check
- ❌ `math.nextPrime` - Find next prime
- ❌ `math.primeFactors` - Prime factorization
- ❌ `math.lcm` - Least common multiple

### Memory Operations
- ❌ `memSet` - Fill memory
- ❌ `memCpy` - Copy memory
- ❌ `memMove` - Move memory
- ❌ `memCmp` - Compare memory
- ❌ `memChr` - Find byte in memory

### Cast Functions
- ✅ `cast.atoi` - Convert ASCII to integer
- ❌ `cast.itoa` - Convert integer to ASCII

### List Operations
- ❌ `list` - Generic list implementation
- ❌ `list.new` - Create new list
- ❌ `list.size` - Create new list
- ❌ `list.add` - Add element
- ❌ `list.remove` - Remove element
- ❌ `list.clear` - Clear list

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
