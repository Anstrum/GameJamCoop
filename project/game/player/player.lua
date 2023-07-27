local player = {}

isNight = false

	player.anims = require("project/game/player/anims")

function player.load()
	player.anims.load()
end

function player.unload()
	player.anims.unload()
end


function player.update(dt)
	player.anims.update(dt)
end

function player.keypressed(key)
	if key == "tab" then
		isNight = not isNight
	end
end

function player.draw()
	player.anims.draw()
end



return player