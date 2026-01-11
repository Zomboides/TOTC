# GitHub Publishing Guide

Complete guide to publishing and maintaining your Project Zomboid mod on GitHub.

---

## Table of Contents

1. [Initial Setup](#initial-setup)
2. [Creating the Repository](#creating-the-repository)
3. [First Commit](#first-commit)
4. [Repository Settings](#repository-settings)
5. [Creating Releases](#creating-releases)
6. [Maintaining Your Repo](#maintaining-your-repo)
7. [Best Practices](#best-practices)

---

## Initial Setup

### Prerequisites

- [ ] GitHub account created
- [ ] Git installed on your computer
- [ ] Mod files ready and tested

### Install Git

**Windows**:
- Download from: https://git-scm.com/download/win
- Run installer, use default settings

**Mac**:
```bash
brew install git
```

**Linux**:
```bash
sudo apt-get install git  # Debian/Ubuntu
sudo yum install git      # Red Hat/CentOS
```

### Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## Creating the Repository

### Method 1: Via GitHub Website

1. **Go to GitHub**: https://github.com
2. **Click** the "+" icon in top right
3. **Select** "New repository"
4. **Fill in details**:
   - **Repository name**: `TOTC_ThinkOfTheChildren`
   - **Description**: "A Project Zomboid mod that adds child-sized zombies"
   - **Visibility**: Public (recommended for mods)
   - **Initialize with**: Check "Add a README file" (we'll replace it)
   - **Add .gitignore**: None (we have our own)
   - **Choose a license**: MIT License
5. **Click** "Create repository"

### Method 2: Via GitHub CLI

If you have GitHub CLI installed:

```bash
gh repo create TOTC_ThinkOfTheChildren --public --description "A Project Zomboid mod that adds child-sized zombies"
```

---

## First Commit

### Initialize Local Repository

Navigate to your mod folder:

```bash
cd /path/to/TOTC_ThinkOfTheChildren
```

### Initialize Git

If starting fresh:

```bash
git init
git branch -M main
```

### Link to GitHub

Replace `YOUR_USERNAME` with your GitHub username:

```bash
git remote add origin https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren.git
```

### Verify Remote

```bash
git remote -v
```

Should show:
```
origin  https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren.git (fetch)
origin  https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren.git (push)
```

### Add Files

Check what will be committed:

```bash
git status
```

Add all files:

```bash
git add .
```

Or add selectively:

```bash
git add README.md
git add LICENSE
git add Contents/
git add *.txt
```

### Commit Files

```bash
git commit -m "Initial commit: TOTC: Think Of The Children mod v1.0.0"
```

### Push to GitHub

```bash
git push -u origin main
```

You'll be prompted for your GitHub credentials:
- Username: Your GitHub username
- Password: Your GitHub personal access token (not your account password)

**Note**: GitHub requires a personal access token instead of password.

#### Create Personal Access Token

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Give it a name: "TOTC Mod Repository"
4. Select scopes:
   - [x] repo (all)
   - [x] workflow
5. Click "Generate token"
6. **Copy the token** (you won't see it again)
7. Use this token as your password when pushing

### Verify Upload

Visit your repository on GitHub:
```
https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren
```

All files should be visible.

---

## Repository Settings

### Update README Links

Now that you know your GitHub URL, update placeholders:

1. **Edit mod.info**:
   ```ini
   url=https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren
   ```

2. **Edit README.md badges** (replace `YOUR_USERNAME`):
   ```markdown
   [![GitHub](https://img.shields.io/github/v/release/YOUR_USERNAME/TOTC_ThinkOfTheChildren?style=for-the-badge)](https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren/releases)
   ```

3. **Commit and push**:
   ```bash
   git add mod.info README.md
   git commit -m "docs: Update repository URLs"
   git push
   ```

### Add Topics

On GitHub repository page:

1. Click the gear icon next to "About"
2. Add topics (tags):
   - `project-zomboid`
   - `zomboid-mod`
   - `gaming`
   - `lua`
   - `mod`
   - `build-42`
   - `build-43`
3. Click "Save changes"

### Setup GitHub Pages (Optional)

For a nice project page:

1. Go to **Settings** > **Pages**
2. Under "Source", select "main" branch
3. Click "Save"
4. Your mod will be accessible at:
   ```
   https://YOUR_USERNAME.github.io/TOTC_ThinkOfTheChildren/
   ```

---

## Creating Releases

Releases are important for version tracking and downloads.

### Create First Release

#### Via GitHub Website

1. **Navigate** to your repository
2. **Click** "Releases" (right sidebar)
3. **Click** "Create a new release"
4. **Fill in release form**:

   **Tag version**: `v1.0.0`

   **Release title**: `v1.0.0 - Initial Release`

   **Description**:
   ```markdown
   # TOTC: Think Of The Children v1.0.0

   Initial release of the mod!

   ## Features
   - Child-sized zombies (configurable spawn rate)
   - Adjustable zombie size
   - Sandbox integration
   - English and Spanish translations
   - Multiplayer compatible

   ## Installation
   See [README.md](../TOTC_ThinkOfTheChildren/README.md) for installation instructions.

   ## Download
   Download `TOTC_ThinkOfTheChildren.zip` and extract to your Project Zomboid Workshop folder.

   ## Compatibility
   - Project Zomboid Build 42+
   - Project Zomboid Build 43.13.1+
   ```

5. **Attach files** (optional):
   - Create a ZIP of your mod folder
   - Name it `TOTC_ThinkOfTheChildren-v1.0.0.zip`
   - Drag and drop to the release

6. **Click** "Publish release"

#### Via Git Command Line

Create and push a tag:

```bash
git tag -a v1.0.0 -m "Initial release v1.0.0"
git push origin v1.0.0
```

Then create the release on GitHub website as above.

### Release Versioning

Follow semantic versioning:

- **v1.0.0** - Initial release
- **v1.0.1** - Bug fix
- **v1.1.0** - New features
- **v2.0.0** - Major changes/breaking changes

### Creating Release Archives

To create a clean ZIP for users:

```bash
# Create a temporary directory
mkdir -p release-build

# Copy only necessary files
cp -r TOTC_ThinkOfTheChildren release-build/
cd release-build/TOTC_ThinkOfTheChildren

# Remove unnecessary files
rm -rf .git .gitignore media/

# Go back and create ZIP
cd ..
zip -r TOTC_ThinkOfTheChildren-v1.0.0.zip TOTC_ThinkOfTheChildren/

# Upload this ZIP to your GitHub release
```

---

## Maintaining Your Repo

### Regular Updates

When you make changes:

```bash
# Check what changed
git status

# Add changes
git add .

# Commit with descriptive message
git commit -m "fix: Zombie scaling now works in multiplayer"

# Push to GitHub
git push
```

### Creating New Releases

When releasing a new version:

1. **Update version** in files:
   - `mod.info` (modversion)
   - `workshop.txt` (version)

2. **Update CHANGELOG**:
   ```bash
   echo "## v1.1.0 - 2026-01-15

   ### Added
   - Spanish translations

   ### Fixed
   - Multiplayer sync issue

   ### Changed
   - Improved performance" >> CHANGELOG.md
   ```

3. **Commit changes**:
   ```bash
   git add .
   git commit -m "chore: Release v1.1.0"
   git push
   ```

4. **Create new tag**:
   ```bash
   git tag -a v1.1.0 -m "Release v1.1.0"
   git push origin v1.1.0
   ```

5. **Create release** on GitHub with changelog

### Branching Strategy

For organized development:

**Main branch** (`main`):
- Production-ready code
- Only merge tested features
- Always stable

**Development branch** (`dev`):
```bash
git checkout -b dev
git push -u origin dev
```
- Active development
- Merge feature branches here first
- Test before merging to main

**Feature branches**:
```bash
git checkout -b feature/add-teen-zombies
# Make changes
git commit -m "feat: Add teen zombie size option"
git push -u origin feature/add-teen-zombies
```
- One branch per feature
- Merge to dev when complete
- Delete after merging

### Handling Issues

When users report bugs:

1. **Create issue** on GitHub with:
   - Bug description
   - Steps to reproduce
   - Expected vs actual behavior
   - Label: `bug`

2. **Create branch** to fix:
   ```bash
   git checkout -b fix/zombie-scale-multiplayer
   ```

3. **Fix and commit**:
   ```bash
   git commit -m "fix: Zombie scaling in multiplayer

   Fixes #5"
   ```
   (The `Fixes #5` automatically links and closes issue #5)

4. **Push and merge**:
   ```bash
   git push -u origin fix/zombie-scale-multiplayer
   ```
   Create PR on GitHub, merge when ready

---

## Best Practices

### Commit Messages

Use clear, descriptive commit messages:

**Good**:
```
feat: Add German translation
fix: Zombie size not applying in dedicated servers
docs: Update installation instructions
refactor: Simplify size calculation logic
```

**Bad**:
```
update
fix
changes
asdf
```

### Commit Frequency

- Commit often (after each logical change)
- Don't commit broken code to main
- One commit per feature/fix

### .gitignore Best Practices

Already created, but ensure it excludes:
```gitignore
# IDE files
.vscode/
.idea/
*.swp

# OS files
.DS_Store
Thumbs.db

# Test files
test/
temp/
*.bak

# Personal notes
notes.txt
TODO.txt
```

### README Maintenance

Keep README.md updated:
- [ ] Accurate feature list
- [ ] Current version number
- [ ] Working links
- [ ] Updated screenshots
- [ ] Current compatibility info

### Documentation Structure

Organize documentation:
```
├── README.md              # Main docs (for users)
├── CONTRIBUTING.md        # For contributors
├── LICENSE               # MIT license
├── CHANGELOG.md          # Version history
├── INSTALL.txt           # Detailed install guide
├── QUICKSTART.txt        # Quick reference
├── TECHNICAL.md          # For developers/modders
├── STEAM_WORKSHOP_GUIDE.md   # Publishing guide
└── GITHUB_PUBLISHING_GUIDE.md # This file
```

### GitHub Features to Use

**Issues**: Bug tracking and feature requests

**Projects**: Organize work with kanban boards

**Wiki**: Extensive documentation (optional)

**Discussions**: Community forum

**Actions**: Automated testing (advanced)

---

## Linking GitHub and Steam

### Update Steam Workshop URL

After publishing to Steam:

1. Note your Workshop ID from Steam
2. Update README.md badge
3. Update repository description
4. Link in Steam Workshop description

### Cross-Promotion

**On GitHub**:
```markdown
## Download

- **Steam Workshop**: [Subscribe here](https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_ID)
- **Manual Download**: [GitHub Releases](https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren/releases)
```

**On Steam**:
```
For bug reports and source code, visit:
https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren
```

---

## Useful Git Commands

### Check Status
```bash
git status
```

### View History
```bash
git log --oneline
```

### Undo Last Commit (not pushed)
```bash
git reset --soft HEAD~1
```

### Discard Local Changes
```bash
git checkout -- filename.txt
git restore filename.txt  # Git 2.23+
```

### Pull Latest Changes
```bash
git pull origin main
```

### Create Branch
```bash
git checkout -b new-feature
```

### Switch Branch
```bash
git checkout main
```

### Delete Branch
```bash
git branch -d feature-name
```

### View Remote URL
```bash
git remote -v
```

### Update Remote URL
```bash
git remote set-url origin https://github.com/NEW_USERNAME/TOTC_ThinkOfTheChildren.git
```

---

## Troubleshooting

### Push Rejected

**Error**: "Updates were rejected because the remote contains work that you do not have locally"

**Fix**:
```bash
git pull origin main --rebase
git push origin main
```

### Authentication Failed

**Error**: "Authentication failed"

**Fix**: Use personal access token instead of password
1. Generate token at: https://github.com/settings/tokens
2. Use token when prompted for password

### Large Files

**Error**: "File too large"

**Fix**: Don't commit large unnecessary files
- Add to .gitignore
- Use Git LFS for large assets (if needed)

### Merge Conflicts

**Error**: "Merge conflict in file.txt"

**Fix**:
```bash
# Edit conflicted files
# Look for <<<<<<< and >>>>>>>
# Choose which changes to keep
git add file.txt
git commit -m "Resolve merge conflict"
```

---

## Security Best Practices

### Never Commit

- Passwords
- API keys
- Personal information
- Steam credentials
- Large binary files (unless necessary)

### Use .gitignore

Already created, but verify sensitive files are excluded.

### Review Before Push

Always review changes before pushing:
```bash
git diff
git status
```

---

## Community Engagement

### Encourage Contributions

In README.md:
```markdown
## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

Ways to help:
- Report bugs
- Suggest features
- Submit translations
- Improve docs
```

### Respond to Issues

- Acknowledge within 24-48 hours
- Be polite and helpful
- Ask for clarification if needed
- Close resolved issues

### Accept Pull Requests

- Review code carefully
- Test changes locally
- Provide feedback
- Merge when ready
- Thank contributors

---

## Advanced Topics

### GitHub Actions (CI/CD)

Automate testing and releases (advanced):

Create `.github/workflows/test.yml`:
```yaml
name: Test Mod
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Validate Lua syntax
        run: |
          sudo apt-get install lua5.1
          find . -name "*.lua" -exec luac -p {} \;
```

### Git LFS (Large File Storage)

For large assets:
```bash
git lfs install
git lfs track "*.png"
git add .gitattributes
```

### Pre-commit Hooks

Automatic checks before committing:

Create `.git/hooks/pre-commit`:
```bash
#!/bin/bash
# Validate Lua syntax
find . -name "*.lua" -exec luac -p {} \;
```

---

## Checklist: First-Time Publishing

- [ ] Git installed and configured
- [ ] GitHub account created
- [ ] Repository created on GitHub
- [ ] Local repository initialized
- [ ] All files added and committed
- [ ] Pushed to GitHub
- [ ] README.md updated with correct URLs
- [ ] LICENSE file present
- [ ] .gitignore configured
- [ ] First release created (v1.0.0)
- [ ] Repository topics added
- [ ] Description added
- [ ] Links tested
- [ ] CONTRIBUTING.md present
- [ ] Documentation complete

---

## Useful Resources

- **Git Documentation**: https://git-scm.com/doc
- **GitHub Guides**: https://guides.github.com/
- **Git Cheat Sheet**: https://education.github.com/git-cheat-sheet-education.pdf
- **Semantic Versioning**: https://semver.org/
- **Keep a Changelog**: https://keepachangelog.com/
- **Markdown Guide**: https://www.markdownguide.org/

---

## Need Help?

- **GitHub Support**: https://support.github.com/
- **Git Forum**: https://git.github.io/community.html
- **Stack Overflow**: Tag your questions with `git` and `github`

---

**Congratulations!** You're now ready to publish and maintain your mod on GitHub.

**Won't somebody please think of the children?!**
