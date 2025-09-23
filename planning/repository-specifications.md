# Repository Specifications

This document provides detailed specifications for each repository in the Factorio Mocks Ecosystem.

## 1. `factorio-mocks` (Central Hub)

**License**: LGPLv3
**Purpose**: Project coordination, documentation, and non-exportable API mocks

### Repository Structure

```bash
factorio-mocks/
├── docs/
│   ├── getting-started.md
│   ├── api-reference/
│   ├── best-practices/
│   ├── examples/
│   └── migration-guides/
├── src/
│   ├── mocks/
│   │   ├── game.lua           # Mock game object
│   │   ├── script.lua         # Mock script object
│   │   ├── commands.lua       # Mock commands API
│   │   ├── rendering.lua      # Mock rendering API
│   │   └── helpers.lua        # Mock helper functions
│   ├── localization/
│   │   ├── parser.lua         # INI parser for .cfg files
│   │   └── localised-string.lua # LocalisedString processor
│   └── integration/
│       ├── ci-setup.lua       # CI/CD integration helpers
│       └── test-utils.lua     # Common testing utilities
├── .github/
│   ├── actions/
│   │   └── setup-factorio-mocks/  # Reusable GitHub Action
│   └── workflows/
│       └── validate-ecosystem.yml
├── examples/
│   ├── basic-mod-test/
│   ├── complex-integration-test/
│   └── localization-test/
├── rockspecs/
│   └── factorio-mocks-*.rockspec
└── planning/
    ├── architecture.md
    ├── roadmap.md
    └── rfcs/
```

### Key Features

- **Comprehensive Documentation**: Getting started guides, API references, best practices
- **Mock Implementations**: Hand-crafted mocks for non-exportable Factorio APIs
- **GitHub Actions**: Reusable actions for setting up mocks in CI environments
- **Example Projects**: Reference implementations for different testing scenarios
- **Community Hub**: Issue tracking, RFC process, contribution guidelines

### LocalisedString Processing Specification

Complex localization support with complete handling of all LocalisedString union types:

- Handle all union cases: `string`, `number`, `boolean`, `nil`, `LocalisedString[]`
- **LuaObject case**: Empirical testing to determine conversion patterns
- Template substitution with `__1__`, `__2__` placeholders (up to 20 parameters)
- Special keys: `""` (concatenation) and `"?"` (fallback logic)
- **Built-in parameters**: `__ITEM__`, `__ENTITY__`, `__FLUID__`, `__TILE__`, `__CONTROL__` variants
- **Plurals**: `__plural_for_parameter__N__{conditions}__` syntax with complex condition matching
- Prevent infinite recursion (20 level depth limit)

## 2. `factorio-mocks-generator` (Data Extraction)

**License**: GPLv3
**Purpose**: Factorio mod that extracts all exportable globals and localization data

### Repository Structure

```bash
factorio-mocks-generator/
├── info.json                 # Factorio mod metadata
├── data.lua                  # Prototype stage extraction
├── control.lua               # Runtime stage extraction
├── src/
│   ├── prototype-extractor.lua
│   ├── runtime-extractor.lua
│   ├── locale-extractor.lua
│   ├── serialization.lua     # Data serialization logic
│   └── validation.lua        # Data validation and quality checks
```

### Extraction Capabilities

**Prototype Stage Globals**:

- `data.raw` - Complete prototype definitions with all categories
- `mods` - Active mod list with exact versions
- `settings` - Startup settings values and metadata
- `feature_flags` - DLC and experimental feature availability

**Runtime Stage Globals**:

- `prototypes` - Runtime prototype access interface
- `settings` - Runtime settings (startup, map, player categories)

**Localization Data**:

- Extract all `.cfg` files from base game and active mods
- Merge mod localization files into consolidated `.cfg` files per language
- Preserve original INI format for maximum tool compatibility

**Data Validation**:

- Generate JSON schemas from Factorio's API documentation for validation
- Validate extracted data for completeness and integrity
- Ensure data quality before publishing to consumers

**Data Processing**:

- Serialize extracted data in human-readable Lua format
- Validate data completeness and integrity
- Include metadata for version tracking and verification

## 3. `factorio-mocks-modpacks` (Modpack Artifact Management)

**License**: GPLv3
**Purpose**: ORAS artifact creation and distribution for modpack configurations

### Repository Structure

```bash
factorio-mocks-modpacks/
├── configs/
│   ├── vanilla/
│   │   ├── mod-list.json
│   │   └── mod-settings.dat
│   ├── spaceage/
│   ├── krastorio2/
│   └── [other-modpacks]/
├── scripts/
│   ├── mod-manager.lua         # Mod portal API client
│   ├── build-artifacts.lua     # ORAS artifact creation
│   └── validate-modpack.lua    # Configuration validation
└── .github/workflows/
    └── build-artifacts.yml     # GitHub Actions for artifact creation
```

