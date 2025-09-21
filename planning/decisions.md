# Architectural Decisions and Rationale

This document captures key architectural decisions made during the design of the Factorio Mocks Ecosystem, along with
the reasoning behind each choice.

## Decision 1: Five-Repository Architecture

**Decision**: Split the ecosystem into five focused repositories instead of a monolithic approach.

**Context**: Need to balance maintainability, licensing flexibility, and community adoption.

**Options Considered**:

1. **Monolithic Repository**: Single repository with all components
2. **Three-Repository Split**: Core, data, and tooling
3. **Five-Repository Ecosystem**: Focused responsibility per repository

**Decision Rationale**:

**Advantages of Five-Repository Approach**:

- **Focused Responsibility**: Each repository has a clear, single purpose
- **Independent Versioning**: Components can evolve at different rates
- **Licensing Flexibility**: Different licenses for different types of content
- **Reduced Coupling**: Clear interfaces between components
- **Community Adoption**: Developers can adopt only needed components
- **Maintenance Efficiency**: Smaller codebases are easier to maintain

**Trade-offs Accepted**:

- **Initial Complexity**: More repositories to set up and coordinate
- **Cross-Repository Changes**: Some features require changes across multiple repositories
- **Documentation Overhead**: Need to maintain coherent documentation across repositories

**Implementation Notes**:

- Clear API contracts between repositories
- Automated testing for cross-repository compatibility
- Shared documentation standards and contribution guidelines

## Decision 2: ORAS for Artifact Distribution

**Decision**: Use ORAS (OCI Registry as Storage) for distributing large datasets and modpack configurations.

**Context**: Need efficient distribution of large mock data files and modpack configurations.

**Options Considered**:

1. **Git LFS**: Store large files in Git with LFS
2. **Direct Downloads**: Host files on GitHub releases or external storage
3. **ORAS**: Use OCI registries for artifact distribution

**Decision Rationale**:

**Advantages of ORAS**:

- **Layer Deduplication**: Common data shared across configurations
- **Efficient Caching**: OCI registry layer caching reduces transfers
- **Standard Tooling**: Leverage existing container registry infrastructure
- **Metadata Rich**: Artifact configs can contain structured metadata
- **Version Management**: Precise versioning with dual tagging strategy
- **Access Control**: Registry-based permissions for private configurations

**Trade-offs Accepted**:

- **Tool Dependency**: Requires ORAS tooling for artifact creation
- **Learning Curve**: New concept for many developers
- **Registry Dependency**: Requires access to OCI-compatible registry

**Implementation Notes**:

- Dual distribution strategy (Git for latest, ORAS for history)
- Comprehensive tooling to abstract ORAS complexity from end users
- Fallback mechanisms for environments without ORAS access

## Decision 3: Native Mod Management vs External Tools

**Decision**: Implement native Factorio Mod Portal API client instead of depending on external tools.

**Context**: Need reliable mod downloading and dependency resolution for modpack creation.

**Options Considered**:

1. **`factorio-mod-updater`**: Use existing Python-based tool
2. **Custom Wrapper**: Wrap existing tools with additional functionality
3. **Native Implementation**: Pure Lua implementation using Mod Portal API

**Decision Rationale**:

**Advantages of Native Implementation**:

- **Zero External Dependencies**: No Python or other language runtime required
- **API-First Architecture**: Direct API integration more reliable than HTML parsing
- **ORAS Integration**: Designed specifically for container-based workflows
- **Enhanced Metadata**: Rich dependency trees and compatibility information
- **Cross-Platform Consistency**: Identical behavior across all platforms
- **Maintenance Control**: No dependency on external project maintenance

**Trade-offs Accepted**:

- **Development Time**: More initial implementation work required
- **HTTP Client Implementation**: Need robust HTTP client in Lua
- **API Compatibility**: Must track Factorio Mod Portal API changes

**Implementation Notes**:

- Comprehensive HTTP client with proper error handling
- Robust dependency resolution algorithm with conflict detection
- Extensive testing against real mod dependency scenarios

## Decision 4: LGPLv3 for Core Libraries

**Decision**: Use LGPLv3 license for `factorio-mocks` and `factorio-mocks-loader` libraries.

**Context**: Need to balance open-source principles with commercial mod development support.

**Options Considered**:

1. **MIT License**: Maximum permissiveness for adoption
2. **GPLv3 License**: Strong copyleft for all components
3. **LGPLv3 License**: Library-friendly copyleft

**Decision Rationale**:

**Advantages of LGPLv3**:

- **Commercial Compatibility**: Allows use in commercial mod projects
- **Library Protection**: Ensures improvements to libraries are shared
- **Community Building**: Encourages contribution while enabling adoption
- **Ecosystem Growth**: Balances open-source values with practical needs

