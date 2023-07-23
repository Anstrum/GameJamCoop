local game = {}

game.player = require("project/game/player")

function game.load()
	game.player.load()
end

function game.unload()
	game.player.unload()
end

function game.update(dt)
	game.player.update(dt)
end

function game.keypressed(key)
	game.player.keypressed(key)
end

function game.draw()
	game.player.draw()
end

return game