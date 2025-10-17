import Foundation

struct WindowManager {
    static func arrange(profile: String, workspace: String) {
        guard let config = Configuration.findWorkspace(profile: profile, workspace: workspace) else {
            fatalError("No configuration found for workspace '\(workspace)' and profile '\(profile)'")
        }

        let windows = Window.visible()
            .filter { config.applications.contains($0.application) }
            .sorted { window1, window2 in
                let index1 = config.applications.firstIndex(of: window1.application) ?? config.applications.count
                let index2 = config.applications.firstIndex(of: window2.application) ?? config.applications.count
                return index1 < index2
            }

        let rectangles = Layout.calculate(config.layout, Screen.visibleRectangle(), windows.count)

        zip(windows, rectangles).forEach { window, rectangle in
            window.updatePosition(rectangle)
        }
    }
}
