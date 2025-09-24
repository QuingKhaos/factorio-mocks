# Cross-Repository Project Board Automation - Quick Reference

## Overview

Due to GitHub Free plan limitations (1 auto-add workflow max), we use a hybrid approach:

- **factorio-mocks**: Built-in GitHub Projects auto-add workflow
- **Other repos**: GitHub Actions workflow using `actions/add-to-project`

## Setup Checklist

### 1. Hub Repository (factorio-mocks) - Built-in Workflow

- [x] Navigate to project board → Settings (⋯) → Workflows
- [x] Edit "Auto-add to project" workflow
- [x] Set repository: `factorio-mocks`
- [x] Set filter: `is:issue,pr`
- [x] Save and enable

### 2. Create Personal Access Token (One-time)

**Choose token type based on your project ownership:**

#### Option A: Fine-Grained Token (Recommended for Organization Projects)

- [ ] GitHub Settings → Developer settings → Personal access tokens → Fine-grained tokens
- [ ] Generate new token
- [ ] Select resource owner (your organization if applicable)
- [ ] Select all repositories that need access
- [ ] Set Organization permissions: `projects` = `read & write`
- [ ] Set Repository permissions: `issues` = `read`, `pull requests` = `read`
- [ ] Copy token value securely

#### Option B: Classic Token (Required for User-Owned Projects)

- [ ] GitHub Settings → Developer settings → Personal access tokens (classic)
- [ ] Generate new token with `project` scope (and `repo` for private repositories)
- [ ] Copy token value securely

**How to determine which token to use**:

- **User-owned project**: URL shows `github.com/users/USERNAME/projects/N` → Use classic token (Option B)
- **Organization-owned project**: URL shows `github.com/orgs/ORGNAME/projects/N` → Use fine-grained token (Option A)

**Current project**: `https://github.com/users/QuingKhaos/projects/3` is user-owned → **Use Option B (Classic Token)**

### 3. Setup Each Repository (generator, modpacks, data, loader)

For each repository:

- [ ] Add repository secret: `ADD_TO_PROJECT_TOKEN` = your PAT
- [ ] Create `.github/workflows/add-to-project.yml` using template below
- [ ] Update project number in workflow file
- [ ] Commit and push

## Workflow Template

Create `.github/workflows/add-to-project.yml` in each repository with this content:

```yaml
name: Add PR to Project Board

on:
  pull_request:
    types: [opened]

jobs:
  add-to-project:
    name: Add PR to Project Board
    runs-on: ubuntu-latest

    steps:
      - name: Add PR to project
        uses: actions/add-to-project@v1.0.2
        with:
          project-url: https://github.com/users/QuingKhaos/projects/3
          github-token: ${{ secrets.ADD_TO_PROJECT_TOKEN }}
```

## Testing

1. Create test PR in any repository
2. Check Actions tab for workflow execution
3. Verify PR appears in project board "New" column

## Troubleshooting

- **Workflow fails**: Check token permissions and project number
- **PR not appearing**: Verify repository has Projects feature enabled
- **Token expired**: Generate new token and update all repository secrets
- **403 Forbidden error**: Verify you're using the correct token type (classic for user-owned projects,
  fine-grained for org-owned)
