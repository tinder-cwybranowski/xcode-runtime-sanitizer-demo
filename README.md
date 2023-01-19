# Xcode Runtime Sanitizer Demo

This project demonstrates an issue in [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) whereby the [Xcode Address Sanitizer](https://developer.apple.com/documentation/xcode/diagnosing-memory-thread-and-crash-issues-early) feature does not seem to work as expected. As described below, a buildbuddy-io/rules_xcodeproj Xcode project is compared to a yonaskolb/XcodeGen Xcode project to understand how a vanilla Xcode project behaves.

## Configuration

These results were validated using the following configuration:

- Host machine:
    - 16-inch MacBook Pro (2021)
    - Apple M1 Max
    - 32 GB memory
    - macOS 12.6 (Monterey)
- Dependecies:
    - Bazel: 6.0.0
    - buildbuddy-io/rules_xcodeproj: 0.12.0

## Setup

The `Makefile` contains two commands to demonstrate the issue:

### Bazel Project

The following command produces a [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) Xcode project:
```
make bazel_project
```

### XcodeGen Project

The following command produces a [yonaskolb/XcodeGen](https://github.com/yonaskolb/XcodeGen) Xcode project:
```
make xcodegen_project
```

## Issue

After performing the following steps:
- `make bazel_project`
- Enable Address Sanitizer via `Product > Scheme > Edit Scheme > Run > Diagnostics > Address Sanitizer`
- Run `App` target
- Tap `Trigger Address Sanitizer` button

We see that the `Address Sanitizer` does not work as expected in the buildbuddy-io/rules_xcodeproj project.

### Expected Outcome

Application execution is halted, and a call-stack identifying the runtime issue is provided.

### Actual Outcome

Application execution continues without any halts or crashes.