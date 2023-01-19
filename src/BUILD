load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)
load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
)

swift_library(
    name = "SwiftLib",
    module_name = "SwiftLib",
    srcs = glob(["swift-lib/*.swift"]),
)

objc_library(
    name = "ObjcLib",
    module_name = "ObjcLib",
    srcs = glob(["objc-lib/*.m"], allow_empty = False),
    hdrs = glob(["objc-lib/*.h"], allow_empty = False),
)

swift_library(
    name = "AppLib",
    srcs = glob(["app/*.swift"]),
    deps = [
        ":SwiftLib",
        ":ObjcLib",
    ],
)

ios_application(
    name = "App",
    bundle_id = "com.example.app",
    families = ["iphone"],
    infoplists = ["app/Info.plist"],
    minimum_os_version = "16.0",
    deps = [
        ":AppLib",
    ],
    visibility = ["//visibility:public"]
)
