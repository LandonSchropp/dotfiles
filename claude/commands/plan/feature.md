---
description: Create a plan for implementing a new feature
argument-hint: [feature description or requirements...]
allowed-tools: Read, Write, Bash(git branch:*), Bash(git switch:*), Bash(git base-branch:*), Bash(git default-base-branch:*), Bash(date:*)
---

Create a plan for implementing a new feature described in $ARGUMENTS by breaking it down into manageable components and defining a systematic development approach.

Read `~/.claude/commands/plan/_base.md` and follow all sections. Use the template below.

## Template

The plan will serve as a roadmap for implementing the feature in a systematic and maintainable way.

```markdown
# [Feature] Implementation Plan

<!-- Replace [Feature] with the actual name of the feature you're implementing -->

## Overview

<!-- Write a brief description of the feature and the overall implementation approach. -->

## Context

<!-- Summarize existing work and recent changes on the branch. -->

## Requirements

<!--
Provide detailed requirements including:

- What the feature should do (functional requirements)
- How it should behave (behavioral requirements)
- Performance and scalability considerations
- User experience expectations
- Integration points with existing systems
-->

## Architecture

<!-- Describe how this feature fits into the existing system and identify the main areas that will be affected. Adapt this section based on your project's specific architecture and technology stack. -->

## Plan

<!-- Break down the implementation into logical phases (if the feature is non-trivial). For simple features, a single implementation phase may suffice. For each phase, review the requirements and break the phase into specific tasks. Phases can be subdivided into steps if necessary. -->

### Phase 1: [Title]

<!-- ... -->

### Phase 2: [Title]

<!-- ... -->

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
