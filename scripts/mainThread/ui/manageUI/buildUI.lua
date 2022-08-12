local mod = {
	loadOrder = 1
}

-- Base
local constructable = mjrequire "common/constructable"

function mod:onload(buildUI)
	local super_createItemList = buildUI.createItemList
	buildUI.createItemList = function(self)
		super_createItemList(buildUI)

		table.insert(buildUI.itemList, constructable.types.charcoal.index)
		
	end
end

return mod