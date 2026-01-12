# Publishing Guide

Guide for publishing TOTC: Think Of The Children to GitHub and Steam Workshop.

---

## Pre-Publishing Checklist

- [ ] Mod loads without errors
- [ ] Tested in singleplayer and multiplayer
- [ ] Sandbox options work correctly
- [ ] Child zombies spawn at configured rate
- [ ] All files present (code, translations, images)
- [ ] Version numbers updated

---

## GitHub Publishing

### 1. Setup (5 min)

```bash
cd TOTC_ThinkOfTheChildren
git init
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren.git
```

### 2. First Commit

```bash
git add .
git commit -m "Initial commit: TOTC v1.0.0"
git push -u origin main
```

### 3. Create Release

1. Go to **Releases** → **Create new release**
2. Tag: `v1.0.0`
3. Title: `v1.0.0 - Initial Release`
4. Add description from CHANGELOG
5. Publish

### 4. Update Links

Replace `YOUR_USERNAME` and `YOUR_WORKSHOP_ID` in:
- `mod.info`
- `README.md`

---

## Steam Workshop Publishing

### 1. Prepare Files

Copy the mod to your mods directory:
```
Windows: %USERPROFILE%\Zomboid\mods\
Linux: ~/.local/share/Zomboid/mods/
Mac: ~/Library/Application Support/Zomboid/mods/
```

### 2. Verify workshop.txt

```ini
version=1
id=TOTC_ThinkOfTheChildren
title=TOTC: Think Of The Children
description="Won't somebody please think of the children?!" - Helen Lovejoy
description=
description=Adds smaller zombies representing children.
description=- Configurable spawn chance (default: 10%)
description=- Configurable size (default: 50%)
tags=Build 42;Build 43;Balance;Multiplayer;Realistic
visibility=public
```

### 3. Test Locally

1. Launch Project Zomboid
2. Enable mod in **Mods** menu
3. Start Sandbox game
4. Verify TOTC options appear
5. Test zombie spawning

### 4. Upload

1. Main menu → **Workshop** → **Create**
2. Select **TOTC_ThinkOfTheChildren**
3. Review info and click **Upload**
4. **Save the Workshop ID!**

### 5. Update with Workshop ID

Add to `workshop.txt`:
```ini
id=3123456789  # Your Workshop ID
```

Update README badges with real Workshop URL.

---

## Updating the Mod

### Version Update Workflow

1. Update code/features
2. Update version in `mod.info`
3. Update `CHANGELOG.md`
4. Test thoroughly
5. Commit and push to GitHub
6. Create new GitHub release
7. Re-upload to Steam Workshop

---

## Troubleshooting

### Mod not appearing in game
- Verify folder structure:
  ```
  Zomboid/mods/TOTC_ThinkOfTheChildren/
  ├── mod.info
  ├── poster.png
  └── media/
      ├── sandbox-options.txt
      └── lua/...
  ```
- Check `mod.info` exists and is valid
- Look for errors in `%USERPROFILE%\Zomboid\console.txt`

### Steam upload fails
- Verify `workshop.txt` format
- Check `preview.png` exists and is valid
- Ensure Steam is running and logged in

### GitHub push fails
- Use Personal Access Token (not password)
- Generate at: https://github.com/settings/tokens
