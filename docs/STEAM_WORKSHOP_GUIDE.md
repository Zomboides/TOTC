# Steam Workshop Publishing Guide

## Complete Guide to Publishing TOTC: Think Of The Children on Steam Workshop

This guide will walk you through the process of publishing your mod to the Steam Workshop for Project Zomboid.

---

## Prerequisites

Before you begin, make sure you have:

- [ ] Project Zomboid installed on Steam
- [ ] A Steam account in good standing
- [ ] The mod files ready (this folder)
- [ ] Tested the mod locally and confirmed it works

---

## Method 1: In-Game Uploader (Recommended for Beginners)

### Step 1: Prepare Your Files

1. **Copy the mod folder** to your Workshop directory:
   ```
   Windows: %USERPROFILE%\Zomboid\Workshop\
   Linux: ~/.local/share/Zomboid/Workshop/
   Mac: ~/Library/Application Support/Zomboid/Workshop/
   ```

2. Your folder structure should look like this:
   ```
   Zomboid/Workshop/TOTC_ThinkOfTheChildren/
   ├── Contents/
   ├── workshop.txt
   └── preview.png
   ```

### Step 2: Verify workshop.txt

Make sure your `workshop.txt` file has the correct information:

```ini
version=1
id=TOTC_ThinkOfTheChildren
title=TOTC: Think Of The Children
description="Won't somebody please think of the children?!" - Helen Lovejoy
description=
description=This mod adds smaller zombies to the game, representing children zombies.
description=
description=Features:
description=- Configurable spawn chance (default: 10%)
description=- Configurable size reduction (default: 50%)
description=- Works with Build 42/43+
description=- Compatible with multiplayer
tags=Build 42;Build 43;Balance;Multiplayer;Realistic
visibility=public
```

**Important**: Each `description=` line adds a new line in the Steam description.

### Step 3: Test Locally First

1. Launch Project Zomboid
2. Go to **Mods** menu
3. Find and enable "TOTC: Think Of The Children"
4. Start a new game in Sandbox mode
5. Check that the mod appears in Sandbox Options under "TOTC"
6. Test that child zombies spawn correctly

### Step 4: Upload to Steam Workshop

1. Launch Project Zomboid
2. From the main menu, click **Workshop**
3. Click **Create**
4. Select your mod from the list: **TOTC_ThinkOfTheChildren**
5. Review the information:
   - Title
   - Description
   - Preview image (preview.png)
   - Tags
6. Click **Upload**
7. Wait for the upload to complete (usually takes a few seconds)
8. You'll receive a Workshop ID number - **save this number!**

### Step 5: Update Your Mod with Workshop ID

After uploading, Steam will assign a Workshop ID (e.g., `3123456789`).

1. Update `workshop.txt` by adding at the top:
   ```ini
   version=1
   id=3123456789
   ```

2. Update the README.md badges with your real Workshop ID:
   ```markdown
   [![Steam Workshop](https://img.shields.io/badge/Steam-Workshop-blue?style=for-the-badge&logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=3123456789)
   ```

3. Update `mod.info` URL:
   ```ini
   url=https://steamcommunity.com/sharedfiles/filedetails/?id=3123456789
   ```

### Step 6: Visit Your Workshop Page

1. Go to your Steam Workshop item:
   ```
   https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID
   ```

2. Click **Edit** to customize:
   - Add more detailed description
   - Add screenshots (if you have them)
   - Add YouTube video links (optional)
   - Update tags
   - Set visibility (Public, Friends Only, Private)

---

## Method 2: SteamCMD (Advanced Users)

### Prerequisites

1. Download and install SteamCMD:
   - Windows: https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
   - Linux: https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
   - Mac: https://steamcdn-a.akamaihd.net/client/installer/steamcmd_osx.tar.gz

### Create VDF File

Create a file called `workshop_upload.vdf` in your mod's root directory:

