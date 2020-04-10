// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "colorPrint",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .exact("0.0.4")),
        .package(url: "https://github.com/enuance/consler", .exact("0.5.0"))
    ],
    targets: [
        .target(
            name: "colorPrint",
            dependencies: ["Consler", "ArgumentParser"]),
        .testTarget(
            name: "colorPrintTests",
            dependencies: ["colorPrint"]),
    ]
)
