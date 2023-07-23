currentDt = 0

require("project/misc/inputs")

screen = {}
	screen.width = 800
	screen.height = 600
	screen.title = "Project starter"
	function screen.init()
		love.window.setMode(screen.width, screen.height)
		love.window.setTitle(screen.title)
	end

mouse = {}
	mouse.x = 0
	mouse.y = 0
	function mouse.update()
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()
	end

camera = {}
	camera.x = 0
	camera.y = 0
	camera.zoom = 1

logger = {}
	logger.logs = {}
	logger.isActive = false
	logger.currentMessage = nil
	logger.messageDuration = 0
	function logger.addLog(content, toPrint)
		local myText
		myText = os.date("%x").." - "..os.date("%X").." | "..content.."\n"
		table.insert(logger.logs, myText)
		if toPrint then
			logger.currentMessage = content
			logger.messageDuration = 2
		end
	end
	function logger.export()
		local file = io.open("debug.txt", "w+")
		io.output(file)

		for i = 1, #logger.logs do
			io.write(logger.logs[i])
		end

		io.close(file)
	end
	function logger.update(dt)
		if logger.currentMessage == nil then return end

		logger.messageDuration = logger.messageDuration - 2 * dt
		if logger.messageDuration < 0 then
			logger.messageDuration = 0
			logger.currentMessage = nil
		end
	end
	function logger.keypressed(key)
		if key == "f2" then
			logger.isActive = not logger.isActive
			logger.addLog("Logs activated: "..tostring(logger.isActive), true)
		end
	end
	function logger.draw()
		if logger.currentMessage ~= nil then
			colors.set(colors.log, logger.messageDuration)
			love.graphics.print(logger.currentMessage, 5, 5)
		end
	end

colors = {}
	function colors.set(color)
		love.graphics.setColor(color)
	end
	colors.red = {1, 0, 0, 1}
	colors.green = {0, 1, 0, 1}
	colors.blue = {0, 0, 1, 1}
	colors.white = {1, 1, 1, 1}
	colors.black = {0, 0, 0, 1}
	colors.log = {0, 1, 0.8}


fonts = {}
	fonts.folder = "project/assets/fonts/"
	fonts.title = nil
	fonts.buttonText = nil
	fonts.text = nil
	function fonts.init()
		fonts.title = love.graphics.newFont(fonts.folder.."flower.TTF", 26)
		fonts.bubbleText = love.graphics.newFont(fonts.folder.."bubbles.TTF", 20)
		fonts.buttonText = love.graphics.newFont(fonts.folder.."dungeon.ttf", 25)
		fonts.text = love.graphics.newFont(20)
		
		logger.addLog("all fonts initiated", false)
	end