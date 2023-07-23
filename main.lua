io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("project/misc/generalFunctions")
require("project/game-manager")

function love.load()
	screen.init()
	fonts.init()

	gameManager.setState("menu")
	
	logger.addLog("Load complete...", false)
end

function love.update(dt)
	currentDt = dt
	mouse.update()

	gameManager.update(dt)

	logger.update(dt)
end

function love.quit()
	logger.export()
end

function love.keypressed(key)
	logger.keypressed(key)
	gameManager.keypressed(key)
end

function love.mousepressed(x, y, click)
end

function love.draw()
	colors.set(colors.white)

	gameManager.draw()

	logger.draw()
end
