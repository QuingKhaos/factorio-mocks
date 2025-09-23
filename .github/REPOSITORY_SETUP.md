# GitHub Repository Setup Guide

This document provides step-by-step instructions for setting up the GitHub repository infrastructure for the
Factorio Mocks Ecosystem.

**Current Status**: 🚧 **Setup in Progress** - This is the first repository (central hub) of the five-repository
ecosystem currently being configured.

**Important Note**: The `factorio-mocks-data` repository uses `stable` as its main branch (aligns with Factorio's
stable/experimental release naming familiar to modders). All other repositories use the standard `main` branch.

## Repository Settings Configuration

### 1. General Settings

Navigate to **Settings > General** and configure:

#### Repository Details

- **Description**: "Comprehensive testing infrastructure for Factorio mod development - Planning & coordination hub"
- **Website**: Leave empty for now (can add documentation site later)
- **Topics**: Add these tags for discoverability:
  - `factorio`
  - `factorio-mod`
  - `testing`
  - `mocking`
  - `lua`
  - `game-development`
  - `testing-framework`

#### Features

- ✅ **Wikis**: Disabled (using documentation in repo instead)
- ✅ **Issues**: Enabled
- ✅ **Sponsorships**: Enabled (Ko-fi link already in README)
- ✅ **Preserve this repository**: Enabled
- ✅ **Projects**: Enabled
- ✅ **Discussions**: Enabled

#### Centralized Issue Tracking

**Important**: The `factorio-mocks` repository serves as the central hub for issue tracking across the entire ecosystem.
Issues for all repositories should be filed here:

- **Issues enabled**: Only in `factorio-mocks` (this repository)
- **Issues disabled**: In all other ecosystem repositories (`factorio-mocks-generator`, `factorio-mocks-modpacks`,
  `factorio-mocks-data`, `factorio-mocks-loader`)
- **Component selection**: Issue templates include dropdown to specify which repository/component is affected
- **Benefits**: Unified tracking, better coordination, simplified contributor workflow

**Action Required**: When creating the other repositories, disable Issues in their repository settings to direct all
issue traffic here.

#### Pull Requests

- ❌ **Allow merge commits**: Disabled (enforcing linear history)
- ✅ **Allow squash merging**: Enabled (required for linear history)
- ❌ **Allow rebase merging**: Disabled (enforcing squash-only workflow)
- ✅ **Always suggest updating pull request branches**: Enabled
- ❌ **Allow auto-merge**: Disabled
- ✅ **Automatically delete head branches**: Enabled
- ✅ **Default to PR title for squash merge commits**: Enabled

**Linear History Policy**: To maintain a clean, linear commit history on `main`, only squash merging is allowed.
PR titles should follow conventional commit format as they become the commit message.

### 2. Branch Protection Rules

Navigate to **Settings > Branches** and add protection for the main branch:

#### Branch Protection Rule for Main Branch

- **Branch name pattern**: `main` (or `stable` for `factorio-mocks-data` repository)
- ✅ **Require a pull request before merging**
  - ❌ **Require approvals**: 0 required (single developer workflow)
  - ✅ **Dismiss stale reviews when new commits are pushed**: Enabled
  - ❌ **Require review from code owners**: Disabled (single developer workflow)
  - ✅ **Require conversation resolution before merging**
- ✅ **Require status checks to pass before merging**
  - ✅ **Require branches to be up to date before merging**
  - **Required status checks**: Add `Documentation Quality and Linting` (from QA workflow)
- ❌ **Require signed commits**: Disabled (would require ALL commits in PRs to be signed, creating contributor barrier)
- ✅ **Require linear history**: Enabled
- ❌ **Allow force pushes**: Disabled
- ❌ **Allow deletions**: Disabled

**Commit Signing Strategy**: While signed commits provide cryptographic verification, requiring them creates barriers
for community contributors who haven't set up GPG keys:

- **GitHub's behavior**: "Require signed commits" applies to ALL commits in PR branches, not just the squashed commits
- **Current approach**: No signing requirement - prioritizes accessibility for contributors
- **Squash merging via GitHub web**: Creates commits signed by GitHub's key regardless of original commit signatures
- **Future consideration**: Could enable signing requirements after established contributor base with GPG setup
- **Alternative**: Maintainers can manually sign important commits when merging locally if desired

**Single Developer Workflow**: Currently configured for sole maintainer workflow. When additional collaborators join:

1. **Enable approval requirements**: Set to 1 required approval
2. **Add CODEOWNERS file**: Define code ownership for different areas
3. **Enable review dismissal**: Automatically dismiss stale reviews on new commits
4. **Consider draft PRs**: Use draft PRs for work-in-progress that shouldn't be merged yet

