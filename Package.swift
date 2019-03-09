// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "Blinker",
  dependencies: [
    .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "Blinker",
      dependencies: ["SwiftyGPIO"]),
    ]
)
