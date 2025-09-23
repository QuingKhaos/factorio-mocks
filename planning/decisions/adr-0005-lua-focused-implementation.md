---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
labels: ["component: architecture"]
supersedes: ""
superseded_by: ""
---

# ADR-0005: Lua-Focused Implementation

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires selection of a primary implementation language that balances developer
familiarity, runtime dependencies, ecosystem compatibility, and technical capabilities. Options include Python with
its rich ecosystem, Node.js for web APIs and tooling, or Lua as Factorio's native language.

## Decision

Implement all core functionality in Lua rather than other languages, making Lua the primary implementation language
across the ecosystem.

## Consequences

### Positive

- **POS-001**: Factorio native language matches the same language used by Factorio mods and runtime
- **POS-002**: Minimal dependencies reduce external runtime requirements and deployment complexity
- **POS-003**: Community familiarity leverages existing knowledge since Factorio modders already know Lua
- **POS-004**: Consistent environment uses same language across all ecosystem components
- **POS-005**: Lightweight runtime with Lua runtime being small and efficient for deployment

### Negative

- **NEG-001**: Limited libraries with fewer third-party libraries available compared to Python or Node.js
- **NEG-002**: HTTP client implementation requires development or identification of suitable HTTP client libraries
- **NEG-003**: JSON handling limitations with limited built-in support for JSON processing in Lua

## Alternatives Considered

### Python

- **ALT-001**: **Description**: Rich ecosystem with existing tools and comprehensive library support
- **ALT-002**: **Rejection Reason**: Introduces external runtime dependency and language mismatch with Factorio
  modding ecosystem

### Node.js

- **ALT-003**: **Description**: Good for web APIs and tooling with strong HTTP and JSON support
- **ALT-004**: **Rejection Reason**: Adds complexity with different language and runtime requirements from Factorio
  modding environment

## Implementation Notes

- **IMP-001**: Identify and standardize on high-quality Lua libraries for common functionality
- **IMP-002**: Implement robust HTTP client suitable for Factorio Mod Portal API integration
- **IMP-003**: Provide clear documentation for Lua-specific patterns and best practices

## References

- **REF-001**: Lua language specification at <https://www.lua.org/manual/5.4/>
- **REF-002**: Native mod management strategy documented in ADR-0003