```vdf
"workshopitem"
{
  "appid" "108600"
  "publishedfileid" "0"
  "contentfolder" "C:\\full\\path\\to\\TOTC_ThinkOfTheChildren\\Contents"
  "previewfile" "C:\\full\\path\\to\\TOTC_ThinkOfTheChildren\\preview.png"
  "visibility" "0"
  "title" "TOTC: Think Of The Children"
  "description" "Won't somebody please think of the children?! - Helen Lovejoy. This mod adds child-sized zombies to Project Zomboid."
  "changenote" "Initial release"
}
```

**Notes**:
- Use full absolute paths
- `publishedfileid` should be `0` for first upload
- `visibility`: 0 = public, 1 = friends only, 2 = private

### Upload via SteamCMD

1. Open terminal/command prompt in SteamCMD directory
2. Run:
   ```bash
   steamcmd +login YOUR_STEAM_USERNAME +workshop_build_item "C:\path\to\workshop_upload.vdf" +quit
   ```
3. Enter your Steam password when prompted
4. If you have Steam Guard, enter the code from your email/mobile app
5. Wait for upload to complete
6. Note the Workshop ID that's returned

### Updating via SteamCMD

1. Edit `workshop_upload.vdf` and change:
   - `publishedfileid` to your Workshop ID
   - `changenote` to describe what changed
2. Run the same SteamCMD command
3. The workshop item will be updated

---

## Method 3: Steam Upload Tool (Community Tool)

There's a community tool called **Steam Uploader** that can help:

1. Download from: https://github.com/blindcoder/pz-steam-uploader
2. Follow the tool's instructions
3. Provide your mod's path and Steam credentials
4. The tool handles the upload process

---

## Post-Publication Steps

### 1. Verify Your Upload

1. Subscribe to your own mod
2. Launch Project Zomboid
3. Test that the mod works when subscribed from Workshop
4. Unsubscribe and re-subscribe to test clean install

### 2. Add Additional Content

Visit your Workshop page and add:

- **Screenshots**: Take in-game screenshots showing child zombies
  - Press F11 in-game to take screenshots
  - Find them in: `Zomboid/screenshots/`
  - Upload to Workshop page

- **Description**: Expand your description with:
  - Clear feature list
  - Installation instructions
  - Configuration guide
  - FAQ section
  - Credits

- **Tags**: Make sure you have relevant tags:
  - Build 42
  - Build 43
  - Balance
  - Multiplayer
  - Realistic

### 3. Promote Your Mod

- Share on Reddit: r/projectzomboid
- Share on Discord: Project Zomboid official and modding servers
- Share on the official forums: https://theindiestone.com/forums/
- Tweet at @projectzomboid (if you have Twitter/X)

### 4. Respond to Comments

- Monitor Workshop comments
- Answer questions from users
- Fix bugs that are reported
- Update based on feedback

---

## Updating Your Mod

### Using In-Game Uploader

1. Make changes to your mod files in the Workshop folder
2. Update `version=` number in `workshop.txt`
3. Launch Project Zomboid
4. Go to **Workshop** > **Manage Mods**
5. Find your mod and click **Update**
6. Add change notes describing what's new/fixed
7. Click **Upload**

### Version Numbering

Use semantic versioning:
- `1.0.0` - Initial release
- `1.0.1` - Bug fixes
- `1.1.0` - New features (minor)
- `2.0.0` - Major changes

### Change Notes

Always include clear change notes:

**Good example**:
```
v1.1.0
- Added Spanish translations
- Fixed bug where zombies weren't scaling properly
- Increased default spawn chance to 15%
- Performance improvements
```

**Bad example**:
```
Fixed stuff
```

---

## Best Practices

### Before Publishing

- [ ] Test thoroughly in singleplayer
- [ ] Test in multiplayer if possible
- [ ] Check for console errors
- [ ] Verify all translations work
- [ ] Make sure preview image is high quality (256x256 minimum)
- [ ] Write clear, comprehensive description
- [ ] Include configuration instructions

### Description Writing Tips

1. **Start with a hook**: Grab attention in the first line
2. **Use formatting**: Bold, italic, lists, headers
3. **Be clear**: Explain exactly what the mod does
4. **Include examples**: Show configuration examples
5. **List compatibility**: What works, what doesn't
6. **Provide support info**: Where to get help
7. **Credit others**: Acknowledge inspirations or helpers

