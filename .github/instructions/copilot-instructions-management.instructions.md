---
description: 'Guidelines for maintaining and updating copilot instructions to ensure they remain accurate, valuable, and aligned with project evolution.'
applyTo: '.github/copilot-instructions.md'
---

# Copilot Instructions Management Guidelines

## Core Principle

**Copilot instructions should evolve with the project, capturing accumulated wisdom and established patterns that make
future development more effective.**

The `.github/copilot-instructions.md` file serves as the project's "institutional memory" for GitHub Copilot, ensuring
consistent context and approach across development sessions.

## When to Update Copilot Instructions

### ✅ Major Update Triggers

#### Phase Transitions

- Moving between development phases (Foundation → Generator Prototype → Integration → Community)
- Completion of major milestones with lessons learned
- Shift from planning to implementation or implementation to community adoption

#### Architectural Changes

- New ADRs that significantly change ecosystem design
- Technology stack changes or major tool adoption
- Repository structure changes or new repositories added
- Breaking changes in development approach or philosophy

#### Workflow Evolution

- New development tools, processes, or standards adopted
- Changes to contribution workflow or community guidelines
- Updated quality assurance measures or review processes
- New automation scripts or CI/CD workflow changes

#### Context Accumulation

- Established patterns or preferences that should guide future decisions
- Lessons learned that prevent common mistakes or improve efficiency
- Philosophy clarifications (e.g., "never commit to timelines in documentation")
- New constraints or requirements that affect decision making

### ❌ Don't Update For

#### Minor Changes

- Individual bug fixes or small documentation updates
- Routine maintenance tasks or dependency updates
- Minor wording changes or typo corrections
- Single ADRs unless they represent major architectural shifts

#### Temporary States

- Work-in-progress or experimental changes
- Pending decisions or incomplete implementations
- Short-term troubleshooting or debugging contexts

## Update Quality Guidelines

### Accuracy Over Completeness

- **Current Status**: Always reflect the actual current state, not planned or aspirational state
- **Specific Examples**: Include concrete examples rather than abstract principles
- **Factual Information**: Distinguish between established facts and evolving decisions

### Context Hierarchy

**Essential Context** (always include):

- Project overview and architecture
- Current development phase and status
- Established patterns and standards
- Key constraints and requirements

**Important Context** (include when relevant):

- Recent architectural decisions
- Active development workflows
- Community guidelines and processes
- Technical tooling and infrastructure

**Supplementary Context** (include selectively):

- Historical context for major decisions
- Future considerations and planning
- Detailed implementation specifics

### Maintainability Standards

#### Clear Organization

- Use consistent heading structure and navigation
- Group related information logically
- Maintain quick reference sections for frequently needed information

#### Actionable Information

- Provide specific guidance rather than general principles
- Include examples and templates where helpful
- Reference relevant files and documentation

#### Version Awareness

- Update file structure information when directories change
- Reflect current tooling and process state
- Remove outdated information that could mislead

## Configuration Synchronization

### Instruction Files with Configuration Dependencies

Some instruction files depend on project configuration files and must be kept synchronized:

#### `.github/instructions/markdown-writing-standards.instructions.md`

**Depends on**: `.markdownlint.json`

**Sync Requirements**:

- Line length limits must match `line-length` setting
- Allowed code languages must match `fenced-code-language.allowed_languages`
- Proper nouns must match `proper-names.names`
- Style preferences must match all style-related rules

**Sync Process**:

1. **Automated Detection**: GitHub Actions should flag when `.markdownlint.json` changes
2. **Manual Review**: Compare instruction file against new configuration
3. **Update Instructions**: Modify instruction file to match new rules
4. **Validate Changes**: Ensure examples and guidelines reflect new configuration

**Sync Script Location**: `.github/scripts/sync-markdown-instructions.ps1` (when implemented)

#### Future Configuration Dependencies

As the project evolves, other instruction files may develop configuration dependencies:

- CI/CD instruction files → `.github/workflows/*.yml` changes
- Code style instruction files → `.editorconfig`, etc.
- Security instruction files → `.github/dependabot.yml`, security policies

### Automated Sync Strategy

#### GitHub Actions Integration

```yaml
# Add to .github/workflows/qa.yml
- name: Check Config Sync
  run: |
    # Compare markdownlint config with instruction file
    # Flag mismatches for manual review
```

#### Manual Sync Checklist

When `.markdownlint.json` changes:

- [ ] Review `markdown-writing-standards.instructions.md` for accuracy
- [ ] Update line length references if changed
- [ ] Update allowed code languages list if changed
- [ ] Update proper nouns list if changed
- [ ] Update style requirements if changed
- [ ] Update examples to match new rules
- [ ] Test instruction file examples against new configuration
- [ ] Commit with message explaining sync update

## Update Process

### Proactive Monitoring

GitHub Copilot should automatically track when significant context changes occur:

- **Decision Impact**: Note when decisions affect broader project context
- **Pattern Recognition**: Identify when new patterns become established
- **Context Accumulation**: Track when enough small changes create significant context shift
- **Contradiction Detection**: Flag when new information contradicts existing instructions

### Update Workflow

1. **Identify Update Need**: Recognize when accumulated changes warrant update
2. **Draft Changes**: Prepare specific additions, modifications, or removals
3. **Explain Rationale**: Document why changes are needed and what they accomplish
4. **Review Impact**: Consider how changes affect overall instruction coherence
5. **Apply Updates**: Make changes with clear commit messages explaining the evolution

### Quality Checks

#### Accuracy Verification

- [ ] Current status section reflects reality
- [ ] File structure matches actual repository state
- [ ] Process descriptions match established workflows
- [ ] Technical details are current and correct

#### Completeness Review

- [ ] Essential context is present and clear
- [ ] New patterns and standards are documented
- [ ] Important constraints and requirements are captured
- [ ] Quick reference information is up to date

#### Usability Assessment

- [ ] Information is well-organized and easy to navigate
- [ ] Examples and templates are helpful and current
- [ ] Instructions provide actionable guidance
- [ ] Content supports effective development workflow

## Update Frequency Philosophy

### Quality Over Frequency

- **Better**: Fewer, substantial updates that capture significant context changes
- **Worse**: Frequent minor tweaks that add noise without meaningful value
- **Goal**: Each update should meaningfully improve Copilot's effectiveness

### Milestone-Based Updates

- **Phase Completion**: Update when completing major development phases
- **Quarterly Reviews**: Periodic comprehensive review and refresh
- **Event-Driven**: Update for significant architectural or process changes

### Evolutionary Approach

- **Accumulate Context**: Gather insights and patterns over time
- **Threshold Updates**: Update when accumulated changes reach significance
- **Continuous Improvement**: Each update should make instructions more valuable

## Content Guidelines

### Project Context Sections

#### Project Overview

- Keep architecture description current with actual implementation
- Update status to reflect real progress, not aspirational goals
- Maintain accurate repository and ecosystem information

#### Development Philosophy

- Document established principles and approaches
- Include specific examples of philosophy in practice
- Update when philosophy evolves through experience

#### Technical Context

- Reflect current tooling and infrastructure state
- Update technology stack information as it changes
- Include relevant integration points and dependencies

### Process Documentation

#### Development Workflow

- Document established patterns and procedures
- Include specific examples and templates
- Update when workflows evolve or improve

#### Quality Standards

- Maintain current coding and documentation standards
- Include specific quality criteria and review processes
- Update when standards evolve or new ones are established

#### Community Guidelines

- Keep community processes and guidelines current
- Include specific examples of community interaction patterns
- Update when community approaches evolve

### Reference Information

#### File Structure

- Maintain accurate directory and file organization
- Update when repository structure changes
- Include key files and their purposes

#### Quick Reference

- Keep frequently needed information easily accessible
- Update key commands, processes, and links
- Maintain relevance to current development needs

## Common Patterns

### Status Updates

When project phase changes:

```markdown
- **Phase**: [Current phase name] - [brief status description]
- **Next Phase**: [Next logical step without timeline commitment]
- **GitHub Setup**: [Current state of infrastructure]
```

### Context Addition

When new patterns emerge:

```markdown
### [New Section Title]

**[Pattern Name]**: [Description of established pattern]
- Key characteristic 1
- Key characteristic 2
- Specific example or implementation detail
```

### Historical Context

When documenting lessons learned:

```markdown
**[Decision/Approach]**: [What was learned and why it matters]
- Context: [Background that led to this learning]
- Impact: [How this affects future decisions]
- Implementation: [Specific guidance for applying this learning]
```

## Integration with Project Evolution

### Phase Alignment

Copilot instructions should evolve in harmony with project phases:

- **Foundation Phase**: Focus on planning, documentation, and infrastructure setup
- **Prototype Phase**: Add implementation patterns and technical guidance
- **Integration Phase**: Include cross-repository coordination and ecosystem patterns
- **Community Phase**: Emphasize community interaction and adoption patterns

### Ecosystem Coordination

As the five-repository ecosystem develops:

- **Cross-Repository Patterns**: Document coordination approaches and standards
- **Shared Infrastructure**: Include common tooling and process information
- **Ecosystem Navigation**: Help Copilot understand relationships between repositories

### Community Growth

As community involvement increases:

- **Contribution Patterns**: Document established community interaction patterns
- **Review Processes**: Include community review and feedback integration approaches
- **Communication Standards**: Maintain current community communication guidelines

---

## Summary

Effective copilot instructions management ensures that GitHub Copilot remains a valuable development partner throughout
project evolution. By focusing on accuracy, relevance, and actionable guidance, these instructions support consistent,
high-quality development that aligns with project goals and community values.

**Key Success Metrics**:

- Copilot provides contextually appropriate suggestions
- Development workflow remains consistent across sessions
- New contributors can quickly understand project context
- Established patterns and standards are consistently applied