**License Strategy by Repository**:

- **`factorio-mocks`**: LGPLv3 (library and coordination hub)
- **`factorio-mocks-generator`**: GPLv3 (Factorio mod, stronger copyleft appropriate)
- **`factorio-mocks-modpacks`**: GPLv3 (infrastructure, community benefit focus)
- **`factorio-mocks-data`**: No License (data only, maximum accessibility)
- **`factorio-mocks-loader`**: LGPLv3 (library for widespread adoption)

## Decision 5: Lua-Focused Implementation

**Decision**: Implement all core functionality in Lua rather than other languages.

**Context**: Need to choose primary implementation language for the ecosystem.

**Options Considered**:

1. **Python**: Rich ecosystem, existing tools available
2. **Node.js**: Good for web APIs and tooling
3. **Lua**: Native Factorio language, minimal dependencies

**Decision Rationale**:

**Advantages of Lua Focus**:

- **Factorio Native**: Same language used by Factorio mods
- **Minimal Dependencies**: Reduce external runtime requirements
- **Community Familiarity**: Factorio modders already know Lua
- **Consistent Environment**: Same language across all components
- **Lightweight**: Lua runtime is small and efficient

**Trade-offs Accepted**:

- **Limited Libraries**: Fewer third-party libraries available
- **HTTP Client**: Need to implement or find suitable HTTP client
- **JSON Handling**: Limited built-in support for JSON processing

**Implementation Notes**:

- Identify and standardize on high-quality Lua libraries
- Implement robust HTTP client suitable for Mod Portal API
- Provide clear documentation for Lua-specific patterns and practices

## Decision 6: Dual Data Distribution Strategy

**Decision**: Use both Git repositories and ORAS artifacts for data distribution.

**Context**: Need to balance ease of browsing with efficient distribution of large datasets.

**Options Considered**:

1. **Git Only**: Store all data in Git repositories
2. **ORAS Only**: Store all data as container artifacts
3. **Dual Strategy**: Latest in Git, historical versions in ORAS

**Decision Rationale**:

**Advantages of Dual Strategy**:

- **Easy Browsing**: Latest data visible in Git for inspection and diffs
- **Efficient Distribution**: Historical versions in ORAS for optimal caching
- **Developer Experience**: GitHub web interface for browsing latest data
- **CI/CD Flexibility**: Choose optimal source based on use case
- **Storage Efficiency**: Historical versions don't bloat Git repositories

**Implementation Strategy**:

- **Git Repository**: Always contains latest version with proper formatting
- **ORAS Artifacts**: Historical versions with dual tagging (semantic + commit hash)
- **Automated Sync**: GitHub Actions ensure consistency between Git and ORAS
- **Consumer Choice**: Loader library supports both sources with automatic fallback

## Decision 7: Comprehensive LocalisedString Support

**Decision**: Implement complete LocalisedString processing including plurals and built-in parameters.

**Context**: Need to decide scope of localization support in the ecosystem.

**Options Considered**:

1. **Basic Support**: Simple string replacement only
2. **Partial Support**: Handle common cases, ignore complex features
3. **Comprehensive Support**: Complete implementation of all LocalisedString features

**Decision Rationale**:

**Advantages of Comprehensive Support**:

- **Testing Completeness**: Enable proper testing of mod localization
- **Community Value**: Provide tools useful beyond just mocking
- **Quality Benchmark**: Demonstrate commitment to completeness
- **Future-Proofing**: Handle edge cases that will inevitably arise

**Implementation Challenges**:

- **LuaObject Conversion**: Undocumented behavior requires empirical testing
- **Complex Plurals**: Advanced plural rules need careful implementation
- **Built-in Parameters**: Prototype lookup for display names
- **Recursion Handling**: Prevent infinite loops in complex strings

**Implementation Strategy**:

- Empirical testing to determine LuaObject conversion patterns
- Reference implementation of Factorio's plural rule system
- Comprehensive test suite covering all documented features
- Clear documentation of limitations and unsupported edge cases

## Decision 8: GitHub Container Registry for ORAS

**Decision**: Use GitHub Container Registry (GHCR) as the primary ORAS artifact registry.

**Context**: Need to choose container registry for artifact distribution.

**Options Considered**:

1. **Docker Hub**: Most popular container registry
2. **GitHub Container Registry**: Integrated with GitHub repositories
3. **Self-Hosted Registry**: Full control over infrastructure

**Decision Rationale**:

**Advantages of GitHub Container Registry**:

- **Repository Integration**: Seamless integration with GitHub repositories
- **Access Control**: Leverages existing GitHub permissions and authentication
- **Cost Efficiency**: Free for public repositories and reasonable pricing for private
- **Reliability**: Backed by GitHub/Microsoft infrastructure
- **Developer Familiarity**: Most developers already have GitHub accounts

