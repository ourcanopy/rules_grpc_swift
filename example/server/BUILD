load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

swift_library(
    name = "Server",
    srcs = glob(["*.swift"]),
    deps = [
        "@com_github_grpc_grpc_swift//:gRPC",
        "//example/proto:Foo",
    ],
    swift_version = 4,
)

macos_command_line_application(
    name = "server",
    deps = [":Server"],
)
