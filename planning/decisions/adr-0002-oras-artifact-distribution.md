---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
tags: ["architecture", "decision", "distribution"]
supersedes: ""
superseded_by: ""
---

# ADR-0002: ORAS for Artifact Distribution

## Status

Accepted

## Context

The Factorio Mocks Ecosystem needs an efficient distribution mechanism for large mock data files and modpack
configurations. The solution must handle large file sizes efficiently, support versioning, enable caching, and provide
rich metadata capabilities. Traditional approaches like Git LFS have limitations with large binary data, while direct
file hosting lacks sophisticated versioning and metadata features.

## Decision

Use ORAS (OCI Registry as Storage) for distributing large datasets and modpack configurations instead of Git LFS or
direct download mechanisms.

## Consequences

### Positive

- **POS-001**: Layer deduplication enables common data to be shared efficiently across different configurations
- **POS-002**: OCI registry layer caching reduces data transfer requirements for consumers
- **POS-003**: Standard tooling leverages existing container registry infrastructure and deployment patterns
- **POS-004**: Metadata rich artifacts can contain structured metadata about modpack configurations and versions
- **POS-005**: Version management through precise versioning with dual tagging strategy (semantic + commit hash)
- **POS-006**: Access control leverages registry-based permissions for private configurations

### Negative

- **NEG-001**: Tool dependency requires ORAS tooling for artifact creation and consumption
- **NEG-002**: Learning curve introduces new concept that many developers may be unfamiliar with
- **NEG-003**: Registry dependency requires access to OCI-compatible registry infrastructure

## Alternatives Considered

### Git LFS

- **ALT-001**: **Description**: Store large files in Git repositories using Git Large File Storage
- **ALT-002**: **Rejection Reason**: Limited deduplication capabilities and high storage costs for frequently changing
  large datasets

### Direct Downloads

- **ALT-003**: **Description**: Host files on GitHub releases or external storage with direct HTTP downloads
- **ALT-004**: **Rejection Reason**: Lacks sophisticated versioning, metadata capabilities, and efficient caching
  mechanisms

## Implementation Notes

- **IMP-001**: Dual distribution strategy with Git for latest versions and ORAS for historical versions
- **IMP-002**: Comprehensive tooling will abstract ORAS complexity from end users
- **IMP-003**: Fallback mechanisms for environments without ORAS access will be implemented

## References

- **REF-001**: Dual data distribution strategy documented in ADR-0006
- **REF-002**: ORAS specification at <https://oras.land/>
