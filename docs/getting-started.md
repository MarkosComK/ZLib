# Getting Started with Zib Library

## Prerequisites

- Zig compiler (latest stable version recommended)
- Git (for cloning the repository)
- Basic understanding of Zig syntax

## Installation

```bash
# Clone the repository
git clone https://github.com/YourUsername/Zib.git

# Navigate to the project directory
cd Zib

# Build the library
zig build
```

## Project Structure

```
Zib/
├── src/
│   ├── char/       # Character manipulation functions
│   ├── string/     # String operations
│   ├── math/       # Mathematical functions
│   └── cast/       # Type conversion utilities
├── tests/          # Test files
└── build.zig       # Build configuration
```

## Core Features

### Character Functions
```zig
const zib = @import("zib");

// Check if character is alphabetic
const is_alpha = zib.char.isAlpha('A'); // true

// Convert to uppercase/lowercase
const upper = zib.char.toUpper('a'); // 'A'
const lower = zib.char.toLower('A'); // 'a'
```

### String Operations
```zig
const zib = @import("zib");

// String length
const len = zib.str.strLen("Hello"); // 5

// String comparison
const equal = zib.str.strCmp("Hello", "Hello"); // true

// String copy and concatenation
var buffer: [20]u8 = undefined;
_ = zib.str.strCpy(&buffer, "Hello");
_ = zib.str.strCat(buffer[0..], " World");
```

### Mathematical Functions
```zig
const zib = @import("zib");

// Power function
const pow_result = zib.math.pow(2, 3); // 8

// Factorial calculation
const fact_result = zib.math.fact(5); // 120

// Fibonacci sequence
const fib_result = zib.math.fibo(7);
```

## Running Tests

```bash
# Run all tests
zig build test

# Test specific modules (see tests/ directory)
zig test tests/char_test.zig
zig test tests/string_test.zig
zig test tests/math_test.zig
```

## Development Workflow

1. **Creating New Functions**
   - Add implementation in appropriate module directory
   - Create corresponding test file
   - Update module's public interface

2. **Testing**
   - Write tests before implementation (TDD recommended)
   - Ensure all tests pass before committing
   - Follow existing test patterns

3. **Documentation**
   - Document function parameters and return values
   - Include usage examples
   - Update README.md for major changes

## Memory Management

- Most functions operate on stack memory
- String operations require pre-allocated buffers
- Use `strDup` with appropriate allocator for heap allocation

## Best Practices

1. **Error Handling**
   ```zig
   // Always handle potential errors
   const result = try zib.str.strDup(allocator, "test");
   defer allocator.free(result);
   ```

2. **Buffer Safety**
   ```zig
   // Ensure buffers are large enough
   var buffer: [100]u8 = undefined;
   _ = zib.str.strCpy(buffer[0..], "Hello");
   ```

3. **Resource Cleanup**
   ```zig
   // Use defer for cleanup
   var gpa = std.heap.GeneralPurposeAllocator(.{}){};
   defer _ = gpa.deinit();
   ```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Submit pull request

## Common Issues

1. **Build Failures**
   - Ensure correct Zig version
   - Check build.zig configuration

2. **Test Failures**
   - Run tests in verbose mode
   - Check test dependencies

## Resources

- [Zig Documentation](https://ziglang.org/documentation/master/)
- [Zig Standard Library](https://ziglang.org/documentation/master/std/)
- [Project Issues](https://github.com/YourUsername/Zib/issues)

## License

Open source - see LICENSE file for details
