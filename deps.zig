const std = @import("std");
const Pkg = std.build.Pkg;
const FileSource = std.build.FileSource;

pub const pkgs = struct {
    pub const parzer = Pkg{
        .name = "parzer",
        .source = FileSource{
            .path = "../parzer/src/main.zig",
        },
    };

    pub fn addAllTo(artifact: *std.build.LibExeObjStep) void {
        artifact.addPackage(pkgs.parzer);
    }
};

pub const exports = struct {
    pub const @"imap-parser" = Pkg{
        .name = "imap-parser",
        .source = FileSource{ .path = "src/main.zig" },
        .dependencies = &[_]Pkg{
            pkgs.parzer,
        },
    };
};
