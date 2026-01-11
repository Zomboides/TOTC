# Publishing Checklist

Quick reference guide for publishing TOTC: Think Of The Children to GitHub and Steam Workshop.

---

## Pre-Publishing Checklist

### Testing

- [ ] Mod loads without errors in console
- [ ] Tested in singleplayer
- [ ] Tested in multiplayer (if possible)
- [ ] Sandbox options appear and work correctly
- [ ] Child zombies spawn at configured rate
- [ ] Size scaling works as expected
- [ ] Compatible with popular mods (tested if possible)
- [ ] No performance issues

### Files

- [ ] All code files present and working
- [ ] Translations complete (EN, ES)
- [ ] Documentation complete
- [ ] Preview image optimized (256x256 minimum)
- [ ] LICENSE file present
- [ ] .gitignore configured
- [ ] Version numbers updated in all files

### Documentation

- [ ] README.md complete and accurate
- [ ] Installation instructions clear
- [ ] Configuration guide included
- [ ] Known issues documented (if any)
- [ ] Credits listed
- [ ] Links updated (replace placeholders)

---

## GitHub Publishing Steps

### 1. Initial Setup (5 minutes)

```bash
# Navigate to mod folder
cd /path/to/TOTC_ThinkOfTheChildren

# Initialize git
git init
git branch -M main

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren.git
```

### 2. First Commit (5 minutes)

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit: TOTC v1.0.0"

