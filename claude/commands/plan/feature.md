---
description: Create a plan for implementing a new feature
argument-hint: [feature description or requirements...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for implementing a new feature described in $ARGUMENTS by breaking it down into manageable components and defining a systematic development approach.

## Process

1. **Check branch:** Use `git branch --show-current` to get current branch name. If you're on the same branch as `git default-base-branch`, create a new feature branch using a hyphenated version of the feature you're implementing (e.g. `add-user-dashboard`) and switch to it using `git switch -c <branch-name>`.

2. **Get base branch:** Use `git base-branch` to get the base branch of the current branch.

3. **Analyze context:** Run `~/.claude/commands/context/branch.md` to understand the current state of the branch and any existing work.

4. **Break down feature:** Analyze the feature requirements and decompose into logical steps based on the project's architecture and technology stack.

5. **Create plan:** Write a structured plan to `.ai/plans/<branch>/<datetime>-feature.md` (use `!date +"%Y-%m-%dT%H-%M-%S"` for datetime) using the template below. Follow the instructions in the comments within the template, then remove all comments from the final output

## Template

The plan will serve as a roadmap for implementing the feature in a systematic and maintainable way.

```markdown
# [Feature] Implementation Plan

<!-- Replace [Feature] with the actual name of the feature you're implementing -->

## Overview

<!-- Write a brief description of the feature and the overall implementation approach. -->

## Feature Requirements

<!--
Provide detailed requirements including:

- What the feature should do (functional requirements)
- How it should behave (behavioral requirements)
- Performance and scalability considerations
- User experience expectations
- Integration points with existing systems
-->

**Feature Type:** <!-- UI Enhancement, API Extension, Data Processing, Integration, etc. -->
**Complexity:** <!-- Simple, Moderate, Complex -->

## Context

<!-- Summarize existing work and recent changes on the branch. In addition, copy the commands below, replacing <base-branch> with the actual base branch name. -->

**Commits command:** `git log origin/<base-branch>...HEAD`
**Diff command:** `git diff origin/<base-branch>...HEAD`

## Architecture Overview

<!-- Describe how this feature fits into the existing system and identify the main areas that will be affected. Adapt this section based on your project's specific architecture and technology stack. -->

## Implementation Plan

<!-- Break down the implementation into logical phases (if the feature is non-trivial). For simple features, a single implementation phase may suffice. For each phase, review the requirements and break the phase into specific tasks. -->

### Phase 1: [Title]

### Phase 2: [Title]

## Process

<!-- Copy this Process section exactly as written, without modification: -->

For each phase above (in order) do the following using TDD (red, green, refactor):

1. Write tests for the functionality you're about to implement and run them. They should fail initially (red).
2. Implement each task with appropriate error handling and validation to make tests pass (green).
3. Refactor the code for clarity and maintainability while keeping tests green.
4. If implementation becomes blocked, document the issue and seek guidance

Once the feature is complete, explain:

- How the feature works and its key components
- Any architectural decisions made during implementation
- Usage examples and integration points
- Future enhancement opportunities
```
