# GitHub Repository Labels Setup Script
# This script uses GitHub CLI to set up standardized labels for the Factorio Mocks Ecosystem

# Ensure GitHub CLI is installed and authenticated
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: GitHub CLI not found. Please install it from https://cli.github.com/" -ForegroundColor Red
    exit 1
}

# Check if authenticated
gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Not authenticated with GitHub CLI. Run 'gh auth login' first." -ForegroundColor Red
    exit 1
}

Write-Host "Setting up GitHub labels for Factorio Mocks Ecosystem..." -ForegroundColor Cyan

# Remove default GitHub labels that don't fit our workflow
Write-Host "`nRemoving default labels..." -ForegroundColor Yellow
$defaultLabels = @("bug", "documentation", "duplicate", "enhancement", "good first issue", "help wanted", "invalid", "wontfix")

foreach ($label in $defaultLabels) {
    try {
        gh label delete $label --yes 2>$null
        Write-Host "  SUCCESS: Removed '$label'" -ForegroundColor Green
    }
    catch {
        Write-Host "  SKIP: Label '$label' not found (already removed)" -ForegroundColor Gray
    }
}

# Keep "question" but update it
try {
    gh label edit "question" --color "d876e3" --description "Further information is requested"
    Write-Host "  SUCCESS: Updated 'question' label" -ForegroundColor Green
}
catch {
    Write-Host "  WARNING: Could not update 'question' label" -ForegroundColor Yellow
}

# Create new labels
Write-Host "`nCreating new labels..." -ForegroundColor Yellow

# Type Labels
$typeLabels = @(
    @{name="type: bug"; color="d73a4a"; description="Something isn't working"},
    @{name="type: feature"; color="a2eeef"; description="New feature or enhancement request"},
    @{name="type: documentation"; color="0075ca"; description="Improvements or additions to documentation"},
    @{name="type: maintenance"; color="fef2c0"; description="Code cleanup, refactoring, or maintenance tasks"},
    @{name="type: modpack-request"; color="b60205"; description="Request for new modpack configuration to be added to ecosystem"}
)

Write-Host "  Type labels..." -ForegroundColor Cyan
foreach ($label in $typeLabels) {
    try {
        gh label create $label.name --color $label.color --description $label.description --force
        Write-Host "    SUCCESS: Created '$($label.name)'" -ForegroundColor Green
    }
    catch {
        Write-Host "    ERROR: Failed to create '$($label.name)'" -ForegroundColor Red
    }
}

# Component Labels
$componentLabels = @(
    @{name="component: architecture"; color="5319e7"; description="Ecosystem architecture and design decisions"},
    @{name="component: ci-cd"; color="1d76db"; description="Continuous integration and deployment"},
    @{name="component: planning"; color="0075ca"; description="Project planning, roadmaps, and strategy documents"},
    @{name="component: templates"; color="7057ff"; description="Issue and PR templates"}
)

Write-Host "  Component labels..." -ForegroundColor Cyan
foreach ($label in $componentLabels) {
    try {
        gh label create $label.name --color $label.color --description $label.description --force
        Write-Host "    SUCCESS: Created '$($label.name)'" -ForegroundColor Green
    }
    catch {
        Write-Host "    ERROR: Failed to create '$($label.name)'" -ForegroundColor Red
    }
}

# Effort Labels (Better than Status - Helps Contributors Choose)
$effortLabels = @(
    @{name="effort: quick-win"; color="0e8a16"; description="Can be completed in a few hours - great for new contributors"},
    @{name="effort: moderate"; color="fbca04"; description="Requires 1-3 days of focused work"},
    @{name="effort: substantial"; color="ff9800"; description="Major feature or complex change requiring significant time"},
    @{name="needs-discussion"; color="d4edda"; description="Requires community or team discussion before implementation"},
    @{name="blocked"; color="d73a4a"; description="Blocked by external dependency or other issue"}
)

Write-Host "  ⚡ Effort and flow labels..." -ForegroundColor Cyan
foreach ($label in $effortLabels) {
    try {
        gh label create $label.name --color $label.color --description $label.description --force
        Write-Host "    SUCCESS: Created '$($label.name)'" -ForegroundColor Green
    }
    catch {
        Write-Host "    ERROR: Failed to create '$($label.name)'" -ForegroundColor Red
    }
}

# Special Labels
$specialLabels = @(
    @{name="adr"; color="5319e7"; description="Architectural Decision Record"},
    @{name="breaking-change"; color="d73a4a"; description="Introduces breaking changes"},
    @{name="good-first-issue"; color="7057ff"; description="Good for newcomers"},
    @{name="help-wanted"; color="008672"; description="Extra attention is needed"}
)

Write-Host "  Special labels..." -ForegroundColor Cyan
foreach ($label in $specialLabels) {
    try {
        gh label create $label.name --color $label.color --description $label.description --force
        Write-Host "    SUCCESS: Created '$($label.name)'" -ForegroundColor Green
    }
    catch {
        Write-Host "    ERROR: Failed to create '$($label.name)'" -ForegroundColor Red
    }
}

# Ecosystem Labels
$ecosystemLabels = @(
    @{name="ecosystem: generator"; color="ff6b35"; description="Related to factorio-mocks-generator repository"},
    @{name="ecosystem: modpacks"; color="ff6b35"; description="Related to factorio-mocks-modpacks repository"},
    @{name="ecosystem: data"; color="ff6b35"; description="Related to factorio-mocks-data repository"},
    @{name="ecosystem: loader"; color="ff6b35"; description="Related to factorio-mocks-loader repository"}
)

Write-Host "  Ecosystem labels..." -ForegroundColor Cyan
foreach ($label in $ecosystemLabels) {
    try {
        gh label create $label.name --color $label.color --description $label.description --force
        Write-Host "    SUCCESS: Created '$($label.name)'" -ForegroundColor Green
    }
    catch {
        Write-Host "    ERROR: Failed to create '$($label.name)'" -ForegroundColor Red
    }
}

Write-Host "`nLabel setup complete!" -ForegroundColor Green
Write-Host "You can view all labels at: https://github.com/QuingKhaos/factorio-mocks/labels" -ForegroundColor Cyan

# Show summary
Write-Host "`nSummary:" -ForegroundColor Yellow
Write-Host "  - Phase tracking: Using GitHub Milestones" -ForegroundColor Cyan
Write-Host "  - Type labels: 5" -ForegroundColor White
Write-Host "  - Component labels: 4" -ForegroundColor White
Write-Host "  - Effort and flow labels: 5" -ForegroundColor White
Write-Host "  - Special labels: 4" -ForegroundColor White
Write-Host "  - Ecosystem labels: 4" -ForegroundColor White
Write-Host "  - Total: 22 labels" -ForegroundColor Green
