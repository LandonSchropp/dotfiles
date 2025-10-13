const MARGIN = 10;

const WORKSPACES = [
  {
    workspace: "Browser",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["Arc"],
  },
  {
    workspace: "Terminal",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["Ghostty"],
  },
  {
    workspace: "Notes",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["Obsidian"],
  },
  {
    workspace: "Calendar",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["BusyCal"],
  },
  {
    workspace: "Music",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["Spotify", "Music"],
  },
  {
    workspace: "Slack",
    profile: "Full",
    layout: "Fullscreen",
    applications: ["Slack"],
  },
  {
    workspace: "Browser",
    profile: "Split",
    layout: "Fullscreen",
    applications: ["Arc"],
  },
  {
    workspace: "Terminal",
    profile: "Split",
    layout: "Main Stack",
    applications: ["Arc", "Ghostty"],
  },
  {
    workspace: "Notes",
    profile: "Split",
    layout: "Main Stack",
    applications: ["Arc", "Obsidian"],
  },
  {
    workspace: "Calendar",
    profile: "Split",
    layout: "Fullscreen",
    applications: ["BusyCal"],
  },
  {
    workspace: "Music",
    profile: "Split",
    layout: "Fullscreen",
    applications: ["Spotify", "Music"],
  },
  {
    workspace: "Slack",
    profile: "Split",
    layout: "Main Stack",
    applications: ["Arc", "Slack"],
  },
];

function getWorkspaceConfiguration(profile, workspace) {
  let workspaceConfiguration = WORKSPACES.find((configuration) => {
    return configuration.workspace === workspace && configuration.profile === profile;
  });

  if (!workspaceConfiguration) {
    throw new Error(`No configuration found for workspace "${workspace}" and profile "${profile}"`);
  }

  return workspaceConfiguration;
}
