---
description: Add or update RSpec tests for Ruby components with incremental approval workflow
argument-hint: [path | class | method | description]
allowed-tools: Read, Write, Edit, Bash(rspec:*), Grep, Glob
---

Add RSpec tests for $ARGUMENTS (or current context if no description provided) following RSpec best practices.

## Process

1. **Analyze Current State:**

   - Determine appropriate spec file location
   - If existing spec file: Understand current structure to integrate new tests

2. **Plan Test Structure:** List describe and context blocks without wrapping in commands:

   ```
   #method_name
     when condition A
     when condition B
     when edge case C
   ```

3. **Review and Approval:** Wait for feedback on proposed structure before implementation

4. **Implement Incrementally:**

   - Implement one context block at a time
   - Wait for approval before each context implementation
   - Run specs after each context addition
   - Fix failures before proceeding

5. **Quality Standards:**

   - Follow [Better Specs](https://www.betterspecs.org/) conventions
   - Use descriptive context names explaining scenarios
   - Follow "describe what it does, not how it does it" principle
   - Include edge cases and error conditions
   - Use appropriate RSpec matchers and let blocks
   - Use FactoryBot factories for models (when applicable)
   - Ensure good coverage without redundancy
