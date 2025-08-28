---
description: Analyze file to identify and remove redundant, verbose, or low-value content
argument-hint: [path]
---

Analyze the $ARGUMENTS (or current context if no path provided) to identify content that clutters context without adding value. The goal is to identify context bloat and remove redundancy.

## Process

1. **High-level analysis:** Read the file and provide an overview of sections that may be redundant, verbose, or low-value.
2. **Step-by-step review:** Present ONE specific edit at a time. For each edit:
   1. Quote the specific content to be changed
   2. Explain why it's redundant/verbose
   3. Make the streamlined change immediately
   4. Then move to the next edit
