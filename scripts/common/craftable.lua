local mod = {
    loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local mat3Inverse = mjm.mat3Inverse

-- local gameObject = mjrequire "common/gameObject"
local constructable = mjrequire "common/constructable"
local actionSequence = mjrequire "common/actionSequence"
local skill = mjrequire "common/skill"
local resource = mjrequire "common/resource"
local craftAreaGroup = mjrequire "common/craftAreaGroup"


local cookingStickRotationOffset = mat3Inverse(mat3Rotate(mat3Identity, math.pi * 0.25, vec3(0.0,1.0,0.0)))
local cookingStickRotation = mat3Rotate(mat3Identity, -math.pi + math.pi * 0.25, vec3(0.0,1.0,0.0))

local actionSequenceRepeatCountSlowerCompletion = 7
local function createStandardBuildSequence(actionSequenceTypeIndex, requiredToolIndex, repeatCountOrNil)
    return {
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.clearIncorrectResources.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.bringResources.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.bringTools.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.moveComponents.index,
        },
        {
            constructableSequenceTypeIndex = constructable.sequenceTypes.actionSequence.index,
            actionSequenceTypeIndex = actionSequenceTypeIndex,
            requiredToolIndex = requiredToolIndex, --must be available at the site, so this must be after constructable.sequenceTypes.bringResources
            disallowCompletionWithoutSkill = true,
            repeatCount = repeatCountOrNil or actionSequenceRepeatCountSlowerCompletion,
        },
    }
end

function mod:onload(craftable)

    -- mj:log("Coal Mod in craftable.lua: Adding craftable recipe for charcoal... ")

    -- constructable:addConstructable("charcoal", {
    --     name = "charcoal",
    --     plural = "charcoals",
    --     summary = "Charcoal is a fuel that lasts longer than branches or logs",
    --     iconGameObjectType = gameObject.typeIndexMap.charcoal,
    --     classification = constructable.classifications.craft.index,
    --     isFoodPreperation = true,

    --     outputObjectInfo = {
    --         objectTypesArray = {
    --             gameObject.typeIndexMap.charcoal,
    --             gameObject.typeIndexMap.charcoal,
    --         }
    --     },
        
    --     outputDisplayCount = 2,

    --     buildSequence = createStandardBuildSequence(actionSequence.types.fireStickCook.index, nil),
    --     inProgressBuildModel = "craftSimple",

    --     skills = {
    --         required = skill.types.campfireCooking.index,
    --     },

    --     requiredResources = {
    --         {
    --             type = resource.types.branch.index,
    --             count = 3,
    --         },
    --     },

    --     requiredCraftAreaGroups = {
    --         craftAreaGroup.types.campfire.index,
    --     },

    --     temporaryToolObjectType = gameObject.typeIndexMap.stick,
    --     temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), cookingStickRotationOffset),
    --     temporaryToolRotation = cookingStickRotation,
    -- })

    -- mj:log("Coal Mod in craftable.lua: Craftable recipe for charcoal added succesfully!...")

    super_load = craftable.load

    craftable.load = function(self, gameObject, flora)
        super_load()

        constructable:addConstructable("charcoal", {
            name = "charcoal",
            plural = "charcoals",
            summary = "Charcoal is a fuel that lasts longer than branches or logs",
            iconGameObjectType = gameObject.typeIndexMap.charcoal,
            classification = constructable.classifications.craft.index,
            isFoodPreperation = true,
    
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
                required = skill.types.campfireCooking.index,
            },
    
            requiredResources = {
                {
                    type = resource.types.branch.index,
                    count = 3,
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
end

return mod