# Plan Base

This file contains the process, steps and template elements used by all plan commands.

## 1. Context

1. **Get branches:** Use !`git default-base-branch` to determine the default base branch for the repository, !`git base-branch` to get the base branch of the branch you're currently on, and !`git branch --show-current` to get the current branch name.

2. **Analyze context:** If you're currently on the default base branch (usually `main` or `master`), no analysis is needed. Otherwise, read `~/.claude/commands/context/branch.md` and follow its instructions to understand the state of the current branch and any existing work.

3. If you're on the default branch, stop and request that I give you the name of the feature branch. Then, switch to it using `git switch -c <branch-name>`.

## 2. Plan Creation

Create the plan file and fill out only the Overview and Context sections:

1. **Create plan file:** Write the plan to `.ai/plans/<branch>/<datetime>-<plan-type>.md` (use `!date +"%Y-%m-%dT%H-%M-%S"` for datetime)

2. **Fill Overview section:** Write a brief description of the work and the overall approach. Follow any specific instructions provided in the plan template.

3. **Fill Context section:** Use the Context Section Template below, summarizing existing work and recent changes. Follow any specific instructions provided in the plan template.

4. **Stop for approval:** Do not fill out any other sections. Wait for feedback and approval before continuing with the rest of the plan.

## 3. Remaining Sections

Complete the remaining template sections one-by-one:

1. **Fill each section individually:** Work through each remaining section in the template
2. **Stop for approval:** After completing each section, stop and wait for feedback and approval before proceeding to the next section
3. **Verbatim sections:** Do not stop for approval when copying sections marked "Copy this section exactly as written, without modification" - these can be copied directly without stopping. Copy them silently without any commentary.
