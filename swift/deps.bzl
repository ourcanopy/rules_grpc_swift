load("@org_pubref_rules_protobuf//protobuf:rules.bzl", "proto_repositories")
load("//swift:grpc_swift.bzl", "GRPC_SWIFT_BUILD_FILE_CONTENT")
load("//swift:swift_protobuf.bzl", "SWIFT_PROTOBUF_BUILD_FILE_CONTENT")
load("//swift:zlib.bzl", "ZLIB_BUILD_FILE_CONTENT")

_REQUIRES = [
    "bazel_skylib",
    "build_bazel_rules_apple",
    "com_github_apple_swift_protobuf",
    "com_github_grpc_grpc_swift",
    "build_bazel_rules_swift",
    "com_github_zewograveyard_czlib",
]

_DEPS = {

    "bazel_skylib": {
        "rule": "git_repository",
        "remote": "https://github.com/bazelbuild/bazel-skylib.git",
        "tag": "0.6.0",
    },

    "build_bazel_rules_apple": {
        "rule": "git_repository",
        "remote": "https://github.com/bazelbuild/rules_apple.git",
        "commit": "f75c4b1be219cb32704d900bd1a42ab200eab445",
    },

    "com_github_apple_swift_protobuf": {
        "rule": "new_git_repository",
        "remote": "https://github.com/apple/swift-protobuf.git",
        "tag": "1.3.1",
        "build_file_content": SWIFT_PROTOBUF_BUILD_FILE_CONTENT,
    },

    "com_github_grpc_grpc_swift": {
        "rule": "new_git_repository",
        "remote": "https://github.com/grpc/grpc-swift.git",
        "tag": "0.7.0",
        "build_file_content": GRPC_SWIFT_BUILD_FILE_CONTENT,
    },

    "build_bazel_rules_swift": {
        "rule": "git_repository",
        "remote": "https://github.com/bazelbuild/rules_swift.git",
        "commit": "2d7da74dffe94d1b7482b92e9c8c276b94eeefdc",
    },

    "com_github_zewograveyard_czlib": {
        "rule": "new_git_repository",
        "remote": "https://github.com/zewograveyard/CZlib.git",
        "tag": "0.4.0",
        "build_file_content": ZLIB_BUILD_FILE_CONTENT,
    },

}

def swift_proto_repositories(lang_deps=_DEPS, lang_requires=_REQUIRES,
                             **kwargs):
  proto_repositories(
      lang_deps = lang_deps,
      lang_requires = lang_requires,
      **kwargs
  )
