SWIFT_PROTOBUF_BUILD_FILE_CONTENT = """
package(default_visibility = ["//visibility:public"])

licenses(["notice"]) # Apache 2.0

load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

swift_library(
    name = "SwiftProtobuf",
    module_name = "SwiftProtobuf",
    srcs = glob(["Sources/SwiftProtobuf/*.swift"]),
    copts = ["-swift-version", "4"],
)

swift_library(
    name = "SwiftProtobufPluginLibrary",
    module_name = "SwiftProtobufPluginLibrary",
    srcs = glob(["Sources/SwiftProtobufPluginLibrary/*.swift"]),
    copts = ["-swift-version", "4"],
    deps = [
        ":SwiftProtobuf",
    ],
)

swift_library(
    name = "protoc_gen_swift_lib",
    srcs = glob(["Sources/protoc-gen-swift/*.swift"]),
    copts = ["-swift-version", "4"],
    deps = [
        ":SwiftProtobuf",
        ":SwiftProtobufPluginLibrary",
    ],
)

macos_command_line_application(
    name = "protoc-gen-swift",
    deps = [
        ":protoc_gen_swift_lib",
    ],
)
"""
