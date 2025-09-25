# Contributing to Factorio Mocks Ecosystem

Thank you for your interest in contributing to the Factorio Mocks Ecosystem! This project aims to provide comprehensive
testing infrastructure for Factorio mod development, and we welcome contributions from developers of all skill levels.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Documentation Guidelines](#documentation-guidelines)
- [Community Guidelines](#community-guidelines)
- [Issue and Pull Request Process](#issue-and-pull-request-process)
- [Architectural Decisions](#architectural-decisions)
- [Security Considerations](#security-considerations)

## Getting Started

### Prerequisites

- **Git**: For version control
- **GitHub Account**: For collaboration
- **GitHub CLI** (recommended): For easier repository management
- **Markdown Editor**: For documentation work
- **Text Editor/IDE**: VS Code recommended with markdown extensions

### First-Time Setup

1. **Fork the Repository**

   ```bash
   gh repo fork QuingKhaos/factorio-mocks --clone
   cd factorio-mocks
   ```

2. **Set Up Development Environment**

   ```bash
   # Install dependencies for linting
   npm install -g markdownlint-cli jsonlint
   pip3 install jsonschema
   ```

3. **Review Project Structure**
   - Read `README.md` for project overview
   - Browse `planning/` directory for architecture and roadmap
   - Review existing `planning/decisions/` for context

### Ways to Contribute

- **📚 Documentation**: Improve planning docs, add examples, fix typos
- **🏗️ Architecture**: Participate in architectural discussions and decisions
- **🔧 Infrastructure**: Improve CI/CD, templates, and automation
- **🐛 Bug Reports**: Help identify issues in planning or processes
- **💡 Feature Ideas**: Suggest improvements to the ecosystem design
- **🎯 Planning**: Help refine implementation roadmap and specifications

## Development Workflow

### Branch Strategy

- **main**: Stable, production-ready planning and documentation
- **feature branches**: `feat/brief-description` for new features
- **fix branches**: `fix/brief-description` for bug fixes
- **docs branches**: `docs/brief-description` for documentation updates

### Standard Workflow

1. **Create a Branch**

   ```bash
   git checkout -b feat/your-feature-name
   ```

2. **Make Changes**
   - Follow coding standards and documentation guidelines
   - Test your changes locally
   - Run quality checks

3. **Commit Changes**
   - Use conventional commit messages
   - Keep commits focused and atomic
   - Sign your commits (recommended)

4. **Push and Create PR**

   ```bash
   git push origin feat/your-feature-name
   ```

   Then create a pull request through the GitHub web interface to ensure the PR template is properly applied:
   `https://github.com/QuingKhaos/factorio-mocks/compare/main...your-branch-name`

   **Important**: Use conventional commit format in PR titles as they become the squash merge commit message.

5. **Address Review Feedback**
   - Respond promptly to reviewer comments
   - Make requested changes
   - Update documentation as needed

## Coding Standards

### Commit Message Format

We use [Conventional Commits](https://www.conventionalcommits.org/) for both individual commits and **PR titles**:

```markdown
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Important**: Since we use squash merging, your **PR title** becomes the commit message on `main`. Make sure your
PR title follows the conventional commit format.

**Types:**

- `feat`: New feature or enhancement
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code changes that neither fix bugs nor add features
- `test`: Adding or updating tests
- `chore`: Maintenance tasks, dependency updates

**Examples:**

```text
feat(architecture): add multi-repository coordination strategy
fix(docs): correct typo in repository specifications
docs(planning): update implementation roadmap with Phase 2 details
chore(ci): update GitHub Actions to latest versions
```

### File Naming Conventions

- **Planning Documents**: `kebab-case.md`
- **ADR Files**: `adr-NNNN-brief-title.md`
- **Scripts**: `kebab-case.ps1` or `kebab-case.sh`
- **Configuration**: Standard names (`.markdownlint.json`, `dependabot.yml`)

### Directory Structure

```bash
planning/
├── architecture.md              # Core ecosystem design
├── implementation-roadmap.md    # Development phases
├── repository-specifications.md # Detailed repo specs
├── community-engagement.md      # Community strategy
└── decisions/                   # Architectural decisions
    ├── adr-NNNN-title.md        # Individual ADRs

.github/
├── workflows/                  # CI/CD workflows
├── ISSUE_TEMPLATE/             # Issue templates
├── PULL_REQUEST_TEMPLATE/      # PR templates
├── scripts/                    # Automation scripts
├── SECURITY.md                 # Security policy
└── dependabot.yml              # Dependency management
```

## Documentation Guidelines

### Markdown Standards

- Follow `.markdownlint.json` configuration
- Use proper heading hierarchy (h1 → h2 → h3)
- Include blank lines around headings and lists
- Wrap lines at 120 characters for readability
- Use consistent formatting for links and references

### Content Guidelines

- **Clear and Concise**: Write for diverse technical backgrounds
- **Well-Structured**: Use headings, lists, and tables effectively
- **Up-to-Date**: Keep information current and accurate
- **Cross-Referenced**: Link to related documents appropriately
- **Accessible**: Consider non-native English speakers

### Architectural Decision Records (ADRs)

Use the template in `.github/prompts/create-architectural-decision-record.prompt.md` for new ADRs:

1. **Context**: What problem are we solving?
2. **Decision**: What did we decide?
3. **Consequences**: What are the implications?
4. **Alternatives**: What other options were considered?

## Community Guidelines

### Code of Conduct

We follow the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/). In summary:

- **Be Respectful**: Treat all community members with respect
- **Be Inclusive**: Welcome people of all backgrounds and experience levels
- **Be Collaborative**: Work together constructively
- **Be Professional**: Maintain professional conduct in all interactions

### Communication Channels

- **GitHub Issues**: Bug reports, feature requests, and specific problems
- **GitHub Discussions**: General questions, ideas, and community chat
- **Pull Requests**: Code review and technical discussions
- **ADR Issues**: Architectural decision discussions

### Getting Help

- **New Contributors**: Look for `good-first-issue` labels
- **Questions**: Use GitHub Discussions Q&A category
- **Technical Help**: Reference planning documentation first
- **Stuck?**: Ask in GitHub Discussions or comment on relevant issues

## Issue and Pull Request Process

### Creating Issues

**Important**: All issues for the entire Factorio Mocks Ecosystem should be filed in this central repository
(`factorio-mocks`), regardless of which component they affect. Issues are disabled in the other ecosystem repositories
to centralize tracking and coordination.

1. **Search Existing Issues**: Avoid duplicates
2. **Choose Appropriate Template**: Bug report, feature request, etc.
3. **Select Correct Component**: Use the dropdown to specify which part of the ecosystem is affected
4. **Provide Complete Information**: Follow template guidance
5. **Use Descriptive Titles**: Make issues easy to understand
6. **Add Relevant Labels**: Help with organization and triage

### Pull Request Guidelines

1. **Use Conventional Commit Format in PR Titles**: Since we use squash merging, your PR title becomes the commit
   message on `main`. Format it as: `type(scope): description`

   **Examples**:
   - `feat(architecture): add multi-repository coordination strategy`
   - `docs: correct typo in implementation roadmap`
   - `docs(planning): update Phase 2 timeline and milestones`
   - `ci: update GitHub Actions workflow versions`

2. **Reference Related Issues**: Link to relevant issues in the PR description
3. **Describe Changes Clearly**: Explain what, why, and how in the PR body
4. **Follow PR Template**: Complete all relevant sections
5. **Keep PRs Focused**: One feature or fix at a time
6. **Update Documentation**: Include necessary doc updates
7. **Test Thoroughly**: Verify changes work as expected

### Review Process

- **All PRs require review** before merging
- **Reviewers will check**:
  - Code quality and standards compliance
  - Documentation completeness
  - Architectural alignment
  - Impact on ecosystem design
- **Address feedback promptly** and professionally
- **Iterate as needed** until approval

## Architectural Decisions

### When to Create an ADR

Create an ADR when making decisions that:

- Affect multiple repositories in the ecosystem
- Change fundamental architectural principles
- Impact public APIs or interfaces
- Require significant technology choices
- Affect development processes or governance

### ADR Process

1. **Create Issue**: Use "Architectural Decision Request" template
2. **Gather Input**: Allow community discussion
3. **Draft ADR**: Create formal decision record
4. **Review Process**: Technical review and approval
5. **Implementation**: Update related documentation

### Architectural Principles

- **Modular Design**: Components should be loosely coupled
- **Community First**: Prioritize community needs and feedback
- **Iterative Development**: Prefer working solutions over complex plans
- **Open Source**: All components should be open source
- **Cross-Platform**: Support Windows, Linux, and macOS

## Security Considerations

### Reporting Security Issues

- **Never** create public issues for security vulnerabilities
- Use GitHub's private vulnerability reporting feature
- Or email maintainers directly (see README for contact info)
- Follow responsible disclosure practices

### Security-Aware Development

- **Validate Inputs**: Always validate and sanitize inputs
- **Minimize Dependencies**: Avoid unnecessary external dependencies
- **Review Code**: Pay attention to security implications
- **Document Assumptions**: Make security assumptions explicit
- **Test Security**: Consider security implications in testing

### Sensitive Information

- **No Secrets**: Never commit API keys, passwords, or secrets
- **No Personal Data**: Avoid including personal information
- **Public Repository**: Remember this is a public repository
- **Review Before Commit**: Always review changes before committing

## Recognition and Credits

### Contributor Recognition

- Contributors are recognized in release notes
- Significant contributions may be highlighted in project updates
- Community contributors may be invited to join maintainer discussions

### Types of Contributions Valued

- **Code and Documentation**: Direct improvements to project
- **Community Support**: Helping other contributors
- **Issue Reporting**: High-quality bug reports and feature requests
- **Architectural Input**: Participation in design discussions
- **Testing and Feedback**: Helping validate changes and decisions

---

## Quick Reference

### Useful Commands

```bash
# Set up repository
gh repo fork QuingKhaos/factorio-mocks --clone

# Create feature branch
git checkout -b feat/my-feature

# Run quality checks
markdownlint --config .markdownlint.json --dot **/*.md

# Push changes
git push origin feat/my-feature

# Then create PR via web interface at:
# https://github.com/QuingKhaos/factorio-mocks/compare/main...your-branch-name
```

### Key Files to Review

- `README.md` - Project overview
- `planning/architecture.md` - Ecosystem design
- `planning/implementation-roadmap.md` - Development phases

### Community Resources

- [GitHub Discussions](https://github.com/QuingKhaos/factorio-mocks/discussions)
- [Issue Templates](https://github.com/QuingKhaos/factorio-mocks/issues/new/choose)
- [Project Planning](https://github.com/QuingKhaos/factorio-mocks/tree/main/planning)

Thank you for contributing to the Factorio Mocks Ecosystem! 🚀
