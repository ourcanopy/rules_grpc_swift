ZLIB_BUILD_FILE_CONTENT = """
package(default_visibility = ["//visibility:public"])

licenses(["notice"]) # zlib license

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

cc_library(
    name = "zlib",
    strip_include_prefix = "Sources/Czlib/include",
    hdrs = glob(["Sources/Czlib/include/*.h"]),
    srcs = glob([
        "Sources/Czlib/*.c",
        "Sources/Czlib/*.h",
    ]),
)
"""
