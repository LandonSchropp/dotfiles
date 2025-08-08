---
description: Create a pull request by analyzing git diff and generating appropriate title and description
allowed-tools: Bash(git branch:*, git diff:*, git log:*, gh pr:*)
---

Create a pull request by analyzing the current branch's changes and generating an appropriate title and description based on the git diff.

## Process

1. **Branch Analysis:** Analyze current git state:

   - Check current branch name with `git branch --show-current`
   - Verify we're not on the `main`/`master` branch
   - Check if branch has upstream tracking
   - Get the base branch (default: main)

2. **Change Analysis:** Analyze changes since branching:

   - Run `git diff main...HEAD` to see all changes
   - Run `git log main..HEAD --oneline` to see commit history
   - Analyze file patterns and content to understand the scope of changes

3. **PR Title Generation:** Create a clear, descriptive title that explains what the PR accomplishes

   Examples:

   - Add user profile management system
   - Resolve authentication timeout issues
   - Update API documentation with examples
   - Simplify database connection logic
   - Update build configuration and dependencies

4. **PR Description Generation:** Create description based on repository setup. Include enough detail for reviewers to understand changes without being overly verbose.

   - **If PR template exists:** Use template, excluding screenshots and ticking/removing hidden checklists
   - **If no template:** Use structured format with Summary, Changes, and Notes sections
   - **For simple PRs:** Use a concise summary instead of full structure

5. **PR Creation:** Execute `gh pr create --web --title "<descriptive title>" --body "<generated description>" --base main`
