// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MerchantAPI",
    products: [
        .library(
            name: "MerchantAPI",
            targets: ["MerchantAPI"]),
    ],
    targets: [
        .target(
            name: "MerchantAPI",
            dependencies: [],
            path: "MerchantAPI"),
    ]
)
