import Cocoa
import ApplicationServices

struct Window {
    let application: String
    let axElement: AXUIElement

    var isVisible: Bool {
        var positionRef: CFTypeRef?
        var sizeRef: CFTypeRef?

        let hasPosition = AXUIElementCopyAttributeValue(axElement, kAXPositionAttribute as CFString, &positionRef) == .success 
        let hasSize = AXUIElementCopyAttributeValue(axElement, kAXSizeAttribute as CFString, &sizeRef) == .success

        return hasPosition && hasSize
    }

    static func visible() -> [Window] {
        return NSWorkspace
            .shared
            .runningApplications
            .filter { $0.activationPolicy == .regular }
            .compactMap { app -> (String, AXUIElement)? in
                guard let appName = app.localizedName else { return nil }
                return (appName, AXUIElementCreateApplication(app.processIdentifier))
            }
            .flatMap { appName, appElement -> [Window] in
                var windowsRef: CFTypeRef?

                guard AXUIElementCopyAttributeValue(appElement, kAXWindowsAttribute as CFString, &windowsRef) == .success,
                      let axWindows = windowsRef as? [AXUIElement] else {
                    return []
                }

                return axWindows.map { Window(application: appName, axElement: $0) }
            }
            .filter { $0.isVisible }
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
