# Launcher

Launcher generates and manages launchd LaunchAgents from a single YAML config at
`~/.config/launcher/tasks.yml`, replacing hand-authored plist files. Each task has a `name`,
`description`, `command`, and a standard 5-field `cron` schedule.

## Commands

- `launcher sync`: Regenerates every task's plist and reconciles them with launchd, booting out
  agents no longer in the config and bootstrapping everything currently defined. Idempotent, so
  running it repeatedly changes nothing after the first run.
- `launcher list`: Shows each configured task's name, description, and live `launchctl` status.
- `launcher run <name>`: Runs a task immediately, without waiting for its schedule.
- `launcher log <name>`: Tails a task's stdout/stderr log files, with `--lines`.

## Note

launchd hands a job a bare `PATH`, so each task's command runs through `/bin/zsh -lc`. Without a
login shell, `ruby` and other Mise-managed binaries resolve to the system versions instead of Mise's
shims.
