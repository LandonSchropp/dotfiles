---
description: Generate a git commit message based on staged changes
allowed-tools: Bash(git status:*, git diff:*), Read, Grep, Glob
---

Analyze the staged git changes and generate a clear, descriptive commit message.

## Process

1. **Stage Analysis:** Check which files are staged with `git status`
2. **Change Analysis:** Perform `git diff --cached` to understand the changes
3. **Message Generation:** Create a clear, descriptive commit message based on the changes

## Guidelines

- **Present tense, imperative mood**: Write as commands (e.g., "add feature" not "added feature")
- **Be specific**: Describe what the change actually does
- **Keep it concise**: One clear line describing the change

Return only the commit message, nothing else. **Do not create the commit.**
