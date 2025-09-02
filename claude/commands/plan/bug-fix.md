---
description: Create a plan for systematically investigating and fixing a bug
argument-hint: [bug description or reproduction steps...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for investigating and fixing a bug described in $ARGUMENTS by systematically identifying the root cause and implementing a proper fix.

Follow the process defined in @~/.claude/commands/plan/\_base.md. Use the template below.

## Template

The plan will serve as a roadmap for systematically investigating and fixing the bug.

```markdown
# [Bug] Fix

<!-- Replace [Bug] with a brief name describing the bug you're fixing -->

## Overview

<!-- Write a brief description of the bug, its symptoms, and the systematic approach to fix it. -->

## Context

<!-- Summarize recent changes that may have introduced the bug. -->

## Description

<!-- Provide a detailed description of the bug including:

- What is happening (actual behavior)
- What should be happening (expected behavior)
- Steps to reproduce the issue
- Environment/conditions where it occurs
-->

## Plan

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
