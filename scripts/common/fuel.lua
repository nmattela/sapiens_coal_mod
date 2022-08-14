local mod = {
    loadOrder = 1
}

local typeMaps = mjrequire "common/typeMaps"
local gameObject = mjrequire "common/gameObject"
local resource = mjrequire "common/resource"
local locale = mjrequire "common/locale"

function mod:onload(fuel)

    local fuelGroup = typeMaps:createMap("fuelGroup", {
        {
            key = "campfire",
            name = locale:get("fuelGroup_campfire"),
            resources = {
                [resource.types.branch.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.log.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.pineCone.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.pineConeBig.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.charcoal.index] = {
                    fuelAddition = 20.0,
                },
            },
            objectTypes = {},
            resourceGroupIndex = resource.groups.campfireFuel.index,
        },
        {
            key = "kiln",
            name = locale:get("fuelGroup_kiln"),
            resources = {
                [resource.types.branch.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.log.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.pineCone.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.pineConeBig.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.charcoal.index] = {
                    fuelAddition = 20.0,
                },
            },
            objectTypes = {},
            resourceGroupIndex = resource.groups.kilnFuel.index,
        },
        {
            key = "torch",
            name = locale:get("fuelGroup_torch"),
            resources = {
                [resource.types.hay.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.charcoal.index] = {
                    fuelAddition = 20.0,
                },
            },
            objectTypes = {},
            resourceGroupIndex = resource.groups.torchFuel.index,
        },
        {
            key = "litObject",
            name = locale:get("fuelGroup_litObject"),
            resources = {
                [resource.types.hay.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.branch.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.log.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.pineCone.index] = {
                    fuelAddition = 1.0,
                },
                [resource.types.pineConeBig.index] = {
                    fuelAddition = 6.0,
                },
                [resource.types.charcoal.index] = {
                    fuelAddition = 20.0,
                },
            },
            objectTypes = {},
        },
    }) --DONT FORGET TO ADD TO RESOURCE GROUPS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    function fuel:finalize()
        fuel.validGroupTypes = typeMaps:createValidTypesArray("fuelGroup", fuelGroup)
        local fuelGroupsByFuelResourceTypes = {}
    
        for i,groupType in ipairs(fuel.validGroupTypes) do
            for resourceTypeIndex,info in pairs(groupType.resources) do
                local gameObjectsTypesForResource = gameObject.gameObjectTypeIndexesByResourceTypeIndex[resourceTypeIndex]
                for j,gameObjectTypeIndex in ipairs(gameObjectsTypesForResource) do
                    table.insert(groupType.objectTypes, gameObjectTypeIndex)
                end
    
                local fuelGroupsArray = fuelGroupsByFuelResourceTypes[resourceTypeIndex]
                if not fuelGroupsArray then
                    fuelGroupsArray = {}
                    fuelGroupsByFuelResourceTypes[resourceTypeIndex] = fuelGroupsArray
                end
                if groupType.resourceGroupIndex then
                    table.insert(fuelGroupsArray, groupType)
                end
            end
        end
    
        fuel.groupsByObjectTypeIndex = {
            [gameObject.types.campfire.index] = fuelGroup.campfire,
            [gameObject.types.torch.index] = fuelGroup.torch,
            [gameObject.types.brickKiln.index] = fuelGroup.kiln,
        }
    
        fuel.fuelGroupsByFuelResourceTypes = fuelGroupsByFuelResourceTypes
    
    end


    local super_mjInit = fuel.mjInit

    fuel.mjInit = function(self)

        fuel:finalize()

        -- super_mjInit(self)

        -- mj:log("Coal Mod in fuel.lua: Adding fuel addition to campfires... ")
        -- fuel.groupsByObjectTypeIndex[gameObject.types.campfire.index].resources[resource.types.charcoal.index] = { fuelAddition = 20.0 }
        -- mj:log("Coal Mod in fuel.lua: Adding fuel addition to torches... ")
        -- fuel.groupsByObjectTypeIndex[gameObject.types.torch.index].resources[resource.types.charcoal.index] = { fuelAddition = 20.0 }
        -- mj:log("Coal Mod in fuel.lua: Adding fuel addition to brickKiln... ")
        -- fuel.groupsByObjectTypeIndex[gameObject.types.brickKiln.index].resources[resource.types.charcoal.index] = { fuelAddition = 20.0 }
        -- mj:log("Coal Mod in fuel.lua: Fuel addition added succesfully! ")

        -- mj:log("Coal Mod in fuel.lua: Printing groupsByObjectTypeIndex... ")
        -- mj:log(fuel.groupsByObjectTypeIndex)
        


    end
end

return mod