// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "window-manager",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "window-manager", targets: ["window-manager"]),
        .executable(name: "profile-switcher", targets: ["profile-switcher"])
    ],
    targets: [
        .executableTarget(
            name: "window-manager",
            path: "Sources",
            exclude: ["profile-switcher.swift"],
            resources: [
                .copy("configuration.json")
            ]
        ),
        .executableTarget(
            name: "profile-switcher",
            path: "Sources",
            exclude: [
                "window-manager.swift",
                "configuration.swift",
                "configuration.json",
                "layout.swift",
                "rectangle.swift",
                "screen.swift",
                "window.swift"
            ]
        )
    ]
)
