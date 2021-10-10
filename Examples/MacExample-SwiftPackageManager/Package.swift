// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Example",
    products: [
        .library(
            name: "Example",
            targets: ["Example"]),
    ],
    // begin-snippet: swiftpm-declare-dependencies
    dependencies: [
        .package(
            name: "OCHamcrest",
            url: "https://github.com/hamcrest/OCHamcrest",
            .upToNextMajor(from: "9.0.0")
        ),
    ],
    // end-snippet
    targets: [
        .target(
            name: "Example",
            dependencies: [],
            publicHeadersPath: "./"
        ),
        // begin-snippet: swiftpm-use-dependencies
        .testTarget(
            name: "ExampleTests",
            dependencies: [
                "Example",
                "OCHamcrest",
            ]
        ),
        // end-snippet
    ]
)
