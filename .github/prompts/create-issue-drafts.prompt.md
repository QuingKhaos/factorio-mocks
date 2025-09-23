---
mode: 'agent'
description: 'Create issue draft documents for for the current branch.'
tools: ['createFile', 'createDirectory', 'editFiles', 'search', 'terminalSelection', 'terminalLastCommand', 'runTasks', 'usages', 'vscodeAPI', 'problems', 'changes', 'testFailure', 'openSimpleBrowser', 'fetch', 'githubRepo', 'extensions']
---
# Create Issue Drafts

Create one or more issue drafts from the implementation roadmap, scoped to the users context using the repositories issue templates like we would create an issue from the GitHub UI.

## Inputs

- **Next issue number**: `${input:issue_number}`
- **Context**: `${input:Context}`

## Input Validation

If any of the required inputs are not provided or cannot be determined from the conversation history, ask the user to
provide the missing information before proceeding with issue generation.

## Requirements

- Use precise, unambiguous language
- Follow standardized issue template structure
- Ensure all sections are filled out appropriately
- Maintain professional and collaborative tone
- Title should be prefixed according to the issue template
- Assign the issue to the appropriate milestone based on the implementation roadmap
- Apply the appropriate labels based on the content of the issue

The issue drafts must be saved in the `.github/drafts/issues/` directory using the naming convention:
`issue-NNNN-[title-slug].md`, where NNNN is the next issue number with leading zeros. If you are creating multiple issues,
increment the issue number for each new issue.

## Required Documentation Structure

The documentation file must follow the template below, ensuring that all sections are filled out appropriately. The
front matter for the markdown should be structured correctly as per the example following:

```markdown
---
title: "Concise and descriptive issue title"
labels: ["type: feature"]
milestone: "Phase 1"
---
<!-- Use the correct issue template like you would get if you created the issue on GitHub -->
```
