# Xcode Runtime Sanitizer Demo

This project demonstrates an issue in [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) whereby the [Xcode Address Sanitizer](https://developer.apple.com/documentation/xcode/diagnosing-memory-thread-and-crash-issues-early) feature does not seem to work as expected in BwB (Build-with-Bazel) mode. As described below, a buildbuddy-io/rules_xcodeproj Xcode project is compared to a yonaskolb/XcodeGen Xcode project to understand how a vanilla Xcode project behaves.

This project was created to add context and reproduction steps to the [GitHub Issue opened here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1613).

## Configuration

These results were validated using the following configuration:

- Host machine:
    - 16-inch MacBook Pro (2021)
    - Apple M1 Max
    - 32 GB memory
    - macOS 12.6 (Monterey)
- Dependecies:
    - Xcode: 14.0.1
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

<img width="1000" alt="Screen Shot 2023-01-19 at 4 24 35 PM" src="https://user-images.githubusercontent.com/40372184/213565354-6be1978d-f209-459d-81af-a804213e15f7.png">

### Actual Outcome

Application execution continues without any halts or crashes.

<img width="1000" alt="Screen Shot 2023-01-19 at 4 26 22 PM" src="https://user-images.githubusercontent.com/40372184/213565652-c4f7081f-2574-48fb-9232-7ab311351cb8.png">

## Notes

- [As confirmed here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1613#issuecomment-1397686073), `Address Sanitizer` works as expected in BwX mode (Build-with-Xcode).
- [As confirmed here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1613#issuecomment-1397889562), `Address Sanitizer` works as expected for a Swift implementation in BwB mode (Build-with-Bazel).
- [As confirmed here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1613#issuecomment-1397907992), `Address Sanitizer` works as expected for a *different* Objective-C implementation in BwB mode (Build-with-Bazel).
