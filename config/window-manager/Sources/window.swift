import Cocoa
import ApplicationServices

// Private API to get CGWindowID from AXUIElement
@_silgen_name("_AXUIElementGetWindow")
private func _AXUIElementGetWindow(_ element: AXUIElement, _ wid: UnsafeMutablePointer<CGWindowID>) -> AXError

struct Window {
    let application: String
    let axElement: AXUIElement

    var cgWindowID: CGWindowID? {
        var wid: CGWindowID = 0
        guard _AXUIElementGetWindow(axElement, &wid) == .success else {
            return nil
        }
        return wid
    }

    static func visible() -> [Window] {
        // Get visible window IDs from CGWindowList
        guard let cgWindowList = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as? [[String: Any]] else {
            return []
        }

        let visibleWindowIDs = Set(cgWindowList.compactMap { $0[kCGWindowNumber as String] as? CGWindowID })

        // Get all windows via Accessibility API and filter by visible window IDs
        return NSWorkspace
            .shared
            .runningApplications
            .filter { $0.activationPolicy == .regular }
            .flatMap { app -> [Window] in
                guard let appName = app.localizedName else { return [] }
                let appElement = AXUIElementCreateApplication(app.processIdentifier)

                var windowsRef: CFTypeRef?
                guard AXUIElementCopyAttributeValue(appElement, kAXWindowsAttribute as CFString, &windowsRef) == .success,
                      let axWindows = windowsRef as? [AXUIElement] else {
                    return []
                }

                return axWindows.compactMap { axWindow -> Window? in
                    let window = Window(application: appName, axElement: axWindow)
                    guard let cgWindowID = window.cgWindowID,
                          visibleWindowIDs.contains(cgWindowID) else {
                        return nil
                    }
                    return window
                }
            }
    }

    func updatePosition(_ rectangle: Rectangle) {
        var position = CGPoint(x: rectangle.x, y: rectangle.y)
        let positionValue = AXValueCreate(.cgPoint, &position)!
        AXUIElementSetAttributeValue(axElement, kAXPositionAttribute as CFString, positionValue)

        var size = CGSize(width: rectangle.width, height: rectangle.height)
        let sizeValue = AXValueCreate(.cgSize, &size)!
        AXUIElementSetAttributeValue(axElement, kAXSizeAttribute as CFString, sizeValue)
    }
}
