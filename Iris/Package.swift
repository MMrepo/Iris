// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Iris",
  platforms: [
    .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
  ],
  products: [
    .library(
      name: "Iris",
      targets: ["Iris"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Iris",
      dependencies: []),
    .testTarget(
      name: "IrisTests",
      dependencies: ["Iris"]),
  ]
)
