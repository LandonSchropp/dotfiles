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

struct Configuration: Codable {
    let margin: Double
    let workspaces: [Workspace]

    static let shared: Configuration = {
        let url = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .appendingPathComponent("configuration.json")

        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(Configuration.self, from: data)
    }()

    func findWorkspace(profile: String, workspace: String) -> Workspace? {
        return workspaces.first { $0.matches(profile: profile, workspace: workspace) }
    }
}
