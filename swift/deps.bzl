load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@build_stack_rules_proto//:deps.bzl",
    "bazel_skylib",
    "build_bazel_rules_swift"
)
load("//swift:zlib.bzl", "ZLIB_BUILD_FILE_CONTENT")
load("//swift:grpc_swift.bzl", "GRPC_SWIFT_BUILD_FILE_CONTENT")
load("//swift:swift_protobuf.bzl", "SWIFT_PROTOBUF_BUILD_FILE_CONTENT")

# TODO: hardcoding these versions is not great, also there are some deps missing here because
# the main CANOPY repo already has them in its WORKSPACE. Would be nice to use stackb's dep model,
# which allows plumbing versions in.
def grpc_swift_deps():
    bazel_skylib()
    build_bazel_rules_swift()

    new_git_repository(
        name = "com_github_zewograveyard_czlib",
        remote = "https://github.com/zewograveyard/CZlib.git",
        tag = "0.4.0",
        build_file_content = ZLIB_BUILD_FILE_CONTENT,
    )

    new_git_repository(
        name = "com_github_apple_swift_protobuf",
        remote = "https://github.com/apple/swift-protobuf.git",
        tag = "1.4.0",
        build_file_content = SWIFT_PROTOBUF_BUILD_FILE_CONTENT,
    )

    new_git_repository(
        name = "com_github_grpc_grpc_swift",
        remote = "https://github.com/grpc/grpc-swift.git",
        tag = "0.8.0",
        build_file_content = GRPC_SWIFT_BUILD_FILE_CONTENT,
    )

    new_git_repository(
        name = "com_github_zewograveyard_czlib",
        remote = "https://github.com/zewograveyard/CZlib.git",
        tag = "0.4.0",
        build_file_content = ZLIB_BUILD_FILE_CONTENT,
    )