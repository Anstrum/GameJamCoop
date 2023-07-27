local audio = {}

	audio.select = nil
	audio.changeOption = nil

	function audio.load()
		audio.select = love.sound.newSoundData("project/assets/menu/change-option.wav")
		audio.changeOption = love.sound.newSoundData("project/assets/menu/select.wav")
	end

	function audio.unload()
	end


	function audio.play(sound)
		if sound == "select" then
			love.audio.newSource(audio.select):play()
			return
		end
		if sound == "change-option" then
			love.audio.newSource(audio.changeOption):play()
			return
		end
	end


return audio