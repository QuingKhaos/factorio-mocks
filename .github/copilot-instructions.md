# Copilot Instructions for Factorio Mocks

## Architecture Overview

**Five-Repository Ecosystem** for comprehensive Factorio mod testing infrastructure:

1. **`factorio-mocks`** (this repo) - Central hub: planning, documentation, mock APIs, CI integration
2. **`factorio-mocks-generator`** - Factorio mod for extracting game data (`data.raw`, `prototypes`, localization)
3. **`factorio-mocks-modpacks`** - Modpack configurations with ORAS artifact distribution
4. **`factorio-mocks-data`** - Generated mock data storage (Git + ORAS containers)
5. **`factorio-mocks-loader`** - Lua runtime library for consuming mock data

**Key Integration**: All ecosystem issues centralized here with `ecosystem: generator|modpacks|data|loader` labels.

## Critical Development Patterns

### Planning-First Workflow

**All architectural changes require ADR documentation:**

```bash
# Use the prompt template for structured decisions
.github/prompts/create-architectural-decision-record.prompt.md
# Results in: planning/decisions/adr-NNNN-title.md
```

**Always update planning docs when changing architecture:**

- `planning/architecture.md` - Ecosystem design
- `planning/implementation-roadmap.md` - Development phases
- `planning/repository-specifications.md` - Repository details

### Conventional Commit Workflow

**Use the XML-based commit prompt:**

```bash
# Structured commit generation via:
.github/prompts/conventional-commit.prompt.md
```

**Commit types for this repo:**

- `docs(planning): ...` - Planning document changes
- `feat(mocks): ...` - New mock API implementations
- `ci(qa): ...` - QA workflow improvements
- `refactor(milestones): ...` - Project structure changes

### Quality Assurance Integration

**All changes validated by `.github/workflows/qa.yml`:**

- Markdown linting (`.markdownlint.json` config)
- JSON validation for configuration files
- Documentation structure validation
- ADR file presence checking

## Project-Specific Conventions

### Documentation Standards

**File naming patterns:**

- ADRs: `adr-NNNN-brief-title.md` in `planning/decisions/`
- Planning docs: `kebab-case.md` in `planning/`
- Prompts: `kebab-case.prompt.md` in `.github/prompts/`

**Content requirements:**

- 120 character line limits
- Proper noun consistency: "Factorio", "GitHub", "ORAS", "Lua"
- Cross-reference related documents
- **Never commit to specific timelines** - use dependency-based sequencing

### Ecosystem Coordination Patterns

**Cross-repository work:**

- Issues filed here with ecosystem labels for routing
- Planning changes synchronized across all repositories
- Architectural decisions documented here affect all repos

**Label strategy:**

- `ecosystem: generator|modpacks|data|loader` - Route to correct repository
- `effort: quick-win|moderate|substantial` - Contributor guidance
- `adr` - Architectural decision requests

## Development Context

### Key Technologies

- **Distribution**: ORAS (OCI Registry as Storage) for artifact distribution
- **Data Format**: Serpent-serialized Lua structures (not JSON)
- **Automation**: GitHub Actions with cross-repository workflows
- **Validation**: LIVR (Language Independent Validation Rules) for data quality

### Build and Test Commands

```bash
# Run QA validation locally
npm install -g markdownlint-cli jsonlint
pip3 install jsonschema

# Validate markdown (--dot flag essential for .github/ directory)
markdownlint --config .markdownlint.json --dot **/*.md

# Validate JSON configs
find . -name "*.json" -exec jsonlint {} \;
```

### Critical Integration Points

**Factorio API References:**

- [Lua API Docs](https://lua-api.factorio.com/) - Official API reference
- [Data Lifecycle](https://lua-api.factorio.com/latest/auxiliary/data-lifecycle.html) - Game stages
- [Mod Structure](https://lua-api.factorio.com/latest/auxiliary/mod-structure.html) - File organization

**External Dependencies:**

- GitHub Container Registry for ORAS artifact hosting
- Factorio Mod Portal API for mod metadata and dependencies
- Cross-platform compatibility requirements (Windows, Linux, macOS)

---

**Quick Reference:**

- Planning docs: `planning/` directory
- QA workflow: `.github/workflows/qa.yml`
- Commit prompts: `.github/prompts/`
- ADR template: `.github/prompts/create-architectural-decision-record.prompt.md`
- Philosophy: Community-first, iterative development with comprehensive planning
