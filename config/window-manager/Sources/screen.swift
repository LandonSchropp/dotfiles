import Cocoa

struct Screen {
    static func visibleRectangle() -> Rectangle {
        let screenFrame = NSScreen.main!.frame
        let visibleFrame = NSScreen.main!.visibleFrame

        // Convert from bottom-left (Cocoa) to top-left (Accessibility) coordinates
        return Rectangle(
            x: visibleFrame.origin.x,
            y: screenFrame.height - (visibleFrame.origin.y + visibleFrame.height),
            width: visibleFrame.width,
            height: visibleFrame.height
        )
    }
}