### Preview Image Tips

- Use 512x512 or 1024x1024 resolution
- Make it eye-catching and relevant
- Include mod name/logo
- Use high contrast for thumbnail visibility
- Test how it looks at different sizes

### Tags Strategy

Choose tags that help users find your mod:
- Version tags (Build 42, Build 43)
- Feature tags (Balance, Multiplayer)
- Category tags (Realistic, Zombies, Hardcore)
- Don't spam tags - only use relevant ones

---

## Troubleshooting

### Upload Fails

**Error**: "Invalid mod structure"
- **Fix**: Ensure Contents/mods/MODNAME folder structure is correct

**Error**: "Preview image too large"
- **Fix**: Resize preview.png to under 1MB

**Error**: "Description too long"
- **Fix**: Shorten description in workshop.txt

### Mod Doesn't Appear

- Verify mod.info exists and is valid
- Check that mod ID matches folder name
- Ensure all required files are present

### Can't Update Mod

- Make sure you're logged into the same Steam account that created it
- Verify workshop.txt has the correct Workshop ID
- Try deleting and re-subscribing to your own mod

### Subscribers Can't Download

- Check Workshop item visibility is set to Public
- Verify you didn't violate any Steam Workshop rules
- Ensure the mod uploaded completely (check file size)

---

## Steam Workshop Guidelines

### Content Policy

Do not include:
- Copyrighted content without permission
- Malicious code
- Offensive content
- Content that violates Steam's terms of service

### Helen Lovejoy Image

The preview image uses a screenshot from The Simpsons. This is generally acceptable under fair use for non-commercial modding purposes, but:
- Don't claim ownership of The Simpsons IP
- Include attribution in description
- If requested by copyright holder, remove immediately

Alternatively, you can:
- Create original artwork
- Use a generic image
- Hire an artist to create custom logo

---

## Linking GitHub and Steam Workshop

### In Your GitHub README

Add your Workshop ID to the badge:
```markdown
[![Steam Workshop](https://img.shields.io/badge/Steam-Workshop-blue?style=for-the-badge&logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID)
```

### In Your Steam Description

Link to GitHub:
```
For bug reports and contributions, visit our GitHub:
https://github.com/yourusername/TOTC_ThinkOfTheChildren
```

### Keep Both Updated

When you update the mod:
1. Update files in GitHub
2. Create a GitHub release with version tag
3. Update Workshop version
4. Keep changelogs synchronized

---

## Success Checklist

After publishing, verify:

- [ ] Mod appears in Workshop search
- [ ] Preview image displays correctly
- [ ] Description is formatted properly
- [ ] All tags are appropriate
- [ ] You can subscribe and unsubscribe
- [ ] Mod downloads and installs correctly
- [ ] Mod works when subscribed (not just manual install)
- [ ] Multiplayer works (if applicable)
- [ ] Comments are enabled
- [ ] You've subscribed to your own mod for testing
- [ ] GitHub and Workshop links are updated

---

## Additional Resources

- **Official Modding Guide**: https://pzwiki.net/wiki/Modding
- **Workshop Guidelines**: https://steamcommunity.com/workshop/workshoplegalagreement
- **PZ Forums**: https://theindiestone.com/forums/
- **PZ Discord**: https://discord.gg/projectzomboid
- **PZ Wiki**: https://pzwiki.net/

---

## Support

If you run into issues:

1. Check the [Modding FAQ](https://pzwiki.net/wiki/Modding)
2. Ask on the [PZ Forums](https://theindiestone.com/forums/)
3. Join the [PZ Discord](https://discord.gg/projectzomboid)
4. Search existing Workshop items for examples

Good luck with your mod publication!

---

**Remember**: Once published, you're responsible for:
- Responding to user feedback
- Fixing reported bugs
- Keeping the mod updated for new game versions
- Being respectful to your users

**Won't somebody please think of the children?!**
