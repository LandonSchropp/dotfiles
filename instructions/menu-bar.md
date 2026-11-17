# Menu Bar

`bin/set-up-macos` decides which icons the menu bar shows. This is their order, from right to left:

1. Clock
2. Control Center
3. Focus
4. Bluetooth
5. Wi-Fi
6. Weather
7. iStat Menus: battery, memory pressure and CPU, in that order
8. FlashSpace
9. Vorssaint

## Arranging the Icons

Move each icon by simulating a ⌘-drag with Core Graphics mouse events that carry the Command flag. Read each icon's position through accessibility first. The icons are the menu bar items of each app's second menu bar in System Events. Read the positions again after each drag, since the others shift.

macOS ignores the `NSStatusItem Preferred Position` keys apps save, so writing them does nothing.

Accessibility doesn't expose Apple's icons, such as Wi-Fi, Bluetooth and Focus. Ask the user to ⌘-drag those into place.

Driving these icons needs the Accessibility access described in [Privacy Permissions](privacy-permissions.md).