### 3. Security Settings

Navigate to **Settings > Security**:

#### Code Security and Analysis

- ✅ **Private vulnerability reporting**: Enabled
- ✅ **Dependency graph**: Enabled
- ✅ **Dependabot alerts**: Enabled
- ✅ **Dependabot security updates**: Enabled
- ✅ **Dependabot grouped security updates**: Enabled (bundles related security fixes into single PRs)
- ✅ **Dependabot version updates**: Enable and configure (see `.github/dependabot.yml` below)
- ❌ **Code scanning**: Not available (CodeQL doesn't support Lua - manual code review required)
- ✅ **Secret scanning**: Enabled

#### Dependabot Configuration

Create `.github/dependabot.yml`:

```yaml
version: 2
updates:
  # GitHub Actions dependencies
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
    commit-message:
      prefix: "chore"
      prefix-development: "chore"
      include: "scope"
    labels:
      - "type: maintenance"
      - "component: ci-cd"
    open-pull-requests-limit: 5
```

**Key Features**:

- **Scheduled Updates**: Weekly for GitHub Actions (LuaRocks not supported by Dependabot)
- **Automatic Labels**: PRs are automatically labeled for easy categorization
- **Conservative Limits**: Limited number of open PRs to avoid overwhelming maintainers
- **Future Planning**: Ready to add npm, Python, or other supported ecosystems as needed
- **Manual Lua Management**: LuaRocks dependencies will require manual updates and security monitoring

### 4. Actions Settings

Navigate to **Settings > Actions > General**:

#### Actions Permissions

- ❌ **Allow all actions and reusable workflows**: Disabled
- ✅ **Allow actions created by GitHub**: Enabled
- ✅ **Allow actions by Marketplace verified creators**: Enabled

#### Workflow Permissions

- **Read and write permissions**: Enabled (for automated documentation updates)
- ✅ **Allow GitHub Actions to create and approve pull requests**: Enabled

## Repository Labels Setup

### Automated Label Setup

Use the provided PowerShell script to automatically create all required labels and remove default GitHub labels:

```powershell
# Run the automated label setup script
PowerShell -ExecutionPolicy Bypass -File .\.github\scripts\setup-labels.ps1
```

**What the script does**:

- **Creates 21 standardized labels** organized in categories:
  - **Effort Labels**: `effort: quick-win`, `effort: moderate`, `effort: substantial`
  - **Type Labels**: `type: bug`, `type: feature`, `type: documentation`, `type: maintenance`
  - **Component Labels**: `component: architecture`, `component: ci-cd`, `component: planning`, `component: templates`
  - **Ecosystem Labels**: `ecosystem: generator`, `ecosystem: modpacks`, `ecosystem: data`, `ecosystem: loader`
  - **Special Labels**: `adr`, `breaking-change`, `good-first-issue`, `help-wanted`, `needs-discussion`, `blocked`

- **Removes default GitHub labels** that don't fit our workflow:
  - `bug`, `documentation`, `duplicate`, `enhancement`, `good first issue`, `help wanted`, `invalid`, `question`, `wontfix`

- **Provides detailed output** showing which labels were created, updated, or removed

**Note**: The script requires GitHub CLI (`gh`) to be installed and authenticated. If you prefer manual setup,
you can view the individual commands in the script file.

## Additional Configurations

### 1. Discussions Setup

Navigate to **Settings > Features** and enable **Discussions**, then:

1. Go to **Discussions** tab
2. **Configure category descriptions** - GitHub provides these by default, update their descriptions:

   **Default Categories to Update**:
   - **💬 General** (speech_balloon): "General discussion about the Factorio Mocks Ecosystem - share ideas, ask
     questions, connect with the community"
   - **💡 Ideas** (bulb): "Feature requests and enhancement suggestions for any of the five ecosystem repositories"
   - **❓ Q&A** (question): "Questions about using, contributing to, or understanding the Factorio Mocks Ecosystem"
   - **🎪 Show and tell** (circus_tent): "Share your mod testing setups, integration examples, or other community contributions"
   - **📢 Announcements** (loudspeaker): "Official project updates, releases, milestones, and important ecosystem news"
   - **📊 Polls** (bar_chart): "Community voting on feature priorities, architectural decisions, and project direction"

3. **Add custom category**:
   - **🏗️ Architecture** (building_construction): "Technical discussions about system design, cross-repository
     coordination, and ecosystem architecture decisions"

**Recommended approach**: Keep all default categories as they provide good coverage for different types of community
engagement. The **Polls** category can be particularly useful for gathering community input on architectural decisions
or feature priorities.

### 2. Project Board Setup

#### Initial Project Creation

1. Go to **Projects** tab
2. Click **New project**
3. Use **Kanban** template
4. Configure the project details:

**Project Configuration**:

- **Project name**: `Factorio Mocks Development`
- **Template**: Kanban

#### Project Settings Configuration

After creating the project, configure these settings by clicking the **⚙️ Settings** icon:

##### General Settings

- **Project name**: `Factorio Mocks Development`
- **Short description**: `Coordinating development across the five-repository Factorio Mocks Ecosystem`
- **README**: Enable and add comprehensive project documentation (see template below)
- **Visibility**: Public
- **Base role**: Read (allows community members to view progress)

##### Project README Template

Enable the README and use this template:

```markdown
# Factorio Mocks Development Board

Welcome to the development coordination center for the **Factorio Mocks Ecosystem** - a comprehensive five-repository system providing mock data for Factorio mod development.

## 🎯 Project Overview

This Kanban board tracks development progress across all five ecosystem repositories:

- `factorio-mocks` - Central planning and coordination hub
- `factorio-mocks-generator` - Automated data extraction from Factorio
- `factorio-mocks-modpacks` - Curated mod combinations and configurations
- `factorio-mocks-data` - Generated mock data artifacts
- `factorio-mocks-loader` - Runtime library for consuming mock data

## 📊 Board Workflow

### Columns Explained

- **New** 🆕 - Recently created issues needing triage (ecosystem, component, effort assignment)
- **Ready** ✅ - Fully triaged and prioritized issues ready for development work to begin
- **In Progress** 🔄 - Issues currently being actively worked on
- **In Review** 👀 - Pull requests awaiting review and completed work awaiting community feedback or testing
- **Done** ✅ - Merged PRs and completed issues ready for release

### Triage Workflow

**New → Ready**: Issues move from "New" to "Ready" when they have been fully triaged with:
- ✅ **Ecosystem label** assigned (`ecosystem: generator`, `ecosystem: data`, etc.)
- ✅ **Component label** assigned (`component: architecture`, `component: ci-cd`, etc.)
- ✅ **Effort estimate** assigned (`effort: quick-win`, `effort: moderate`, `effort: substantial`)
- ✅ **Type classification** assigned (`type: bug`, `type: feature`, etc.)
- ✅ **Milestone** assigned (if applicable)

### How to Contribute

1. **Browse the board** to see what's being worked on
2. **Look for `good-first-issue` labels** for beginner-friendly tasks
3. **Check effort labels** to find tasks matching your available time:
   - `effort: quick-win` - Can be completed in a few hours
   - `effort: moderate` - Requires 1-2 days of focused work
   - `effort: substantial` - Multi-day or complex implementation
4. **Comment on issues** to ask questions or offer help
5. **Reference ecosystem components** using the component labels for clarity

## 🏗️ Current Phase: Foundation Setup (In Progress)

We're actively working on establishing the foundation with these key deliverables:

- ✅ Complete planning documentation and architectural decisions
- 🔄 GitHub repository infrastructure setup (first repository - this one!)
- ⏳ Create remaining four ecosystem repositories
- ⏳ Basic project website and community onboarding

## 🎯 Milestone Integration

Issues are organized by these major milestones:

- **Foundation Complete** - Core infrastructure and planning
- **Generator Prototype** - First working data extraction prototype
- **Ecosystem Integration** - Cross-repository automation and coordination
- **Community Ready** - Public release with full documentation

## 📈 Progress Tracking

- **Repository**: All issues tracked centrally in `factorio-mocks` repository
- **Labels**: Comprehensive system for effort, type, component, and ecosystem coordination
- **Automation**: GitHub Actions handle quality assurance and documentation updates
- **Community**: Discussions enabled for broader architectural and feature conversations

## 🤝 Community First

This project follows a community-first development philosophy:

- **Transparency**: All planning and development visible on this board
- **Accessibility**: Multiple contribution levels supported with clear guidance
- **Iteration**: Continuous feedback preferred over formal processes
- **Documentation**: Everything documented to support contributor onboarding

---

**Latest Update**: 🚧 **Active Development** - Setting up the first repository of five in the ecosystem. Foundation
phase in progress with repository infrastructure being configured.
```

##### Access and Permissions

- **Base role**: Read (community can view but not edit)
- **Maintain role**: Write (for active contributors)
- **Admin role**: Admin (for project maintainers)

#### Label Integration

The project board automatically leverages the existing comprehensive label system instead of duplicating information
with custom fields:

**Existing Labels Already Provide**:

- **Effort tracking**: `effort: quick-win`, `effort: moderate`, `effort: substantial`
- **Component identification**: `component: architecture`, `component: ci-cd`, `component: planning`, `component: templates`
- **Ecosystem coordination**: `ecosystem: generator`, `ecosystem: modpacks`, `ecosystem: data`, `ecosystem: loader`
- **Type classification**: `type: bug`, `type: feature`, `type: documentation`, `type: maintenance`
- **Community guidance**: `good-first-issue`, `help-wanted`, `needs-discussion`

**GitHub Milestones handle phase tracking** rather than custom fields, providing better integration with GitHub's
native project management features.

#### Automation Rules

GitHub Projects provides limited automation capabilities. You can only modify the default workflow, not create custom ones:

**Available Default Workflow Modifications**:

1. **Auto-add to project**: Automatically add new issues/PRs from the repository to this project
   - Configure to add **both issues and pull requests**
   - Essential for ensuring nothing falls through the cracks
   - Both issues and PRs will use the same default status (typically "New")

2. **Item added to project**: Configure what happens when items are added
   - Set default status (applies to both issues and PRs equally)
   - Cannot differentiate between issues and PRs - they all get the same treatment
   - Typically set to "New" for initial triage

3. **Item reopened**: Configure what happens when issues/PRs are reopened
   - Move back to "New" or "Ready" status

4. **Item closed**: Configure what happens when issues/PRs are closed
   - Automatically move to "Done" status
   - Applies to both merged PRs and closed issues

5. **Code changes requested**: Configure automatic handling when PR reviews request changes
   - **Recommended**: Set status to "In Progress" when changes are requested
   - **Benefits**: Automatically moves PRs back to work status without manual intervention
   - **Workflow**: PR moves from "In Review" → "In Progress" → "In Review" (when ready)

6. **Auto-archive items**: Configure automatic archiving of completed items
   - **Recommended**: Auto-archive after **30 days** in "Done" status
   - **Benefits**: Keeps board clean and focused on current work
   - **Alternative**: Manual archiving during foundation phase for full visibility

**Manual Workflow Management**:

Since custom automation workflows aren't available, the project relies on:

- **Manual status updates**: Team members update card status as work progresses
  - Issues: New → Ready → In Progress → Done
  - PRs: Mostly automated via GitHub workflows (see automation rules above)
- **PR Status Guidelines**:
  - **New**: Just created, awaiting initial triage
  - **In Progress**: Draft PRs or PRs with requested changes (automated via workflow #5)
  - **In Review**: Ready for review, not a draft, no outstanding change requests
  - **Done**: Merged and completed (automated via workflow #4)
- **Label-based organization**: Use views and filters based on existing labels
- **Milestone tracking**: GitHub milestones provide phase organization
- **Regular board maintenance**: Weekly review to ensure cards are in correct columns

#### Project Views

GitHub Projects provides different view types with varying filtering capabilities:

**Board Views (Limited Filtering)**:

- **Default Board View**: Standard Kanban columns (New, Ready, In Progress, In Review, Done)
- **Group by Milestone**: Can group items by GitHub milestone (as you've configured)
- **No custom filtering**: Board views cannot be filtered by labels or other criteria

**Table Views (Advanced Filtering)**:

- **Default table views**: Include views like "In Review" that filter by status
- **Custom table views**: Can create new table views with label-based filtering
- **Advanced filtering**: Filter by labels, assignees, milestones, status, and other fields
- **Multiple filters**: Combine multiple criteria (e.g., specific labels + milestone + status)

**Recommended Additional Table Views**:

1. **Quick Wins**: Filter by `effort: quick-win` label for contributors looking for short tasks
2. **Community Ready**: Filter by `good-first-issue` and `help-wanted` labels for new contributors
3. **Blocked Items**: Filter by `blocked` label for visibility and resolution

**Note**: While table views can filter by specific `component:` or `ecosystem:` labels, creating separate views for each
would result in too many views (4 components × 4 ecosystems = 16+ views). Instead, use the comprehensive labels for
manual identification within existing views.

**Why This Multi-View Approach Works Well**:

- **Board for workflow**: Use board view for drag-and-drop status management
- **Tables for filtering**: Use table views to focus on specific work types or priorities
- **Label-based organization**: Create focused table views filtered by labels
- **Milestone tracking**: Both board and table views can group/filter by milestones
- **Community transparency**: Different stakeholders can use the view that works best for them
- **Comprehensive coverage**: Board shows workflow, tables show filtered subsets

This completes the core GitHub repository setup for the Factorio Mocks Ecosystem!
