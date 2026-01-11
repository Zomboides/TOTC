# TOTC: Think Of The Children

<div align="center">

![TOTC Logo](preview.png)

> *"Won't somebody please think of the children?!"* - Helen Lovejoy, The Simpsons

[![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-Build%2042%2F43-green?style=for-the-badge)](https://projectzomboid.com)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)
[![Steam Workshop](https://img.shields.io/badge/Steam-Workshop-blue?style=for-the-badge&logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID)

**A Project Zomboid mod that adds child-sized zombies to the game**

[Features](#features) • [Installation](#installation) • [Configuration](#configuration) • [Screenshots](#screenshots) • [FAQ](#faq)

</div>

---

## Description

This mod introduces child-sized zombies to Project Zomboid, adding more variety and realism to the apocalypse. A configurable percentage of zombies will spawn at a reduced size, making the world feel more diverse and emotionally impactful.

The mod is lightweight, performance-friendly, and fully configurable through the game's Sandbox Options menu.

## Features

- **Configurable Spawn Rate**: Control what percentage of zombies spawn as children (default: 10%)
- **Adjustable Size**: Set how small child zombies are compared to adults (default: 50%)
- **Sandbox Integration**: Easy-to-use configuration through the game's built-in Sandbox Options
- **Multiplayer Ready**: Works seamlessly in both singleplayer and multiplayer servers
- **Build 42/43 Compatible**: Fully compatible with the latest Project Zomboid versions
- **Lightweight**: Minimal performance impact - only runs once per zombie spawn
- **Bilingual**: Includes English and Spanish translations
- **No Dependencies**: Works standalone without requiring other mods

## Installation

### Method 1: Steam Workshop (Recommended)

1. **Subscribe** to the mod on [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID)
2. Launch Project Zomboid
3. Go to **Mods** menu and enable "TOTC: Think Of The Children"
4. Restart the game or start a new session
5. (Optional) Configure settings in **Sandbox Options > TOTC**

### Method 2: Manual Installation

1. **Download** the latest release from [GitHub Releases](../../releases)
2. **Extract** the `TOTC_ThinkOfTheChildren` folder
3. **Copy** to your Project Zomboid mods directory:
   - **Windows**: `%USERPROFILE%\Zomboid\mods\`
   - **Linux**: `~/.local/share/Zomboid/mods/`
   - **Mac**: `~/Library/Application Support/Zomboid/mods/`
4. Launch the game and enable the mod in the **Mods** menu
5. (Optional) Configure in **Sandbox Options > TOTC**

For detailed installation instructions, see [INSTALL.txt](INSTALL.txt).

## Configuration

Access the mod settings through **Main Menu > Sandbox Options > TOTC Tab**:

### Child Zombie Spawn Chance
- **Range**: 0-100%
- **Default**: 10%
- **Description**: Controls what percentage of zombies spawn as children
- **Examples**:
  - `10` = 1 in 10 zombies is a child (default)
  - `25` = 1 in 4 zombies is a child
  - `50` = Half of all zombies are children

### Child Zombie Size
- **Range**: 10-100%
- **Default**: 50%
- **Description**: Size of child zombies relative to normal zombie size
- **Examples**:
  - `50` = Children are half the size of adults (default)
  - `75` = Children are 3/4 the size of adults
  - `30` = Children are very small (30% of adult size)

### Multiplayer Considerations

In multiplayer games:
- **Server Owner**: Sets the configuration through Sandbox Options when creating the server
- **Clients**: Must have the mod installed but will use the server's settings
- Settings are synchronized automatically across all players

## Compatibility

### Game Versions
- Project Zomboid Build 42.x
- Project Zomboid Build 43.x (including 43.13.1)

### Mod Compatibility
Works with:
- Most zombie behavior mods
- Zombie spawn mods
- Map mods
- Difficulty/balance mods
- Outfit/clothing mods

Potential conflicts:
- Mods that completely override zombie models (rare)
- Other mods that also modify `OnZombieCreate` (usually compatible due to event system)

### Game Modes
- **Singleplayer**: Yes
- **Multiplayer**: Yes (requires installation on both server and clients)
- **Dedicated Server**: Yes

## Screenshots

*Coming soon - In-game screenshots showing size comparison between normal and child zombies*

## Technical Details

- **Language**: Lua
- **Event Hook**: `OnZombieCreate`
- **API Used**: `IsoZombie:setModelScale()`
- **Performance**: O(1) per zombie spawn - negligible impact
- **Code Size**: ~17 lines of core logic
- **Total Size**: ~1.9MB (includes images and documentation)

For technical documentation, see [TECHNICAL.md](TECHNICAL.md).

## FAQ

<details>
<summary><b>Does this work in existing saves?</b></summary>

Yes! The mod will affect newly spawned zombies. Zombies that already exist in your save will remain their original size.
</details>

<details>
<summary><b>Will this affect game balance?</b></summary>

Slightly. Smaller zombies have smaller hitboxes, making them slightly harder to hit. However, they still have the same health, damage, and AI behavior as normal zombies.
</details>

<details>
<summary><b>Can I change settings mid-game?</b></summary>

Settings are applied when a new game starts or when a server is created. Changing sandbox options requires starting a new game.
</details>

<details>
<summary><b>Does this work with zombie respawn?</b></summary>

Yes! Every time a zombie spawns (including respawns), the mod checks whether it should be child-sized.
</details>

<details>
<summary><b>Is this multiplayer compatible?</b></summary>

Yes! Both the server and all clients must have the mod installed. The server's Sandbox settings will apply to everyone.
</details>

<details>
<summary><b>Can I set it to 0% to disable child zombies?</b></summary>

Yes! Set "Child Zombie Spawn Chance" to 0% to disable the mod's effect while keeping it installed.
</details>

## Known Issues

None currently reported. If you encounter any bugs, please [open an issue](../../issues).

## Roadmap

Potential future features:
- [ ] Multiple size tiers (toddler, child, teen)
- [ ] Optional stat adjustments (weaker, faster, etc.)
- [ ] Child-specific zombie outfits
- [ ] Configurable spawn rates based on location type

Suggestions welcome!

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Ways to contribute:
- Report bugs or issues
- Suggest new features
- Submit translations for other languages
- Improve documentation
- Submit pull requests

## Credits

- **Concept**: Inspired by Helen Lovejoy's iconic quote from The Simpsons
- **Developer**: [Your Name/Username]
- **Logo**: Helen Lovejoy screenshot from The Simpsons
- **Community**: Thanks to the Project Zomboid modding community

## License

This mod is released under the MIT License. See [LICENSE](LICENSE) for details.

You are free to:
- Use the mod in your gameplay
- Modify the mod for personal use
- Fork and create derivative works
- Use in mod packs or collections

Please provide credit if you use this mod's code in your own projects.

## Support

### Getting Help

- **Steam Workshop**: Comment on the [workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=YOUR_WORKSHOP_ID)
- **GitHub Issues**: [Report bugs or request features](../../issues)
- **Discord**: Join the [Project Zomboid Modding Discord](https://discord.gg/projectzomboid)

### Quick Links

- [Installation Guide](INSTALL.txt)
- [Quick Start Guide](QUICKSTART.txt)
- [Technical Documentation](TECHNICAL.md)
- [Spanish Documentation](LEEME.md)
- [File Structure](STRUCTURE.txt)

---

<div align="center">

**Won't somebody please think of the children?!**

Made with ♥ for the Project Zomboid community

[⬆ Back to Top](#totc-think-of-the-children)

</div>
