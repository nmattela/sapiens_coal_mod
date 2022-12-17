local mod = {
    loadOrder = 1
}

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

function mod:onload(material)
    mj:insertIndexed(material.types, {
        key = "charcoal",
        color = vec3(0,0,0),
        roughness = 1.1,
        metal = 1.1,
        colorB = vec3(0,0,0),
        roughnessB = 1.1 * 0.9,
        metalB = 1.1
    })

    mj:insertIndexed(material.types, {
        key ="coal",
        color = vec3(0,0,0),
        roughness = 1.1,
        metal = 1.1,
        colorB = vec3(0,0,0),
        roughnessB = 1.1 * 0.9,
        metalB = 1.1
    })
end

return mod