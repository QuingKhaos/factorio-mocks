# Factorio Mocks Ecosystem Architecture

## Overview

This document outlines the architecture for a comprehensive five-repository ecosystem that provides complete testing
infrastructure for Factorio mod development. The ecosystem is designed to solve the complex challenges of mocking
Factorio's extensive API surface while providing realistic test data from diverse modpack environments.

## Core Design Principles

### Modular Architecture

Each repository has a focused responsibility, enabling developers to use only the components they need while providing
a complete solution for those who want comprehensive testing infrastructure.

### Community-Centric Approach

- **Data Reuse**: One extraction process serves the entire community
- **Standardization**: Common testing infrastructure across all mods
- **Open Source**: All components are open source with appropriate licenses
- **Extensibility**: Easy to add new modpack configurations and features

### Production-Ready Design

- **Cross-Platform**: Works on Windows, Linux, and macOS
- **CI/CD Integration**: GitHub Actions support for automated testing
- **Performance**: Intelligent caching and efficient data distribution
- **Reliability**: Comprehensive validation and error handling

## Five-Repository Ecosystem

### 1. `factorio-mocks` (Central Hub)

**License**: LGPLv3
**Purpose**: Project coordination, documentation, and non-exportable API mocks

**Core Responsibilities**:

- Central documentation and planning repository
- Mock implementations for non-exportable Factorio APIs (`game`, `script`, `commands`, etc.)
- GitHub Actions for CI/CD integration
- Localization support with `.cfg` file parsing and LocalisedString processing
- Project coordination and issue tracking
- Community hub for contributions and feedback

**Key Components**:

- **Documentation**: Comprehensive guides, API references, best practices
- **Mock APIs**: Hand-crafted mocks for runtime-only Factorio globals
- **GitHub Actions**: Reusable actions for setting up mocks in CI environments
- **Example Projects**: Reference implementations for different testing scenarios
- **LuaRocks Distribution**: Easy installation and dependency management

### 2. `factorio-mocks-generator` (Data Extraction)

**License**: GPLv3
**Purpose**: Factorio mod that extracts all exportable globals and localization data

**Core Responsibilities**:

- Extract all exportable globals during Factorio game execution
- Serialize data in structured, consumable format
- Minimal, focused codebase for maximum mod compatibility
- Support both prototype and runtime stage extraction

**Extraction Capabilities**:

**Prototype Stage**:

- `data.raw` - Complete prototype definitions
- `mods` - Active mod list with versions
- `settings` - Startup settings values
- `feature_flags` - DLC and experimental feature flags

**Runtime Stage**:

- `prototypes` - Runtime prototype access interface
- `settings` - Runtime settings (startup, map, player)

**Localization**:

- Extract all `.cfg` files from base game and active mods
- Merge mod localization files into consolidated format
- Preserve original INI format for tool compatibility

**Metadata**:

- Game version information
- Extraction timestamps
- Configuration checksums

### 3. `factorio-mocks-modpacks` (Modpack Artifact Management)

**License**: GPLv3
**Purpose**: ORAS artifact creation and distribution for modpack configurations

**Core Responsibilities**:

- Create and distribute modpack configurations as ORAS artifacts
- Native Factorio Mod Portal API integration
- Automated dependency resolution
- GitHub Actions workflows for artifact building

**Key Features**:

- **ORAS Artifact Distribution**: Modpack configurations as container artifacts
- **Native Mod Management**: Pure Lua implementation of Mod Portal API client
- **Dependency Resolution**: Recursive dependency tree building with conflict detection
- **Latest Mod Versions**: Always use latest compatible mods from portal (only Factorio version pinned)
- **BYOM Support**: Users can create custom modpack artifacts

**Versioning Strategy**:

- **Factorio Version Pinning**: Pin to specific Factorio release (e.g., `2.0.66`) for stability
- **Latest Mod Versions**: Always fetch latest compatible mod versions from Mod Portal
- **Automated Updates**: Daily builds automatically capture latest mod ecosystem state
- **Snapshot Immutability**: Each generated artifact represents exact mod versions at build time
- **No Manual Maintenance**: Eliminates human intervention for mod version management

**Benefits Over External Tools**:

- Zero external dependencies (no Python, no HTML parsing)
- API-first architecture for reliability
- ORAS-native workflow for container distribution
- Enhanced metadata with dependency trees
- Cross-platform consistency

### 4. `factorio-mocks-data` (Mock Data Storage)

**License**: No License (data only)
**Purpose**: Centralized storage for all generated mock data

**Core Responsibilities**:

- Store generated mock data from diverse modpack configurations
- Organize data by modpack, game stage, and language
- Provide both Git and ORAS distribution strategies

**Distribution Strategy**:

- **Git Repository**: Latest versions for easy browsing and diff visualization
- **ORAS Artifacts**: Historical versions for precise testing scenarios
- **Dual Tagging**: Both semantic versions and Git commit hashes
- **Efficient Caching**: OCI layer deduplication for common data

**Data Organization**:

- **Stage Separation**: Clear separation between prototype and runtime data
- **Language Support**: Localization data for all supported languages

### 5. `factorio-mocks-loader` (Generic Import Library)

**License**: LGPLv3
**Purpose**: Easy-to-use library for consuming mock data in any Lua project

**Core Responsibilities**:

- Provide simple API for mock environment setup
- Handle data fetching and caching automatically
- Support both Git and ORAS data sources
- Cross-platform compatibility

**Key Features**:

- **Simple API**: One-line setup for most use cases
- **Flexible Configuration**: Extensive customization options
- **Intelligent Caching**: Automatic staleness detection and updates
- **Multiple Sources**: Support Git repositories and ORAS artifacts
- **LuaRocks Integration**: Easy installation and dependency management

