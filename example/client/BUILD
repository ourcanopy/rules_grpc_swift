load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

swift_library(
    name = "Client",
    srcs = glob(["*.swift"]),
    deps = [
        "@com_github_grpc_grpc_swift//:gRPC",
        "//example/proto:Foo",
    ],
    swift_version = 4,
)

macos_command_line_application(
    name = "client",
    deps = [":Client"],
)
