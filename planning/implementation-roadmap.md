# Implementation Roadmap

This document outlines the phased implementation approach for the Factorio Mocks Ecosystem.

## Development Philosophy

### Incremental Value Delivery

Each phase delivers working, useful functionality that provides immediate value to the community while building
toward the complete ecosystem vision.

### Community-Driven Development

- Regular feedback collection and incorporation
- Public development with transparent decision-making
- Continuous community engagement and iteration
- Community contribution opportunities at every phase

*See [community-engagement.md](community-engagement.md) for detailed community engagement strategy and contributor
onboarding processes.*

### Quality-First Approach

- Comprehensive testing for each component before release
- Security review and performance optimization
- Cross-platform compatibility validation
- Documentation completeness requirements

## Phase 1: Foundation

**Goal**: Establish core infrastructure and basic functionality

### 1.1 Repository Setup and Planning

**Deliverables**:

- [x] Complete planning documentation in `factorio-mocks` repository
- [ ] Create all five repositories with proper structure and licenses
- [ ] Set up GitHub Actions workflows for basic CI/CD
- [ ] Establish community contribution guidelines and RFC process

**Success Criteria**:

- All repositories created with appropriate licenses
- Basic CI/CD workflows operational

### 1.2 `factorio-mocks-generator` - Basic Extraction

#### 1.2.1 Core Extraction Functionality

**Deliverables**:

- [ ] Create Factorio mod with basic info.json and structure
- [ ] Implement prototype stage extraction (`data.raw`, `mods`, `settings`, `feature_flags`)
- [ ] Basic serialization using Serpent library
- [ ] Initial extraction validation and error handling

**Success Criteria**:

- Successfully extracts complete `data.raw` from vanilla Factorio
- Produces valid, parseable Lua output files
- Works consistently in local Factorio installations
- Handles extraction errors gracefully

#### 1.2.2 Automated Testing Workflow

**Deliverables**:

- [ ] GitHub Actions workflow for automated headless Factorio testing on PRs and pushes to main
- [ ] Headless extraction execution using direct Factorio headless binary (self-contained, no system dependencies)
- [ ] Automated testing of generator mod in headless environment with stdout capture
- [ ] Data validation and integrity checking framework with comprehensive unit tests
- [ ] Error handling and reporting for extraction failures with detailed logging
- [ ] Manual trigger capability for on-demand testing during development
- [ ] Documentation for automated testing process, validation framework, and troubleshooting

**Success Criteria**:

- GitHub Actions automatically runs generator mod testing on every PR and push to main
- Extraction validation framework automatically detects data integrity issues and extraction failures
- Unit tests achieve comprehensive coverage of validation logic, error detection, and edge cases
- Automated testing provides reliable feedback and detailed error reporting for extraction functionality
- Manual triggers work reliably for development testing and validation scenarios

#### 1.2.3 Data Repository Integration (Temporary)

**Deliverables**:

- [ ] Manual workflow to capture validated extraction artifacts and commit to data repository
- [ ] Automated commit and push of extracted vanilla data to `factorio-mocks-data` repository via manual trigger
- [ ] Basic repository structure and file organization for vanilla Factorio data
- [ ] Manual trigger for data updates when Factorio version is updated or data refresh is needed
- [ ] Validation integration ensuring only tested data gets committed to repository
- [ ] Documentation for git-based data distribution approach and migration strategy

**Success Criteria**:

- Manual workflow successfully captures extraction artifacts and commits validated data to repository
- Repository serves as reliable source with current vanilla data updated via manual triggers
- Manual trigger process is straightforward and well-documented for maintainers
- Repository structure supports easy browsing and understanding of available vanilla data
- Clear migration path documented for transition to `factorio-mocks-modpacks` data management in Phase 2.1

**Note**: This is a temporary bridge solution until Phase 2.1 (`factorio-mocks-modpacks`) implements comprehensive modpack
management. The data commit functionality will be migrated to the modpacks repository when multi-modpack support
is implemented, enabling immediate community access while Phase 2 development proceeds.

### 1.3 `factorio-mocks-loader` - Basic Import

**Deliverables**:

- [ ] Create Lua library with basic import functionality
- [ ] Simple API for loading extracted data
- [ ] Basic environment setup (globals creation)
- [ ] Git-based data loading from `factorio-mocks-data` repository
- [ ] Cross-platform compatibility (Windows, Linux, macOS)

**Success Criteria**:

