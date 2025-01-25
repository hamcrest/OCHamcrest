// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "OCHamcrest",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "OCHamcrest",
            targets: ["OCHamcrest"]
        ),
    ],
    targets: [
        .target(
            name: "OCHamcrest",
            cSettings: [
                .headerSearchPath("./Core/Helpers"),
                .headerSearchPath("./Core/Helpers/ReturnValueGetters"),
                .headerSearchPath("./Core/Helpers/TestFailureReporters"),
            ]
        ),
        .testTarget(
            name: "OCHamcrestTests",
            dependencies: [
                .target(name: "OCHamcrest")
            ],
            cSettings: [
                .headerSearchPath("."),
            ]
        )
    ]
)
