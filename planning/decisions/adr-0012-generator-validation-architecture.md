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

Implement integrated validation architecture with JSON schema generation within `factorio-mocks-generator`,
build-time schema bundling, and lightweight integrity verification in `factorio-mocks-loader`. This approach
balances data quality assurance with performance and architectural simplicity across the ecosystem.

## Consequences

### Positive

- **POS-001**: Clear architectural separation between generation validation and consumption delivery
- **POS-002**: Performance optimized through build-time schema generation and lightweight loading checks
- **POS-003**: Reliable execution with no external dependencies during extraction or loading phases
- **POS-004**: Simplified architecture maintains focused repository responsibilities without coordination overhead
- **POS-005**: Resource efficient approach minimizes computational overhead for consumer applications

### Negative

- **NEG-001**: Consumers cannot independently validate data structures without generator dependency
- **NEG-002**: JSON schemas unavailable for broader Factorio tooling ecosystem reuse
- **NEG-003**: Schema updates coupled to generator repository lifecycle rather than independent versioning

## Alternatives Considered

### Schema Distribution via ORAS

- **ALT-001**: **Description**: Distribute JSON schemas as separate ORAS artifacts for ecosystem-wide consumption
- **ALT-002**: **Rejection Reason**: Adds coordination complexity without clear consumer benefit for current use cases

### Runtime Schema Generation

- **ALT-003**: **Description**: Generate schemas dynamically during extraction by fetching Factorio API documentation
- **ALT-004**: **Rejection Reason**: Performance impact and reliability concerns in headless execution environments

### Full Schema Validation in Loader

- **ALT-005**: **Description**: Implement complete JSON schema validation within loader for consumer independence
- **ALT-006**: **Rejection Reason**: Redundant validation of pre-validated data with significant performance cost

## Implementation Notes

- **IMP-001**: Generator repository bundles pre-generated JSON schemas in mod zip during build process
- **IMP-002**: Loader implements checksum verification and basic format validation without schema dependencies
- **IMP-003**: Success metrics include 100% validation success for extraction and sub-second loading performance

## References

- **REF-001**: [ADR-0001](adr-0001-five-repository-architecture.md) (Five-repository architecture enables focused
  component responsibilities)
- **REF-002**: [ADR-0002](adr-0002-oras-artifact-distribution.md) (ORAS distribution supports efficient data delivery
  without schema coupling)
- **REF-003**: [Issue #10](https://github.com/QuingKhaos/factorio-mocks/issues/10) (Future separate schema repository
  consideration for community benefit)
