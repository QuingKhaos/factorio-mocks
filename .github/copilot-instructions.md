# Copilot Instructions for Factorio Mock## Code Standards and Conventions

### Documentationem

## Project Overview

The **Factorio Mocks Ecosystem** is a comprehensive five-repository system designed to provide mock data for Factorio mod development. This project enables developers to test mods without running the full Factorio game, making development faster and more accessible.

**Architecture**: Five-repository ecosystem with ORAS distribution
**Philosophy**: Iterative development with community-first approachtory system designed to provide mock data for Factorio mod
development. This project enables developers to test mods without running the full Factorio game, making development faster
and more accessible.

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
```

## Technical Context

### Current Status

- **Phase**: Planning and documentation complete
- **Next Phase**: Repository setup and initial implementation
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

### Quality Assurance

- GitHub Actions QA workflow validates all documentation
- Markdown linting enforces consistency and proper nouns
- JSON validation ensures configuration file integrity
- Documentation structure validation prevents missing files

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

### Community Engagement Guidelines

- Maintain low barrier to entry for contributors
- Provide clear documentation for all skill levels
- Enable early access to useful functionality
- Iterate based on community feedback rather than formal processes

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
**Commit Prompt**: `.github/prompts/conventional-commit.prompt.md`
**Architecture**: Five-repository ecosystem with ORAS distribution
**Philosophy**: Iterative development with community-first approach