- Can load and set up `data.raw` in test environment from git repository
- Simple one-line setup for basic use cases using git-based distribution
- Works consistently across all target platforms
- Proper error handling for missing or corrupted data

### 1.4 Integration Validation and Documentation

**Deliverables**:

- [ ] Successful import and environment setup using loader with automated data
- [ ] Basic example project demonstrating automated workflow
- [ ] Integration testing validating generator → automation → loader chain
- [ ] Documentation for complete automated process

**Success Criteria**:

- Automated process successfully extracts and loads vanilla `data.raw`
- Example project validates extracted data works for basic testing
- Documentation enables community to use automated data source
- Process validation confirms Phase 1 components work together automatically

## Phase 2: Modpack Support and Data Repository

**Goal**: Enable modpack support, ORAS integration, and community-accessible mock data browsing

### 2.1 Native Mod Management System

**Deliverables**:

- [ ] Create `factorio-mocks-modpacks` repository
- [ ] Implement native Factorio Mod Portal API client
- [ ] Recursive dependency resolution with conflict detection
- [ ] ORAS artifact creation for modpack configurations
- [ ] Support for authenticated mod downloads

**Success Criteria**:

- Successfully resolves complex mod dependency trees
- Creates working modpack artifacts for popular configurations
- Handles version conflicts and optional dependencies correctly
- Works without external Python dependencies

### 2.2 ORAS Integration Infrastructure

**Deliverables**:

- [ ] Implement ORAS artifact creation in `factorio-mocks-data`
- [ ] Set up GitHub Container Registry integration
- [ ] Dual tagging strategy (semantic versions + Git commits)
- [ ] Artifact linking and metadata management
- [ ] Implement `oras attach` for modpack-to-data provenance tracking

**Success Criteria**:

- ORAS artifacts successfully created and pushed to registry
- Dual tagging enables both commit-based and version-based retrieval
- Artifact metadata includes comprehensive extraction information
- Efficient layer caching reduces storage and transfer costs
- Mock data artifacts successfully attached to their source modpack digests

### 2.3 Multi-Modpack Data Generation

**Deliverables**:

- [ ] Support for multiple popular modpack configurations
- [ ] Automated modpack artifact generation with daily builds
- [ ] Daily build cycle for maintaining currency with mod ecosystem
- [ ] Community-browsable data repository structure
- [ ] Configuration templates and validation

**Success Criteria**:

- At least 3 popular modpacks fully supported with daily builds
- Community can browse extracted data for compatibility mod creation
- Automated validation prevents broken configurations
- Clear process for requesting new modpack configurations

### 2.4 Multi-Modpack Data Management

**Deliverables**:

- [ ] Documentation for discovering and understanding available modpack configurations
- [ ] Community modpack configuration request and approval process
- [ ] Clear cataloging and organization of multiple data sets in `factorio-mocks-data`
- [ ] Usage examples for consuming modpack-specific data via ORAS
- [ ] Process documentation for validating and maintaining modpack configurations

**Success Criteria**:

- Community can easily discover which modpack configurations are available
- Clear process for requesting new modpack configurations with community validation
- Well-organized data repository structure supports multiple modpack data sets
- Documentation enables successful consumption of modpack-specific data via ORAS
- Community successfully requests and receives new modpack configurations

## Phase 3: Advanced Loader Functionality

**Goal**: Add runtime extraction, localization, intelligent caching, and CI/CD capabilities

### 3.1 Runtime Stage Extraction

**Deliverables**:

- [ ] Extend `factorio-mocks-generator` with runtime stage extraction
- [ ] Extract `prototypes` and `settings` during game runtime
- [ ] Implement control.Lua for runtime data access
- [ ] Coordinate prototype and runtime stage data collection

**Success Criteria**:

- Complete runtime `prototypes` data available
- Runtime `settings` extraction works correctly
- Proper coordination between data and control stage extraction
- Maintains compatibility with existing prototype extraction

### 3.2 Localization Support

**Deliverables**:

- [ ] Extract all `.cfg` files from base game and active mods
- [ ] Merge mod localization files into consolidated format
- [ ] Implement LocalisedString processing in `factorio-mocks-loader`
- [ ] Support for complex plural rules and built-in parameters
- [ ] Multi-language testing capabilities

**Success Criteria**:

- All supported languages extracted and available
- LocalisedString resolution works for basic cases
- Plural rules and special parameters handled correctly
- Multi-language test examples working

### 3.3 Intelligent Caching System

