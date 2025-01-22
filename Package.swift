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
            path: "Source",
            exclude: [
                "MakeDistribution.sh",
                "makeXCFramework.sh",
                "OCHamcrest-Info.plist",
                "XcodeTargets.xcconfig",
                "XcodeWarnings.xcconfig",
            ],
            publicHeadersPath: "include",
            cSettings: [
                CSetting.headerSearchPath("./Core/Helpers"),
                CSetting.headerSearchPath("./Core/Helpers/ReturnValueGetters"),
                CSetting.headerSearchPath("./Core/Helpers/TestFailureReporters"),
            ]
        ),
        .testTarget(
            name: "OCHamcrestTests",
            dependencies: [
                .target(name: "OCHamcrest")
            ],
            exclude: [
                "Resources/Tests-Info.plist",
            ],
            cSettings: [
                .headerSearchPath("."),
            ]
        )
    ]
)
