// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ModuleKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "ModuleKit",
            targets: ["ModuleKit"]
        ),
    ],
    targets: [
        .target(
            name: "ModuleKit",
            dependencies: []
        ),
        .testTarget(
            name: "ModuleKitTests",
            dependencies: ["ModuleKit"]
        ),
    ]
)
