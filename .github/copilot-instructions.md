# Copilot Instructions for Factorio Mocks

## Project Overview

The **Factorio Mocks Ecosystem** is a comprehensive five-repository system designed to provide mock data for Factorio
mod development. This project enables developers to test mods without running the full Factorio game, making development
faster and more accessible.

**Architecture**: Five-repository ecosystem with ORAS distribution
**Philosophy**: Iterative development with community-first approachtory system

### Core Architecture

The ecosystem consists of five interconnected repositories:

1. `factorio-mocks` (this repo) - Central planning, documentation, and coordination
2. `factorio-mocks-generator` - Automated data extraction from Factorio installations
3. `factorio-mocks-modpacks` - Curated mod combinations and configurations
4. `factorio-mocks-data` - Generated mock data artifacts
5. `factorio-mocks-loader` - Runtime library for consuming mock data

### Key Architectural Decisions

- **Latest Mod Versions Strategy**: Only Factorio version is pinned; all mods use latest compatible versions
- **Daily Automated Builds**: Continuous integration captures latest mod ecosystem state
- **ORAS Distribution**: Container-based artifact distribution via GitHub Container Registry
- **Native Mod Management**: No external mod managers; direct integration with Factorio's native systems
- **Modular Design**: Early community access to data browsing while development continues
- **Centralized Issue Tracking**: All ecosystem issues filed in `factorio-mocks` repository; Issues disabled in other repos

## Development Philosophy

### Iterative Over Complex

- Prefer simple, working solutions over complex formal processes
- Continuous feedback over formal beta testing programs
- Progressive enhancement over big-bang releases

### Community-First

- Enable community data browsing as early as possible
- Separate technical roadmap from community engagement for independent maintenance
- Support multiple contributor skill levels with clear onboarding paths

## Code Standards and Conventions

### Documentation

- All planning documents live in `planning/` directory
- Use comprehensive markdown linting (`.markdownlint.json` configured)
- Maintain proper noun consistency (Factorio, GitHub, ORAS, etc.)
- Document architectural decisions formally in `planning/decisions/adr-NNNN-*.md` via `create-architectural-decision-record.prompt.md`.

### File Structure

```bash
planning/
├── architecture.md              # Core ecosystem design
├── decisions/adr-NNNN-*.md      # Formal architectural decisions
├── implementation-roadmap.md    # Technical development phases
├── repository-specifications.md # Detailed repo specs
└── community-engagement.md      # Community strategy

.github/
├── workflows/qa.yml             # Quality assurance automation
├── ISSUE_TEMPLATE/              # Structured issue templates
├── PULL_REQUEST_TEMPLATE/       # PR template with checklists
├── scripts/setup-labels.ps1     # Label automation script
├── instructions/                # Copilot instruction files (auto-loaded)
├── MILESTONES_STRATEGY.md       # Milestone planning approach
├── REPOSITORY_SETUP.md          # GitHub configuration guide
├── SECURITY.md                  # Security policy
├── dependabot.yml               # Dependency management
└── copilot-instructions.md      # This file

CONTRIBUTING.md                  # Community contribution guidelines
```

## Technical Context

### Current Status

- **Phase**: Foundation phase - first repository (`factorio-mocks`) complete, planning refinements in progress
- **Repository Progress**: 1/5 repositories created and configured with full GitHub infrastructure
- **Planning Status**: Core documentation complete, refinements needed before finalizing foundation phase
- **Next Phase**: Complete planning refinements, then create remaining 4 repositories and begin prototype development
- **Dependencies**: None external; all repositories will be created within ecosystem

### Key Technologies

- **Distribution**: ORAS (OCI Registry as Storage)
- **Data Format**: JSON-based mock structures
- **Automation**: GitHub Actions for daily builds
- **Documentation**: Markdown with comprehensive linting

### Integration Points

- Factorio mod portal API for mod discovery
- GitHub Container Registry for artifact storage
- Native Factorio mod loading mechanisms
- Cross-repository automation workflows

## Development Workflow

### Planning Updates

1. All architectural changes must be documented in `planning/decisions/adr-NNNN-<title>.md`
2. Update relevant planning documents to maintain consistency
3. Run QA workflow to validate documentation quality
4. Use conventional commits with clear rationale
5. **Never commit to specific timelines** in documentation - use dependency-based sequencing instead

### GitHub Infrastructure

- **Issue Templates**: Bug reports, feature requests, architectural decisions, documentation issues
- **PR Template**: Comprehensive checklist covering code quality, testing, and architectural alignment
- **Labels**: Effort-based (quick-win, moderate, substantial), type, component, and ecosystem coordination
- **Milestones**: Phase-based tracking without timeline commitments
- **Security**: Dependabot, secret scanning, and comprehensive security policy

### Quality Assurance

- GitHub Actions QA workflow validates all documentation
- Markdown linting enforces consistency and proper nouns
- JSON validation ensures configuration file integrity
- Documentation structure validation prevents missing files
- Branch protection requires PR review and status checks

