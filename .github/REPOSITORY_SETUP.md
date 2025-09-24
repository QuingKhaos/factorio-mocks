# GitHub Repository Setup Guide

This document provides step-by-step instructions for setting up the GitHub repository infrastructure for the
Factorio Mocks Ecosystem.

**Current Status**: 🚀 **Ready for Repository Creation** - Planning alignment complete. About to create the remaining
four repositories of the five-repository ecosystem. Foundation phase transitioning from planning to implementation.

**Important Note**: The `factorio-mocks-data` repository uses `stable` as its main branch (aligns with Factorio's
stable/experimental release naming familiar to modders). All other repositories use the standard `main` branch.

## Repository Settings Configuration

### 1. General Settings

Navigate to **Settings > General** and configure:

#### Repository Details

Configure repository-specific settings based on the repository being created:

##### factorio-mocks (Hub Repository)

- **Description**: "Comprehensive testing infrastructure for Factorio mod development - Planning & coordination hub"
- **Website**: Leave empty for now (can add documentation site later)

##### factorio-mocks-generator (Data Extraction)

- **Description**: "Factorio mod for extracting game data to generate comprehensive mocks for mod testing"
- **Website**: Leave empty

##### factorio-mocks-modpacks (Modpack Configurations)

- **Description**: "Curated modpack configurations and automation for comprehensive Factorio mod testing scenarios"
- **Website**: Leave empty

##### factorio-mocks-data (Data Artifacts)

- **Description**: "Generated mock data artifacts from Factorio installations for mod testing and development"
- **Website**: Leave empty

##### factorio-mocks-loader (Runtime Library)

- **Description**: "Lua library for loading Factorio mock data in testing environments and development workflows"
- **Website**: Leave empty

##### Common Topics

Add these topics to all repositories for discoverability:

- `factorio`
- `factorio-mod`
- `testing`
- `mocking`
- `lua`
- `game-development`
- `testing-framework`

#### Features

Configure repository-specific features:

##### factorio-mocks (Hub Repository Only)

- ❌ **Wikis**: Disabled (using documentation in repo instead)
- ✅ **Issues**: Enabled (centralized issue tracking)
- ✅ **Sponsorships**: Enabled (Ko-fi link in README)
- ✅ **Preserve this repository**: Enabled
- ✅ **Projects**: Enabled (ecosystem coordination)
- ✅ **Discussions**: Enabled (community engagement)

##### All Other Repositories (generator, modpacks, data, loader)

- ❌ **Wikis**: Disabled (documentation in individual repos)
- ❌ **Issues**: Disabled (centralized in hub repository)
- ✅ **Sponsorships**: Enabled (Ko-fi link for ecosystem support)
- ✅ **Preserve this repository**: Enabled
- ✅ **Projects**: Enabled (required for cross-repository project automation)
- ❌ **Discussions**: Disabled (centralized in hub)

#### Centralized Issue Tracking with Cross-Repository Project Management

**Important**: The `factorio-mocks` repository serves as the central hub for issue tracking across the entire ecosystem.
Issues for all repositories should be filed here:

- **Issues enabled**: Only in `factorio-mocks` (this repository)
- **Issues disabled**: In all other ecosystem repositories (`factorio-mocks-generator`, `factorio-mocks-modpacks`,
  `factorio-mocks-data`, `factorio-mocks-loader`)
- **Projects enabled**: In ALL repositories (required for cross-repository project board automation)
- **Component selection**: Issue templates include dropdown to specify which repository/component is affected
- **Benefits**: Unified tracking, better coordination, simplified contributor workflow

**Action Required**: When creating the other repositories:

1. **Disable Issues** in their repository settings to direct all issue traffic here
2. **Keep Projects enabled** to allow the central project board to automatically add PRs from those repositories

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
  - **Required status checks**: Add relevant workflow checks (e.g., `Documentation Quality and Linting` for
    repositories with QA workflows, `CI/CD` for repositories with testing, etc.)
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

### Hub Repository (factorio-mocks): Full Label Set

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

### Other Repositories: Essential Labels for PR Management

For repositories with centralized issue tracking, create only the essential labels needed for Pull Request management:

#### Required Labels for All Other Repositories

**Type Labels** (for PR categorization):

- `type: bug` - Bug fixes and error corrections
- `type: feature` - New functionality and enhancements
- `type: documentation` - Documentation updates
- `type: maintenance` - Dependency updates, refactoring, housekeeping

**Component Labels** (repository-specific):

