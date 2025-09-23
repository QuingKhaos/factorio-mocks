---
status: "Accepted"
date: "2025-09-23"
authors: "Development Team"
tags: ["architecture", "decision", "validation", "generator", "loader"]
supersedes: ""
superseded_by: ""
---

# ADR-0012: Generator Validation Architecture

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires data validation to ensure extracted data quality and integrity. Critical
architectural decisions needed resolution regarding validation placement, schema generation approaches, and consumer
validation responsibilities. The ecosystem must balance data quality assurance with performance, simplicity, and
maintainability across five repositories.

## Decision

Implement integrated validation architecture using LIVR (Language Independent Validation Rules) with rule generation
from Factorio's JSON API documentation within `factorio-mocks-generator`, build-time validation rule bundling, and
lightweight integrity verification in `factorio-mocks-loader`. This approach balances data quality assurance with
performance and architectural simplicity while leveraging mature validation libraries for native Lua compatibility.

## Consequences

### Positive

- **POS-001**: Clear architectural separation between generation validation and consumption delivery
- **POS-002**: Performance optimized through build-time schema generation and lightweight loading checks
- **POS-003**: Reliable execution with no external dependencies during extraction or loading phases
- **POS-004**: Simplified architecture maintains focused repository responsibilities without coordination overhead
- **POS-005**: Resource efficient approach minimizes computational overhead for consumer applications

### Negative

- **NEG-001**: Consumers cannot independently validate data structures without generator dependency
- **NEG-002**: LIVR validation rules unavailable for broader Factorio tooling ecosystem reuse
- **NEG-003**: Validation logic updates coupled to generator repository lifecycle rather than independent versioning

## Alternatives Considered

### LIVR Rule Distribution via ORAS

- **ALT-001**: **Description**: Distribute LIVR validation rules as separate ORAS artifacts for ecosystem-wide consumption
- **ALT-002**: **Rejection Reason**: Adds coordination complexity without clear consumer benefit for current use cases

### Runtime Rule Generation

- **ALT-003**: **Description**: Generate LIVR rules dynamically during extraction by fetching Factorio API documentation
- **ALT-004**: **Rejection Reason**: Performance impact and reliability concerns in headless execution environments

### Full LIVR Validation in Loader

- **ALT-005**: **Description**: Implement complete LIVR validation within loader for consumer independence
- **ALT-006**: **Rejection Reason**: Redundant validation of pre-validated data with significant performance cost

## Implementation Notes

- **IMP-001**: Generator repository bundles pre-generated LIVR validation rules in mod zip during build process
- **IMP-002**: LIVR rules generated from Factorio's JSON API documentation using `lua-LIVR` library for native compatibility
- **IMP-003**: Validation leverages mature LIVR ecosystem (lua-LIVR and lua-LIVR-extra) for robust rule processing
- **IMP-004**: Loader implements checksum verification and basic format validation without LIVR dependencies
- **IMP-005**: Success metrics include 100% validation success for extraction and sub-second loading performance

## References

- **REF-001**: [ADR-0001](adr-0001-five-repository-architecture.md) (Five-repository architecture enables focused
  component responsibilities)
- **REF-002**: [ADR-0002](adr-0002-oras-artifact-distribution.md) (ORAS distribution supports efficient data delivery
  without schema coupling)
- **REF-003**: [Issue #10](https://github.com/QuingKhaos/factorio-mocks/issues/10) (Future separate schema repository
  consideration for community benefit)
