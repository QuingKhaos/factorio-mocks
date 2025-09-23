---
status: "Accepted"
date: "2025-09-21"
authors: "Architecture Team"
labels: ["component: architecture"]
supersedes: ""
superseded_by: ""
---

# ADR-0004: LGPLv3 for Core Libraries

## Status

Accepted

## Context

The Factorio Mocks Ecosystem requires a licensing strategy that balances open-source principles with commercial mod
development support. Different components have different usage patterns and integration requirements, necessitating a
flexible licensing approach that supports both community and commercial use cases.

## Decision

Use LGPLv3 license for `factorio-mocks` and `factorio-mocks-loader` libraries and GPLv3 for `factorio-mocks-generator`
and `factorio-mocks-modpacks`, with differentiated licensing strategy across the ecosystem based on component type and
usage patterns.

## Consequences

### Positive

- **POS-001**: Commercial compatibility allows use in commercial mod projects without license contamination
- **POS-002**: Library protection ensures improvements to core libraries are shared back to community
- **POS-003**: Community building encourages contribution while enabling widespread adoption
- **POS-004**: Ecosystem growth balances open-source values with practical development needs

### Negative

- **NEG-001**: License complexity requires careful management of different licenses across repositories
- **NEG-002**: Legal considerations may require developers to understand licensing implications
- **NEG-003**: Contribution overhead may complicate contributor license agreement processes

## Alternatives Considered

### MIT License

- **ALT-001**: **Description**: Maximum permissiveness for adoption with minimal restrictions
- **ALT-002**: **Rejection Reason**: Provides no protection for library improvements and community contributions

### GPLv3 License

- **ALT-003**: **Description**: Strong copyleft for all components with viral licensing
- **ALT-004**: **Rejection Reason**: Incompatible with commercial mod development and would limit adoption

## Implementation Notes

- **IMP-001**: License strategy varies by repository: LGPLv3 for libraries, GPLv3 for infrastructure, No License for
  data
- **IMP-002**: Clear documentation of license implications for each component will be provided
- **IMP-003**: Contributor license agreements aligned with chosen licensing strategy

## References

- **REF-001**: Five-repository architecture enabling licensing flexibility documented in ADR-0001
- **REF-002**: LGPLv3 license text at <https://www.gnu.org/licenses/lgpl-3.0.html>
