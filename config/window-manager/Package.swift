// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "window-manager",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "window-manager", targets: ["window-manager"])
    ],
    targets: [
        .executableTarget(
            name: "window-manager",
            path: "Sources",
            resources: [
                .copy("configuration.json")
            ]
        )
    ]
)
