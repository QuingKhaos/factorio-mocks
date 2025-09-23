---
description: 'Instructions for maintaining synchronization between planning documents when changes are made to the implementation roadmap. Ensures consistency across README.md, MILESTONES_STRATEGY.md, and implementation-roadmap.md.'
applyTo: 'planning/implementation-roadmap.md'
---

# Planning Document Synchronization Instructions

## Core Principle

**When making changes to planning/implementation-roadmap.md, you must ensure that related documents remain synchronized
to maintain consistency across all planning materials.**

The four key documents that must stay aligned are:

- planning/implementation-roadmap.md (source of truth for detailed planning)
- planning/repository-specifications.md (technical architecture and repository designs)
- .github/MILESTONES_STRATEGY.md (milestone definitions and deliverables)
- README.md (high-level development priorities for community)

## Synchronization Requirements

### When Updating Phase Structure or Deliverables

**If you modify phase goals, deliverables, or success criteria in implementation-roadmap.md:**

1. **Check repository-specifications.md**:
   - Update repository purposes and capabilities to support new roadmap deliverables
   - Ensure technical architecture aligns with phase implementation requirements
   - Verify cross-repository integration reflects updated data flow or dependencies
   - Update repository structure specifications if new components are needed

2. **Check MILESTONES_STRATEGY.md**:
   - Update corresponding milestone "Key Deliverables" to match roadmap changes
   - Ensure "Success Metrics" align with roadmap success criteria
   - Verify "Community Value" statements reflect updated phase goals

3. **Check README.md**:
   - Update "Development Priorities" section to reflect major changes
   - Ensure phase descriptions are concise but accurate summaries
   - Maintain consistency in terminology and feature names

### Specific Synchronization Points

#### Phase Deliverables Changes

- **Roadmap**: Detailed deliverable lists with checkboxes
- **Repository Specs**: Technical capabilities and repository structures needed to support deliverables
- **Milestones**: High-level deliverable summaries focusing on community value
- **README**: Concise bullet points highlighting key features

#### Success Criteria Updates

- **Roadmap**: Detailed technical and functional success criteria
- **Milestones**: Community-focused success metrics and validation checkpoints
- **README**: Not directly included, but should influence phase descriptions

#### New Phase Additions

- **Roadmap**: Complete phase specification with all sections
- **Repository Specs**: New repository requirements or architectural changes to support phase
- **Milestones**: New milestone with full template structure
- **README**: New phase section in Development Priorities

### Change Impact Assessment

**Before making changes, consider:**

1. **Scope**: Does this change affect one phase or multiple phases?
2. **Audience**: How does this change affect community understanding vs. developer implementation?
3. **Dependencies**: Does this change affect phase dependencies or sequencing?
4. **Terminology**: Are we introducing new terms that need consistent usage?

### Validation Checklist

After making synchronized changes, verify:

- [ ] All four documents use consistent terminology for features and phases
- [ ] Phase goals align across all documents (detailed in roadmap, supported by repository specs)
- [ ] Technical architecture in repository specs supports roadmap implementation requirements
- [ ] No contradictory information exists between documents
- [ ] Community-facing language is consistent between README and milestones
- [ ] Technical detail level is appropriate for each document's audience
- [ ] Cross-references and links remain valid

## Document-Specific Guidelines

### implementation-roadmap.md (Source of Truth)

- **Audience**: Development team and detailed planners
- **Content**: Comprehensive phase specifications with full deliverables and success criteria
- **Updates**: Make changes here first, then synchronize to other documents

### repository-specifications.md (Technical Architecture)

- **Audience**: Development team and technical contributors
- **Content**: Detailed repository structures, capabilities, and cross-repository integration
- **Updates**: Must align with roadmap phase requirements and deliverable implementations

### MILESTONES_STRATEGY.md (Community Milestones)

- **Audience**: Community contributors and project stakeholders
- **Content**: Community-focused milestone definitions with deliverables and value propositions
- **Updates**: Extract key deliverables and community value from roadmap changes

### README.md (Public Overview)

- **Audience**: General community and new contributors
- **Content**: High-level development priorities and feature summaries
- **Updates**: Create concise summaries of roadmap phases for broader audience

## Example Synchronization Workflow

### Scenario: Adding New Deliverable to Phase 2

1. **Update implementation-roadmap.md**:
   ```markdown
   - [ ] New feature for community feedback integration
   ```

2. **Update repository-specifications.md**:
   ```markdown
   **Feedback Integration API**:
   - REST endpoints for community feedback collection
   - Integration with GitHub Discussions API
   ```

3. **Update MILESTONES_STRATEGY.md**:
   ```markdown
   - [ ] Community feedback integration and validation processes
   ```

4. **Update README.md**:
   ```markdown
   - [ ] Community feedback integration and validation workflows
   ```

### Scenario: Restructuring Phase Goals

1. **Update roadmap phase goal statement**
2. **Update milestone "Phase Goal" and "Community Value"**
3. **Update README phase description to match new focus**
4. **Verify all deliverables still align with new goal**

## Quality Assurance

### Automated Checks

- QA workflow validates markdown formatting across all three documents
- No automated content synchronization checks (manual responsibility)

### Manual Review

- Always review synchronized changes in all three documents before committing
- Consider having another team member review cross-document consistency
- Test that the community story flows logically from README  Milestones  Roadmap

### Commit Best Practices

- Include all synchronized documents in a single commit when possible

## Common Synchronization Patterns

### Adding New Features

1. Define in roadmap with full technical detail
2. Summarize community value for milestones
3. Create high-level bullet point for README

### Refining Deliverables

1. Update roadmap with refined specifications
2. Adjust milestone deliverables to match refined scope
3. Update README if the change affects high-level understanding

### Phase Restructuring

1. Restructure roadmap phases first
2. Update repository specifications to support new phase architecture
3. Update milestone dependencies and sequencing
4. Revise README Development Priorities to match new structure

### Architectural Changes

1. Update repository specifications with new technical requirements
2. Ensure roadmap phases align with architectural capabilities
3. Update milestone deliverables to reflect architectural changes
4. Update README if architectural changes affect user-facing features

---

Following these synchronization guidelines ensures that all stakeholders from detailed implementers to community contributors
have consistent, accurate information about the project's development direction.
