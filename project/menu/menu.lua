local menu = {}

	menu.audio = require("project/menu/menu-audio")
	menu.ui = require("project/menu/menu-ui")

	menu.title = "Undecided Title"

	menu.layoutText = "Current keyboard Layout:"
	menu.azerty = "AZERTY"
	menu.qwerty = "QWERTY"

	menu.loaded = false


function menu.startGame()
	gameManager.setState("game")
end

function menu.quit()
	love.event.quit()
end



function menu.load()
	if menu.loaded then return end

	menu.layoutText = love.graphics.newText(fonts.text, menu.layoutText)
	menu.azerty = love.graphics.newText(fonts.bubbleText, menu.azerty)
	menu.qwerty = love.graphics.newText(fonts.bubbleText, menu.qwerty)
	menu.title = love.graphics.newText(fonts.title, menu.title)

	menu.audio.load()
	menu.ui.load()

	menu.loaded = true
	logger.addLog("menu loaded", false)
end


function menu.unload()
	-- menu.loaded = false
	menu.ui.unload()
	menu.audio.unload()
	logger.addLog("menu unloaded", false)
end



function menu.keypressed(key)
	menu.ui.keypressed(key)
end

function menu.draw()

	-- keyboard layout text --
	colors.set(colors.white)
	love.graphics.draw(menu.layoutText, screen.width / 2 - menu.layoutText:getWidth() / 2, screen.height / 2 - menu.layoutText:getHeight() - 5)

	colors.set(colors.green)
	if inputs.keyboardLayout == "AZERTY" then
		love.graphics.draw(menu.azerty, screen.width / 2 - menu.azerty:getWidth() / 2, screen.height / 2 + 5)
	else
		love.graphics.draw(menu.qwerty, screen.width / 2 - menu.azerty:getWidth() / 2, screen.height / 2 + 5)
	end

	-- title text --
	colors.set(colors.white)
	love.graphics.draw(menu.title, screen.width / 2 - menu.title:getWidth() / 2, menu.title:getHeight() / 2)

	menu.ui.draw()

	-- colors.set(colors.blue)
	-- love.graphics.rectangle("fill", 10, 10, 192, 48)
end


return menu