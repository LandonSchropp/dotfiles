import Foundation

struct Layout {
    static func calculate(_ layoutName: String, _ screenRectangle: Rectangle, _ numberOfWindows: Int) -> [Rectangle] {
        switch layoutName {
            case "Fullscreen":
                return fullscreen(screenRectangle, numberOfWindows)
            case "Columns":
                return columns(screenRectangle, numberOfWindows)
            case "Main Stack":
                return mainStack(screenRectangle, numberOfWindows)
            default:
                return []
        }
    }

    private static func fullscreen(_ screenRectangle: Rectangle, _ numberOfWindows: Int) -> [Rectangle] {
        return Array(repeating: screenRectangle, count: numberOfWindows)
    }

    private static func columns(_ screenRectangle: Rectangle, _ numberOfWindows: Int) -> [Rectangle] {
        if numberOfWindows < 2 {
            return fullscreen(screenRectangle, numberOfWindows)
        }

        return screenRectangle
            .inset(Configuration.shared.margin)
            .splitIntoColumns(numberOfWindows, gap: Configuration.shared.margin)
    }

    private static func mainStack(_ screenRectangle: Rectangle, _ numberOfWindows: Int) -> [Rectangle] {
        if numberOfWindows < 2 {
            return fullscreen(screenRectangle, numberOfWindows)
        }

        let columnRectangles = columns(screenRectangle, 2)

        return [columnRectangles[0]] + columnRectangles[1].splitIntoRows(numberOfWindows - 1, gap: Configuration.shared.margin)
    }
}
