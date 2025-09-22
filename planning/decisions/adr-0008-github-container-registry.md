---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
tags: ["architecture", "decision", "registry", "infrastructure"]
supersedes: ""
superseded_by: ""
---

# ADR-0008: GitHub Container Registry for ORAS

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires selection of a container registry for ORAS artifact distribution. The registry
must provide reliable hosting, reasonable pricing, integration with existing development workflows, and appropriate
access control mechanisms for public artifact distribution.

## Decision

Use GitHub Container Registry (GHCR) as the primary ORAS artifact registry instead of Docker Hub or self-hosted
alternatives.

## Consequences

### Positive

- **POS-001**: Repository integration provides seamless integration with GitHub repositories and existing workflows
- **POS-002**: Access control leverages existing GitHub permissions and authentication mechanisms
- **POS-003**: Cost efficiency offers free tier for public repositories and reasonable pricing for private use
- **POS-004**: Reliability backed by GitHub/Microsoft infrastructure with high availability guarantees
- **POS-005**: Developer familiarity as most developers already have GitHub accounts and authentication setup

### Negative

- **NEG-001**: Vendor lock-in creates dependency on GitHub/Microsoft ecosystem and pricing policies
- **NEG-002**: Rate limiting may impact high-volume artifact distribution scenarios
- **NEG-003**: Regional access limitations in some geographic regions or network environments

## Alternatives Considered

### Docker Hub

- **ALT-001**: **Description**: Most popular container registry with widespread adoption and tooling support
- **ALT-002**: **Rejection Reason**: Rate limiting for anonymous pulls and separate authentication from GitHub
  development workflow

### Self-Hosted Registry

- **ALT-003**: **Description**: Full control over infrastructure with custom configuration and policies
- **ALT-004**: **Rejection Reason**: Operational overhead and reliability concerns for community-focused project

## Implementation Notes

- **IMP-001**: Registry namespace using consistent naming convention across all artifacts with proper organization
- **IMP-002**: Authentication via GitHub token-based authentication for automated CI/CD workflows
- **IMP-003**: Public access configuration ensuring artifacts are publicly accessible for community use with proper
  retry logic

## References

- **REF-001**: GitHub Container Registry documentation at <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>
- **REF-002**: ORAS artifact distribution strategy documented in ADR-0002
