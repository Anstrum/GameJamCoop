local anims = {}

anims.dayIdle = nil
anims.nightIdle = nil
anims.dayWalk = {}
anims.nightWalk = {}

anims.current = "walk"
anims.timePerFrame = 0.15
anims.tick = 0
anims.currentFrame = 1
anims.frameCount = 4

function anims.load()
	anims.dayIdle = love.graphics.newImage("project/assets/player/player_day_idle.png")
	anims.nightIdle = love.graphics.newImage("project/assets/player/player_night_idle.png")

	local dayWalk = love.graphics.newImage("project/assets/player/player_day_walk.png")
	local nightWalk = love.graphics.newImage("project/assets/player/player_night_walk.png")

	for i = 1, 4 do
		table.insert(anims.dayWalk, love.graphics.newQuad((i - 1) * 11, 0, 11, 17, dayWalk))		-- day walk --
		table.insert(anims.nightWalk, love.graphics.newQuad((i - 1) * 11, 0, 11, 17, nightWalk))	-- night walk --
	end
end


function anims.unload()
end


function anims.update(dt)
	anims.tick = anims.tick + dt
	if anims.tick > anims.timePerFrame then
		anims.currentFrame = anims.currentFrame + 1
		anims.tick = 0
		if anims.currentFrame > anims.frameCount then
			anims.currentFrame = 1
		end
		print("frame changed, now: "..anims.currentFrame)
	end
end


function anims.draw()
	local dayWalk = love.graphics.newImage("project/assets/player/player_day_walk.png")
	love.graphics.draw(dayWalk, anims.dayWalk[anims.currentFrame], 10, 10, 0, 3, 3)
	love.graphics.draw(dayWalk, anims.dayWalk[anims.currentFrame], 100, 10, 0, 3.5, 3.5)
end


return anims