local mod = {
    loadOrder = 1
}

function mod:onload(model)
    model.remapModels.dirt.coal = {
        dirt = "coal"
    }

    model.remapModels.dirt.charcoal = {
        dirt = "charcoal"
    }

    
end

return mod