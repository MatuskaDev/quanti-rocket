// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyInjection",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DependencyInjection",
            targets: ["DependencyInjection"]),
        .library(
            name: "DependencyInjectionMocks",
            targets: ["DependencyInjectionMocks"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", .upToNextMinor(from: "1.5.0")),
        .package(name: "SharedDomain", path: "../../DomainLayer/SharedDomain"),
        
        // Toolkits
        .package(name: "DeviceMotionToolkit", path: "../../DataLayer/Toolkits/DeviceMotionToolkit"),
        
        // Providers
        .package(name: "DeviceMotionProvider", path: "../../DataLayer/Providers/DeviceMotionProvider")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DependencyInjection",
            dependencies: [
                .product(name: "Resolver", package: "Resolver"),
                .product(name: "SharedDomain", package: "SharedDomain"),
                
                // Toolkits
                .product(name: "DeviceMotionToolkit", package: "DeviceMotionToolkit"),
                
                // Providers
                .product(name: "DeviceMotionProvider", package: "DeviceMotionProvider")
            ]),
        .target(
            name: "DependencyInjectionMocks",
            dependencies: [
                .product(name: "SharedDomain", package: "SharedDomain"),
                .product(name: "Resolver", package: "Resolver"),
                .product(name: "SharedDomainStubs", package: "SharedDomain")
            ])
    ]
)
