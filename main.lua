io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("generalFunctions")

function love.load()
	screen.init()
	logger.addLog("Load complete...", false)
end

function love.update(dt)
	currentDt = dt
	mouse.update()
	logger.update(dt)
end

function love.quit()
	logger.export()
end

function love.keypressed(key)
	logger.keypressed(key)
end

function love.mousepressed(x, y, click)
end

function love.draw()
	colors.set(colors.white)
	logger.draw()
end
