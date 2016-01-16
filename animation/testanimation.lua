local TestAnimation = {}

local TurnManager = require("gameplay.turnmanager")
local Config = require("config.config")

function TestAnimation.create(entity)
	local instance = require("animation.animation").create()

	local timer = 0;

	function instance.update(delta)

		if timer < 0.2 then
			TurnManager.paused = true
			timer = timer + delta

		else
			instance.dead = true
			TurnManager.paused = false
		end

	end

	function instance.render()
		if not instance.dead then
			love.graphics.print('Animation test!', 400, 300)
		end
	end

	return instance
end

return TestAnimation
