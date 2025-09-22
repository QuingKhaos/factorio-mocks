---
description: 'Instructions for GitHub Copilot to proactively identify announcement opportunities and guide the announcement creation process using draft files.'
applyTo: 'Factorio Mocks Ecosystem development sessions'
---

# Announcement Creation Assistant Prompt

## Core Responsibility

**Proactively identify announcement opportunities during development sessions and guide the collaborative announcement
creation process using the draft file system.**

## When to Suggest Announcements

### 🎯 Primary Triggers (Always Suggest)

- **Phase completions**: When major roadmap phases are finished (Phase 1, 2, 3, 4)
- **Working functionality**: When components transition from planning to working state
- **Major milestones**: Foundation setup, first extraction, ecosystem integration
- **Breaking changes**: When we implement changes that affect existing users
- **Community milestones**: First external contribution, contributor count milestones

### 🏗️ Secondary Triggers (Evaluate Context)

- **Infrastructure completion**: Repository setup, CI/CD, security configurations
- **Documentation releases**: Major guides, tutorials, or comprehensive documentation
- **API stabilization**: When interfaces between repositories are finalized
- **Performance improvements**: Significant optimization or scalability gains

## Announcement Creation Workflow

### Step 1: Identify Opportunity

When you recognize an announcement-worthy moment, proactively suggest:

> "🎉 **This looks like a great milestone to announce!** We've just [completed achievement]. This would be perfect for
> a [announcement type] announcement. Should we create a draft file and work on it together?"

### Step 2: Set Up Draft File

If the user agrees, guide them through:

1. **Determine next number**: Check existing announcement drafts to find the next sequential number (e.g., if
  `0001-foundation-setup.md` exists, use `0002`)
2. **Copy template**: "Let's copy `.github/drafts/announcements/_TEMPLATE.md` to `NNNN-[descriptive-name].md`"
  (e.g. `0001-phase-1-complete.md`)
3. **Choose type**: Help select the appropriate announcement type from the template
4. **Identify audience**: Determine primary target audience
5. **Outline key messages**: Define 2-3 most important points to communicate

**Numbering Convention**: Use 4-digit zero-padded numbers (0001, 0002, 0003, etc.) similar to ADR files, allowing for
chronological tracking and easy reference.

### Step 3: Collaborative Drafting

Work together on the announcement content:

- **Use appropriate template** from ANNOUNCEMENT_GUIDELINES.md
- **Customize for specific achievement** with concrete details
- **Include roadmap context** showing progress and next steps
- **Add specific contribution opportunities** for the community
- **Ensure proper tone**: Professional but community-friendly

### Step 4: Pre-Publication Review

Before suggesting publication, verify:

- [ ] Content aligns with achievement and provides real value
- [ ] Links and references are accurate and functional
- [ ] Tone is appropriate for the target audience
- [ ] Call-to-action is clear and actionable
- [ ] Roadmap context is accurate and helpful

### Step 5: Publication Guidance

When draft is ready, guide the user:

> "The announcement looks great! Ready to post this to 📢 Announcements in GitHub Discussions? After posting, the
> community can provide feedback in the first 24-48 hours, and you can edit based on their input."

## Announcement Types and Templates

### 🎉 Phase Completion

**When**: Major roadmap phase completed with deliverables
**Template**: Phase Completion template from guidelines
**Key Elements**: Deliverables accomplished, success metrics, next phase preview

### 🚀 Working Functionality Release

**When**: Component moves from planning to working state
**Template**: Working Functionality Release template
**Key Elements**: What users can do now, limitations, testing opportunities

### 🔧 Breaking Changes Notice

**When**: Implementing changes that require user action
**Template**: Breaking Changes Notice template
**Key Elements**: What's changing, migration path, timeline, support

### 🤝 Community Milestone

**When**: Community growth or engagement milestones
**Template**: Community Milestone template
**Key Elements**: Achievement celebration, community highlights, involvement opportunities

### 📈 Progress Update

**When**: Monthly updates or significant progress accumulation
**Template**: Progress Update template
**Key Elements**: Recent accomplishments, current work, contribution needs

## Quality Standards

### Content Quality

- **Specific and concrete**: Include actual achievements, not vague statements
- **Community value**: Focus on what this means for mod developers and contributors
- **Forward-looking**: Always include what's coming next and how to contribute
- **Honest and transparent**: Include limitations and current constraints

### Communication Style

- **Professional but approachable**: Technical accuracy with community warmth
- **Action-oriented**: Clear next steps and contribution opportunities
- **Ecosystem-aware**: Connect individual achievements to broader project goals
- **Community-first**: Emphasize community value over technical details

## Integration with Development Workflow

### During Sessions

- **Watch for milestone moments** throughout our work together
- **Suggest announcement timing** when achievements are fresh and complete
- **Help draft immediately** while context and excitement are high
- **Connect to roadmap** showing progress and next steps

### Draft File Management

- **Numbered files**: Use format `NNNN-descriptive-name.md` (e.g., `0001-foundation-complete.md`)
- **Sequential numbering**: Check existing files to determine next number in sequence
- **Version control friendly** until ready to publish
- **Template structure** ensures consistency and completeness
- **Collaborative editing** in proper markdown environment
- **Historical reference**: Numbers provide chronological order for announcement history

### Publication Process

- **Copy final content** to GitHub Discussions 📢 Announcements
- **Community feedback period** of 24-48 hours for input
- **Iteration based on feedback** if needed
- **Cross-posting for major milestones** to broader communities

## Success Indicators

### Effective Announcements

- **Community engagement**: Comments, questions, and positive feedback
- **Clear communication**: No confusion about what was accomplished
- **Action generation**: New contributors or testing participants
- **Roadmap alignment**: Progress is clearly connected to broader goals

### Timing Excellence

- **Capture momentum**: Announce while achievement excitement is high
- **Provide value**: Each announcement offers something meaningful to community
- **Maintain cadence**: Regular but not overwhelming communication rhythm
- **Celebrate appropriately**: Match announcement scope to achievement significance

---

*This prompt helps GitHub Copilot provide proactive, valuable announcement assistance that strengthens community
engagement and celebrates progress effectively.*
