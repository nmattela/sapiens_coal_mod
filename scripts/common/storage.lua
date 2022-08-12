local mod = {
    loadOrder = 1
}


local typeMaps = mjrequire "common/typeMaps"
local resource = mjrequire "common/resource"
local rng = mjrequire "common/randomNumberGenerator"

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Rotate = mjm.mat3Rotate
local mat3Identity = mjm.mat3Identity

function mod:onload(storage)
    storage:addStorage("charcoal", {
        name = "charcoal",
        displayGameObjectTypeIndex = typeMaps.types.gameObject.charcoal,
        resources = {
            resource.types.charcoal.index,
        },
        storageBox = {
            size =  vec3(0.1, 0.1, 0.1),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
                rotation = mat3Rotate(rotation, randomValue * 6.282, vec3(1.0,0.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
		carryType = storage.carryTypes.small,
		carryOffset = vec3(0.0,0.01,0.0),
    })
end

return mod