# PowerShell script to check markdown configuration synchronization
# Usage: .\sync-markdown-instructions-simple.ps1

param(
    [string]$ConfigPath = ".markdownlint.json",
    [string]$InstructionPath = ".github/instructions/markdown-writing-standards.instructions.md"
)

Write-Host "Checking markdown configuration synchronization..." -ForegroundColor Cyan

# Check if files exist
if (-not (Test-Path $ConfigPath)) {
    Write-Host "ERROR: Configuration file not found: $ConfigPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $InstructionPath)) {
    Write-Host "ERROR: Instruction file not found: $InstructionPath" -ForegroundColor Red
    exit 1
}

# Load configuration
try {
    $config = Get-Content $ConfigPath -Raw | ConvertFrom-Json
    Write-Host "SUCCESS: Loaded markdownlint configuration" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: Invalid JSON in configuration file" -ForegroundColor Red
    exit 1
}

# Load instruction file
$instructions = Get-Content $InstructionPath -Raw

# Check line length
$configLineLength = 120
if ($config.'line-length' -and $config.'line-length'.'line_length') {
    $configLineLength = $config.'line-length'.'line_length'
}

if ($instructions -match "Maximum line length.*?: (\d+) characters") {
    $instructionLineLength = [int]$Matches[1]
    if ($configLineLength -eq $instructionLineLength) {
        Write-Host "SUCCESS: Line length synchronized ($configLineLength characters)" -ForegroundColor Green
    }
    else {
        Write-Host "WARNING: Line length mismatch - Config: $configLineLength, Instructions: $instructionLineLength" -ForegroundColor Yellow
    }
}
else {
    Write-Host "WARNING: Could not find line length in instruction file" -ForegroundColor Yellow
}

# Check allowed languages
if ($config.'fenced-code-language' -and $config.'fenced-code-language'.'allowed_languages') {
    $configLanguages = $config.'fenced-code-language'.'allowed_languages'
    $languageCount = $configLanguages.Count
    Write-Host "INFO: Found $languageCount allowed languages in config" -ForegroundColor Cyan

    # Check if instruction file has language section
    if ($instructions -match "bash, dockerfile, gitignore, json, lua, markdown, powershell, text, yaml") {
        Write-Host "SUCCESS: Language section found in instruction file" -ForegroundColor Green
    }
    else {
        Write-Host "WARNING: Language section may need updating in instruction file" -ForegroundColor Yellow
    }
}

# Check proper nouns
if ($config.'proper-names' -and $config.'proper-names'.'names') {
    $configNouns = $config.'proper-names'.'names'
    $nounCount = $configNouns.Count
    Write-Host "INFO: Found $nounCount proper nouns in config" -ForegroundColor Cyan

    # Extract the proper nouns section from instruction file (with multiline matching)
    if ($instructions -match "(?s)## Proper Nouns.*?The following proper nouns.*?\n((?:- .*?\n)+)") {
        $instructionNounsSection = $Matches[1]

        # Extract noun names from the instruction file (look for **noun** and `noun` patterns)
        $instructionNouns = @()

        # Split into lines and process each line individually
        $lines = $instructionNounsSection -split '\n'
        foreach ($line in $lines) {
            if ($line -match '^- \*\*([^*]+)\*\*') {
                # Match **bold** patterns at start of line for regular proper nouns
                $instructionNouns += $Matches[1]
            }
            elseif ($line -match '^- `([^`]+)`') {
                # Match `backtick` patterns at start of line for repository names
                $instructionNouns += $Matches[1]
            }
        }

        $foundCount = $instructionNouns.Count
        Write-Host "INFO: Found $foundCount proper nouns in instruction file" -ForegroundColor Cyan

        # Check if counts match
        if ($foundCount -ne $nounCount) {
            Write-Host "WARNING: Proper noun count mismatch - Config: $nounCount, Instructions: $foundCount" -ForegroundColor Yellow
        }

        # Check if all config nouns are present in instructions
        $missingNouns = @()
        foreach ($noun in $configNouns) {
            if ($noun -notin $instructionNouns) {
                $missingNouns += $noun
            }
        }

        if ($missingNouns.Count -eq 0) {
            Write-Host "SUCCESS: All proper nouns from config found in instruction file" -ForegroundColor Green
        }
        else {
            Write-Host "WARNING: Missing proper nouns in instruction file: $($missingNouns -join ', ')" -ForegroundColor Yellow
        }

        # Check for extra nouns in instructions
        $extraNouns = @()
        foreach ($noun in $instructionNouns) {
            if ($noun -notin $configNouns) {
                $extraNouns += $noun
            }
        }

        if ($extraNouns.Count -gt 0) {
            Write-Host "WARNING: Extra proper nouns in instruction file (not in config): $($extraNouns -join ', ')" -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "WARNING: Could not parse proper nouns section in instruction file" -ForegroundColor Yellow
    }
}

Write-Host "`nConfiguration sync check completed." -ForegroundColor Cyan
Write-Host "Review any warnings above and update the instruction file manually if needed." -ForegroundColor White