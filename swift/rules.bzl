load("@org_pubref_rules_protobuf//protobuf:rules.bzl", "proto_compile")
load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

PB_COMPILE_DEPS = [
    "@com_github_apple_swift_protobuf//:SwiftProtobuf",
]

GRPC_COMPILE_DEPS = PB_COMPILE_DEPS + [
    "@com_github_grpc_grpc_swift//:gRPC",
]

def swift_proto_library(name, langs=[str(Label("//swift"))],
    protos=[], importmap={}, imports=[], inputs=[], proto_deps=[],
    output_to_workspace=False, protoc=None, pb_plugin=None, pb_options=["Visibility=Public"],
    grpc_plugin=None, grpc_options=["Visibility=Public"], proto_compile_args={}, with_grpc=True,
    srcs=[], deps=[], swift_proto_deps=[], verbose=0, **kwargs):

  proto_compile_args += {
    "name": name + ".pb",
    "protos": protos,
    "deps": [dep + ".pb" for dep in proto_deps],
    "langs": langs,
    "importmap": importmap,
    "imports": imports,
    "inputs": inputs,
    "pb_options": pb_options,
    "grpc_options": grpc_options,
    "output_to_workspace": output_to_workspace,
    "verbose": verbose,
    "with_grpc": with_grpc,
  }

  if not swift_proto_deps:
    swift_proto_deps = GRPC_COMPILE_DEPS if with_grpc else PB_COMPILE_DEPS

  if protoc:
    proto_compile_args["protoc"] = protoc
  if pb_plugin:
    proto_compile_args["pb_plugin"] = pb_plugin
  if grpc_plugin:
    proto_compile_args["grpc_plugin"] = grpc_plugin

  proto_compile(**proto_compile_args)

  swift_library(
      name = name,
      srcs = srcs + [name + ".pb"],
      deps = depset(deps + proto_deps + swift_proto_deps).to_list(),
      **kwargs
  )
