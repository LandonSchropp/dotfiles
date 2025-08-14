Create or update a Claude Code command in the `claude/commands/` directory.

## Metadata

Use the following fields:

- **description (required):** What the command does
- **argument-hint (optional):** Expected input format
- **allowed-tools (optional):** Only when command needs specific tools. For Bash, specify the exact command with wildcards if needed (e.g., `Bash(git status:*)`) and only allow read-only commands unless explicitly told otherwise

Example:

```markdown
---
description: An example description of what this command does
argument-hint: <path>
allowed-tools: Bash(git status:*), Grep, Read
---

[Command content here]
```

## Guidelines

- **Single purpose:** One clear function per command
- **Dynamic input:** Use `$ARGUMENTS` for flexibility
- **File references:** Point to files with `@path/to/file`
- **Shell commands:** Include with a bang and backticks
- **Decision points:** Add where needed

## Process

1. **Determine Action:** Create new command or update existing one based on `$ARGUMENTS`
2. **Define Purpose:** What does the command do with its input?
3. **Write/Update Command:** Follow this structure:

   ```markdown
   [Clear instruction for the $ARGUMENTS file/input]

   [Any specific requirements or context]

   ## Process (only if multi-step)

   1. **Step name:** What happens
   2. **Next step:** What follows
   ```

4. **Save:** Use descriptive filename like `action-target.md`. Place the command in an appropriate subdirectory if necessary.

## Patterns

### Simple Commands

```markdown
Fix all import statements in $ARGUMENTS following project conventions.
Remove unused imports and add missing ones.
```

### Multi-Step Commands

```markdown
Refactor $ARGUMENTS for better performance.

## Process

1. **Analyze:** Identify bottlenecks and issues
2. **Propose:** Present plan, ask for approval
3. **Implement:** Apply approved changes
```

### Context-Aware Commands

```markdown
Apply style guide from @Areas/AI/Style Guide/Structure and Formatting.md to $ARGUMENTS.
Check structure with !\`tree -d\` if location unclear.
```
