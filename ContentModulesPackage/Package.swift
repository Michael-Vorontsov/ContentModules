// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentModulesPackage",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ContentModulesPackage",
            targets: ["ContentModulesPackage"]),
    ],
    dependencies: [
      .package(url: "https://github.com/uber/ios-snapshot-test-case.git", from: "8.0.0"),
      .package(
         url: "https://github.com/pointfreeco/swift-snapshot-testing",
         from: "1.12.0"
       ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ContentModulesPackage"),
        .testTarget(
            name: "ContentModulesPackageTests",
            dependencies: [
                "ContentModulesPackage",
                .product(name: "iOSSnapshotTestCase", package: "ios-snapshot-test-case"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
    ]
)
