[![GitHub build status: Quality Assurance](https://img.shields.io/github/actions/workflow/status/QuingKhaos/factorio-mocks/qa.yml?branch=main&label=QA&style=for-the-badge)](https://github.com/QuingKhaos/factorio-mocks/actions?query=workflow%3A%22Quality+Assurance%22)
[![GitHub issues: bugs](https://img.shields.io/github/issues/QuingKhaos/factorio-mocks/bug?label=Bug%20Reports&style=for-the-badge)](https://github.com/QuingKhaos/factorio-mocks/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/QuingKhaos/factorio-mocks?label=Pull%20Requests&style=for-the-badge)](https://github.com/QuingKhaos/factorio-mocks/pulls)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-support%20me-hotpink?logo=kofi&logoColor=white&style=for-the-badge)](https://ko-fi.com/quingkhaos)

# Factorio Mocks - Comprehensive Testing Infrastructure

## Early Development Phase - Experimental Testing Ecosystem

Planning and prototyping a comprehensive ecosystem of tools and libraries to enable realistic testing for Factorio mods.
This experimental project aims to solve the complex problem of creating complete mocking capabilities for Factorio's API
surface, backed by real data from diverse modpack environments.

## Current Status: Planning & Architecture

**What We're Building:**
A five-repository ecosystem providing complete testing infrastructure for Factorio mod development:

- **`factorio-mocks`** (this repo) - Central hub with documentation, planning, and core mock implementations
- **`factorio-mocks-generator`** - Factorio mod for extracting all exportable globals and localization data
- **`factorio-mocks-modpacks`** - ORAS artifact system for distributing modpack configurations
- **`factorio-mocks-data`** - Centralized storage for generated mock data from diverse modpack environments
- **`factorio-mocks-loader`** - Generic Lua library for consuming mock data in any project

## Project Vision

**Mission**: Enable every Factorio mod developer to write comprehensive, realistic tests by providing complete mocking
capabilities for Factorio's API surface, backed by real data from diverse modpack environments.

**Key Problems We're Solving:**

- Most Factorio mods have minimal or no automated testing
- Creating realistic test data manually is time-consuming and error-prone
- No standardized way to mock Factorio's extensive API surface
- Complex setup requirements prevent widespread adoption of automated testing
- Difficulty testing localization across different languages
- Hard to test mods in isolation from specific modpack environments

## Architecture Overview

**Core Strategy**: Create a comprehensive, modular ecosystem where each repository has a focused responsibility, enabling
developers to use only what they need while providing a complete solution for those who want it.

### Repository Responsibilities

1. **`factorio-mocks`** (LGPLv3) - Central coordination hub
   - Project documentation and planning
   - Mock implementations for non-exportable APIs (`game`, `script`, `commands`, etc.)
   - GitHub Actions for CI/CD integration
   - Community hub for issues and contributions

2. **`factorio-mocks-generator`** (GPLv3) - Data extraction
   - Factorio mod that extracts all exportable globals during game execution
   - Prototype stage: `data.raw`, `mods`, `settings`, `feature_flags`
   - Runtime stage: `prototypes`, `settings`
   - Localization files from all active mods

3. **`factorio-mocks-modpacks`** (GPLv3) - Modpack management
   - ORAS artifact creation for modpack configurations
   - Native Factorio Mod Portal API client with dependency resolution
   - GitHub Actions workflows for artifact building and distribution

4. **`factorio-mocks-data`** (No License - data only) - Mock data storage
   - Generated mock data from diverse modpack configurations
   - Latest versions in Git, historical versions via ORAS artifacts
   - All exported globals organized by modpack and game stage

5. **`factorio-mocks-loader`** (LGPLv3) - Consumer library
   - Easy-to-use library for consuming mock data in any Lua project
   - On-demand data fetching with intelligent caching
   - Cross-platform compatibility (Windows, Linux, macOS)

## Development Priorities

### Phase 1: Foundation

- [ ] Complete planning documentation and architecture design
- [ ] Create `factorio-mocks-generator` with basic extraction capabilities
- [ ] Implement prototype stage extraction
- [ ] Create `factorio-mocks-loader` with basic import functionality

### Phase 2: Modpack Support and Data Repository

- [ ] Create `factorio-mocks-modpacks` with native mod management
- [ ] ORAS integration infrastructure for artifact distribution
- [ ] Multi-modpack data generation with daily builds
- [ ] Community-accessible browsable data repository

### Phase 3: Advanced Loader Functionality

- [ ] Runtime stage extraction and localization support
- [ ] Intelligent caching and environment setup
- [ ] GitHub Actions for CI/CD integration
- [ ] Advanced testing capabilities and cross-platform support

## Quick Start (Planned)

```lua
-- Install: luarocks install factorio-mocks-loader
local mocks = require("factorio-mocks-loader")

-- Set up vanilla environment for testing
mocks.setup_environment("vanilla", {
    stage = "prototype",
    localization = "en"
})

-- Now data.raw, mods, settings, feature_flags are available
assert(data.raw.recipe["iron-plate"])
assert(mods["base"] == "2.0.0")
```

## Documentation

Comprehensive planning and architecture documentation is available in the [`planning/`](planning/) directory:

- [`planning/architecture.md`](planning/architecture.md) - Five-repository ecosystem design
- [`planning/repository-specifications.md`](planning/repository-specifications.md) - Detailed specs for each repository
- [`planning/implementation-roadmap.md`](planning/implementation-roadmap.md) - Development phases and milestones
- [`planning/community-engagement.md`](planning/community-engagement.md) - Community strategy, beta testing, and onboarding
- [`planning/decisions.md`](planning/decisions.md) - Key architectural decisions and rationale

## Contributing

This project is in early planning and development phase. We welcome:

- Feedback on the architecture and approach
- Experience reports from mod developers about testing challenges
- Contributions to planning and design discussions
- Early testing and validation of concepts

## Note

This is an experimental approach to improve upon existing Factorio modding testing solutions. The architecture may evolve
significantly as we validate core concepts and gather feedback from the Factorio modding community.

**Current Focus**: We're currently in the planning and architecture phase, working to design a comprehensive solution
that will serve the entire Factorio modding community's testing needs.
