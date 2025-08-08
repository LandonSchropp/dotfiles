---
description: Analyze file to identify and remove redundant, verbose, or low-value content
argument-hint: [path]
---

Analyze the $ARGUMENTS (or current context if no path provided) to identify content that clutters context without adding value. The goal is to identify context bloat and remove redundancy.

## Process

1. **High-level analysis:** Read the file and provide an overview of sections that may be redundant, verbose, or low-value.
2. **Step-by-step review:** For each item identified, make suggestions, but let the user decide what to change.
