# Technical Documentation

## Overview

TOTC uses the `OnZombieCreate` event to randomly scale zombies at spawn time.

## Core Code

```lua
local TOTC = {}

function TOTC.OnZombieCreate(zombie)
    if not zombie then return end

    local childChance = SandboxVars.TOTC.ChildZombieChance or 10
    local childSize = SandboxVars.TOTC.ChildZombieSize or 50

    if ZombRand(100) < childChance then
        zombie:setModelScale(childSize / 100.0)
    end
end

Events.OnZombieCreate.Add(TOTC.OnZombieCreate)
```

## APIs Used

| API | Purpose |
|-----|---------|
| `Events.OnZombieCreate` | Hook for zombie spawn |
| `IsoZombie:setModelScale(float)` | Set zombie size (0.1-1.0+) |
| `ZombRand(max)` | Random int 0 to max-1 |
| `SandboxVars.TOTC.*` | User config values |

## Sandbox Options

Defined in `sandbox-options.txt`:

```
option TOTC.ChildZombieChance
    10, 0, 100    # default, min, max
    translation = Sandbox_TOTC_ChildZombieChance

option TOTC.ChildZombieSize
    50, 10, 100
    translation = Sandbox_TOTC_ChildZombieSize
```

## File Structure

```
Contents/mods/TOTC_ThinkOfTheChildren/
├── mod.info                 # Mod metadata
├── poster.png               # Thumbnail
└── common/media/
    ├── sandbox-options.txt  # Config options
    └── lua/
        ├── client/TOTC_Main.lua
        └── shared/Translate/
            ├── EN/Sandbox_EN.txt
            └── ES/Sandbox_ES.txt
```

## Performance

- **Memory**: Negligible
- **CPU**: O(1) per zombie spawn
- **Network**: No additional traffic

## Compatibility

- Uses `common/` folder (Build 42/43 structure)
- No conflicts with other mods (event system allows multiple handlers)
- Works in singleplayer and multiplayer

## Extending

Ideas for enhancement:
- Multiple size tiers (toddler, child, teen)
- Stat adjustments (speed, damage)
- Location-based spawn rates
- Additional translations
