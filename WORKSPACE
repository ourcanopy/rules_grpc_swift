workspace(name = "canopy_rules_grpc_swift")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

git_repository(
    name = "com_google_protobuf",
    remote = "https://github.com/protocolbuffers/protobuf.git",
    tag = "v3.6.1.3",
)

http_archive(
    name = "build_stack_rules_proto",
    urls = ["https://github.com/stackb/rules_proto/archive/d86ca6bc56b1589677ec59abfa0bed784d6b7767.tar.gz"],
    sha256 = "36f11f56f6eb48a81eb6850f4fb6c3b4680e3fc2d3ceb9240430e28d32c47009",
    strip_prefix = "rules_proto-d86ca6bc56b1589677ec59abfa0bed784d6b7767",
)

git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.12.0",
)
load("@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies")
apple_rules_dependencies()

load("//swift:deps.bzl", "shared_deps")

shared_deps()
load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)
swift_rules_dependencies()

load("//swift:grpc_swift.bzl", "GRPC_SWIFT_BUILD_FILE_CONTENT")
load("//swift:swift_protobuf.bzl", "SWIFT_PROTOBUF_BUILD_FILE_CONTENT")
load("//swift:zlib.bzl", "ZLIB_BUILD_FILE_CONTENT")

new_git_repository(
    name = "com_github_apple_swift_protobuf",
    remote = "https://github.com/apple/swift-protobuf.git",
    tag = "1.3.1",
    build_file_content = SWIFT_PROTOBUF_BUILD_FILE_CONTENT,
)

new_git_repository(
    name = "com_github_grpc_grpc_swift",
    remote = "https://github.com/grpc/grpc-swift.git",
    tag = "0.7.0",
    build_file_content = GRPC_SWIFT_BUILD_FILE_CONTENT,
)

new_git_repository(
    name = "com_github_zewograveyard_czlib",
    remote = "https://github.com/zewograveyard/CZlib.git",
    tag = "0.4.0",
    build_file_content = ZLIB_BUILD_FILE_CONTENT,
)
