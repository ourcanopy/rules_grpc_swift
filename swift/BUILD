package(default_visibility = ["//visibility:public"])

load("@org_pubref_rules_protobuf//protobuf:rules.bzl", "proto_language")

proto_language(
    name = "swift",
    pb_plugin = "@com_github_apple_swift_protobuf//:protoc-gen-swift",
    pb_file_extensions = [".pb.swift"],
    grpc_plugin = "@com_github_grpc_grpc_swift//:protoc-gen-swiftgrpc",
    grpc_plugin_name = "swiftgrpc",
    grpc_file_extensions = [".grpc.swift"],
    supports_grpc = True,
)
