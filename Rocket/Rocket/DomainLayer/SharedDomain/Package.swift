// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedDomain",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SharedDomain",
            targets: ["SharedDomain"]
        ),
        .library(
            name: "SharedDomainMocks",
            targets: ["SharedDomainMocks"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", .upToNextMinor(from: "1.5.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SharedDomain"
        ),
        .target(
            name: "SharedDomainMocks",
            dependencies: [
                "SharedDomain",
                .product(name: "Resolver", package: "Resolver")
            ]
        ),
        .testTarget(
            name: "SharedDomainTests",
            dependencies: ["SharedDomain", "SharedDomainMocks"]),
    ]
)
