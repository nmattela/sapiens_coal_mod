local mod = {
    loadOrder = 1
}

local terrainTypesModule = mjrequire "common/terrainTypes"
local terrainBaseTypes = terrainTypesModule.baseTypes

function mod:onload(flora)
    flora.mediumTypes[terrainBaseTypes.coal.index] = {
        soilQuality = flora.soilQualities.veryPoor
    }
end

return mod