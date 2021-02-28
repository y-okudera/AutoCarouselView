// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoCarouselView",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AutoCarouselView",
            targets: ["AutoCarouselView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AutoCarouselView",
            dependencies: []),
        .testTarget(
            name: "AutoCarouselViewTests",
            dependencies: ["AutoCarouselView"]),
    ],
    swiftLanguageVersions: [.v5]
)
