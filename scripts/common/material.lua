local mod = {
    loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

function mod:onload(material)
    mj:insertIndexed(material.types, {
        key = "charcoal",
        color = vec3(1, 1, 1),
        roughness = 1.0,
        metal = 0.0
    })
end

return mod