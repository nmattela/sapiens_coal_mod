local mod = {
	loadOrder = 1,
}

local eventManager = mjrequire "hammerstone/event/eventManager"
local eventTypes = mjrequire "hammerstone/event/eventTypes"

function mod:onload(controller)
	local sapiensPlusPlus = mjrequire "sapiens-pp/sapiensPlusPlus"
	eventManager:bind(eventTypes.init, sapiensPlusPlus.init)
	eventManager:bind(eventTypes.worldLoad, sapiensPlusPlus.worldinit)
end

return mod