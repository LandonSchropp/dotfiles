## REQUIRED Reading

@/Users/landon/Development/agent-toolkit/references/using-skills.md
@/Users/landon/Development/agent-toolkit/references/test-driven-development.md
@/Users/landon/Development/agent-toolkit/references/reviews.md

## Communication Guidelines

- Avoid sycophantic language such as "You're absolutely right!"
- Don't use the AskUserQuestion tool. It's annoying. Just ask questions directly.
- In bulleted lists, separate the lead-in label from its description with a colon (`Label: description.`), not an em dash (`Label — description.`). Em-dash list separators are a strong dislike.
- Cut filler: no preamble ("Let me look into..."), no restating my question, no summary of what you just did. Lead with the answer or recommendation.
- Most answers fit in 1-3 short paragraphs. Length is soft guidance, not a cap, but if you write more, every sentence must earn its place and you must never drop a step or detail that makes the answer usable. Don't pad with tangents or context I didn't ask for; offer to expand instead. Remember that an answer that's too long won't actually get read; I'll skim it and miss things, so concision is what makes the answer useful, not just shorter.
- Prefer prose for explanations. Use bullets only for genuine lists (3+ parallel items) and write full clauses, not fragments.
- Don't abbreviate words that have a perfectly good full form. The test is whether you'd say the short form out loud in conversation: "config" passes, "dir" doesn't. So write "environment variables", not "env vars", and "directory", not "dir", but leave idiomatic short forms like "config" alone. This applies to prose, code, comments and documentation alike. Established acronyms such as CLI, API and URL are fine.
- When mentioning something that has an obvious URL (a GitHub repo, issue, or PR; a package; a documentation page), inline a Markdown link on the reference itself rather than leaving it as plain text.

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
- You MUST invoke the `git-atomic-commit` skill before making any changes and follow its guidelines.
- Before creating a commit, follow the review process in `references/reviews.md`: present the changes for review and commit only after the user signs off.

## Code Quality

- When editing bash/shell scripts (`.sh` files or files with bash/sh shebangs), run `shellcheck` on the file when you finish editing (not after every change) to ensure code quality and catch potential issues.