- For `factorio-mocks-generator`: `component: extraction`, `component: validation`,
  `component: distribution`, `component: ci-cd`
- For `factorio-mocks-modpacks`: `component: modpacks`, `component: automation`,
  `component: distribution`, `component: ci-cd`
- For `factorio-mocks-data`: `component: ci-cd` (minimal - mostly automated commits)
- For `factorio-mocks-loader`: `component: loader`, `component: ci-cd`

**Ecosystem Labels** (for coordination):

- Each repository gets its own ecosystem label (`ecosystem: generator`, `ecosystem: modpacks`, etc.)

#### Automated Label Setup Scripts

For easier setup, use the provided PowerShell scripts in each repository:

```powershell
PowerShell -ExecutionPolicy Bypass -File .\.github\scripts\setup-labels.ps1
```

**What the scripts do:**

- **Create essential labels** specific to each repository's needs
- **Remove default GitHub labels** that don't fit the workflow
- **Provide detailed output** showing progress and final label counts
- **Handle existing labels** by updating them if they already exist

**Prerequisites:** GitHub CLI (`gh`) must be installed and authenticated

**Benefits of Essential Labels**:

- **Automated PR labeling** for Dependabot and workflows
- **PR categorization** for easier review and coordination
- **Ecosystem tracking** across repositories
- **Workflow triggers** based on PR types and components

## Additional Configurations

### 1. Discussions Setup (Hub Repository Only)

**Note**: Only configure Discussions in the `factorio-mocks` hub repository. Other repositories have Discussions
disabled to centralize community interaction.

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

### 2. Project Board Setup (Hub Repository Only)

**Note**: While only the `factorio-mocks` hub repository will have an active project board, **all repositories must have
Projects enabled** to allow cross-repository automation. The central project board in the hub can automatically add
PRs from other repositories, but this requires Projects to be enabled in those target repositories.

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

**Latest Update**: 🚀 **Ready for Repository Creation** - Planning alignment complete. About to create the remaining four repositories of the five-repository ecosystem. Foundation phase transitioning from planning to implementation.
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

#### Cross-Repository Automation Setup

**GitHub Free Plan Limitation**: GitHub Free plan only allows **1 auto-add workflow** per project. Since we have a
five-repository ecosystem, we'll use a hybrid approach:

1. **Hub repository** (`factorio-mocks`) - Use the built-in auto-add workflow for issues and PRs
2. **Other repositories** - Use GitHub Actions to automatically add PRs to the project board

**Automation Strategy**:

- **factorio-mocks**: Built-in GitHub Projects auto-add workflow
- **All other repositories**: GitHub Action workflow that runs on PR open/reopen events

#### Automation Rules Configuration

GitHub Projects provides these automation capabilities for each repository workflow:

**Available Workflow Automations**:

1. **Auto-add to project**: Automatically add new issues/PRs from each target repository
   - Configure to add **both issues and pull requests**
   - Each repository needs its own workflow (5 total workflows)
   - All items start in "New" status for triage

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

## Cross-Repository Automation Setup

**Important**: Due to GitHub Free plan limitations (only 1 auto-add workflow allowed), we use a hybrid approach to
automatically add items from all repositories to the central project board.

### Hub Repository Setup (factorio-mocks)

1. **Navigate to the project board** in the `factorio-mocks` repository
2. **Click the menu icon** (⋯) in the top-right corner of the project
3. **Select "Workflows"** from the menu
4. **Configure the "Auto-add to project" workflow**:
   - Click "Edit" on the existing workflow
   - Under "Filters", select the `factorio-mocks` repository
   - Set filter to add both issues and PRs: `is:issue,pr`
   - Click "Save and turn on workflow"

### Other Repositories Setup (GitHub Actions)

For `factorio-mocks-generator`, `factorio-mocks-modpacks`, `factorio-mocks-data`, and `factorio-mocks-loader`,
create a GitHub Action workflow to automatically add PRs to the project board.

**Complete Setup Instructions**: See `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md` for detailed step-by-step
instructions including:

- Personal access token creation (fine-grained vs classic tokens)
- Workflow file template with your project URL
- Repository secret configuration
- Testing and troubleshooting guidance

### Expected Automation Results

After completing the setup in `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md`:

- **factorio-mocks**: Issues and PRs automatically added via built-in GitHub Projects workflow
- **All other repositories**: PRs automatically added via GitHub Actions when opened or reopened
- **Unified tracking**: All development activity appears on the central project board

**Testing and Troubleshooting**: See the quick reference guide for verification steps and common issues.

## Repository Setup Summary

