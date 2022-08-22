local mod = {
    loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

function mod:onload(material)
    mj:insertIndexed(material.types, {
        key = "charcoal",
        color = vec3(0.19,0.14,0.05) * 0.8,
        roughness = 1.0,
        metal = 0.0
    })
end

return mod