**Deliverables**:

- [ ] Implement cache management in `factorio-mocks-loader`
- [ ] Automatic staleness detection and updates
- [ ] Configurable cache policies and directories
- [ ] Cache invalidation and cleanup mechanisms

**Success Criteria**:

- Significantly improved loading times for cached data
- Automatic updates when data becomes stale
- Proper cache management prevents disk space issues
- User-configurable cache behavior

### 3.4 GitHub Actions Integration

**Deliverables**:

- [ ] Create reusable GitHub Action for setup
- [ ] Automated data extraction workflows
- [ ] CI/CD integration examples and templates
- [ ] Cross-platform testing automation

**Success Criteria**:

- GitHub Action enables easy setup in any repository
- Automated extraction workflows run reliably
- Example CI/CD configurations work for common scenarios
- All platforms supported in automated testing

## Phase 4: Community Ready

**Goal**: Optimize performance, enhance security, and prepare for community adoption

### 4.1 Performance Optimization

**Deliverables**:

- [ ] Comprehensive performance analysis and optimization
- [ ] Memory usage optimization for large datasets
- [ ] Network transfer optimization and compression
- [ ] Concurrent processing for extraction and loading

**Success Criteria**:

- Significant performance improvements across all components
- Memory usage remains reasonable for largest modpacks
- Network transfers optimized through compression and caching
- Extraction and loading times meet production requirements

### 4.2 Security and Reliability

**Deliverables**:

- [ ] Security review of all authentication and credential handling
- [ ] Input validation and sanitization hardening
- [ ] Error handling and recovery improvements
- [ ] Comprehensive logging and monitoring

**Success Criteria**:

- Security review passes without major issues
- All user inputs properly validated and sanitized
- Graceful handling of network failures and data corruption
- Adequate logging for troubleshooting and monitoring

### 4.3 Comprehensive Testing and Documentation

**Deliverables**:

- [ ] Comprehensive test coverage for all repositories
- [ ] Integration testing across the entire ecosystem
- [ ] Complete documentation for all APIs and workflows
- [ ] Migration guides and best practices

**Success Criteria**:

- Test coverage exceeds 90% for all critical functionality
- Integration tests validate cross-repository compatibility
- Documentation enables successful adoption by new users
- Migration guides support users coming from other solutions

### 4.4 Community Release Preparation

**Deliverables**:

- [ ] Community feedback collection and validation
- [ ] Release candidate preparation and validation
- [ ] Community feedback integration and final adjustments
- [ ] Official v1.0 release

**Success Criteria**:

- Community provides valuable feedback and validation through regular usage
- Release candidate demonstrates stability and completeness
- Community feedback incorporated into final release
- Official release meets all success criteria and community expectations

## Success Metrics and Evaluation

### Quality Metrics

**Technical Standards**:

- 90%+ test coverage for all critical functionality
- Cross-platform compatibility (Windows, Linux, macOS)
- Performance benchmarks within acceptable ranges
- Security review completion without major issues

**Community Standards**:

- Comprehensive documentation enabling successful adoption
- Responsive issue resolution (average < 1 week for bugs)
- Regular community communication and updates
- Clear contribution guidelines and welcoming community

### Risk Mitigation Checkpoints

**Monthly Reviews**:

- Progress against roadmap timeline and deliverables
- Community feedback and adoption metrics
- Technical quality and performance assessments
- Risk identification and mitigation planning

**Phase Gates**:

- Each phase requires completion of success criteria before proceeding
- Community feedback integration required between phases
- Technical architecture review and approval for major changes
- Performance and security validation at phase boundaries

## Resource Requirements and Dependencies

### Development Resources

**Core Team**: 1-2 developers with Factorio modding and Lua expertise
**Community Support**: Documentation, testing, and feedback from community volunteers
**Infrastructure**: GitHub repositories, Container Registry, CI/CD runner resources

### External Dependencies

**Factorio**: Stable API compatibility and continued game development
**Community**: Active participation in feedback, testing, and contribution
**Tools**: ORAS tooling, GitHub Actions, Luarocks ecosystem

### Risk Management

**Technical Risks**: Factorio API changes, tool compatibility issues, performance bottlenecks
**Community Risks**: Low adoption, insufficient feedback, contributor burnout
**Resource Risks**: Development capacity, infrastructure costs, maintenance burden

**Mitigation Strategies**: Modular design for flexibility, community engagement programs, sustainable development practices