### Configuration Matrix

| Setting/Feature | Hub (factorio-mocks) | Other Repositories |
|----------------|---------------------|-------------------|
| **Issues** | ✅ Enabled (centralized) | ❌ Disabled |
| **Discussions** | ✅ Enabled | ❌ Disabled |
| **Projects** | ✅ Enabled | ✅ Enabled (required for automation) |
| **Sponsorships** | ✅ Enabled (Ko-fi link) | ✅ Enabled (Ko-fi link) |
| **Branch Protection** | ✅ All rules apply | ✅ All rules apply |
| **Security Settings** | ✅ All enabled | ✅ All enabled |
| **Labels** | ✅ Full set (21 labels) | ✅ Subset for PR management |
| **Linear History** | ✅ Squash merge only | ✅ Squash merge only |

### Setup Checklist by Repository

#### factorio-mocks (Hub Repository)

- [x] Repository description: "Comprehensive testing infrastructure for Factorio mod development - Planning &
  coordination hub"
- [x] All features enabled (Issues, Discussions, Projects, Sponsorships)
- [x] Branch protection with status checks
- [x] Security settings and Dependabot
- [x] Full label setup (21 labels)
- [x] Discussions categories configured
- [x] Project board with comprehensive README

#### factorio-mocks-generator

- [ ] Repository description: "Factorio mod for extracting game data to generate comprehensive mocks for mod testing"
- [ ] Issues disabled, Projects enabled, sponsorships enabled for ecosystem support
- [ ] Branch protection with appropriate status checks
- [ ] Security settings and Dependabot
- [ ] Essential labels for PR management (type, component, ecosystem)
- [ ] GitHub Action workflow setup (follow `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md`)
- [ ] GitHub Copilot configuration: Copy `conventional-commit.prompt.md`, `create-pull-request-draft.prompt.md`,
  and all chatmodes
- [ ] GitHub Copilot instructions: Copy universal instructions (commenting, CI/CD, markdown standards)

#### factorio-mocks-modpacks

- [ ] Repository description: "Curated modpack configurations and automation for comprehensive Factorio mod testing
  scenarios"
- [ ] Issues disabled, Projects enabled, sponsorships enabled for ecosystem support
- [ ] Branch protection with appropriate status checks
- [ ] Security settings and Dependabot
- [ ] Essential labels for PR management (type, component, ecosystem)
- [ ] GitHub Action workflow setup (follow `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md`)
- [ ] GitHub Copilot configuration: Copy `conventional-commit.prompt.md`, `create-pull-request-draft.prompt.md`,
  and all chatmodes
- [ ] GitHub Copilot instructions: Copy universal instructions (commenting, CI/CD, markdown standards)

#### factorio-mocks-data

- [ ] Repository description: "Generated mock data artifacts from Factorio installations for mod testing and
  development"
- [ ] **Main branch**: `stable` (not `main`)
- [ ] Issues disabled, Projects enabled, sponsorships enabled for ecosystem support
- [ ] Branch protection for `stable` branch
- [ ] Security settings and Dependabot
- [ ] Essential labels for PR management (type, component, ecosystem)
- [ ] GitHub Action workflow setup (follow `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md`)
- [ ] GitHub Copilot configuration: Copy `conventional-commit.prompt.md`, `create-pull-request-draft.prompt.md`,
  and all chatmodes
- [ ] GitHub Copilot instructions: Copy universal instructions (commenting, CI/CD, markdown standards)

#### factorio-mocks-loader

- [ ] Repository description: "Lua library for loading Factorio mock data in testing environments and development
  workflows"
- [ ] Issues disabled, Projects enabled, sponsorships enabled for ecosystem support
- [ ] Branch protection with appropriate status checks
- [ ] Security settings and Dependabot
- [ ] Essential labels for PR management (type, component, ecosystem)
- [ ] GitHub Action workflow setup (follow `.github/CROSS_REPOSITORY_AUTOMATION_QUICKREF.md`)
- [ ] GitHub Copilot configuration: Copy `conventional-commit.prompt.md`, `create-pull-request-draft.prompt.md`,
  and all chatmodes
- [ ] GitHub Copilot instructions: Copy universal instructions (commenting, CI/CD, markdown standards)

### Next Steps

1. **Create remaining repositories** using GitHub web interface or CLI
2. **Apply configurations** from the appropriate sections above
3. **Set up initial repository structure** according to repository specifications
4. **Link repositories** in README files with cross-references
5. **Begin Phase 1 implementation** starting with generator prototype
