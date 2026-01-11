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
