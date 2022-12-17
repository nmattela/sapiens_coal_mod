local mod = {
    loadOrder = 1
}


function mod:onload(flora)

    local terrainTypesModule = mjrequire "common/terrainTypes"
    local terrainBaseTypes = terrainTypesModule.baseTypes
    
    flora.mediumTypes[terrainBaseTypes.coal.index] = {
        soilQuality = flora.soilQualities.veryPoor
    }
end

return mod