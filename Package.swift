// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPUNotifier",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CPUNotifier",
            targets: ["CPUNotifier"]),
        .executable(name: "cpu-notifier", targets: ["cpu_notifier"])
    ],
    dependencies: [
        .package(url: "https://github.com/mipalgu/swiftfsm", from: "3.11.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CPUNotifier",
            dependencies: [
                .product(name: "swiftfsm", package: "swiftfsm")
            ]),
        .target(name: "cpu_notifier", dependencies: [.target(name: "CPUNotifier")]),
        .testTarget(
            name: "CPUNotifierTests",
            dependencies: [
                .target(name: "CPUNotifier"),
                .product(name: "swiftfsm", package: "swiftfsm"),
                .product(name: "FSMTest", package: "swiftfsm")
            ]),
    ]
)
