//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: 2025-01-19 21:44:41                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: 2025-01-19 21:44:41                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================
const std = @import("std");

pub fn build(b: *std.Build) void {
    // Set the target options for the build, which defines the architecture and platform.
    const target = b.standardTargetOptions(.{});

    // Set the optimization level for the build (e.g., Debug or Release).
    const optimize = b.standardOptimizeOption(.{});

    // Add a static library named "zib".
    const lib = b.addStaticLibrary(.{
        .name = "zib", // Name of the library
        .root_source_file = b.path("src/libzib.zig"), // Path to the source file for the library
        .target = target, // Target platform settings
        .optimize = optimize, // Optimization settings
    });

    // Install the generated library artifact to the output directory.
    b.installArtifact(lib);

    // Add a module named "zib" that can be imported by other Zig files.
    // aka. → @import("zib");
    const zib_pkg = b.addModule("zib", .{
        .root_source_file = b.path("src/libzib.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Add an executable named "zibmain" at zig-out/bin/.
    const exe = b.addExecutable(.{
        .name = "zibmain", // Name of the executable
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Import the "zib" module into the root module of the executable.
    // so you can use as @import("zib") → example in src/main.zig
    exe.root_module.addImport("zib", zib_pkg);

    // Add a library path to find the static library during linking.
    exe.addLibraryPath(b.path("zig-out/lib/"));

    // Link the static library to the executable.
    exe.linkLibrary(lib);

    // Install the generated executable artifact to the output directory.
    b.installArtifact(exe);

    // Add a test configuration for running unit tests.
    // try: sh$ zig build test
    const main_tests = b.addTest(.{
        .root_source_file = b.path("tests/main_test.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Create a run artifact for executing the tests.
    const run_unit_tests = b.addRunArtifact(main_tests);

    // Define a step in the build process for running tests.
    const test_step = b.step("test", "Run library tests");

    // Import the "zib" module into the root module of the test configuration.
    // It's like a @import("zib") for the tests
    main_tests.root_module.addImport("zib", zib_pkg);

    // Make this test step depend on running unit tests before it completes.
    test_step.dependOn(&run_unit_tests.step);
}
