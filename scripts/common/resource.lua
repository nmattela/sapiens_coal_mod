local mod = {
    loadOrder = 1
}

local locale = mjrequire "common/locale"
local typeMaps = mjrequire "common/typeMaps"

function mod:onload(resource)

    local super_mjInit = resource.mjInit
    local gameObjectTypeIndexMap = typeMaps.types.gameObject

    resource.mjInit = function(self)
        super_mjInit(self)

        mj:log("Coal Mod in resource.lua: Adding charcoal resource... ")

        resource:addResource("charcoal", {
            name = "charcoal",
            plural = "charcoals",
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.charcoal
        })

        mj:log("Coal Mod in resource.lua: Modifying campfireFuel resource group... ")

        resource:addResourceGroup("campfireFuel", {
            name = locale:get("resource_group_campfireFuel"),
            plural = locale:get("resource_group_campfireFuel_plural"),
            resourceTypes = {
                resource.types.branch.index,
                resource.types.log.index,
                resource.types.pineCone.index,
                resource.types.pineConeBig.index,
                resource.types.charcoal.index,
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
        })

        mj:log("Coal Mod in resource.lua: Modifying kilnFuel resource group... ")

        resource:addResourceGroup("kilnFuel", {
            name = locale:get("resource_group_kilnFuel"),
            plural = locale:get("resource_group_kilnFuel_plural"),
            resourceTypes = {
                resource.types.branch.index,
                resource.types.log.index,
                resource.types.pineCone.index,
                resource.types.pineConeBig.index,
                resource.types.charcoal.index,
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
        })

        mj:log("Coal Mod in resource.lua: Modifying torchFuel resource group... ")

        resource:addResourceGroup("torchFuel", {
            name = locale:get("resource_group_torchFuel"),
            plural = locale:get("resource_group_torchFuel_plural"),
            resourceTypes = {
                resource.types.hay.index,
                resource.types.charcoal.index
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.hay,
        })

        mj:log("Coal Mod in resource.lua: Finished adding/modifying resource (group)s!")
    end
end

return mod