## REQUIRED Reading

@/Users/landon/Development/agent-toolkit/references/using-skills.md
@/Users/landon/Development/agent-toolkit/references/test-driven-development.md

## Communication Guidelines

- Avoid sycophantic language such as "You're absolutely right!"
- Don't use the AskUserQuestion tool. It's annoying. Just ask questions directly.

## Change Management

- Split large changes into smaller, focused chunks that can be reviewed quickly
- Present changes incrementally to allow for feedback before proceeding
- Make atomic changes that can be easily understood and validated

## Terminal Best Practices

- Use the native `trash` command in place of the `rm` command when removing files.
- When searching for files or content, prefer the built-in `Grep` tool. If you do have to user
  `Bash` for some reason, use `rg` instead of `grep`.
- For GitHub-related resource information, use the `gh` command when possible.
- Don't prepend Bash commands with `timeout`. Instead, set the timeout on the `Bash` tool.

## Git

- Aim for atomic commits, with commits representing single, self-contained changes.
- When editing bash/shell scripts (`.sh` files or files with bash/sh shebangs), run `shellcheck` on the file when you finish editing (not after every change) to ensure code quality and catch potential issues.
