// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "Blinker",
  dependencies: [
    .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
    .package(url: "https://github.com/TomasLinhart/SwiftGtk", from: Version(0, 3, 1))
  ],
  targets: [
    .target(
      name: "Blinker",
      dependencies: ["SwiftyGPIO", "SwiftGtk"]),
    ]
)
