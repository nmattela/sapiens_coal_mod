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

        local function createGroupHashesForBuiltInTypes()
            local validGroupTypes = typeMaps:createValidTypesArray("resourceGroup", resource.groups)
            for i,groupType in ipairs(validGroupTypes) do
                for j, resourceTypeIndex in ipairs(groupType.resourceTypes) do
                    groupType.containsTypesHash[resourceTypeIndex] = true
                end
            end
        end

        function resource:addResourceGroup(key, objectType)
            --- Allows adding a resource.
            --- @param key: The key to add, such as 'cake'
            --- @param objectType: The object to add, containing all fields.
    
            local typeIndexMap = typeMaps.types.resourceGroups -- Created automatically in resource.lua
    
            local index = typeIndexMap[key]
            if not index then
                --mj:error("Attempt to add resource group type that isn't in typeIndexMap:", key)
            else
                if resource.groups[key] then
                    --mj:warning("Overwriting resource group type:", key)
                    --mj:log(debug.traceback())
                end
        
                objectType.key = key
                objectType.index = index
                typeMaps:insert("resourceGroup", resource.groups, objectType)
    
                -- Recache the type maps
                -- resource.validTypes = typeMaps:createValidTypesArray("resource", resource.types)
                createGroupHashesForBuiltInTypes()
            end
    
            return index
        end

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