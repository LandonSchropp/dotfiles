---
description: Create a plan for systematically refactoring code to improve its structure and maintainability
argument-hint: [scope]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for refactoring the scope described in $ARGUMENTS.

## Process

1. **Check branch:** Use `git branch --show-current` to get current branch name. If you're on the same branch as `git default-base-branch`, create a new feature branch using a hyphenated version of the refactoring you're doing (e.g. `refactor-user-service-layer`) and switch to it using `git switch -c <branch-name>`.

2. **Get base branch:** Use `git base-branch` to get the base branch of the current branch.

3. **Analyze context:** Run `~/.claude/commands/context/branch.md` to understand the current state of the branch and any existing work.

4. **Create plan:** Write a structured plan to `.ai/plans/<branch>/<datetime>-refactor.md` (use `!date +"%Y-%m-%dT%H-%M-%S"` for datetime) using the template below. Follow the instructions in the comments within the template, then remove all comments from the final output

## Template

The plan will serve as a roadmap for systematically refactoring code while maintaining functionality and improving code quality.

```markdown
# [Scope] Refactoring Plan

<!-- Replace [Scope] with the specific area of code you're refactoring (e.g., User Service Layer, Authentication Module, etc.) -->

## Overview

<!-- Write a brief description of what code is being refactored and the overall approach to improve its structure and maintainability. -->

## Refactoring Goals

<!-- Define the scope of the refactor. -->

**Refactoring Type:** <!-- Architecture, Code Structure, Performance, Testing, Design Patterns, etc. -->
**Complexity:** <!-- Simple, Moderate, Complex -->

## Context

<!-- Summarize existing work and recent changes on the branch. -->

## Scope

<!-- Document the specific problems the refactor aims to address. -->

## Refactoring Plan

<!-- Break down the refactoring into logical phases. For simple refactoring, a single phase may suffice. For complex refactoring, multiple phases help manage risk and ensure functionality is preserved. -->

### Phase 1: [Title]

<!-- ... -->

### Phase 2: [Title]

<!-- ... -->

## Safety Measures

<!-- Copy this Safety Measures section exactly as written, without modification: -->

To ensure safe refactoring:

1. **Preserve existing tests:** Run tests related to the refactored code.
2. **Maintain test coverage:** Keep tests passing throughout the refactoring process
3. **Small incremental changes:** Make small, focused changes that can be easily reviewed and reverted
4. **Validate after each phase:** Run tests for affected units and verify functionality after completing each phase
5. **Document breaking changes:** If any API changes are needed, document them clearly

## Process

<!-- Copy this Process section exactly as written, without modification: -->

For each phase above (in order) do the following:

1. Run existing tests to ensure they pass before making changes (establish baseline).
2. Make incremental refactoring changes while keeping tests green.
3. Add new tests if the refactoring introduces new functionality or improves testability.
4. Validate that the refactored code maintains the same external behavior.
5. If refactoring becomes blocked or tests start failing, document the issue and seek guidance.

Once the refactoring is complete, explain:

- How the code changed from the factor
- Any architectural decisions made during refactoring
- Areas that might benefit from future refactoring
```
