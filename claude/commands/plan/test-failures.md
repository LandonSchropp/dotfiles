---
description: Create a plan for systematically fixing failing tests
argument-hint: [failing test paths...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for fixing failing tests in $ARGUMENTS (or from current context if no tests
specified).

Read `~/.claude/commands/plan/_base.md` and follow all sections. Use the template below.

## Order

Order tests from lowest to highest to facilitate efficient root cause identification:

1. Testing pyramid level: unit → integration → end-to-end
2. Architectural abstraction: Consider the project's specific architecture to determine what constitutes low-level vs high-level within each testing tier (e.g., models → services → controllers → UI components)

## Template

The plan will serve as a roadmap for systematically fixing tests to resolve cascading failures efficiently.

```markdown
# Fix Failing Tests

## Overview

<!-- Write a brief description of the failing tests and the approach to fix them systematically. -->

## Context

<!-- Summarize the recent changes that may have caused the failures. -->

## Tests

<!-- List the failing tests provided in the arguments as a numbered list, ordered by abstraction level (lowest to highest). Output only the test file paths with numbers—no subsections or abstraction labels. Fixing lower-level tests may resolve higher-level test failures. -->

1. test/path/to/unit_test.js
2. test/path/to/integration_test.js
3. test/path/to/end_to_end_test.js

## Process

<!-- Copy this Process section exactly as written, without modification: -->

For each failing test above (in order) do the following:

1. Run the test command to confirm the test is actually failing.
2. Analyze the failure output to identify the root cause of the problem.
3. Fix the underlying issue.
4. Re-run the test to verify the fix resolves the failure.
5. If you make 5 attempts and the test is still failing, stop working and escalate to the user.

Once you've completed fixing all tests, for each fix, explain what was failing, what the underlying problem was, and how you fixed it.
```
