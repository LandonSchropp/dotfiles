# Privacy Permissions

Agents run under the herdr server binary at `~/.local/bin/herdr`, which Sheprd launches. macOS checks an agent's privacy permissions against that binary, so it needs the same access as Sheprd. Both need these in System Settings → Privacy & Security:

- **Accessibility:** Lets agents drive other apps' windows. Without it, accessibility calls fail with "osascript is not allowed assistive access".
- **Full Disk Access:** Covers Desktop, Documents, Downloads and other apps' data, so agents don't stop on folder prompts.
- **Screen Recording:** Lets agents take screenshots of other apps' windows.

Agents can't grant these themselves. Ask the user to add each missing one: click **+**, press ⌘⇧G and enter the path. Then ask them to run `herdr server stop` and reopen Sheprd so agents pick up the change. This closes every pane, including the agent's own.

Each Herdr update replaces the binary and drops its permissions. After an update, ask the user to remove the old `herdr` entries and add the binary again.

macOS asks for Automation access the first time an agent controls each app. Tell the user to approve those prompts.

## Vorssaint

Vorssaint needs these in System Settings → Privacy & Security:

- **Accessibility**
- **Full Disk Access**
- **Screen Recording**

Ask the user to grant any that are missing. macOS also asks for Automation access to Finder the first time the uninstaller moves files to the Trash, so tell the user to approve that prompt.
