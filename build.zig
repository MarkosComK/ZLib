const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "zib",
        .root_source_file = b.path("src/libzib.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);

    const zib_pkg = b.addModule("zib", .{
        .root_source_file = b.path("src/libzib.zig"),
        .target = target,
        .optimize = optimize,
    });

    const main_tests = b.addTest(.{
        .root_source_file = b.path("tests/main_test.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "zibmain",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("zib", zib_pkg);
    main_tests.root_module.addImport("zib", zib_pkg);

    exe.addLibraryPath(b.path("zig-out/lib/"));
    exe.linkLibrary(lib);

    const run_unit_tests = b.addRunArtifact(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_unit_tests.step);
    b.installArtifact(exe);
}