### Integrated Mod Manager Specification

**Core API Integration**:

- Direct interface to Factorio Mod Portal API endpoints
- `/api/mods/{name}/full` for comprehensive mod metadata
- `/api/mods` for searching and browsing mod collections
- Native HTTP client implementation without external dependencies

**Dependency Resolution Engine**:

- Parse dependency strings: `"name >= 1.0.0"`, `"? optional-mod"`, `"! incompatible-mod"`
- Recursive dependency tree building with cycle detection
- Version constraint satisfaction using semantic versioning
- Factorio version compatibility checking
- Optional dependency handling based on configuration

**ORAS Artifact Building**:

- Generate OCI-compatible artifacts directly from Lua
- Download mods into structured artifact layers
- Create manifest files with rich dependency metadata
- Generate checksums and validation data for integrity
- Support authenticated downloads with Factorio credentials
- **Artifact Attachment Support**: Enable `oras attach` for linking generated data to source modpacks

### Benefits Over External Tools

Compared to `factorio-mod-updater`:

- **Zero External Dependencies**: Pure Lua implementation eliminates Python dependency
- **API-First Architecture**: Direct Mod Portal API integration
- **ORAS-Native Workflow**: Designed specifically for container-based artifact distribution
- **Enhanced Metadata**: Rich dependency trees and compatibility matrices in artifact metadata
- **Cross-Platform Consistency**: Works identically across Linux, Windows, and macOS

## 4. `factorio-mocks-data` (Mock Data Storage)

