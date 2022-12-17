local mod = {
    loadOrder = 1
}

local typeMaps = mjrequire "common/typeMaps"
local material = mjrequire "common/material"
local terrainDecal = mjrequire "common/terrainDecal"
local pathFinding = mjrequire "common/pathFinding"

local function createStandardOutputs(objectKeyName, countOrNil)
	local result = {}
	local count = countOrNil or 1
	for i=1,count do
		table.insert(result, {
			objectKeyName = objectKeyName,
			allowsOutputWhenVertexHasBeenFilled = true
		})
	end
	return result
end

function mod:onload(terrainTypes)

    function addBaseType(key, objectType)
        --- Allows adding a resource.
        --- @param key: The key to add, such as 'cake'
        --- @param objectType: The object to add, containing all fields.
    
        local typeIndexMap = typeMaps.types.terrainBase
    
        local index = typeIndexMap[key]
        if not index then
            mj:error("Attempt to add resource type that isn't in typeIndexMap:", key)
        else
            if terrainTypes.baseTypes[key] then
                mj:warn("Overwriting base type:", key)
                mj:log(debug.traceback())
            end
    
            objectType.key = key
            objectType.index = index
            typeMaps:insert("terrainBase", terrainTypes.baseTypes, objectType)
    
            -- Recache the type maps
            terrainTypes.baseTypesArray = typeMaps:createValidTypesArray("terrainBase", terrainTypes.baseTypes)
        end
    
        return index
    end

    function addVariations(key, objectType)
        --- Allows adding a resource.
        --- @param key: The key to add, such as 'cake'
        --- @param objectType: The object to add, containing all fields.
    
        local typeIndexMap = typeMaps.types.terrainVariations
    
        local index = typeIndexMap[key]
        if not index then
            mj:error("Attempt to add resource type that isn't in typeIndexMap:", key)
        else
            if terrainTypes.variations[key] then
                mj:warn("Overwriting base type:", key)
                mj:log(debug.traceback())
            end
    
            objectType.key = key
            objectType.index = index
            typeMaps:insert("terrainVariations", terrainTypes.variations, objectType)
    
            -- Recache the type maps
            terrainTypes.variationsArray = typeMaps:createValidTypesArray("terrainVariations", terrainTypes.variations)
        end
    
        return index
    end

    addBaseType("coal", {
        name = "coal",
		material = material.types.coal.index,
		decalGroupTypeIndex = terrainDecal.groupTypes.dirtGrass.index,
		digOutputs = createStandardOutputs("coal"),
		fillObjectTypeKey = "coal",
		pathDifficultyIndex = pathFinding.pathNodeDifficulties.dirtRock.index,
        requiresMining = true,
		disableSpawn = false,
    })

    addVariations("coal", {
        name = "coal"
    })
end

return mod