import Foundation

@main
struct WindowManager {
    static func main() {
        // Determine the profile and workspace from command line arguments
        guard CommandLine.arguments.count == 3 else {
            fputs("Usage: \(CommandLine.arguments[0]) <profile> <workspace>\n", stderr)
            exit(1)
        }

        let profile = CommandLine.arguments[1]
        let workspace = CommandLine.arguments[2]

        // Find the configuration for the specified profile and workspace
        guard let config = Configuration.shared.findWorkspace(profile: profile, workspace: workspace) else {
            fatalError("No configuration found for workspace '\(workspace)' and profile '\(profile)'")
        }

        // Get the visible windows, filter and sort them according to the configuration
        let windows = Window.visible()
            .filter { config.applications.contains($0.application) }
            .sorted { window1, window2 in
                let index1 = config.applications.firstIndex(of: window1.application) ?? config.applications.count
                let index2 = config.applications.firstIndex(of: window2.application) ?? config.applications.count
                return index1 < index2
            }

        // Calculate the layout
        let rectangles = Layout.calculate(config.layout, Screen.visibleRectangle(), windows.count)

        // Update the position of each window according to the calculated layout
        for (window, rectangle) in zip(windows, rectangles) {
            window.updatePosition(rectangle)
        }
    }
}
