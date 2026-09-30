// swift-tools-version: 6.0

import Foundation
import PackageDescription

let package = Package(
    name: "swift-midi-core",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "SwiftMIDICore",
            targets: ["SwiftMIDICore"]
        ),
        .library(
            name: "SwiftMIDIInternals",
            targets: ["SwiftMIDIInternals"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/orchetect/swift-testing-extensions", from: "0.3.1")
    ],
    targets: [
        .target(
            name: "SwiftMIDICore",
            dependencies: [
                "SwiftMIDIInternals"
            ],
            swiftSettings: [.define("DEBUG", .when(configuration: .debug))]
        ),
        .target(
            name: "SwiftMIDIInternals",
            swiftSettings: [.define("DEBUG", .when(configuration: .debug))]
        ),
        .testTarget(
            name: "SwiftMIDICoreTests",
            dependencies: [
                "SwiftMIDICore",
                "SwiftMIDIInternals",
                .product(name: "TestingExtensions", package: "swift-testing-extensions")
            ]
        ),
        .testTarget(
            name: "SwiftMIDIInternalsTests",
            dependencies: [
                "SwiftMIDIInternals"
            ]
        )
    ]
)

// MARK: - Utilities

func hasEnvironmentVariable(_ name: String) -> Bool {
    ProcessInfo.processInfo.environment[name] != nil
}

// MARK: - CI Pipeline

if hasEnvironmentVariable("GITHUB_ACTIONS") {
    for target in package.targets {
        if target.swiftSettings == nil { target.swiftSettings = [] }
        target.swiftSettings? += [.define("GITHUB_ACTIONS", .when(configuration: .debug))]
    }
}
