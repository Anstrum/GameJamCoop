local UI = {}


	UI.start = "Start"
	UI.quit = "Quit"
	UI.startButton = nil
	UI.quitButton = nil
	UI.buttonSelected = nil
	UI.hoverScale = 1.1

function UI.load()
	UI.start = love.graphics.newText(fonts.buttonText, UI.start)
	UI.quit = love.graphics.newText(fonts.buttonText, UI.quit)

	UI.startButton = love.graphics.newImage("project/assets/menu/button-light.png")
	UI.quitButton = love.graphics.newImage("project/assets/menu/button-dark.png")
end
function UI.unload()
end


function UI.update(dt)
end

function UI.keypressed(key)
	if key == "p" then
		if inputs.keyboardLayout == "AZERTY" then
			inputs.keyboardLayout = "QWERTY"
			menu.audio.play("change-option")
		else
			inputs.keyboardLayout = "AZERTY"
			menu.audio.play("change-option")
		end
	end

		-- UI selection --

	if inputs.check(key) == "left" then
		UI.buttonSelected = "start"
		menu.audio.play("select")
	end
	if inputs.check(key) == "right" then
		UI.buttonSelected = "quit"
		menu.audio.play("select")
	end

		-- UI validation --
	if inputs.check(key) == "space" or inputs.check(key) == "return" then
		if UI.buttonSelected == "start" then
			menu.startGame()
		end
		if UI.buttonSelected == "quit" then
			menu.quit()
		end
	end
end

function UI.draw()
		-- buttons --
	colors.set(colors.white)
	if UI.buttonSelected == "start" then
		love.graphics.draw(UI.startButton, screen.width / 4 - (UI.startButton:getWidth() * UI.hoverScale) / 2, screen.height - (UI.start:getHeight() * UI.hoverScale) * 4 - UI.startButton:getHeight() * UI.hoverScale / 4, 0, UI.hoverScale, UI.hoverScale)
		colors.set(colors.black)
		love.graphics.draw(UI.start, screen.width / 4 - (UI.start:getWidth() * UI.hoverScale) / 2, screen.height - (UI.start:getHeight() * UI.hoverScale) * 4, 0, UI.hoverScale, UI.hoverScale)
	else
		love.graphics.draw(UI.startButton, screen.width / 4 - UI.startButton:getWidth() / 2, screen.height - UI.start:getHeight() * 4 - UI.startButton:getHeight() / 4)
		colors.set(colors.black)
		love.graphics.draw(UI.start, screen.width / 4 - UI.start:getWidth() / 2, screen.height - UI.start:getHeight() * 4)
	end

	colors.set(colors.white)
	if UI.buttonSelected == "quit" then
		love.graphics.draw(UI.quitButton, screen.width / 4 * 3 - (UI.quitButton:getWidth() * UI.hoverScale) / 2, screen.height - (UI.quit:getHeight() * UI.hoverScale) * 4 - UI.quitButton:getHeight() * UI.hoverScale / 4, 0, UI.hoverScale, UI.hoverScale)
		love.graphics.draw(UI.quit, screen.width / 4 * 3 - (UI.quit:getWidth() * UI.hoverScale) / 2, screen.height - (UI.quit:getHeight() * UI.hoverScale) * 4, 0, UI.hoverScale, UI.hoverScale)
	else
		love.graphics.draw(UI.quitButton, screen.width / 4 * 3 - UI.quitButton:getWidth() / 2, screen.height - UI.quit:getHeight() * 4 - UI.quitButton:getHeight() / 4)
		love.graphics.draw(UI.quit, screen.width / 4 * 3 - UI.quit:getWidth() / 2, screen.height - UI.quit:getHeight() * 4)
	end
end


return UI