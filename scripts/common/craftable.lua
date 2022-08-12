local mod = {
    loadOrder = 1
}

local vec3xMat3 = mjm.vec3xMat3

local gameObject = mjrequire "common/gameObject"
local constructable = mjrequire "common/constructable"
local actionSequence = mjrequire "common/actionSequence"
local skill = mjrequire "common/skill"
local resource = mjrequire "common/resource"
local craftAreaGroup = mjrequire "common/craftAreaGroup"


local cookingStickRotationOffset = mat3Inverse(mat3Rotate(mat3Identity, math.pi * 0.25, vec3(0.0,1.0,0.0)))
local cookingStickRotation = mat3Rotate(mat3Identity, -math.pi + math.pi * 0.25, vec3(0.0,1.0,0.0))

function mod:onload(craftable) {

    super_load = craftable.load

    craftable.load = function(self, gameObject, flora)

        super_load()

        craftable:addCraftable("charcoal", {
            name = "charcoal",
            plural = "charcoals",
            summary = "Charcoal is a fuel that lasts longer than branches or logs",
            iconGameObjectType = gameObject.typeIndexMap.charcoal,
            classification = constructable.classifications.craft.index,
            isFoodPreperation = false,
    
            outputObjectInfo = {
                objectTypesArray = {
                    gameObject.typeIndexMap.charcoal,
                    gameObject.typeIndexMap.charcoal,
                }
            },
            
            outputDisplayCount = 2,
    
            buildSequence = createStandardBuildSequence(actionSequence.types.fireStickCook.index, nil),
            inProgressBuildModel = "craftSimple",
    
            skills = {
                required = skill.types.fireLighting.index,
            },
    
            requiredResources = {
                {
                    type = resource.types.branch.index,
                    count = 3,
                },
                {
                    type = resource.types.log.index,
                    count = 1,
                },
            },
    
            requiredCraftAreaGroups = {
                craftAreaGroup.types.campfire.index,
            },
    
            temporaryToolObjectType = gameObject.typeIndexMap.stick,
            temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), cookingStickRotationOffset),
            temporaryToolRotation = cookingStickRotation,
        })
    end
    
}

return mod