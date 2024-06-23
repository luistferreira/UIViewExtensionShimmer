// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewExtensionShimmer",
    platforms: [
        .iOS(
            .v14
        )
    ],
    products: [
        .library(
            name: "UIViewExtensionShimmer",
            targets: ["UIViewExtensionShimmer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIViewExtensionShimmer",
            dependencies: [],
            path: "./UIViewExtensionShimmer-iOS"
        )
    ]
)
