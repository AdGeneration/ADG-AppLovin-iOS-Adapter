// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-AppLovin-iOS-Adapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ADGAppLovinAdapter",
            type: .static,
            targets: ["ADGAppLovinAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            "2.43.0"..<"7.0.0"
        ),
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            exact: "13.6.4"
        ),
    ],
    targets: [
        .target(
            name: "ADGAppLovinAdapterTarget",
            dependencies: [
                .target(name: "ADGAppLovinAdapter"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
            ],
            path: "ADGAppLovinAdapterTarget"
        ),
        .binaryTarget(
            name: "ADGAppLovinAdapter",
            url: "https://github.com/AdGeneration/ADG-AppLovin-iOS-Adapter/releases/download/13.6.400/ADGAppLovin.xcframework.zip",
            checksum: "32fa51255b5016702fa54394116aba506b0165507727cce7f0982d0ee2fd6a88"
        ),
    ]
)
