// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeviceMotionToolkit",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DeviceMotionToolkit",
            targets: ["DeviceMotionToolkit"]),
    ],
    dependencies: [
        .package(name: "SharedDomain", path: "../../../DomainLayer/SharedDomain"),
        .package(name: "DeviceMotionProvider", path: "../../Providers/DeviceMotionProvider")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DeviceMotionToolkit",
            dependencies: [
                .product(name: "SharedDomain", package: "SharedDomain"),
                .product(name: "DeviceMotionProvider", package: "DeviceMotionProvider")
            ]
        ),
        .testTarget(
            name: "DeviceMotionToolkitTests",
            dependencies: ["DeviceMotionToolkit"]),
    ]
)
