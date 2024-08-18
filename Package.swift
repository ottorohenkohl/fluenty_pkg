// swift-tools-version: 6.0

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "fluenty_pkg",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "fluenty_pkg",
            targets: ["Macro"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "600.0.0-latest"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.0.0")
    ],
    targets: [
        .macro(
            name: "Implementation",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver")
            ]
        ),
        .target(name: "Macro", dependencies: ["Implementation"]),
        .testTarget(
            name: "Test",
            dependencies: [
                "Macro",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
