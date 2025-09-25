---
description: 'Prompt and workflow for generating conventional commit messages using a structured XML format. Guides users to create standardized, descriptive commit messages in line with the Conventional Commits specification, including instructions, examples, and validation.'
tools: ['runInTerminal', 'getTerminalOutput']
---

<!-- Repository: factorio-mocks -->

### Instructions

```xml
	<description>This file contains a prompt template for generating conventional commit messages for the factorio-mocks repository (central hub). It provides instructions, examples, and formatting guidelines to help users write standardized, descriptive commit messages in accordance with the Conventional Commits specification.</description>
	<repository>factorio-mocks - Central hub repository for documentation, planning, and coordination</repository>
	<note>This prompt is specifically designed for the factorio-mocks central hub repository. For other ecosystem repositories, use their respective prompt files.</note>
```

### Workflow

**Follow these steps:**

1. Run `git status` to review changed files.
2. Run `git diff` or `git diff --cached` to inspect changes.
3. Stage your changes with `git add <file>`.
4. Construct your commit message using the following XML structure.
5. After generating your commit message, Copilot will automatically run the following command in your integrated terminal (no confirmation needed):

```bash
git commit -m "type(scope): description"
```

6. Just execute this prompt and Copilot will handle the commit for you in the terminal.

### Commit Message Structure

```xml
<commit-message>
	<type>feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert</type>
	<scope>()</scope>
	<description>A short, imperative summary of the change</description>
	<body>(optional: more detailed explanation)</body>
	<footer>(optional: e.g. BREAKING CHANGE: details, or issue references)</footer>
</commit-message>
```

### Examples

```xml
<examples>
	<example>feat(parser): add ability to parse arrays</example>
	<example>fix(ui): correct button alignment</example>
	<example>docs: update README with usage instructions</example>
	<example>refactor: improve performance of data processing</example>
	<example>chore: update dependencies</example>
	<example>feat!: send email on registration (BREAKING CHANGE: email service required)</example>
</examples>

<hub-specific-examples>
	<example>docs(planning): update architecture decisions</example>
	<example>feat(templates): add generator-specific issue template</example>
	<example>chore: sync labels across ecosystem repositories</example>
	<example>docs: improve ecosystem getting started guide</example>
	<example>feat(coordination): add new milestone strategy</example>
</hub-specific-examples>
```

### Validation

```xml
<validation>
	<type>Must be one of the allowed types. See <reference>https://www.conventionalcommits.org/en/v1.0.0/#specification</reference></type>
	<scope>Optional, but recommended for clarity.</scope>
	<description>Required. Use the imperative mood (e.g., "add", not "added").</description>
	<body>Optional. Use for additional context.</body>
	<footer>Use for breaking changes or issue references.</footer>
</validation>
```

### Co-authored-by Guidelines

```xml
<co-authored-by>
	<when>Include when AI contributed significantly to the implementation or design decisions</when>
	<format>Co-authored-by: GitHub Copilot &lt;copilot@github.com&gt;</format>
	<example>
		git commit -m "feat(parser): add ability to parse arrays

		Implemented comprehensive array parsing with nested object support.

		Co-authored-by: GitHub Copilot &lt;copilot@github.com&gt;"
	</example>
</co-authored-by>
```

### Final Step

```xml
<final-step>
  <cmd>git commit -m "type(scope): description"</cmd>
  <note>Replace with your constructed message. Include body, footer, and co-authored-by if needed.</note>
  <powershell-escaping>
    For PowerShell users, follow these quote escaping rules:
    - Always use double quotes around the entire commit message
    - Always use single quotes for any quoted text within the message
    - This applies to both single-line and multi-line messages
    - Single-line example: git commit -m "feat(scope): add 'quoted feature'"
    - Multi-line example: git commit -m "feat(scope): add feature with 'quoted text'[newline][newline]Body text here.[newline][newline]Co-authored-by: GitHub Copilot &lt;copilot@github.com&gt;"
  </powershell-escaping>
</final-step>
```
