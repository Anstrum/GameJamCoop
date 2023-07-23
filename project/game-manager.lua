gameManager = {}

	menu = require("project/menu/menu")
	-- game = require("game")

	gameManager.currentState = "none"

	function gameManager.setState(state)
		if state == "menu" then
			if gameManager.currentState == "game" then
				gameManager.unload("game")
				gameManager.currentState = "game"
			end
			if gameManager.currentState == "none" then
				gameManager.currentState = "menu"
			end
		end
		gameManager.load()
	end


	function gameManager.load()
		if gameManager.currentState == "menu" then
			menu.load()	
		end
		if gameManager.currentState == "game" then
			-- game.load()	
		end
	end
	function gameManager.unload(state)
		if state == "menu" then
			menu.unload()
		end
		if state == "game" then
			-- game.unload()
		end
	end


	function gameManager.update(dt)
	end

	function gameManager.keypressed(key)
		menu.keypressed(key)
	end

	function gameManager.draw()
		menu.draw()
	end
