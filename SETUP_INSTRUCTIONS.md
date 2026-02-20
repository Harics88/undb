# UnDB GitHub Actions Build Setup

This repository has been configured to automatically build **undb** using GitHub Actions and the Bun runtime.

## What's Configured

✅ **GitHub Actions Workflow** (`.github/workflows/main.yml`)
- Automatically triggers on push to `main` and `develop` branches
- Installs Bun runtime
- Installs dependencies with `bun install`
- Builds the project with `bun run build`
- Uploads build artifacts (available for 30 days)
- Creates GitHub Releases from git tags

✅ **PowerShell Clone Script** (`clone-and-push-undb.ps1`)
- Automates cloning the original undb repo
- Pushes all code and history to your GitHub account
- Sets up a local development clone

## Quick Start (3 Steps)

### Step 1: Run the Clone Script

1. Open **PowerShell** on your Windows machine
2. Download or copy the script from this repo:
   ```powershell
   # Download the script directly
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Harics88/undb/main/clone-and-push-undb.ps1" -OutFile "clone-and-push-undb.ps1"
   ```

3. Run the script:
   ```powershell
   .\clone-and-push-undb.ps1
   ```

   The script will:
   - Clone the original undb repo from undb-io/undb
   - Push all branches and commit history to your GitHub
   - Create a local copy at `C:\dev\undb-clone\undb-work`

### Step 2: Wait for GitHub Actions

1. Go to your repo: https://github.com/Harics88/undb
2. Click the **Actions** tab
3. Watch the build workflow complete

### Step 3: Download Build Artifacts

1. In the Actions tab, click on the completed workflow
2. Scroll to "Artifacts"
3. Download `undb-build-[number]` containing your compiled binaries

## After First Push

### Work with the Code

```bash
cd C:\dev\undb-clone\undb-work

# Install dependencies (if not done by GitHub Actions)
bun install

# Build locally
bun run build

# Open in VS Code
code .
```

### Push Your Changes

```bash
# Make changes
git add .
git commit -m "Your changes"
git push

# GitHub Actions will automatically build!
```

### Create a Release

```bash
# Tag a release
git tag v1.0.0
git push --tags

# GitHub Actions will:
# 1. Build the project
# 2. Create a Release on GitHub
# 3. Attach the build artifacts as release downloads
```

## Project Structure

```
Harics88/undb/
├── .github/
│   └── workflows/
│       └── main.yml              # GitHub Actions workflow
├── clone-and-push-undb.ps1       # PowerShell setup script
├── SETUP_INSTRUCTIONS.md         # This file
└── [undb source code]            # Added after running clone script
```

## GitHub Actions Workflow Details

**Triggers:**
- Pushes to `main` or `develop` branches
- Pull requests to `main` or `develop`
- Manual trigger via Actions tab (`workflow_dispatch`)

**Build Steps:**
1. Checkout code
2. Install Bun runtime
3. Run `bun install`
4. Run `bun run build`
5. Upload artifacts to GitHub
6. Create releases from git tags

## Build Artifacts

- **Location**: GitHub Actions > Build workflow > Artifacts
- **Contents**: `dist/` and `build/` directories
- **Retention**: 30 days
- **Access**: Available for download from Actions tab

## Using on Windows as Desktop App

After downloading the built binary:

1. Extract to `C:\Apps\undb\`
2. Create `run-undb.cmd`:
   ```cmd
   @echo off
   set UNDB_DATA_DIR=%~dp0.undb
   "%~dp0undb.exe"
   ```
3. Double-click `run-undb.cmd` to start
4. Open browser to `http://localhost:3721`

Or use Chrome/Edge "Install as app" to get a native-feeling window.

## Troubleshooting

### Script fails to clone
- Ensure Git is installed and in your PATH
- Check internet connectivity
- Verify GitHub is accessible

### GitHub Actions build fails
- Check the Actions tab for error messages
- Verify `bun run build` works locally first
- Check that undb has a valid `package.json`

### Can't download artifacts
- Workflows must complete successfully to save artifacts
- Check the Actions tab for build status
- Artifacts are kept for 30 days only

## Links

- **Your Repository**: https://github.com/Harics88/undb
- **Original undb**: https://github.com/undb-io/undb
- **Bun Runtime**: https://bun.sh
- **GitHub Actions Docs**: https://docs.github.com/en/actions

## Next Steps

1. ✅ GitHub Actions configured
2. ⏳ Run the PowerShell script to clone and push code
3. ⏳ Monitor the Actions tab for builds
4. ⏳ Download and test the built binaries
5. ⏳ Customize the workflow as needed

---

You're all set! Run the PowerShell script to get started.
