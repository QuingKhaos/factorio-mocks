---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
labels: ["component: architecture", "ecosystem: data"]
supersedes: ""
superseded_by: ""
---

# ADR-0006: Dual Data Distribution Strategy

## Status

Accepted

## Context

The Factorio Mocks Ecosystem needs to balance ease of data browsing with efficient distribution of large datasets.
The solution must provide developers with easy access to browse and inspect mock data while also enabling efficient
distribution and caching for automated systems and CI/CD environments.

## Decision

Use both Git repositories and ORAS artifacts for data distribution, with latest data in Git and historical versions
in ORAS artifacts.

## Consequences

### Positive

- **POS-001**: Easy browsing enabled through latest data visible in Git for inspection and diff visualization
- **POS-002**: Efficient distribution achieved through historical versions in ORAS for optimal caching and transfer
- **POS-003**: Developer experience enhanced with GitHub web interface for browsing latest data sets
- **POS-004**: CI/CD flexibility allows choosing optimal source based on specific use case requirements
- **POS-005**: Storage efficiency prevents historical versions from bloating Git repositories

### Negative

- **NEG-001**: Synchronization complexity requires maintaining consistency between Git and ORAS systems
- **NEG-002**: Infrastructure overhead managing two distribution channels increases operational complexity
- **NEG-003**: Consumer complexity requiring loader library to support both sources with fallback logic

## Alternatives Considered

### Git Only

- **ALT-001**: **Description**: Store all data in Git repositories with full version history
- **ALT-002**: **Rejection Reason**: Large datasets would bloat repositories and impact clone performance over time

### ORAS Only

- **ALT-003**: **Description**: Store all data as container artifacts without Git repository browsing
- **ALT-004**: **Rejection Reason**: Eliminates easy browsing capability and GitHub web interface accessibility

## Implementation Notes

- **IMP-001**: Git repository always contains latest version with proper formatting for web browsing
- **IMP-002**: ORAS artifacts contain historical versions with dual tagging using semantic versions and commit hashes
- **IMP-003**: Automated synchronization through GitHub Actions ensures consistency between Git and ORAS sources

## References

- **REF-001**: ORAS artifact distribution strategy documented in ADR-0002
- **REF-002**: Consumer library implementation in `factorio-mocks-loader` repository
