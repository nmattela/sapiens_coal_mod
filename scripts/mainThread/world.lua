local mod = {
    loadOrder = 1
}

function mod:onload(world)
    superTogglePause = world.togglePause

    world.togglePause = function(self)
        mj:log("You can run any logic you want here :)")

        superTogglePause(self)
end

return mod