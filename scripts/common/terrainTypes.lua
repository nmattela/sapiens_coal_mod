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

    terrainTypes:addBaseType("coal", {
        name = "coal",
		material = material.types.coal.index,
		decalGroupTypeIndex = terrainDecal.groupTypes.dirtGrass.index,
		digOutputs = createStandardOutputs("coal"),
		fillObjectTypeKey = "coal",
		pathDifficultyIndex = pathFinding.pathNodeDifficulties.dirtRock.index,
        requiresMining = true,
		disableSpawn = false,
    })

    terrainTypes:addVariation("coal", {
        name = "coal"
    })
end

return mod