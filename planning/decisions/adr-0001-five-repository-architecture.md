---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
labels: ["component: architecture", "ecosystem: generator", "ecosystem: modpacks", "ecosystem: data", "ecosystem: loader"]
supersedes: ""
superseded_by: ""
---

# ADR-0001: Five-Repository Architecture

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires a structure that balances maintainability, licensing flexibility, and community
adoption. A key decision is whether to use a monolithic approach or split functionality across multiple repositories.
This decision impacts development workflow, community contribution patterns, licensing strategy, and long-term
maintenance burden.

## Decision

Split the ecosystem into five focused repositories instead of a monolithic approach, with each repository having a
clear, single purpose and focused responsibility.

## Consequences

### Positive

- **POS-001**: Each repository has clear, single purpose enabling focused development and maintenance
- **POS-002**: Independent versioning allows components to evolve at different rates matching their maturity
- **POS-003**: Licensing flexibility enables different licenses for different types of content (LGPLv3, GPLv3, No License)
- **POS-004**: Reduced coupling through clear interfaces between components improves system modularity
- **POS-005**: Community adoption facilitated as developers can adopt only needed components
- **POS-006**: Maintenance efficiency improved through smaller, focused codebases

### Negative

- **NEG-001**: Initial complexity increased with more repositories to set up and coordinate
- **NEG-002**: Cross-repository changes require coordination across multiple repositories for some features
- **NEG-003**: Documentation overhead increased to maintain coherent documentation across repositories

## Alternatives Considered

### Monolithic Repository

- **ALT-001**: **Description**: Single repository containing all components and functionality
- **ALT-002**: **Rejection Reason**: Reduces licensing flexibility and creates tight coupling between components with
  different maturity levels

### Three-Repository Split

- **ALT-003**: **Description**: Split into core functionality, data storage, and tooling repositories
- **ALT-004**: **Rejection Reason**: Insufficient separation of concerns, still mixing components with different
  licensing and versioning requirements

## Implementation Notes

- **IMP-001**: Clear API contracts between repositories must be established and maintained
- **IMP-002**: Automated testing for cross-repository compatibility will be implemented
- **IMP-003**: Shared documentation standards and contribution guidelines will be established across all repositories

## References

- **REF-001**: Repository specifications documented in planning/repository-specifications.md
- **REF-002**: Implementation roadmap in planning/implementation-roadmap.md
