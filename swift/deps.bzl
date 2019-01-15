load("@build_stack_rules_proto//:deps.bzl",
    "bazel_skylib",
    "build_bazel_rules_swift"
)

def shared_deps():
    bazel_skylib()
    build_bazel_rules_swift()
