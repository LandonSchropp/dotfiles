import Foundation

struct Workspace: Codable {
    let profile: String
    let workspace: String
    let layout: String
    let applications: [String]

    func matches(profile: String, workspace: String) -> Bool {
        return self.profile == profile && self.workspace == workspace
    }
}

struct Configuration {
    static let margin: Double = 10

    private static let workspaces: [Workspace] = {
        let url = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .appendingPathComponent("configuration.json")

        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode([Workspace].self, from: data)
    }()

    static func findWorkspace(profile: String, workspace: String) -> Workspace? {
        return workspaces.first { $0.matches(profile: profile, workspace: workspace) }
    }
}
