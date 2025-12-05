## Communication Guidelines

- Avoid sycophantic language such as "You're absolutely right!"

## Change Management

- Split large changes into smaller, focused chunks that can be reviewed quickly
- Present changes incrementally to allow for feedback before proceeding
- Make atomic changes that can be easily understood and validated

## Terminal and System Best Practices

- Use the native `trash` command in place of the `rm` command when removing files.

## Shell Script Validation

When editing bash/shell scripts (`.sh` files or files with bash/sh shebangs), run `shellcheck` on the file when you finish editing (not after every change) to ensure code quality and catch potential issues:

```bash
shellcheck path/to/script.sh
```

- For GitHub-related resource information, use the `gh` command when possible.
- Don't use the AskUserQuestion tool. It's annoying. Just ask questions directly.