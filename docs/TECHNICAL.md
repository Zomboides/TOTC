# Technical Documentation

## Overview

TOTC marks zombies as "children" at spawn time using Lua events. 

**Important**: Build 42 does **not support visual character scaling via Lua**. The mod currently marks zombies and attempts scale assignment, but visual scaling requires Java modding (see [LEAF_FUTURE.md](LEAF_FUTURE.md)).

## Current Implementation (v1.0.5)

### How It Works

1. `OnZombieCreate` - Randomly marks zombies as "child" based on spawn chance
2. `OnZombieUpdate` - Attempts to apply scale (no visual effect in B42)
3. Scale value stored in `modData.TOTCChildScale` for future use

### Core Code

```lua
-- OnZombieCreate: Mark zombie as child
function TOTC.onZombieCreate(zombie)
    if ZombRand(100) < options.chance then
        modData.TOTCChildScale = options.size / 100.0
        modData.TOTCIsChild = true
    end
end

-- OnZombieUpdate: Attempt scale (wrapped in pcall for safety)
function TOTC.onZombieUpdate(zombie)
    pcall(function()
        local modelInstance = zombie:getModelInstance()
        if modelInstance then
            modelInstance.scale = targetScale  -- Sets value, no visual effect
        end
    end)
    modData.TOTCScaleApplied = true
end
```

## Build 42 Scaling Limitations

We tested multiple approaches - **none provide visual scaling**:

| Method | Result |
|--------|--------|
| `modelInstance.scale = X` | ❌ Sets value, no visual change |
| `zombie:resetModelNextFrame()` | ❌ NullPointerException crash |
| `ModelManager.instance:Reset()` | ❌ No effect or crash |
| `applyModelScriptScale()` | ❌ Not available for characters |
| Custom ModelScripts | ❌ Only work for items/vehicles |

### Why It Doesn't Work

- Characters (zombies/players) use a specialized rendering pipeline
- Scale is read from model definitions at load time, not dynamically
- The rendering system ignores runtime scale changes
- No Lua API exists to swap character models

### Solution: Java Modding

Visual scaling requires:
1. **Java class modification** via Leaf framework
2. **Custom 3D models** (smaller meshes)
3. See [LEAF_FUTURE.md](LEAF_FUTURE.md) for roadmap

## APIs Used

| API | Purpose |
|-----|---------|
| `Events.OnZombieCreate` | Hook for zombie spawn |
| `Events.OnZombieUpdate` | Hook for per-tick updates |
| `zombie:getModData()` | Store child zombie flags |
| `zombie:getModelInstance()` | Access model (scale ineffective) |
| `ZombRand(max)` | Random number generation |
| `SandboxVars.TOTC.*` | User configuration |

## Sandbox Options

Defined in `42/media/sandbox-options.txt` (Build 42 format):

```txt
option TOTC.ChildZombieChance {
    type = integer, min = 0, max = 100, default = 10,
    page = TOTC, translation = TOTC_ChildZombieChance,
}

option TOTC.ChildZombieSize {
    type = integer, min = 10, max = 100, default = 50,
    page = TOTC, translation = TOTC_ChildZombieSize,
}
```

## File Structure (Build 42)

```
TOTC_ThinkOfTheChildren/
├── workshop.txt
├── preview.png
└── Contents/mods/TOTC_ThinkOfTheChildren/
    ├── common/                     # Required (even if empty)
    │   └── media/
    └── 42/
        ├── mod.info
        ├── poster.png
        └── media/
            ├── sandbox-options.txt
            └── lua/
                ├── client/TOTC_Main.lua
                └── shared/Translate/
                    ├── EN/Sandbox_EN.txt
                    └── ES/Sandbox_ES.txt
```

## Performance

- **Memory**: Negligible (modData flags only)
- **CPU**: O(1) per zombie spawn
- **Network**: No additional traffic

## Future Enhancements

See [LEAF_FUTURE.md](LEAF_FUTURE.md) for visual scaling roadmap.

Other ideas:
- Stat adjustments (speed, HP, damage) for "child" zombies
- Location-based spawn rates (schools, playgrounds)
- Additional language translations
