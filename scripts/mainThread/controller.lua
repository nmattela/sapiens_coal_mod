local mod = {
	loadOrder = 1,
}

local eventManager = mjrequire "hammerstone/event/eventManager"
local eventTypes = mjrequire "hammerstone/event/eventTypes"

function mod:onload(controller)
    local coal = mjrequire "nmattela/coal"
    eventManager:bind(eventTypes.init, coal.init)
end

return mod