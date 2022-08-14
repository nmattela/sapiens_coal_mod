local mod = {
    loadOrder = 1
}

local resource = mjrequire "common/resource"

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

function mod:onload(gameObject)


    mj:log("Coal Mod in gameObject.lua: Doing init...")

    super_mjInit = gameObject.mjInit

    gameObject.mjInit = function(self)

        mj:log("Coal Mod in gameObject.lua: About to add charcoal...")
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
        mj:log("Coal Mod in gameObject.lua: Charcoal added successfully!")


        super_mjInit(self)
    end
end

return mod