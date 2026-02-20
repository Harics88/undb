# Clone undb from original source and push to your GitHub account
# This script will:
# 1. Clone the original undb repository as a mirror
# 2. Push all code and history to your GitHub account
# 3. Set up your local clone for development

# Configuration
$SourceRepo = "https://github.com/undb-io/undb.git"
$YourGitHub = "https://github.com/Harics88/undb.git"
$WorkDir = "C:\dev\undb-clone"

# Create working directory
Write-Host "Creating working directory: $WorkDir" -ForegroundColor Green
if (-not (Test-Path $WorkDir)) {
    New-Item -ItemType Directory -Path $WorkDir | Out-Null
}
Set-Location $WorkDir

# Step 1: Clone as mirror
Write-Host "\nCloning original undb repo as mirror..." -ForegroundColor Green
git clone --mirror $SourceRepo
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to clone repository" -ForegroundColor Red
    exit 1
}

# Step 2: Push to your GitHub
Write-Host "\nPushing to your GitHub account..." -ForegroundColor Green
cd "undb.git"
git push --mirror $YourGitHub
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to push to GitHub" -ForegroundColor Red
    exit 1
}
cd ..

# Step 3: Clone your repo for development
Write-Host "\nCloning your repo for development..." -ForegroundColor Green
git clone $YourGitHub undb-work
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to clone your repository" -ForegroundColor Red
    exit 1
}

Write-Host "\n✓ Success! Your repository is ready." -ForegroundColor Green
Write-Host "\nNext steps:" -ForegroundColor Cyan
Write-Host "1. cd $WorkDir\undb-work" -ForegroundColor White
Write-Host "2. Open VS Code or your editor" -ForegroundColor White
Write-Host "3. Install dependencies: bun install" -ForegroundColor White
Write-Host "4. View your repo on GitHub: $YourGitHub" -ForegroundColor White
Write-Host "\nGitHub Actions will automatically start building when code is pushed!" -ForegroundColor Cyan
