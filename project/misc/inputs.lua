-- the [1] is qwerty and the [2] is azerty

inputs = {}
	inputs.keyboardLayout = "QWERTY"

	inputs.upQ = "w"
	inputs.upA = "z"

	inputs.leftQ = "a"
	inputs.leftA = "q"

	inputs.downQ = "s"
	inputs.downA = "s"

	inputs.rightQ = "d"
	inputs.rightA = "d"

	inputs.space = "space"
	inputs.enter = "return"

function inputs.check(key)
	if inputs.keyboardLayout == "QWERTY" then
		if key == inputs.upQ then return "up" end
		if key == inputs.leftQ then return "left" end
		if key == inputs.downQ then return "down" end
		if key == inputs.rightQ then return "right" end
		if key == inputs.space then return "space" end
		if key == inputs.enter then return "return" end

	else
		if key == inputs.upA then return "up" end
		if key == inputs.leftA then return "left" end
		if key == inputs.downA then return "down" end
		if key == inputs.rightA then return "right" end
		if key == inputs.space then return "space" end
		if key == inputs.enter then return "return" end
	end
end