// swift-tools-version:5.2
/*
 * (c) Miva Inc <https://www.miva.com/>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import PackageDescription

let package = Package(
    name: "MerchantAPI",
    platforms: [ .macOS(.v10_13) ],
    products: [
        .library(
            name: "MerchantAPI",
            targets: ["MerchantAPI"]),
    ],
    dependencies: [
        .package(name: "CryptorRSA", url: "https://github.com/IBM-Swift/BlueRSA.git", .upToNextMajor(from: "1.0.201")),
        .package(name: "Cryptor", url: "https://github.com/IBM-Swift/BlueCryptor.git", .upToNextMajor(from: "1.0.200")),
        .package(name: "Socket", url: "https://github.com/IBM-Swift/BlueSocket.git", .upToNextMajor(from: "1.0.200"))
    ],
    targets: [
        .target(
            name: "MerchantAPI",
            dependencies: [
                "CryptorRSA",
                "Socket",
                "Cryptor"
            ],
            path: "MerchantAPI")

    ]
)
