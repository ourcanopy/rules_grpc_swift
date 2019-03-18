load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_stack_rules_proto//:compile.bzl", "proto_compile")

PB_COMPILE_DEPS = [
    "@com_github_apple_swift_protobuf//:SwiftProtobuf",
]

GRPC_COMPILE_DEPS = PB_COMPILE_DEPS + [
    "@com_github_grpc_grpc_swift//:SwiftGRPC",
]

def swift_proto_library(name, deps=[], with_grpc=False):
  proto_compile_args = {
    "name": name + ".pb",
    "deps": deps,
    "has_services": with_grpc,
  }

  swift_proto_deps = GRPC_COMPILE_DEPS if with_grpc else PB_COMPILE_DEPS

  proto_compile_args["plugins"] = [str(Label("//swift:swift"))]
  if with_grpc:
    proto_compile_args["plugins"] += [str(Label("//swift:grpc_swift"))]

  proto_compile(**proto_compile_args)

  swift_library(
      name = name,
      srcs = [name + ".pb"],
      deps = depset(swift_proto_deps).to_list(),
  )
