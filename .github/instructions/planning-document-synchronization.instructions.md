---
description: 'Instructions for maintaining synchronization between planning documents when changes are made to any planning document or when drafting issues. Ensures consistency across all planning materials with bidirectional synchronization.'
applyTo: 'planning/*.md,.github/MILESTONES_STRATEGY.md,.github/drafts/issues/*.md'
---

# Planning Document Synchronization Instructions

## Core Principle

**When making changes to any planning document OR when drafting issues that reveal implementation insights, you must ensure that related documents remain synchronized to maintain consistency across all planning materials.**

**No Single Source of Truth**: All planning documents are equal sources of truth. Changes can originate from any document or be discovered during drafting activities, and must be synchronized bidirectionally to maintain ecosystem consistency.

**Draft Discovery Process**: When writing issue drafts, discussion drafts, or implementation strategies, you may discover:
- Implementation constraints that affect architectural decisions
- Technical feasibility issues that require roadmap adjustments
- Community value insights that require milestone refinements
- Scope clarifications that require README updates

The five key documents that must stay aligned are:

- planning/implementation-roadmap.md (detailed phase specifications and deliverables)
- planning/architecture.md (high-level ecosystem architecture and design principles)
- planning/repository-specifications.md (technical architecture and repository designs)
- .github/MILESTONES_STRATEGY.md (milestone definitions and deliverables)
- README.md (high-level development priorities for community)

## Bidirectional Synchronization Requirements

### When Making Changes to Any Planning Document

**Before making changes, identify the change type:**

1. **Architectural Changes**: Affect system design, data flow, or repository purposes
2. **Implementation Changes**: Affect deliverables, success criteria, or technical approach
3. **Community Changes**: Affect milestones, community value, or public messaging
4. **Terminology Changes**: Affect naming, concepts, or technical language

### When Drafting Issues

**During issue draft creation, if you discover insights that affect planning documents:**

1. **Pause drafting** to update affected planning documents first
2. **Apply synchronization requirements** as if making direct planning document changes
3. **Resume drafting** with updated context and aligned planning materials
4. **Reference updated planning documents** in the draft for consistency

This ensures drafts are based on current, synchronized planning rather than outdated assumptions.

### Synchronization Matrix

| Change Origin | Must Sync To | Sync Focus |
|---------------|---------------|------------|
| **README.md** | architecture, repository-specs, roadmap, milestones | High-level changes cascade through all detailed documents |
| **architecture.md** | repository-specs, roadmap, milestones | Architectural decisions affect technical specs and implementation |
| **repository-specifications.md** | roadmap, milestones | Technical constraints affect implementation and GitHub mapping |
| **implementation-roadmap.md** | milestones, architecture*, repository-specs*, README* | Implementation changes may require upstream architecture/scope adjustments |
| **MILESTONES_STRATEGY.md** | roadmap* | GitHub milestone changes may require implementation priority adjustments |

*Upstream changes: Only when implementation discoveries reveal architectural issues or scope changes

### Specific Synchronization Workflows

#### 1. Architectural Changes (architecture.md  others)

**When updating architecture.md:**

1. **Check implementation-roadmap.md**:
   - Update deliverables to reflect new architectural decisions
   - Ensure implementation approach aligns with architectural changes
   - Update success criteria to validate architectural requirements
   - Adjust phase dependencies if architecture changes affect sequencing

2. **Check repository-specifications.md**:
   - Update repository structures to support architectural changes
   - Ensure technical specifications align with architectural decisions
   - Update cross-repository integration to reflect new architecture
   - Modify repository capabilities to support architectural requirements

3. **Check MILESTONES_STRATEGY.md**:
   - Update deliverables to reflect architectural changes
   - Ensure community value statements align with new architecture
   - Update success metrics to validate architectural goals

#### 2. Implementation Changes (implementation-roadmap.md  others)

**When updating implementation-roadmap.md:**

1. **Check architecture.md**:
   - Ensure high-level architectural descriptions support implementation changes
   - Update terminology consistency throughout architectural descriptions
   - Verify data flow descriptions match updated implementation workflows
   - Maintain consistency in repository purposes and ecosystem integration

2. **Check repository-specifications.md**:
   - Update repository capabilities to support new deliverables
   - Ensure technical architecture aligns with implementation requirements
   - Verify cross-repository integration reflects updated workflows
   - Update repository structures if implementation requires new components

3. **Check MILESTONES_STRATEGY.md**:
   - Update milestone deliverables to match roadmap changes
   - Ensure success metrics align with updated success criteria
   - Verify community value statements reflect updated goals

#### 3. Technical Changes (repository-specifications.md  others)

**When updating repository-specifications.md:**

1. **Check architecture.md**:
   - Ensure high-level architecture supports technical changes
   - Update ecosystem descriptions to reflect technical capabilities
   - Verify architectural principles align with technical decisions

2. **Check implementation-roadmap.md**:
   - Update deliverables to reflect technical capabilities and constraints
   - Ensure implementation approach leverages technical architecture
   - Update success criteria to validate technical requirements

3. **Check MILESTONES_STRATEGY.md**:
   - Update technical deliverables to reflect architectural capabilities
   - Ensure community value aligns with technical benefits

