import Foundation

struct Rectangle {
    let x: Double
    let y: Double
    let width: Double
    let height: Double

    func inset(_ amount: Double) -> Rectangle {
        return Rectangle(
            x: x + amount,
            y: y + amount,
            width: width - amount * 2,
            height: height - amount * 2
        )
    }

    func transpose() -> Rectangle {
        return Rectangle(
            x: y,
            y: x,
            width: height,
            height: width
        )
    }

    func splitIntoColumns(_ numberOfColumns: Int, gap: Double) -> [Rectangle] {
        let columnWidth = (width - gap * Double(numberOfColumns - 1)) / Double(numberOfColumns)

        return (0..<numberOfColumns).map { n in
            Rectangle(
                x: x + Double(n) * (columnWidth + gap),
                y: y,
                width: columnWidth,
                height: height
            )
        }
    }

    func splitIntoRows(_ numberOfRows: Int, gap: Double) -> [Rectangle] {
        return transpose()
            .splitIntoColumns(numberOfRows, gap: gap)
            .map { $0.transpose() }
    }
}
