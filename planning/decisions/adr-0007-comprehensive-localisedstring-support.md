---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
labels: ["component: architecture", "ecosystem: loader", "ecosystem: generator"]
supersedes: ""
superseded_by: ""
---

# ADR-0007: Comprehensive LocalisedString Support

## Status

Accepted

## Context

The Factorio Mocks Ecosystem needs to decide the scope of localization support for testing mod internationalization.
LocalisedString processing in Factorio includes complex features like plurals, built-in parameters, template
substitution, and LuaObject conversion patterns that require significant implementation effort.

## Decision

Implement complete LocalisedString processing including plurals and built-in parameters rather than partial or basic
string replacement functionality.

## Consequences

### Positive

- **POS-001**: Testing completeness enables proper testing of mod localization features and edge cases
- **POS-002**: Community value provides localization tools useful beyond just mocking scenarios
- **POS-003**: Quality benchmark demonstrates commitment to completeness and ecosystem excellence
- **POS-004**: Future-proofing handles edge cases that will inevitably arise in complex mod localization

### Negative

- **NEG-001**: Implementation complexity significantly increased due to LuaObject conversion patterns requiring
  empirical testing
- **NEG-002**: Maintenance overhead for complex plural rules requiring careful implementation and ongoing updates
- **NEG-003**: Documentation burden explaining built-in parameter prototype lookup and recursive processing
  limitations

## Alternatives Considered

### Basic Support

- **ALT-001**: **Description**: Simple string replacement only without advanced LocalisedString features
- **ALT-002**: **Rejection Reason**: Insufficient for proper testing of mod localization and missing critical
  functionality

### Partial Support

- **ALT-003**: **Description**: Handle common LocalisedString cases while ignoring complex features like plurals
- **ALT-004**: **Rejection Reason**: Incomplete solution that would fail on real-world mod localization scenarios

## Implementation Notes

- **IMP-001**: Empirical testing required to determine LuaObject conversion patterns through game behavior analysis
- **IMP-002**: Reference implementation of Factorio's plural rule system with comprehensive rule matching
- **IMP-003**: Comprehensive test suite covering all documented LocalisedString features and edge cases with clear
  documentation of limitations

## References

- **REF-001**: Factorio LocalisedString documentation in API reference
- **REF-002**: Localization parser implementation in `factorio-mocks` repository
