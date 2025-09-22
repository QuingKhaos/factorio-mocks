---
description: 'Instructions for maintaining synchronization between planning documents when changes are made to the implementation roadmap. Ensures consistency across README.md, MILESTONES_STRATEGY.md, and implementation-roadmap.md.'
applyTo: 'planning/implementation-roadmap.md'
---

# Planning Document Synchronization Instructions

## Core Principle

**When making changes to planning/implementation-roadmap.md, you must ensure that related documents remain synchronized
to maintain consistency across all planning materials.**

The three key documents that must stay aligned are:

- planning/implementation-roadmap.md (source of truth for detailed planning)
- .github/MILESTONES_STRATEGY.md (milestone definitions and deliverables)
- README.md (high-level development priorities for community)

## Synchronization Requirements

### When Updating Phase Structure or Deliverables

**If you modify phase goals, deliverables, or success criteria in implementation-roadmap.md:**

1. **Check MILESTONES_STRATEGY.md**:
   - Update corresponding milestone "Key Deliverables" to match roadmap changes
   - Ensure "Success Metrics" align with roadmap success criteria
   - Verify "Community Value" statements reflect updated phase goals

2. **Check README.md**:
   - Update "Development Priorities" section to reflect major changes
   - Ensure phase descriptions are concise but accurate summaries
   - Maintain consistency in terminology and feature names

### Specific Synchronization Points

#### Phase Deliverables Changes

- **Roadmap**: Detailed deliverable lists with checkboxes
- **Milestones**: High-level deliverable summaries focusing on community value
- **README**: Concise bullet points highlighting key features

#### Success Criteria Updates

- **Roadmap**: Detailed technical and functional success criteria
- **Milestones**: Community-focused success metrics and validation checkpoints
- **README**: Not directly included, but should influence phase descriptions

#### New Phase Additions

- **Roadmap**: Complete phase specification with all sections
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

- [ ] All three documents use consistent terminology for features and phases
- [ ] Phase goals align across all documents (detailed in roadmap, summarized in others)
- [ ] No contradictory information exists between documents
- [ ] Community-facing language is consistent between README and milestones
- [ ] Technical detail level is appropriate for each document's audience
- [ ] Cross-references and links remain valid

## Document-Specific Guidelines

### implementation-roadmap.md (Source of Truth)

- **Audience**: Development team and detailed planners
- **Content**: Comprehensive phase specifications with full deliverables and success criteria
- **Updates**: Make changes here first, then synchronize to other documents

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
   `markdown
   - [ ] New feature for community feedback integration
   `

2. **Update MILESTONES_STRATEGY.md**:
   `markdown
   - [ ] Community feedback integration and validation processes
   `

3. **Update README.md**:
   `markdown
   - [ ] Community feedback integration and validation workflows
   `

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
2. Update milestone dependencies and sequencing
3. Revise README Development Priorities to match new structure

---

Following these synchronization guidelines ensures that all stakeholders from detailed implementers to community contributors
have consistent, accurate information about the project's development direction.
