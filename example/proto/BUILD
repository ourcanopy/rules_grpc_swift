package(default_visibility = ["//visibility:public"])

load("//swift:rules.bzl", "swift_proto_library")

swift_proto_library(
    name = "Foo",
    protos = glob(["*.proto"]),
    with_grpc = True,
)
