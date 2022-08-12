local mod = {
    loadOrder = 1
}

local typeMaps = mjrequire "common/typeMaps"
local gameObject = mjrequire "common/gameObject"
local resource = mjrequire "common/resource"

function mod:onload(fuel)
    local super_mjInit = fuel.mjInit

    fuel.mjInit = function(self)
        super_mjInit()

        fuel.groupsByObjectTypeIndex.[gameObject.types.campfire.index].resources[resource.types.charcoal.index] = { fuelAddition = 20.0 }
        fuel.groupsByObjectTypeIndex.[gameObject.types.torch.index].resource[resource.types.charcoal.index]     = { fuelAddition = 20.0 }
        fuel.groupsByObjectTypeIndex.[gameObject.types.brickKiln.index].resource[resource.types.charcoal.index] = { fuelAddition = 20.0 }
        


    end
end

return mod