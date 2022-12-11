local mod = {
    loadOrder = 1
}

local typeMaps = mjrequire "common/typeMaps"
local gameObject = mjrequire "common/gameObject"
local resource = mjrequire "common/resource"
local locale = mjrequire "common/locale"

function mod:onload(fuel)

    mj:log("Coal mod in fuel.lua: Adding fuel types...")

    fuel:addFuelType("charcoal", {
        campfire = 20.0,
        kiln = 20.0,
        torch = 20.0
    })

    mj:log("Coal mod in fuel.lua: Fuel types added!")

end

return mod