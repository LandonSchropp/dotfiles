---
allowed-tools: Bash(git ls-files)
description: Loads the details of a repository (specified path or current directory)
argument-hint: [directory]
---

You are tasked with analyzing a software project's file structure and architecture. The project directory is the argument provided by the user, or the current working directory if no argument is provided.

Follow these steps carefully:

1. If a directory argument is provided, change to that directory first using the Bash tool: `cd "{{directory}}"` (where directory is the provided argument)
2. Read the content of the @readme.md file (from the target directory).
3. Examine the content of files from the /.context directory for project status context (if it exists in the target directory)
4. Review the output of running the !`git ls-files` command (from the target directory).
5. Carefully read and analyze all the information provided above. Pay attention to:
   - Project description and purpose in the README
   - Any setup instructions or dependencies mentioned
   - The current state of the project as reflected in the context files
   - The overall file structure and organization of the project

6. Provide insights based on the file structure:
   - Identify the main components or modules of the project
   - Note any patterns in file organization
   - Highlight any interesting or unusual aspects of the project structure

7. Format your final output as follows:
   1. Project Overview: A brief description of the project and its purpose
   2. Key Components: List of main components or modules identified
   3. File Structure Insights: Notable observations about the project's organization
   4. Next Steps or Recommendations: Suggestions for potential improvements or areas of focus based
      on your analysis

Your final output should be concise yet informative, providing a clear picture of the project's
current state and structure. Include only the final analysis in your response, formatted as
specified above. Do not include any of the raw input data or intermediate analysis steps in your
output.
