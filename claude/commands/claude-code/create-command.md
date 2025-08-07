Generate a new Claude Code command.

## Metadata

Use the following fields:

- **description (required):** What the command does
- **argument-hint (optional):** Expected input format
- **allowed-tools (optional):** Only when command needs specific tools

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

1. **Define Purpose:** What does the command do with `$ARGUMENTS`?
2. **Write Command:** Follow this structure:

   ```markdown
   [Clear instruction for the $ARGUMENTS file/input]

   [Any specific requirements or context]

   ## Process (only if multi-step)

   1. **Step name:** What happens
   2. **Next step:** What follows
   ```

3. **Save:** Use descriptive filename like `action-target.md`

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
