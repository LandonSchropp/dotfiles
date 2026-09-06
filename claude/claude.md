## Required Skill

CRITICAL: Before doing anything else, you MUST invoke the `ls-agent:instructions` skill.

## Change Management

- Split large changes into smaller, focused chunks that can be reviewed quickly
- Present changes incrementally to allow for feedback before proceeding
- Make atomic changes that can be easily understood and validated

## Working Directory

- The session's primary working directory is the source of truth for which checkout to edit. When a repository is checked out in multiple places, such as a dedicated worktree alongside another clone, always edit the copy under the current working directory.
- Never navigate to a same-named checkout elsewhere on disk (for example `~/Development/<repo>`) to make changes. Resolve repository-relative paths against the working directory.

## Terminal Best Practices

- Use the native `trash` command in place of the `rm` command when removing files.
- When searching for files or content, prefer the built-in `Grep` tool. If you do have to user
  `Bash` for some reason, use `rg` instead of `grep`.
- For GitHub-related resource information, use the `gh` command when possible.
- Don't prepend Bash commands with `timeout`. Instead, set the timeout on the `Bash` tool.
- Run Bash commands one at a time. Do not chain multiple commands together with `&&` or `;`. Each command should be a separate Bash tool call so the user can review and approve them individually.

## Shebangs

- Use `#!/usr/bin/env bash` for Bash scripts.
- Use `#!/usr/bin/env ruby` for Ruby scripts.

## Git

- Aim for atomic commits, with commits representing single, self-contained changes.
- In my personal repositories, default to working directly on the `main` branch instead of creating a feature branch. (A repository is personal when its `origin` remote is under my `LandonSchropp` GitHub account, or when it has no remote at all.)
- In a linked worktree, stay on the worktree's own branch.
- Work repositories will always use a feature branch.
- Push after committing: always on a feature branch, and on `main` only in personal repositories. Never push directly to `main` in a work repository.
- You MUST invoke the `ls-git:git-atomic-commit` skill before making any changes and follow its guidelines.
- Before creating a commit, follow the review process in the `ls-agent:instructions` skill's reviews reference: present the changes for review and commit only after the user signs off.

## Code Quality

- When editing bash/shell scripts (`.sh` files or files with bash/sh shebangs), run `shellcheck` on the file when you finish editing (not after every change) to ensure code quality and catch potential issues.
