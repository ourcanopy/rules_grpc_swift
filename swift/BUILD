package(default_visibility = ["//visibility:public"])

load("@build_stack_rules_proto//:plugin.bzl", "proto_plugin")
proto_plugin(
    name = "swift",
    tool = "@com_github_apple_swift_protobuf//:protoc-gen-swift",
    outputs = [".pb.swift"],
    options = ["Visibility=Public"],
)

proto_plugin(
    name = "grpc_swift",
    tool = "@com_github_grpc_grpc_swift//:protoc-gen-swiftgrpc",
    outputs = [".grpc.swift"],
    options = ["Visibility=Public"],
)