# Push to GitHub (will ask for credentials)
git push -u origin main
```

**Note**: Use Personal Access Token as password
- Generate at: https://github.com/settings/tokens

### 3. Update Repository (5 minutes)

On GitHub website:

1. Go to repository settings
2. Add topics: `project-zomboid`, `zomboid-mod`, `lua`, `gaming`, `mod`
3. Update description
4. Check that all files uploaded correctly

### 4. Create First Release (10 minutes)

1. Go to **Releases** > **Create a new release**
2. Tag: `v1.0.0`
3. Title: `v1.0.0 - Initial Release`
4. Description: Copy from CHANGELOG.md
5. Attach ZIP file (optional)
6. Click **Publish release**

### 5. Update Links (5 minutes)

Update these files with your actual GitHub URL:
- `mod.info` (url=)
- `README.md` (badges and links)
- `CHANGELOG.md` (links section)

Commit and push:
```bash
git add .
git commit -m "docs: Update repository URLs"
git push
```

**Total Time**: ~30 minutes

---

## Steam Workshop Publishing Steps

### 1. Prepare Files (5 minutes)

- [ ] Copy mod to `%USERPROFILE%\Zomboid\Workshop\`
- [ ] Verify `workshop.txt` is correct
- [ ] Verify `preview.png` is present (256x256)
- [ ] Test mod loads from Workshop folder

### 2. Test Locally (10 minutes)

- [ ] Launch Project Zomboid
- [ ] Enable mod in Mods menu
- [ ] Start new game
- [ ] Verify mod works correctly
- [ ] Check Sandbox Options appear

### 3. Upload to Steam (5 minutes)

1. Launch Project Zomboid
2. Main menu > **Workshop**
3. Click **Create**
4. Select **TOTC_ThinkOfTheChildren**
5. Review information
6. Click **Upload**
7. **Save Workshop ID!**

### 4. Update Files with Workshop ID (5 minutes)

Add Workshop ID to:

**workshop.txt**:
```ini
version=1
id=3123456789  # Your actual Workshop ID
```

**mod.info**:
```ini
url=https://steamcommunity.com/sharedfiles/filedetails/?id=3123456789
```

**README.md**:
```markdown
[![Steam Workshop](https://img.shields.io/badge/Steam-Workshop-blue)](https://steamcommunity.com/sharedfiles/filedetails/?id=3123456789)
```

### 5. Customize Workshop Page (10 minutes)

Visit workshop page and click **Edit**:

- [ ] Expand description
- [ ] Add screenshots
- [ ] Add YouTube video link (if you have one)
- [ ] Set proper tags
- [ ] Set visibility to Public

### 6. Cross-Link (5 minutes)

**On Steam Workshop**:
Add GitHub link in description:
```
Source code and bug reports:
https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren
```

**On GitHub README.md**:
Add Steam Workshop link in prominent location

**Total Time**: ~40 minutes

---

## Quick Command Reference

### Git Commands

```bash
# Check status
git status

# Add all changes
git add .

# Commit
git commit -m "Type: Brief description"

# Push
git push

# Create tag
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

# Create branch
git checkout -b feature-name

# Switch branch
git checkout main
```

### Commit Message Types

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code formatting
- `refactor:` Code restructuring
- `test:` Adding tests
- `chore:` Maintenance

---

## Update Workflow

### For Bug Fixes (v1.0.1)

1. **Fix the bug** in code
2. **Test** thoroughly
3. **Update version** in mod.info and workshop.txt
4. **Commit**:
   ```bash
   git add .
   git commit -m "fix: Description of bug fix"
   git push
   ```
5. **Tag release**:
   ```bash
   git tag -a v1.0.1 -m "Bug fix release"
   git push origin v1.0.1
   ```
6. **Create GitHub release** with changelog
7. **Update Steam Workshop**:
   - Launch PZ > Workshop > Manage Mods > Update
   - Add change notes

### For New Features (v1.1.0)

Same as above, but:
- Commit message: `feat: Description`
- Tag: `v1.1.0`
- More detailed changelog

---

## Promotion Checklist

After publishing:

### Week 1

- [ ] Post on r/projectzomboid
- [ ] Post on PZ Discord servers
- [ ] Post on official forums
- [ ] Tweet at @projectzomboid (if applicable)

### Ongoing

- [ ] Monitor Steam Workshop comments
- [ ] Monitor GitHub issues
- [ ] Respond to questions within 24-48 hours
- [ ] Update based on feedback
- [ ] Keep mod compatible with latest PZ version

---

## Troubleshooting Quick Fixes

### Git Push Fails

```bash
git pull origin main --rebase
git push origin main
```

### Steam Upload Fails

- Check preview.png size (under 1MB)
- Verify folder structure is correct
- Make sure mod.info is valid
- Try restarting Steam

### Mod Not Working After Subscribe

- Unsubscribe and resubscribe
- Check console for errors
- Verify mod ID matches
- Clear Workshop cache

---

## Important URLs to Update

Before publishing, replace these placeholders:

1. **YOUR_USERNAME** - Your GitHub username
2. **YOUR_WORKSHOP_ID** - Your Steam Workshop ID (after upload)
3. **[Your Name/Username]** - Your actual name in credits

### Files to Update:

- [ ] README.md (badges and links)
- [ ] mod.info (url)
- [ ] workshop.txt (id, after Steam upload)
- [ ] CHANGELOG.md (links)
- [ ] All documentation mentioning GitHub URL

---

## Contact Information

Add your contact info for support:

- **GitHub Issues**: https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren/issues
- **Steam Workshop**: https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID
- **Discord**: Your Discord username (optional)
- **Email**: Your email (optional)

---

## Final Pre-Launch Check

Right before making public:

- [ ] All links work (click every link in README)
- [ ] Screenshots added (if available)
- [ ] Version numbers consistent everywhere
- [ ] No placeholder text remains
- [ ] LICENSE is correct
- [ ] Credits are complete
- [ ] Workshop visibility is Public
- [ ] GitHub repository is Public

---

## Post-Launch Monitoring

### First 24 Hours

- [ ] Check for comments/questions
- [ ] Monitor for bug reports
- [ ] Verify download works
- [ ] Check subscriber count

### First Week

- [ ] Address any critical bugs immediately
- [ ] Respond to all comments
- [ ] Update FAQ based on questions
- [ ] Thank early adopters

### Ongoing

- [ ] Weekly check for comments/issues
- [ ] Update for new PZ versions
- [ ] Consider user suggestions
- [ ] Keep documentation current

---

## Version Release Template

When releasing a new version:

### Checklist

- [ ] Code changes complete and tested
- [ ] Version bumped in mod.info
- [ ] Version bumped in workshop.txt
- [ ] CHANGELOG.md updated
- [ ] README.md updated (if needed)
- [ ] Git committed and tagged
- [ ] GitHub release created
- [ ] Steam Workshop updated
- [ ] Announcement posted

### Announcement Template

For Reddit, Discord, Forums:

```
TOTC: Think Of The Children - v1.1.0 Released!

New in this version:
- Feature 1
- Feature 2
- Bug fix 1

Download:
Steam: [link]
GitHub: [link]

Full changelog: [link]
```

---

**Ready to publish? Follow this checklist and you're all set!**

**Won't somebody please think of the children?!**
