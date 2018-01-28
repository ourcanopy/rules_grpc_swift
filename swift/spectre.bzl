SPECTRE_BUILD_FILE_CONTENT = """
package(default_visibility = ["//visibility:public"])

licenses(["notice"]) # BSD 2-Clause

load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

swift_library(
    name = "Spectre",
    srcs = glob(["Sources/Spectre/*.swift"]),
    swift_version = 4,
)
"""
