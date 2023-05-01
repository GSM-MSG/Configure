// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Configure",
    platforms: [.iOS(.v11), .tvOS(.v11), .macOS(.v10_13), .watchOS(.v4)],
    products: [
        .library(
            name: "Configure",
            targets: ["Configure"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Configure",
            dependencies: []
        ),
        .testTarget(
            name: "ConfigureTests",
            dependencies: ["Configure"]
        )
    ]
)