## Common Tasks and Patterns

### Adding New Architectural Decisions

```markdown
## Decision [N]: [Title]

**Decision**: [What was decided and why]

**Context**: [Background and problem statement]

**Options Considered**:
1. **Option A**: Description
2. **Option B**: Description
3. **Option C**: Description

**Decision Rationale**:

**Advantages of Chosen Approach**:
- Point 1
- Point 2

**Trade-offs Accepted**:
- Point 1
- Point 2

**Implementation Notes**:
- Implementation detail 1
- Implementation detail 2
```

### Repository Creation Checklist

Each new repository should include:

- [ ] Clear README with ecosystem context
- [ ] GitHub Actions workflows for automation
- [ ] Consistent markdown linting configuration
- [ ] Proper conventional commit setup
- [ ] Documentation linking back to main planning

### GitHub Repository Management

**Prepared Infrastructure Files**:

- **4 Issue Templates**: Bug reports, feature requests, architectural decisions, documentation issues (ready to use)
- **Comprehensive PR Template**: Quality checklist covering code, testing, documentation, and architecture (ready to use)
- **21 Standardized Labels**: Effort-based (quick-win, moderate, substantial), type, component, ecosystem (script ready
  to run)
- **Phase-Based Milestones**: Foundation → Generator Prototype → Ecosystem Integration → Community Ready (strategy documented)
- **Security Configuration**: Dependabot config, security policy prepared (ready to apply)
- **Label Setup Script**: `.github/scripts/setup-labels.ps1` for automated label creation (not yet executed)
- **Complete Setup Guide**: `.github/REPOSITORY_SETUP.md` with step-by-step GitHub configuration (ready to follow)

**Label Strategy**:

- **Effort Labels**: `effort: quick-win`, `effort: moderate`, `effort: substantial` (help contributors choose appropriate
  tasks)
- **Type Labels**: `type: bug`, `type: feature`, `type: documentation`, `type: maintenance`
- **Component Labels**: `component: architecture`, `component: ci-cd`, `component: documentation`, `component: templates`
- **Ecosystem Labels**: `ecosystem: generator`, `ecosystem: modpacks`, `ecosystem: data`, `ecosystem: loader`
- **Special Labels**: `adr`, `breaking-change`, `good-first-issue`, `help-wanted`, `needs-discussion`, `blocked`

**Milestone Philosophy**:

- Use **phase-based milestones** instead of version numbers during initial development
- Focus on **dependency-based sequencing** rather than calendar commitments
- Each milestone represents **community value delivery** with clear success criteria
- Switch to version milestones only after stable releases and community adoption

### Community Engagement Guidelines

- Maintain low barrier to entry for contributors
- Provide clear documentation for all skill levels
- Enable early access to useful functionality
- Iterate based on community feedback rather than formal processes
- Use effort labels to help contributors find appropriate tasks
- Support multiple contribution levels through comprehensive issue templates
- Follow CONTRIBUTING.md guidelines for all community interactions

### Community Announcements

**Proactive Announcement System**: GitHub Copilot actively identifies announcement opportunities during development
sessions and guides the collaborative creation process using numbered draft files (`NNNN-descriptive-name.md`) in
`.github/drafts/announcements/`.

**Full Workflow**: See `.github/instructions/announcement-creation-assistant.instructions.md` for comprehensive
guidance on:

- When to suggest announcements (milestone completions, working functionality, breaking changes, etc.)
- Step-by-step collaborative drafting process
- Template selection and content quality standards
- Publication workflow from draft files to GitHub Discussions

**Quick Reference**: Templates available in `.github/ANNOUNCEMENT_GUIDELINES.md` for phase completions, functionality
releases, breaking changes, community milestones, and progress updates.

## Important Notes

### Version Management

- **Factorio versions**: Pinned to specific releases (e.g. 2.0.x)
- **Mod versions**: Always use latest compatible versions
- **Daily builds**: Capture evolving mod ecosystem automatically
- **Breaking changes**: Handled through Factorio version separation

### Distribution Strategy

- ORAS enables efficient artifact distribution
- GitHub Container Registry provides reliable hosting
- Native mod loading avoids external dependencies
- Cross-platform compatibility maintained

### Future Considerations

- Scalable architecture supports growing mod ecosystem
- Community contributions encouraged at all levels
- Documentation-first approach for all major changes

---

## Quick Reference

**Main Planning Docs**: `planning/` directory
**QA Workflow**: `.github/workflows/qa.yml`
**Markdown Config**: `.markdownlint.json`
**GitHub Setup**: `.github/REPOSITORY_SETUP.md`
**Milestones**: `.github/MILESTONES_STRATEGY.md`
**Contributing**: `CONTRIBUTING.md`
**Architecture**: Five-repository ecosystem with ORAS distribution
**Philosophy**: Iterative development with community-first approach
**Timeline Policy**: Never commit to specific dates in documentation
