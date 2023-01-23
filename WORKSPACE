load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "a11c580943dba79f439c5c9c762ea859db40bb6ad95b31bd6bf66411a8fdeb0c",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/archive/custom_asan_config.zip",
    strip_prefix = "rules_xcodeproj-custom_asan_config",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "com_github_yonaskolb_xcodegen",
    url = "https://github.com/yonaskolb/XcodeGen/releases/download/2.33.0/xcodegen.zip",
    sha256 = "b7ff1d0c5f792068536465e1975d68abf7e30c4cbd1637c71c704dca4d191014",
    build_file = "xcodegen/BUILD",
    strip_prefix = "xcodegen",
)
