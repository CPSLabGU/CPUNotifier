# CPU Notifier
* The implementation of the CPU Notifier machine as presented in the Aeroconf 2024 conference.*

## Overview

This is a swift package that leverages [swiftfsm](https://github.com/mipalgu/swiftfsm) to define the Logic-Labelled Finite State Machine (LLFSM). This package also provides the ability for swiftfsm to generate a Uppaal model that represents the state-space of the LLFSM.

## Prerequisites

### Swift 5.9 or Higher

To build, download Swift from https://swift.org/download/ -- if you are using macOS, make sure you have the command line tools installed as well). Test that your compiler works using swift --version, which should give you something like
```bash
$ swift --version
swift-driver version: 1.45.2 Apple Swift version 5.9...
Target: x86_64-apple-darwin20.3.0
```
on macOS, or on Linux you should get something like:
```bash
$ swift --version
Swift version 5.9 (swift-5.9-RELEASE)
Target: x86_64-unknown-linux-gnu
```

## Accessing the Pre-Generated Model

We have provided a pre-generated model that you may inspect. Please find it on the [Releases](https://github.com/CPSLabGU/CPUNotifier/releases) page.

## Generating the Uppaal Model

Simply run the following to generate the uppaal model:
```bash
$ swift test
Building for debugging...
[399/399] Linking CPUNotifierPackageTests.xctest
Build complete! (13.09s)
Test Suite 'All tests' started at 2024-01-12 14:09:32.708
Test Suite 'debug.xctest' started at 2024-01-12 14:09:32.709
Test Suite 'CPUNotifierTests' started at 2024-01-12 14:09:32.709
Test Case 'CPUNotifierTests.testGenerateUppaalModel' started at 2024-01-12 14:09:32.709
Test Case 'CPUNotifierTests.testGenerateUppaalModel' passed (20.466 seconds)
Test Suite 'CPUNotifierTests' passed at 2024-01-12 14:09:53.175
         Executed 1 test, with 0 failures (0 unexpected) in 20.466 (20.466) seconds
Test Suite 'debug.xctest' passed at 2024-01-12 14:09:53.175
         Executed 1 test, with 0 failures (0 unexpected) in 20.466 (20.466) seconds
Test Suite 'All tests' passed at 2024-01-12 14:09:53.175
         Executed 1 test, with 0 failures (0 unexpected) in 20.466 (20.466) seconds
```

This should create a folder in your current directory containing ``0.xml`` file which can be opened by Uppaal version 5.0.0.
