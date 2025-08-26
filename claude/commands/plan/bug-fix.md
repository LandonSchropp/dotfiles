---
description: Create a plan for systematically investigating and fixing a bug
argument-hint: [bug description or reproduction steps...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for investigating and fixing a bug described in $ARGUMENTS by systematically identifying the root cause and implementing a proper fix.

## Process

1. **Check branch:** Use `git branch --show-current` to get current branch name. If you're on the same branch as `git default-base-branch`, create a new feature branch using a hyphenated version of the bug you're fixing (e.g. `fix-login-validation-error`) and switch to it using `git switch -c <branch-name>`.

2. **Get base branch:** Use `git base-branch` to get the base branch of the current branch.

3. **Analyze context:** Run `~/.claude/commands/context/branch.md` to understand what changes on the current branch might be related to the bug.

4. **Categorize bug:** Determine the bug category and priority:
   - **Type:** UI/UX, Logic, Performance, Security, Integration, Data, etc.
   - **Impact:** User-facing, Internal, Development workflow

5. **Create plan:** Write a structured plan to `.ai/plans/<branch>/<datetime>-bug-fix.md` (use `!date +"%Y-%m-%dT%H-%M-%S"` for datetime) using the template below. Follow the instructions in the comments within the template, then remove all comments from the final output

## Template

The plan will serve as a roadmap for systematically investigating and fixing the bug.

```markdown
# [Bug] Bug Fix

<!-- Replace [Bug] with a brief name describing the bug you're fixing -->

## Overview

<!-- Write a brief description of the bug, its symptoms, and the systematic approach to fix it. -->

## Bug Description

<!-- Provide a detailed description of the bug including:

- What is happening (actual behavior)
- What should be happening (expected behavior)
- Steps to reproduce the issue
- Environment/conditions where it occurs
-->

**Bug Type:** <!-- UI/UX, Logic, Performance, Security, Integration, Data, etc. -->
**Impact:** <!-- User-facing, Internal, Development workflow -->

## Context

<!-- Summarize recent changes that may have introduced the bug based on git log and diff output. In addition, copy the commands below, replacing <base-branch> with the actual base branch name. -->

**Commits command:** `git log origin/<base-branch>...HEAD`
**Diff command:** `git diff origin/<base-branch>...HEAD`

## Investigation & Fix Plan

<!-- Describe the approach for investigating and fixing this bug based on your project's specific architecture and debugging practices. -->

## Process

<!-- Copy this Process section exactly as written, without modification: -->

For bug fixes, follow this approach:

1. Reproduce the bug and write a test (or multiple tests) that demonstrates the failing behavior.
2. Investigate the root cause by examining code paths, logs, and recent changes.
3. Implement the minimal fix needed to address the root cause.
4. Run the test to ensure it now passes.
5. If the fix doesn't resolve the issue after 5 attempts, re-evaluate the root cause analysis.

Once the bug is fixed, document:

- What the root cause was
- Why the bug occurred
- How the fix addresses the underlying issue
- Any preventive measures to avoid similar bugs in the future
```