**License**: No License (data only)
**Purpose**: Centralized storage for all generated mock data
**Main Branch**: `stable` (aligns with Factorio's stable/experimental release naming)

### Repository Structure

```bash
factorio-mocks-data/
├── configurations/
│   ├── vanilla/
│   │   ├── prototype/
│   │   │   ├── data-raw.lua
│   │   │   ├── mods.lua
│   │   │   ├── settings.lua
│   │   │   └── feature-flags.lua
│   │   ├── runtime/
│   │   │   ├── prototypes.lua
│   │   │   └── settings.lua
│   │   ├── localization/
│   │   │   ├── en.cfg
│   │   │   ├── fr.cfg
│   │   │   └── [other-languages]/
│   │   └── metadata.json              # Basic metadata and checksums
│   └── [other-modpacks]/
└── README.md                  # Data repository documentation and usage
```

### ORAS Integration Strategy

**Dual Distribution Model**:

- **Git Repository**: Latest version committed to Git for easy browsing and diff visualization
- **ORAS Artifacts**: Historical versions stored as container artifacts in GitHub Container Registry

**Branch Strategy**:

- **Git Main Branch**: `stable` (aligns with Factorio's stable/experimental release naming familiar to modders)
- **ORAS Stable Tags**: `stable` tag for consistent naming across distribution methods

**Artifact Structure**:

```bash
# Mock data artifacts
ghcr.io/quingkhaos/factorio-mocks-data/vanilla:2.0.66-v1.2.3
├── config.json              # Artifact metadata
├── manifest.json            # Layer manifest
└── blobs/
    ├── prototype/           # Prototype stage data
    ├── runtime/             # Runtime stage data
    ├── localization/        # Localization files
    └── metadata.json        # Extraction metadata
```

**Tagging Strategy**:

- **Semantic Version**: `2.0.66-2024.12.15-v1.2.3` for predictable retrieval
- **Git Commit Hash**: `abc123f` for exact commit linking
- **Stable Tag**: `stable` for latest data (both Git branch and ORAS tag)
- **Bidirectional Linking**: Browse commits in Git, pull exact artifacts via ORAS

**ORAS Attachment for Provenance**:

Mock data artifacts are attached to their source modpack artifacts using `oras attach`:

```bash
# Example: Link vanilla mock data to the modpack that generated it
oras attach ghcr.io/quingkhaos/factorio-mocks-data/vanilla:2.0.66-2024.12.15-v1.2.3 \
  --subject ghcr.io/quingkhaos/factorio-mocks-modpacks/vanilla:2.0.66-2024.12.15@sha256:abc123...
```

**Provenance Benefits**:

- **Traceability**: Direct link from data back to exact generating modpack configuration
- **Reproducibility**: Can reconstruct identical data by re-running the same modpack digest
- **Validation**: Verify data integrity by comparing against source modpack
- **Debugging**: Trace data anomalies back to specific mod versions and conflicts

### Data Organization Strategy

**Pure Data Storage**:

- No generation workflows - receives data artifacts from `factorio-mocks-generator` or later `factorio-mocks-modpacks`
- Organized by modpack name and game stage (prototype, runtime, localization)
- Git repository provides easy browsing and diff visualization of latest data
- ORAS artifacts provide historical versioning and efficient distribution

**Data Quality Assurance**:

- Data validated for completeness and integrity during generation
- Metadata includes validation results and extraction information
- Focus on data quality and format consistency
- Lightweight metadata for consumer verification

## 5. `factorio-mocks-loader` (Generic Import Library)

**License**: LGPLv3
**Purpose**: Easy-to-use library for consuming mock data in any Lua project

### Repository Structure

```bash
factorio-mocks-loader/
├── src/
│   ├── init.lua               # Main entry point
│   ├── data-fetcher.lua       # On-demand data downloading
│   ├── cache-manager.lua      # Intelligent caching system
│   ├── environment-setup.lua  # Test environment configuration
│   ├── localization.lua       # Localization support
│   └── integrity.lua          # Basic integrity checks (checksums, format validation)
├── examples/
│   ├── basic-usage.lua
│   ├── advanced-configuration.lua
│   └── localization-example.lua
├── spec/
│   └── [test-files]/
├── rockspecs/
│   └── factorio-mocks-loader*.rockspec
└── docs/
    ├── api-reference.md
    └── configuration.md
```

### Key Features

**Simple API**:

```lua
local mocks = require("factorio-mocks-loader")

-- One-line setup for most use cases
mocks.setup_environment("vanilla", {
    stage = "prototype",
    localization = "en"
})
```

**Flexible Configuration**:

- Support for custom cache directories
- Configurable data sources (Git repositories, ORAS artifacts)
- Environment variable overrides for CI/CD
- Custom staleness thresholds and update policies

**Intelligent Caching**:

- Automatic staleness detection based on timestamps
- Incremental updates for changed configurations
- Multi-level caching (memory, filesystem, network)
- Efficient storage with deduplication

**Data Source Support**:

- **Git Repositories**: Direct clone and pull from data repositories
- **ORAS Artifacts**: Pull from OCI registries with layer caching
- **Local Files**: Support for offline development and testing
- **Hybrid Mode**: Automatic fallback between sources

### Consumer Integration Examples

**Basic Mod Testing**:

```lua
-- Install: luarocks install factorio-mocks-loader
local mocks = require("factorio-mocks-loader")

-- Set up vanilla environment
mocks.setup_environment("vanilla", {
    stage = "prototype",
    localization = "en"
})

-- Now data.raw, mods, settings, feature_flags are available
assert(data.raw.recipe["iron-plate"])
assert(mods["base"] == "2.0.0")
assert(settings.startup["some-setting"])
```

**Advanced Integration Testing**:

```lua
local mocks = require("factorio-mocks-loader")

-- Test with complex modpack
mocks.setup_environment("pyanodons", {
    stage = "runtime",
    localization = {"en", "fr"},
    cache_dir = "test_cache",
    version = "2.0.66-2024.11.15-v1.2.1"  -- Specific historical version
})

-- Test runtime prototypes access
local recipes = prototypes.recipe
assert(recipes["py-advanced-circuit"])

-- Test localization
local localized = mocks.localize("recipe-name.py-advanced-circuit", "fr")
assert(localized == "Circuit avancé Py")
```

## Cross-Repository Integration

### Data Flow

1. **Modpack Preparation**: `factorio-mocks-modpacks` creates ORAS artifacts with mod collections
2. **Data Generation & Validation**: `factorio-mocks-generator` extracts and validates data from modpack environments
3. **Data Publishing**: Validated data artifacts with basic metadata published to `factorio-mocks-data`
4. **Data Storage & Distribution**: `factorio-mocks-data` stores and distributes validated data artifacts
5. **Data Consumption**: `factorio-mocks-loader` fetches data and performs basic integrity checks
6. **Testing Integration**: `factorio-mocks` provides CI/CD actions and documentation

### Version Compatibility

**Semantic Versioning Strategy**:

- **Major (X.0.0)**: Breaking changes to data structure or API
- **Minor (X.Y.0)**: New modpack configurations or features
- **Patch (X.Y.Z)**: Data updates and bug fixes

**Compatibility Matrix**:

- Each repository maintains compatibility information
- Clear documentation of supported version ranges
- Automated compatibility testing in CI/CD

### Quality Assurance

**Validation Pipeline**:

- Schema validation for all extracted data
- Regression testing for data consistency
- Cross-platform testing for loader library
- Integration testing across all repositories

**Community Feedback**:

- Issue tracking across all repositories
- Regular community feedback collection
- Continuous community engagement and iteration
- Documentation and example validation
