---
description: Add or update Jest tests for JavaScript/TypeScript/JSX components with incremental approval workflow
argument-hint: [path | class | function | component | description]
allowed-tools: Read, Write, Edit, Bash(jest:*), Grep, Glob
---

Add Jest tests for $ARGUMENTS (or current context if no description provided) following Jest best practices.

## Process

1. **Analyze Current State:**
   - Determine appropriate test file location (`.test.js`/`.test.ts`/`.test.jsx`/`.test.tsx` or `__tests__` directory)
   - If existing test file: Understand current structure to integrate new tests

2. **Plan Test Structure:** List describe and test blocks without wrapping in commands:

   ```
   functionName
     when condition A
     when condition B
     when edge case C
   ```

   ```
   ClassName
     #methodName
       when condition A
       when condition B
       when edge case C
     .staticMethod
       when condition X
       when condition Y
     #property
       when accessed
       when modified
       when invalid value
   ```

   ```
   ComponentName
     when rendered with props
     when user interaction occurs
     when error state
   ```

3. **Review and Approval:** Wait for feedback on proposed structure before implementation

4. **Implement Incrementally:**

- Implement one describe block at a time
  - Wait for approval before each context implementation
  - Run tests after each block addition
  - Fix failures before proceeding

5. **Quality Standards:**
   - Follow [Better Specs](https://www.betterspecs.org/) conventions adapted for JavaScript/TypeScript
   - Use descriptive test names explaining scenarios
   - Follow "describe what it does, not how it does it" principle
   - Include edge cases and error conditions
   - Use appropriate Jest matchers and setup/teardown hooks
   - Use factory functions or test data builders for complex objects (when applicable)
   - Ensure good coverage without redundancy
   - Prefer `describe` for grouping related tests and `it` for individual test cases
