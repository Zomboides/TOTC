# Changelog

All notable changes to TOTC: Think Of The Children will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- **Java/Leaf-based visual scaling** (see docs/LEAF_FUTURE.md)
- Custom 3D child models via Leaf framework
- Stat adjustments for child zombies (speed, HP, damage)
- Location-based spawn rates (schools, playgrounds)
- Additional language translations

---

## [1.0.5] - 2026-01-12

### Changed
- **IMPORTANT**: Discovered that Build 42 does NOT support visual character scaling via Lua
- Simplified code to essential marking functionality only
- Removed all scaling approaches that don't work:
  - `modelInstance.scale` - sets value but no visual effect
  - `resetModelNextFrame()` - causes NullPointerException crashes
  - `applyModelScriptScale()` - not available for characters
  - Custom ModelScripts - only work for items/vehicles
- Removed TOTC_Models.txt (doesn't work for character models)

### Fixed
- Full pcall protection prevents all crashes
- Clean modData marking for future Leaf-based implementation

### Documentation
- Created LEAF_FUTURE.md with Java modding roadmap
- Updated TECHNICAL.md with Build 42 limitations
- Research confirmed: visual scaling requires Java modding + custom 3D meshes

---

## [1.0.4] - 2026-01-12

### Added
- Custom ModelScript definitions for scaled zombie models (TOTC_Models.txt)
- Three different scaling approaches for maximum compatibility:
  1. Direct `modelInstance.scale` assignment
  2. `applyModelScriptScale()` with custom model definitions
  3. `ModelManager.instance:Reset()` for model refresh
- Model definitions at 50% scale (child) and 25% scale (tiny)

### Fixed
- Removed crash-causing `resetModelNextFrame()` call
- Fixed orphan `else` block syntax error
- Added pcall wrappers for safe API calls
- Added tick delay before applying scale (waits for model to load)

### Technical
- Uses Build 42 `42/media/scripts/` folder for ModelScript definitions
- Fallback approaches if one method doesn't work
- Extensive debug logging for troubleshooting

---

## [1.0.1] - 2026-01-12

### Fixed
- Fixed Build 42 mod structure (uses `common/` + `42/` folder layout)
- Fixed sandbox-options.txt format for Build 42 compatibility
- Fixed Lua error: replaced non-existent `setScaleForThirdPersonCamera` with `modelInstance.scale`
- Added fallback OnTick handler for reliable zombie processing
- Added zombie tracking to prevent processing the same zombie multiple times

### Changed
- Updated mod.info to specify `pzversion=42.13.1`
- Added extensive debug logging for troubleshooting
- Improved error handling and nil checks

---

## [1.0.0] - 2026-01-10

### Added
- Initial release of TOTC: Think Of The Children mod
- Child-sized zombie spawning system
- Configurable spawn chance (default: 10%)
- Configurable zombie size (default: 50%)
- Sandbox Options integration for easy configuration
- Event hook using `OnZombieCreate`
- English translation (EN)
- Spanish translation (ES)
- Multiplayer support with server-side settings
- Build 42/43 compatibility
- Comprehensive documentation:
  - README.md (English)
  - LEEME.md (Spanish)
  - TECHNICAL.md (Technical documentation)
  - INSTALL.txt (Installation guide)
  - QUICKSTART.txt (Quick reference)
  - STRUCTURE.txt (File structure documentation)
  - STEAM_WORKSHOP_GUIDE.md (Steam publishing guide)
  - GITHUB_PUBLISHING_GUIDE.md (GitHub publishing guide)
  - CONTRIBUTING.md (Contribution guidelines)
- MIT License
- Preview image (Helen Lovejoy from The Simpsons)
- Mod poster image

### Technical Details
- Lua-based implementation
- Uses `IsoZombie:setModelScale()` API
- Minimal performance impact
- No external dependencies
- ~17 lines of core logic

### Compatibility
- Project Zomboid Build 42.x
- Project Zomboid Build 43.13.1+
- Works with most zombie-related mods
- Fully functional in singleplayer and multiplayer

---

## Version History

### Version Numbering

This mod follows [Semantic Versioning](https://semver.org/):
- **MAJOR** version (1.0.0): Incompatible API changes
- **MINOR** version (0.1.0): New features, backwards compatible
- **PATCH** version (0.0.1): Bug fixes, backwards compatible

### Release Types

- **Stable**: Fully tested, recommended for all users
- **Beta**: Testing phase, may have minor issues
- **Alpha**: Early development, use at your own risk

---

## Links

- **GitHub Repository**: https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren
- **Steam Workshop**: https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID
- **Issue Tracker**: https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren/issues
- **Releases**: https://github.com/YOUR_USERNAME/TOTC_ThinkOfTheChildren/releases

---

**Won't somebody please think of the children?!**
