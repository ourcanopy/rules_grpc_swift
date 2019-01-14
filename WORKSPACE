workspace(name = "canopy_rules_grpc_swift")

load("//:deps.bzl", "grpc_swift_dependencies")

grpc_swift_dependencies()

load("//swift:deps.bzl", "swift_proto_repositories")

swift_proto_repositories()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()