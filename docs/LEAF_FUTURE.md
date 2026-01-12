# Leaf Framework - Future Development Path

## What is Leaf?

[Leaf](https://pzwiki.net/wiki/Leaf) is a fork of [FabricMC](https://fabricmc.net/) (the popular Minecraft mod loader) adapted for Project Zomboid Java modding.

**Key Benefits:**
- ✅ **Java mods via Steam Workshop** - No manual file installation
- ✅ **Auto-updates** - Mods update automatically
- ✅ **Update-resistant** - Uses mixins/patches instead of full class replacement
- ✅ **Build 42 compatible** - Updated for B42.12.2+

## Resources

| Resource | Link |
|----------|------|
| **Installer** | https://github.com/aoqia194/leaf-installer |
| **Example Mod** | https://github.com/aoqia194/leaf-example-mod |
| **Leaf API** | https://github.com/aoqia194/leaf-api |
| **Loader** | https://github.com/aoqia194/leaf-loader |
| **Wiki** | https://pzwiki.net/wiki/Leaf |

## Why Leaf for TOTC?

### Current Limitation

Build 42 does **not support visual character scaling via Lua**:
- `modelInstance.scale` - Sets value but doesn't affect rendering
- `resetModelNextFrame()` - Causes NullPointerException crashes
- `ModelScripts` with scale - Only work for items/vehicles, not characters

### Leaf Solution

With Leaf, we could:
1. Use **Java mixins** to hook into the character rendering pipeline
2. Override the model loading for zombies marked as "child"
3. Load **custom smaller 3D models** or apply scale transforms at render time
4. Distribute everything via **Steam Workshop** (users just need Leaf installed)

## Implementation Roadmap

### Phase 1: Research (Future)
- [ ] Study Leaf example mod structure
- [ ] Identify which Java classes control zombie model rendering
- [ ] Test if `HumanVisual.setForceModel()` can swap to custom models
- [ ] Explore render-time scale transforms

### Phase 2: 3D Models (Future)
- [ ] Create child-sized body meshes in Blender (~50-70% scale)
- [ ] Maintain skeleton rigging compatibility with adult animations
- [ ] Export as PZ-compatible format (.X or .FBX)
- [ ] Create male and female variants

### Phase 3: Leaf Mod Development (Future)
- [ ] Set up Leaf mod project structure
- [ ] Create mixins for zombie model loading
- [ ] Implement child zombie detection from ModData
- [ ] Handle corpse conversion properly
- [ ] Test multiplayer sync

### Phase 4: Integration (Future)
- [ ] Merge Leaf Java mod with existing Lua mod
- [ ] Lua handles: spawn chance, sandbox options, marking zombies
- [ ] Java handles: visual model swapping
- [ ] Package for Workshop distribution

## Comparison: Current vs Leaf Approach

| Aspect | Current (Lua Only) | Future (Leaf + Lua) |
|--------|-------------------|---------------------|
| Visual Scaling | ❌ Not possible | ✅ Custom models |
| Installation | ✅ Workshop only | ⚠️ Requires Leaf |
| Update Resilience | ✅ Very stable | ⚠️ May need updates |
| Complexity | ✅ Simple | ⚠️ Java + 3D modeling |
| User Reach | ✅ All users | ⚠️ Leaf users only |

## Related Mods to Study

### Dynamic Body Shape
- **Workshop ID**: 3066054201
- **Author**: Fed-cap
- **Approach**: Java class replacement (manual install)
- **Status**: Currently broken in B42.13+
- **Lesson**: Full class replacement is fragile; mixins are better

## Requirements for Leaf Development

1. **Java Development Kit (JDK)** - Version 17+
2. **Gradle** - Build system
3. **Blender** - For 3D model creation
4. **Understanding of**:
   - Java mixins (Fabric-style)
   - Project Zomboid's model/animation system
   - Skeleton rigging and animation compatibility

## Current Status

**v1.0.5** - Lua-only implementation:
- Marks zombies as "child" via ModData
- Attempts scale assignment (no visual effect in B42)
- No crashes (full pcall protection)
- Ready for future Leaf integration

## Notes

- Leaf is still maturing - API may change
- Consider reaching out to Leaf developer (aoqia194) for guidance
- Monitor PZ modding Discord for Leaf updates
- The Indie Stone may add official scaling support in future builds