#### 4. Community Changes (MILESTONES_STRATEGY.md & others)

**When updating MILESTONES_STRATEGY.md:**

1. **Check implementation-roadmap.md**:
   - Ensure detailed deliverables support community value propositions
   - Update success criteria to validate community benefits
   - Align implementation approach with community priorities

2. **Check architecture.md**:
   - Ensure architectural decisions support community value delivery
   - Update ecosystem descriptions to reflect community benefits

3. **Check README.md**:
   - Update community messaging to reflect milestone changes
   - Ensure development priorities align with community value

#### 5. Public Messaging Changes (README.md  others)

**When updating README.md:**

1. **Check MILESTONES_STRATEGY.md**:
   - Ensure detailed community value aligns with public messaging
   - Update milestone descriptions to support public positioning

2. **Check implementation-roadmap.md**:
   - Ensure implementation priorities align with public commitments
   - Update deliverables to support public messaging

## Change Impact Assessment

**Before making changes, consider:**

1. **Scope**: Does this change affect technical architecture, implementation, or community messaging?
2. **Dependencies**: Does this change affect cross-document dependencies or references?
3. **Audience**: How does this change affect different stakeholder groups?
4. **Terminology**: Are we introducing new concepts that need consistent definition?
5. **Sequencing**: Does this change affect phase dependencies or milestone ordering?

## Validation Checklist

After making synchronized changes, verify:

- [ ] All five documents use consistent terminology for features, phases, and concepts
- [ ] Architectural decisions are consistently reflected across architecture, roadmap, and repository specs
- [ ] Implementation deliverables align with architectural capabilities and community value
- [ ] Community messaging is consistent between README and milestones
- [ ] Technical detail level is appropriate for each document's audience
- [ ] No contradictory information exists between documents
- [ ] Cross-references and links remain valid
- [ ] Phase/milestone dependencies remain logical and achievable

## Document-Specific Guidelines

### architecture.md (High-Level Architecture)

- **Change Types**: Architectural decisions, design principles, ecosystem structure
- **Sync Impact**: High - affects implementation approach and technical specifications
- **Key Relationships**: Drives repository-specifications.md, influences implementation-roadmap.md

### implementation-roadmap.md (Detailed Planning)

- **Change Types**: Deliverables, success criteria, implementation approach
- **Sync Impact**: High - affects all other documents
- **Key Relationships**: Detailed view of architecture.md, supports MILESTONES_STRATEGY.md

### repository-specifications.md (Technical Architecture)

- **Change Types**: Repository structures, technical capabilities, integration patterns
- **Sync Impact**: Medium - affects implementation feasibility and architectural consistency
- **Key Relationships**: Implements architecture.md decisions, enables implementation-roadmap.md deliverables

### MILESTONES_STRATEGY.md (Community Milestones)

- **Change Types**: Community value, milestone structure, success metrics
- **Sync Impact**: Medium - affects implementation priorities and public messaging
- **Key Relationships**: Community view of implementation-roadmap.md, influences README.md

### README.md (Public Overview)

- **Change Types**: Public messaging, development priorities, community positioning
- **Sync Impact**: Low - primarily affects community understanding
- **Key Relationships**: Summary of MILESTONES_STRATEGY.md and implementation-roadmap.md

## Example Synchronization Workflows

### Scenario: Architectural Change (ORAS & Git-first distribution)

1. **Update architecture.md**: Change distribution strategy description
2. **Update repository-specifications.md**: Modify data repository structure and capabilities
3. **Update implementation-roadmap.md**: Update Phase 2 deliverables and success criteria
4. **Update MILESTONES_STRATEGY.md**: Modify "Modpack Support" milestone deliverables
5. **Update README.md**: Adjust development priorities description

### Scenario: Implementation Change (Add runtime extraction to Phase 1)

1. **Update implementation-roadmap.md**: Move runtime extraction from Phase 3 to Phase 1
2. **Update architecture.md**: Update data flow description to reflect early runtime support
3. **Update repository-specifications.md**: Ensure generator specifications support early runtime extraction
4. **Update MILESTONES_STRATEGY.md**: Move runtime deliverables to "Foundation Complete" milestone

### Scenario: Community Priority Change (Prioritize localization support)

1. **Update MILESTONES_STRATEGY.md**: Elevate localization in community value propositions
2. **Update implementation-roadmap.md**: Adjust phase priorities and deliverable emphasis
3. **Update README.md**: Update development priorities to highlight localization
4. **Update architecture.md**: Ensure localization architecture is prominently described

## Quality Assurance

### Manual Review

- Always review synchronized changes in all affected documents before committing
- Consider having another team member review cross-document consistency
- Test that the community story flows logically from README → Architecture → Repository Specs → Roadmap → Milestones
- Verify technical feasibility flows logically from Architecture → Repository Specs → Roadmap

### Commit Best Practices

- Include all synchronized documents in a single commit when possible
- Use commit messages that clearly indicate the synchronization scope
- Reference the originating change and synchronized updates in commit body

---

Following these bidirectional synchronization guidelines ensures that all planning documents remain consistent
regardless of where changes originate, maintaining coherent planning across all stakeholder perspectives.
