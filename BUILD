load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

xcodeproj(
    name = "BazelProject",
    project_name = "BazelProject",
    tags = ["manual"],
    top_level_targets = [
        top_level_target("//src:App", target_environments = ["simulator"]),
    ],
)
