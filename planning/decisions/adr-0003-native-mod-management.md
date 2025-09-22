---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
tags: ["architecture", "decision", "mod-management"]
supersedes: ""
superseded_by: ""
---

# ADR-0003: Native Mod Management vs External Tools

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires reliable mod downloading and dependency resolution for modpack creation. Several
approaches exist, including using existing Python-based tools like `factorio-mod-updater`, creating custom wrappers
around existing tools, or implementing a native solution using the Factorio Mod Portal API directly.

## Decision

Implement native Factorio Mod Portal API client instead of depending on external tools, using a pure Lua
implementation for mod management and dependency resolution.

## Consequences

### Positive

- **POS-001**: Zero external dependencies eliminates need for Python or other language runtime requirements
- **POS-002**: API-first architecture provides more reliable integration than HTML parsing approaches
- **POS-003**: ORAS integration designed specifically for container-based artifact workflows
- **POS-004**: Enhanced metadata capabilities provide rich dependency trees and compatibility information
- **POS-005**: Cross-platform consistency ensures identical behavior across all supported platforms
- **POS-006**: Maintenance control removes dependency on external project maintenance and updates

### Negative

- **NEG-001**: Development time increased due to more initial implementation work required
- **NEG-002**: HTTP client implementation requires robust HTTP client implementation in Lua
- **NEG-003**: API compatibility maintenance must track Factorio Mod Portal API changes over time

## Alternatives Considered

### Factorio-mod-updater

- **ALT-001**: **Description**: Use existing Python-based tool for mod downloading and management
- **ALT-002**: **Rejection Reason**: Introduces Python runtime dependency and relies on HTML parsing rather than API
  integration

### Custom Wrapper

- **ALT-003**: **Description**: Wrap existing tools with additional functionality for integration
- **ALT-004**: **Rejection Reason**: Still maintains external dependencies while adding complexity layer without
  addressing core API reliability issues

## Implementation Notes

- **IMP-001**: Comprehensive HTTP client with proper error handling and retry mechanisms will be implemented
- **IMP-002**: Robust dependency resolution algorithm with conflict detection capabilities
- **IMP-003**: Extensive testing against real mod dependency scenarios to ensure reliability

## References

- **REF-001**: Factorio Mod Portal API documentation
- **REF-002**: ORAS integration strategy documented in ADR-0002
