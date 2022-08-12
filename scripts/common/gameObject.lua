local mod = {
    loadOrder = 1
}

local resource = mjrequire "common/resource"
local snapGroup = mjrequire "common/snapGroup"

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local normalize = mjm.normalize

function mod:onload(gameObject)
    gameObject:addGameObject("charcoal", {
        modelName = "charcoal",
        name = "charcoal",
        plural = "charcoals",
        scale = 1.0,
        hasPhysics = true,
        resourceTypeIndex = resource.types.charcoal.index,
        objectViewRotationFunction = function(object)
            return mat3Rotate(mat3Identity, 0.1, vec3(1.0, 0.0, 0.0))
        end,
        markerPositions = {
            {
                worldOffset = vec3(0.0, mj:mToP(0.2), 0.0)
            }
        },
    })
end

return mod