## ORAS Integration Architecture

### Artifact Types

1. **Mock Data Artifacts**: Complete extracted data organized by modpack and stage
2. **Modpack Configuration Artifacts**: Mod collections with dependency metadata
3. **Schema Distribution Artifacts**: Validation schemas generated from Factorio API docs

### Distribution Strategy

**Dual Distribution Model**:

- **Git Repositories**: Latest versions for easy browsing and development
- **ORAS Artifacts**: Historical versions and large datasets for production use

**Benefits**:

- **Storage Efficiency**: Historical versions don't bloat Git repositories
- **Precise Versioning**: Test against exact historical mod configurations
- **Caching Optimization**: OCI layer caching reduces redundant downloads
- **Standard Tooling**: Leverage existing OCI registry infrastructure

### Artifact Linking

**Dual Tagging Approach**:

```bash
# Date-based version with Factorio version
ghcr.io/quingkhaos/factorio-mocks-data/vanilla:2.0.66-2024.12.15

# Git commit hash
ghcr.io/quingkhaos/factorio-mocks-data/vanilla:abc123f
```

**ORAS Attach for Provenance Tracking**:

The `oras attach` command creates explicit relationships between artifacts, enabling precise traceability:

```bash
# Link mock data artifact to the exact modpack digest that generated it
oras attach ghcr.io/quingkhaos/factorio-mocks-data/vanilla:2.0.66-2024.12.15-v1.2.3 \
  --subject ghcr.io/quingkhaos/factorio-mocks-modpacks/vanilla:2.0.66@sha256:abc123...
```

**Artifact Relationship Benefits**:

- **Provenance Tracking**: Direct link from data to generating modpack configuration
- **Reproducible Builds**: Exact modpack digest enables bit-for-bit reproduction
- **Dependency Analysis**: Understand which modpack changes affect which data
- **Validation**: Verify data integrity by checking against source modpack
- **Debugging**: Trace data issues back to specific mod versions and configurations

**Bidirectional Linking Benefits**:

- Browse commits in GitHub, use commit hash to pull exact ORAS artifact
- Use semantic version for predictable artifact retrieval in automation
- No Git repository bloat from artifact storage
- Cache efficiency through artifact deduplication

## Data Flow Architecture

### Mock Data Generation Workflow

1. **Modpack Preparation**: `factorio-mocks-modpacks` resolves latest compatible mod versions and creates ORAS artifacts
2. **Environment Setup**: GitHub Actions pulls modpack artifacts and sets up extraction environment
3. **Data Extraction**: `factorio-mocks-generator` runs in headless Factorio instance
4. **Data Processing**: Extract, validate, and format all exportable globals and localization
5. **Distribution**: Update Git repository and create ORAS artifacts with dual tagging
6. **Artifact Linking**: Use `oras attach` to link mock data artifacts to their source modpack digest
7. **Consumption**: `factorio-mocks-loader` fetches and caches data for consumer projects

**Automated Update Cycle**:

- **Daily Builds**: Automated GitHub Actions resolve latest mod versions and regenerate artifacts
- **Version Capture**: Each artifact snapshot contains exact mod versions used at build time
- **Dependency Resolution**: Always fetch latest versions that satisfy dependency constraints
- **Compatibility Checking**: Ensure all mods are compatible with pinned Factorio version

### Consumer Integration Workflow

1. **Installation**: Install `factorio-mocks-loader` via LuaRocks
2. **Configuration**: Specify modpack, version, and data source preferences
3. **Environment Setup**: Loader fetches data and sets up global environment
4. **Testing**: Consumer code runs with complete Factorio API mocks available

## Scalability and Performance

### Caching Strategy

- **Multi-Level Caching**: Local filesystem, OCI registry layers, CDN distribution
- **Intelligent Updates**: Staleness detection and incremental updates
- **Deduplication**: Common data shared across modpack configurations

### Performance Optimizations

- **Lazy Loading**: Load only requested data components
- **Parallel Processing**: Concurrent data extraction and processing
- **Compression**: Efficient serialization and compression of large datasets

## Security and Reliability

### Authentication

- **Factorio Credentials**: Secure handling of Mod Portal authentication
- **Registry Access**: GitHub Container Registry permissions and access control
- **Environment Variables**: Secure credential management for CI/CD workflows

### Validation and Quality

- **Schema Validation**: Automatic validation against Factorio API schemas
- **Data Integrity**: Checksums and validation for all distributed data
- **Regression Testing**: Automated testing of extraction and distribution processes

## Community Integration

### Contribution Model

- **Open Development**: All planning and development in public repositories
- **RFC Process**: Structured process for major architectural changes
- **Community Feedback**: Regular feedback collection and incorporation

### Adoption Strategy

- **Incremental Adoption**: Developers can use individual components
- **Migration Support**: Tools and guides for migrating existing testing setups
- **Documentation**: Comprehensive guides for all user types

## Future Extensions

### Planned Enhancements

- **Private Modpack Support**: Support for proprietary and unreleased mods

## Conclusion

This architecture provides a comprehensive, scalable, and community-focused solution to Factorio mod testing
challenges. The modular design ensures that the ecosystem can grow and evolve with the community's needs while
maintaining high standards for reliability, performance, and ease of use.

The five-repository structure balances focused responsibility with comprehensive functionality, enabling both
simple adoption for basic needs and powerful capabilities for advanced use cases. The integration of modern
container technologies (ORAS) with traditional source control (Git) provides optimal distribution strategies
for different types of data and usage patterns.
