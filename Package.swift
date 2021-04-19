// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Iris",
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
