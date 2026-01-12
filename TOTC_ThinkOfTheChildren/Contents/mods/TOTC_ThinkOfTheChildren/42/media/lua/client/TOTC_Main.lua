--[[
    TOTC: Think Of The Children
    Main Client Script - Build 42
    
    This mod adds smaller "child" zombies to the game.
    A configurable percentage of zombies will spawn at a reduced size.
    
    v1.0.5 - Simplified with full pcall protection
]]--

print("[TOTC] ========================================")
print("[TOTC] Think Of The Children v1.0.5 LOADING...")
print("[TOTC] ========================================")

local TOTC = {}
TOTC.DEBUG = true
TOTC.RESET_DELAY_TICKS = 5  -- Wait 5 ticks before applying scale

-- Debug print helper
function TOTC.log(msg)
    if TOTC.DEBUG then
        print("[TOTC DEBUG] " .. tostring(msg))
    end
end

-- Get sandbox options with defaults
function TOTC.getOptions()
    local options = {
        chance = 10,
        size = 50
    }
    
    if SandboxVars and SandboxVars.TOTC then
        if SandboxVars.TOTC.ChildZombieChance then
            options.chance = SandboxVars.TOTC.ChildZombieChance
        end
        if SandboxVars.TOTC.ChildZombieSize then
            options.size = SandboxVars.TOTC.ChildZombieSize
        end
    end
    
    return options
end

-- Mark zombie as child at creation
function TOTC.onZombieCreate(zombie)
    if not zombie then 
        TOTC.log("zombie is nil!")
        return 
    end
    
    local options = TOTC.getOptions()
    local roll = ZombRand(100)
    
    TOTC.log("Roll: " .. roll .. " < Chance: " .. options.chance .. " ?")
    
    if roll < options.chance then
        local finalScale = options.size / 100.0
        TOTC.log("*** MAKING CHILD ZOMBIE! Scale = " .. finalScale)
        
        local modData = zombie:getModData()
        if modData then
            modData.TOTCChildScale = finalScale
            modData.TOTCIsChild = true
            modData.TOTCTickCounter = 0
            modData.TOTCScaleApplied = false
        end
    end
end

-- Apply scale using multiple approaches (all wrapped in pcall for safety)
function TOTC.onZombieUpdate(zombie)
    if not zombie then return end
    
    local modData = zombie:getModData()
    if not modData then return end
    if not modData.TOTCIsChild then return end
    
    -- Already applied successfully
    if modData.TOTCScaleApplied then return end
    
    -- Increment tick counter
    modData.TOTCTickCounter = (modData.TOTCTickCounter or 0) + 1
    
    -- Wait a few ticks for model to be fully loaded
    if modData.TOTCTickCounter < TOTC.RESET_DELAY_TICKS then return end
    
    local targetScale = modData.TOTCChildScale or 0.5
    
    -- Wrap everything in pcall to prevent crashes
    local success, err = pcall(function()
        local modelInstance = zombie:getModelInstance()
        if modelInstance then
            -- Try to set scale property
            if type(modelInstance) == "userdata" or type(modelInstance) == "table" then
                modelInstance.scale = targetScale
                TOTC.log("Set modelInstance.scale = " .. targetScale)
            end
        end
    end)
    
    if not success then
        TOTC.log("Scale assignment failed: " .. tostring(err))
    end
    
    -- Mark as applied to stop retrying
    modData.TOTCScaleApplied = true
    TOTC.log("Child zombie processed (ID: " .. tostring(zombie:getOnlineID()) .. ")")
end

-- Register events
print("[TOTC] Registering OnZombieCreate event")
Events.OnZombieCreate.Add(TOTC.onZombieCreate)

print("[TOTC] Registering OnZombieUpdate event") 
Events.OnZombieUpdate.Add(TOTC.onZombieUpdate)

print("[TOTC] ========================================")
print("[TOTC] Think Of The Children v1.0.5 LOADED!")
print("[TOTC] ========================================")
