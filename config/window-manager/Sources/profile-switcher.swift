import AppKit
import Foundation
import Combine

@main
struct ProfileSwitcher {
    static let fullProfileWidth: CGFloat = 1496

    static func main() {
        // Immediately set the profile on launch
        switchProfile()

        // Listen for screen changes such as connecting/disconnecting monitors
        let _ = NotificationCenter.default
            .publisher(for: NSApplication.didChangeScreenParametersNotification)
            .sink { _ in switchProfile() }

        // Keep the application running to listen for notifications
        RunLoop.main.run()
    }

    static func selectProfile(_ width: CGFloat) -> String {
        return width > fullProfileWidth ? "Split" : "Full"
    }

    static func switchProfile() {
        let profile = selectProfile(NSScreen.main!.frame.size.width)
        Process.launchedProcess(launchPath: "/usr/local/bin/flashspace", arguments: ["profile", profile])
    }
}
