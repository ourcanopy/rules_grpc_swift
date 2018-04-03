STENCIL_BUILD_FILE_CONTENT = """
package(default_visibility = ["//visibility:public"])

licenses(["notice"]) # BSD 2-Clause

load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

swift_library(
    name = "Stencil",
    srcs = glob(["Sources/*.swift"]),
    copts = ["-swift-version", "3"],
    deps = [
        "@com_github_kylef_pathkit//:PathKit",
        "@com_github_kylef_spectre//:Spectre",
    ],
)
"""
