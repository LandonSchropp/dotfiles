---
description: Analyze what's been done in the current branch compared to its base branch
allowed-tools: Bash(git *), Bash(gh *), Read, Grep
---

Analyze the work done in the current branch by examining commits and changes compared to the base branch.

First, check if we're on a feature branch:

```bash
git branch --show-current
```

Get the base branch using our custom git command:

```bash
git base-branch
```

Show the commits made in this branch:

```bash
git log origin/<base-branch>...HEAD --oneline --graph
```

Count the number of commits:

```bash
git rev-list --count origin/<base-branch>...HEAD
```

Show the full diff of changes (including unstaged changes):

```bash
git diff origin/<base-branch>...HEAD
git diff HEAD
```

## Output Format

Present the analysis using this template:

**Current branch:** `<current-branch>`
**Base branch:** `<base-branch>`
**Number of commits:** `<number-of-commits>`

[Write a brief summary of the changes made on the branch based on the commit messages and diff content.]
