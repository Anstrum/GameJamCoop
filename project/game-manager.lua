gameManager = {}

	menu = require("project/menu/menu")
	game = require("project/game/game")

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
		if state == "game" then
			if gameManager.currentState == "menu" then
				gameManager.unload("game")
				gameManager.currentState = "game"
			else
				return
			end
		end
		gameManager.load()
	end


	function gameManager.load()
		if gameManager.currentState == "menu" then
			menu.load()	
		end
		if gameManager.currentState == "game" then
			game.load()	
		end
	end
	function gameManager.unload(state)
		if state == "menu" then
			menu.unload()
		end
		if state == "game" then
			game.unload()
		end
	end

	function gameManager.update(dt)
		if gameManager.currentState == "game" then
			game.update(dt)
		end
	end

	function gameManager.keypressed(key)
		
		if gameManager.currentState == "menu" then
			menu.keypressed(key)
		end
		if gameManager.currentState == "game" then
			game.keypressed(key)
		end
	end

	function gameManager.draw()
		if gameManager.currentState == "menu" then
			menu.draw()
		end
		if gameManager.currentState == "game" then
			game.draw()
		end
	end