**Implementation Considerations**:

- **Registry Namespace**: Consistent naming convention across all artifacts
- **Authentication**: GitHub token-based authentication for CI/CD
- **Public Access**: Ensure artifacts are publicly accessible for community use
- **Rate Limiting**: Implement proper retry logic for registry interactions

## Decision 9: Incremental Adoption Strategy

**Decision**: Design ecosystem for incremental adoption rather than all-or-nothing approach.

**Context**: Need to maximize adoption while ecosystem is being developed.

**Options Considered**:

1. **Complete Solution First**: Build entire ecosystem before any releases
2. **Monolithic Releases**: Release complete functionality in large increments
3. **Incremental Approach**: Enable adoption of individual components

**Decision Rationale**:

**Advantages of Incremental Adoption**:

- **Early Value**: Provide value to community during development
- **Feedback Loop**: Get real-world feedback to guide development
- **Reduced Risk**: Lower barrier to initial adoption
- **Community Building**: Build user base gradually with proven value
- **Iteration Opportunity**: Adjust based on actual usage patterns

**Implementation Strategy**:

- **Component Independence**: Each repository provides standalone value
- **Clear Migration Paths**: Easy progression from basic to advanced usage
- **Backward Compatibility**: Maintain compatibility as ecosystem evolves
- **Documentation Tiers**: Different documentation for different adoption levels

## Decision 10: Latest Mod Versions vs Version Pinning

**Decision**: Always use latest available mod versions from Mod Portal instead of pinning specific mod versions.

**Context**: Need to balance reproducibility with maintenance burden and data currency for testing infrastructure.

**Options Considered**:

1. **Full Version Pinning**: Pin both Factorio version and all mod versions
2. **Hybrid Approach**: Pin major mods, use latest for others
3. **Latest Versions Only**: Pin only Factorio version, use latest compatible mod versions

**Decision Rationale**:

**Advantages of Latest Versions Approach**:

- **Zero Maintenance Overhead**: No human intervention needed for mod version updates
- **Always Current**: Test data reflects latest mod features and bug fixes
- **Automated Updates**: Daily builds automatically capture mod ecosystem evolution
- **Realistic Testing**: Developers test against current mod state, not outdated versions
- **Community Alignment**: Matches how most players actually use mods (latest versions)
- **Reduced Complexity**: Eliminates complex version management workflows

**Trade-offs Accepted**:

- **Build Variation**: Different builds may have different mod versions
- **Debugging Complexity**: Need artifact metadata to determine exact versions used
- **Potential Instability**: Latest versions may occasionally introduce breaking changes

**Mitigation Strategies**:

- **Artifact Immutability**: Each generated artifact captures exact versions at build time
- **ORAS Provenance**: Full traceability from data back to generating modpack digest
- **Automated Validation**: Build process validates mod compatibility before extraction
- **Rollback Capability**: Can pin to previous artifact digest if issues arise

**Implementation Strategy**:

- **Factorio Version Pinning**: Only pin Factorio version for stability (e.g., `2.0.66`)
- **Latest Compatible Resolution**: Fetch latest mod versions that satisfy dependency constraints
- **Daily Build Cycle**: Automated builds capture latest ecosystem state
- **Rich Metadata**: Each artifact contains complete mod version manifest

## Decision 11: Community-First Development Model

**Decision**: Prioritize community involvement and transparency throughout development.

**Context**: Need to ensure ecosystem meets real community needs and gains adoption.

**Approach Selected**:

- **Public Planning**: All architectural decisions documented publicly
- **RFC Process**: Community input on major changes
- **Regular Updates**: Transparent progress reporting
- **Contribution Welcome**: Clear paths for community contributions

**Benefits**:

- **Community Buy-In**: Stakeholders involved in design decisions
- **Real-World Validation**: Designs tested against actual use cases
- **Shared Ownership**: Community investment in ecosystem success
- **Knowledge Transfer**: Decisions documented for future contributors

**Implementation**:

- **Planning Documents**: Comprehensive public documentation of all decisions
- **Issue Templates**: Structured ways for community to provide feedback
- **Contribution Guidelines**: Clear processes for community involvement
- **Regular Communication**: Blog posts, updates, and community calls

## Conclusion

These architectural decisions form the foundation of the Factorio Mocks Ecosystem. Each decision balances multiple
concerns including technical requirements, community needs, and long-term sustainability.

The decisions prioritize:

- **Community Value**: Maximum benefit to the Factorio modding community
- **Technical Excellence**: High-quality, reliable, and performant solutions
- **Sustainable Development**: Maintainable architecture that can evolve over time
- **Incremental Adoption**: Lower barriers to entry with clear upgrade paths

These decisions will be revisited and refined based on community feedback and real-world usage experience.
