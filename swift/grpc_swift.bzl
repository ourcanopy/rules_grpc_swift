GRPC_SWIFT_BUILD_FILE_CONTENT = """
package(default_visibility = ["//visibility:public"])

licenses(["notice"]) # Apache 2.0

load("@build_bazel_rules_apple//apple:swift.bzl", "swift_library")

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_command_line_application",
)

cc_library(
    name = "BoringSSL",
    hdrs = glob(["Sources/BoringSSL/include/**/*.h"]),
    strip_include_prefix = "Sources/BoringSSL/include",
    srcs = glob(
        include = [
            "Sources/BoringSSL/**/*.c",
            "Sources/BoringSSL/**/*.h",
        ],
        exclude = [
            "Sources/BoringSSL/include/**/*.h",
        ],
    ),
)

cc_library(
    name = "nanopb",
    strip_include_prefix = "Sources/CgRPC/third_party/nanopb",
    hdrs = glob(["Sources/CgRPC/third_party/nanopb/*.h"]),
    srcs = glob(["Sources/CgRPC/third_party/nanopb/*.c"]),
)

cc_library(
    name = "CgRPC",
    hdrs = glob(["Sources/CgRPC/include/**/*.h"]),
    strip_include_prefix = "Sources/CgRPC/include",
    srcs = glob(
        include = [
            "Sources/CgRPC/**/*.c",
            "Sources/CgRPC/**/*.cc",
            "Sources/CgRPC/**/*.h",
        ],
        exclude = [
            "Sources/CgRPC/include/**/*.h",
            "Sources/CgRPC/include/**/*.c",
            "Sources/CgRPC/third_party/**",
        ],
    ),
    deps = [
        "@com_github_zewograveyard_czlib//:zlib",
        ":BoringSSL",
        ":nanopb",
    ],
)

objc_library(
    name = "CgRPC_bridge",
    hdrs = ["Sources/CgRPC/include/CgRPC.h"],
    deps = [":CgRPC"],
)

swift_library(
    name = "gRPC",
    module_name = "gRPC",
    srcs = glob(["Sources/gRPC/*.swift"]),
    swift_version = 4,
    deps = [":CgRPC_bridge"],
    copts = [
        "-import-objc-header",
        "external/com_github_grpc_grpc_swift/Sources/CgRPC/include/CgRPC.h",
    ],
)

swift_library(
    name = "lib_TemplateEncoder",
    srcs = glob(["Plugin/Sources/TemplateEncoder/*.swift"]),
    swift_version = 4,
)

macos_command_line_application(
    name = "TemplateEncoder",
    deps = [":lib_TemplateEncoder"],
)

genrule(
    name = "gen_templates",
    tools = [":TemplateEncoder"],
    srcs = glob(["Plugin/Templates/*.swift"]),
    outs = ["Plugin/Sources/protoc-gen-swiftgrpc/gen-templates.swift"],
    cmd = "ROOT=$$(pwd);" +
          "cd external/com_github_grpc_grpc_swift/Plugin;" +
          "$$ROOT/$(location :TemplateEncoder) > $$ROOT/$(location " +
          "Plugin/Sources/protoc-gen-swiftgrpc/gen-templates.swift)",
)

swift_library(
    name = "lib_protoc_gen_swiftgrpc",
    srcs = glob(
        include = ["Plugin/Sources/protoc-gen-swiftgrpc/*.swift"],
        exclude = ["Plugin/Sources/protoc-gen-swiftgrpc/templates.swift"],
    ) + [
        "Plugin/Sources/protoc-gen-swiftgrpc/gen-templates.swift",
    ],
    swift_version = 4,
    deps = [
        "@com_github_kylef_stencil//:Stencil",
        "@com_github_apple_swift_protobuf//:SwiftProtobuf",
        "@com_github_apple_swift_protobuf//:SwiftProtobufPluginLibrary",
    ],
)

macos_command_line_application(
    name = "protoc-gen-swiftgrpc",
    deps = [":lib_protoc_gen_swiftgrpc"],
)
"""
