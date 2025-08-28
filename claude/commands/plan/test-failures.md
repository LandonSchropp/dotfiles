---
description: Create a plan for systematically fixing failing tests
argument-hint: [failing test paths...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for fixing failing tests in $ARGUMENTS (or from current context if no tests specified) by categorizing them by abstraction level and ordering them for efficient root cause identification.

## Process

1. **Check branch:** Use `git branch --show-current` to get current branch name. If you're on the same branch as `git default-base-branch`, stop execution—plans should only be created on feature branches.

2. **Get base branch:** Use `git base-branch` to get the base branch of the current branch.
   .
3. **Analyze context:** Read `~/.claude/commands/context/branch.md` and follow its instructions to understand what changes on the current branch might be causing test failures.

4. **Order tests:** Examine each test path and order them from lowest to highest:
   - First by testing pyramid level: unit → integration → end-to-end
   - Then within each level by architectural abstraction (e.g., models → services → controllers → UI components)
   - Consider the project's specific architecture to determine what constitutes low-level vs high-level within each testing tier

5. **Create plan:** Write a structured plan to `.ai/plans/<branch>/<datetime>-failing-tests.md` (use `!date +"%Y-%m-%dT%H-%M-%S"` for datetime) using the template below. Follow the instructions in the comments within the template, then remove all comments from the final output

## Template

The plan will serve as a roadmap for systematically fixing tests to resolve cascading failures efficiently.

```markdown
# Fix Failing Tests

## Overview

<!-- Write a brief description of the failing tests and the approach to fix them systematically. -->

## Failing Tests

<!-- List the failing tests provided in the arguments as a numbered list, ordered by abstraction level (lowest to highest). Output only the test file paths with numbers—no subsections or abstraction labels. Fixing lower-level tests may resolve higher-level test failures. -->

1. test/path/to/unit_test.js
2. test/path/to/integration_test.js
3. test/path/to/end_to_end_test.js

## Context

<!-- Summarize the recent changes that may have caused the failures based on git log and diff output. In addition, copy the commands below, replacing <base-branch> with the actual base branch name. -->

**Commits command:** `git log origin/<base-branch>...HEAD`
**Diff command:** `git diff origin/<base-branch>...HEAD`

## Process

<!-- Copy this Process section exactly as written, without modification: -->

For each failing test above (in order) do the following:

1. Run the appropriate test command to confirm the test is actually failing.
2. Analyze the failure output to identify the root cause of the problem.
3. Fix the underlying issue in the codebase, not just the test itself.
4. Re-run the test to verify the fix resolves the failure.
5. If you make 5 attempts and the test is still failing, stop working and escalate to the user.

Once you've completed fixing all tests, for each fix, explain what was failing, what the underlying problem was, and how you fixed it.
```
