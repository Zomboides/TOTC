# TOTC: Think Of The Children - Technical Documentation

## Overview

This mod uses Lua scripting to modify zombie properties at creation time. It hooks into the `OnZombieCreate` event to randomly assign smaller sizes to a percentage of spawned zombies.

## Technical Details

### Core Mechanics

The mod operates on a simple probability system:

1. **Event Hook**: Listens to the `OnZombieCreate` event
2. **Random Roll**: Generates a random number (0-99) for each zombie
3. **Size Assignment**: If the roll is less than the configured chance, scales the zombie down

### Code Structure

#### Main Script (`TOTC_Main.lua`)

```lua
local TOTC = {}

function TOTC.OnZombieCreate(zombie)
    if not zombie then return end

    local childChance = SandboxVars.TOTC.ChildZombieChance or 10
    local childSize = SandboxVars.TOTC.ChildZombieSize or 50

    local randomRoll = ZombRand(100)

    if randomRoll < childChance then
        local scaleFactor = childSize / 100.0
        zombie:setModelScale(scaleFactor)
    end
end

Events.OnZombieCreate.Add(TOTC.OnZombieCreate)
```

**Key Functions:**
- `ZombRand(100)`: Returns a random integer between 0 and 99
- `zombie:setModelScale(scale)`: Sets the visual and collision size of the zombie
- `SandboxVars.TOTC.*`: Accesses user-configured settings

### Sandbox Options

The mod defines two sandbox options in `sandbox-options.txt`:

1. **TOTC.ChildZombieChance** (Integer: 0-100)
   - Type: integer
   - Range: 0 to 100
   - Default: 10
   - Represents percentage chance

2. **TOTC.ChildZombieSize** (Integer: 10-100)
   - Type: integer
   - Range: 10 to 100
   - Default: 50
   - Represents percentage of normal size

### Translation System

Translations are provided for:
- English (EN)
- Spanish (ES)

Translation files define:
- Page name: "TOTC: Think Of The Children"
- Option names and descriptions
- Tooltip text with formatting

## API Usage

### Project Zomboid APIs Used

1. **Events.OnZombieCreate**
   - Fires when a new zombie is created/spawned
   - Parameters: `IsoZombie zombie`
   - Called on both client and server

2. **IsoZombie:setModelScale(float)**
   - Sets the visual and physics scale of the zombie
   - Range: 0.1 to 1.0+ (typically)
   - Affects hitbox, render size, and collision

3. **ZombRand(max)**
   - Returns random integer from 0 to max-1
   - Used for probability calculations

4. **SandboxVars**
   - Global table containing all sandbox option values
   - Accessed via: `SandboxVars.ModName.OptionName`

## Compatibility Notes

### Build 42/43 Compatibility

The mod is designed for Build 42+ structure:
- Uses `common/` folder for shared content
- Supports versioning folders (e.g., `42.0/`, `43.0/`)
- Translation system compatible with both builds

### Multiplayer Behavior

- **Server-side**: Settings are controlled by server's Sandbox configuration
- **Client-side**: Each client must have the mod installed
- **Sync**: Zombie size is synced automatically by the game
- **Performance**: Minimal impact; only runs once per zombie spawn

### Mod Compatibility

**Compatible with:**
- All zombie behavior mods (Superb Survivors, etc.)
- Spawn mods (custom zombie spawners)
- Difficulty mods
- Map mods

**Potential conflicts:**
- Mods that also modify `OnZombieCreate` (usually no issue due to event system)
- Mods that override zombie models entirely

## Performance Considerations

- **Memory**: Negligible (no persistent data storage)
- **CPU**: Minimal (one function call per zombie spawn)
- **Network**: No additional network traffic
- **Optimization**: Early return if zombie is nil prevents unnecessary processing

## Extension Ideas

Potential enhancements for this mod:

1. **Age Variety**: Multiple size tiers (toddler, child, teen)
2. **Outfit Integration**: Child-specific clothing
3. **Stat Adjustments**: Weaker strength, faster speed
4. **Visual Indicators**: Different sounds or animations
5. **Lore Integration**: Context-based spawn chances (schools, playgrounds)

## Development Notes

### File Structure Requirements

For Build 42/43 compatibility:
- `common/` folder is MANDATORY (even if empty)
- `media/` must be inside `common/` or version folder
- `sandbox-options.txt` must be in `media/` folder
- Lua scripts can be in `lua/client/`, `lua/server/`, or `lua/shared/`

### Testing Checklist

- [ ] Mod loads without errors in console
- [ ] Sandbox options appear in menu
- [ ] Translations display correctly
- [ ] Child zombies spawn at configured rate
- [ ] Size scaling works as expected
- [ ] Multiplayer sync works correctly
- [ ] No conflicts with popular mods

## References

- [PZwiki Mod Structure](https://pzwiki.net/wiki/Mod_structure)
- [PZwiki Sandbox Options](https://pzwiki.net/wiki/Sandbox_options)
- [PZwiki Lua Events](https://pzwiki.net/wiki/Lua_event)
- [Project Zomboid JavaDocs](https://projectzomboid.com/modding/)

## License

This mod is open source and free to use. Feel free to:
- Study the code
- Modify for personal use
- Fork and create derivatives
- Use as a learning resource

Please credit the original mod if you publish derivatives.

---

**Created for the Project Zomboid modding community**
