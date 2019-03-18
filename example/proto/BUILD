package(default_visibility = ["//visibility:public"])

load("//swift:rules.bzl", "swift_proto_library")

proto_library(
    name = "foo_proto",
    srcs = ["foo.proto"],
)

swift_proto_library(
    name = "Foo",
    deps = [":foo_proto"],
    with_grpc = True,
)
