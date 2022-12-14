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

        resource:addResource("charcoal", {
            name = "charcoal",
            plural = "charcoals",
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.charcoal
        })

        resource:addResource("coal", {
            name = "coal",
            plural = "coals",
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.coal
        })

        resource.validTypes = typeMaps:createValidTypesArray("resource", resource.types)

        local function addResourceToResourcePanel(key)
            for index, value in ipairs(resource.validTypes) do
                if value.key ~= nil and value.key == key then
                    table.insert(resource.alphabeticallyOrderedTypes, resource.validTypes[index])
                    table.sort(resource.alphabeticallyOrderedTypes, function(a, b)
                        return a.name < b.name
                    end)
                    break
                end
            end
        end

        addResourceToResourcePanel("coal")
        addResourceToResourcePanel("charcoal")

        resource:addResourceGroup("campfireFuel", {
            name = locale:get("resource_group_campfireFuel"),
            plural = locale:get("resource_group_campfireFuel_plural"),
            resourceTypes = {
                resource.types.branch.index,
                resource.types.log.index,
                resource.types.pineCone.index,
                resource.types.pineConeBig.index,
                resource.types.charcoal.index,
                resource.types.coal.index
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
        })

        resource:addResourceGroup("kilnFuel", {
            name = locale:get("resource_group_kilnFuel"),
            plural = locale:get("resource_group_kilnFuel_plural"),
            resourceTypes = {
                resource.types.branch.index,
                resource.types.log.index,
                resource.types.pineCone.index,
                resource.types.pineConeBig.index,
                resource.types.charcoal.index,
                resource.types.coal.index
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
        })

        resource:addResourceGroup("torchFuel", {
            name = locale:get("resource_group_torchFuel"),
            plural = locale:get("resource_group_torchFuel_plural"),
            resourceTypes = {
                resource.types.hay.index,
                resource.types.charcoal.index,
                resource.types.coal.index
            },
            containsTypesHash = {},
            displayGameObjectTypeIndex = gameObjectTypeIndexMap.hay,
        })
    end
end

return mod