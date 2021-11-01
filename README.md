# Miva Merchant API SDK for Swift 5.x

This library wraps the Miva Merchant JSON API introduced in
Miva Merchant 9.12. It allows you to quickly integrate your swift
applications with a Miva Merchant store to fetch, create, and update
store data.

For api documentation visit [https://docs.miva.com/json-api](https://docs.miva.com/json-api).

# Requirements

- Miva Merchant 10.00.00+
- Swift 5.0

**For Miva Merchant 9.x, use the 1.x release**

# Installation

## Via Package Manager

To include the bundle in your project via the [package manager](https://swift.org/package-manager/), include in your dependencies of your `Package.swift` file:

    dependencies: [
        .package(url: "https://github.com/mivaecommerce/api-sdk-swift", from: "2.0.1")
    ]

## Via Release Package

You can also download the release package from the Releases page or clone the repository directly. To include it in your projects, add the `MerchantAPI.xcodeproj` to your project and configure the build settings of your target to link to the MerchantAPI framework.

# Getting Started

After cloning the repository, you can open the `MerchantAPI.xcodeproj` which includes a Playground for you to play around in. In addition, there are examples provided in the `Examples/` directory.

# License

This library is licensed under the `Miva SDK License Agreement`.

See the `LICENSE` file for more information.
