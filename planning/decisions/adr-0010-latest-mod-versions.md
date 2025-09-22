---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
tags: ["architecture", "decision", "versioning", "maintenance"]
supersedes: ""
superseded_by: ""
---

# ADR-0010: Latest Mod Versions vs Version Pinning

## Status

Accepted

## Context

The Factorio Mocks Ecosystem must balance reproducibility with maintenance burden and data currency for testing
infrastructure. The decision impacts how modpack configurations are managed, build consistency, maintenance overhead,
and alignment with real-world usage patterns where most players use latest mod versions.

## Decision

Always use latest available mod versions from Mod Portal instead of pinning specific mod versions, with only Factorio
version pinned for stability.

## Consequences

### Positive

- **POS-001**: Zero maintenance overhead eliminates human intervention for mod version updates and management
- **POS-002**: Always current test data reflects latest mod features and bug fixes automatically
- **POS-003**: Automated updates through daily builds capture mod ecosystem evolution without manual processes
- **POS-004**: Realistic testing ensures developers test against current mod state rather than outdated versions
- **POS-005**: Community alignment matches how most players actually use mods with latest available versions
- **POS-006**: Reduced complexity eliminates complex version management workflows and dependency conflicts

### Negative

- **NEG-001**: Build variation means different builds may have different mod versions creating inconsistency
- **NEG-002**: Debugging complexity requires artifact metadata to determine exact versions used in specific builds
- **NEG-003**: Potential instability as latest versions may occasionally introduce breaking changes or bugs

## Alternatives Considered

### Full Version Pinning

- **ALT-001**: **Description**: Pin both Factorio version and all mod versions for complete reproducibility
- **ALT-002**: **Rejection Reason**: High maintenance overhead requiring constant manual updates and human curation

### Hybrid Approach

- **ALT-003**: **Description**: Pin major mods while using latest versions for smaller community mods
- **ALT-004**: **Rejection Reason**: Increased complexity without eliminating maintenance burden or providing clear
  criteria for pinning decisions

## Implementation Notes

- **IMP-001**: Factorio version pinning provides stability anchor while allowing mod ecosystem evolution
- **IMP-002**: Artifact immutability ensures each generated artifact captures exact versions at build time
- **IMP-003**: ORAS provenance enables full traceability from data back to generating modpack configuration
- **IMP-004**: Automated validation during build process validates mod compatibility before extraction
- **IMP-005**: Rollback capability allows pinning to previous artifact digest if issues arise

## References

- **REF-001**: Daily build automation strategy in implementation roadmap
- **REF-002**: ORAS artifact provenance documented in ADR-0002
