import Foundation

guard CommandLine.arguments.count == 3 else {
    fputs("Usage: \(CommandLine.arguments[0]) <profile> <workspace>\n", stderr)
    exit(1)
}

let profile = CommandLine.arguments[1]
let workspace = CommandLine.arguments[2]

WindowManager.arrange(profile: profile, workspace: workspace)
