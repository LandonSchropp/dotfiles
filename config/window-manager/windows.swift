#!/usr/bin/env swift

import Cocoa
import ApplicationServices
import Foundation

struct Window: Codable {
    let application: String
    let id: Int
    let bounds: CGRect
}

func requireAccessibilityPermissions() {
    let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true]
    if !AXIsProcessTrustedWithOptions(options as CFDictionary) {
        exit(1)
    }
}

func isNormalWindow(_ windowDictionary: [String: Any]) -> Bool {
    return windowDictionary[kCGWindowLayer as String] as! Int == 0
}

func buildWindow(_ windowDictionary: [String: Any]) -> Window {
    let ownerName = windowDictionary[kCGWindowOwnerName as String] as! String
    let windowNumber = windowDictionary[kCGWindowNumber as String] as! Int
    let bounds = windowDictionary[kCGWindowBounds as String] as! [String: Any]
    
    let x = bounds["X"] as! CGFloat
    let y = bounds["Y"] as! CGFloat
    let width = bounds["Width"] as! CGFloat
    let height = bounds["Height"] as! CGFloat
    
    let rect = CGRect(x: x, y: y, width: width, height: height)
    
    return Window(
        application: ownerName,
        id: windowNumber,
        bounds: rect
    )
}

func getVisibleWindows() -> [Window] {
    let windowList = CGWindowListCopyWindowInfo(
        [.optionOnScreenOnly, .excludeDesktopElements],
        kCGNullWindowID
    ) as! [[String: Any]]

    return windowList
        .filter(isNormalWindow)
        .map(buildWindow)
}

requireAccessibilityPermissions()

let windows = getVisibleWindows()
print(windows)
