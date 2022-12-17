local mod = {
    loadOrder = 1
}

function mod:onload(model)
    model.remapModels.dirt.coal = {
        dirt = "coal"
    }

    
end

return mod