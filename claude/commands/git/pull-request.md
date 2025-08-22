---
description: Create a pull request by analyzing git diff and generating appropriate title and description
allowed-tools: Bash(git branch:*, git diff:*, git log:*, gh pr:*)
---

Create a pull request by analyzing the current branch's changes and generating an appropriate title and description based on the git diff.

## Process

1. **Branch analysis:** Analyze current git state

   - Check current branch name with `git branch --show-current`, the base branch with `git base-branch` and the default base branch with `git default-base-branch`
   - Verify we're not on the default base branch (if we are, then stop)
   - Check if branch has upstream tracking
   - Get the base branch (default: main)

2. **Change analysis:** Analyze changes since branching

   - Run `git diff <base-branch>...HEAD` to see all changes
   - Run `git log <base-branch>..HEAD --oneline` to see commit history
   - Analyze file patterns and content to understand the scope of changes

3. **PR title generation:** Create a clear, descriptive title that explains what the PR accomplishes

   Examples:

   - Add user profile management system
   - Resolve authentication timeout issues
   - Update API documentation with examples
   - Simplify database connection logic
   - Update build configuration and dependencies

4. **PR description generation:** Create description based on repository setup. Include enough detail for reviewers to understand changes without being overly verbose.

   - **If PR template exists:** Use template, excluding screenshots and ticking/removing hidden checklists
   - **If no template:** Use structured format with Summary, Changes and Notes sections
   - **For simple PRs:** Use a concise summary instead of full structure

5. **PR handling:** Handle PR creation or update

   - **Check for existing PR:** Run `gh pr view --json url,title,body` to check if PR exists for current branch
   - **If no PR exists:** Execute `gh pr create --web --title "<descriptive title>" --body "<generated description>" --base main`
   - **If PR exists:** Open GitHub web interface for editing with `gh pr edit --web --body "<generated description>"` to pre-populate the new description
