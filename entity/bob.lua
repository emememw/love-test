local Bob = {}

local TextureManager = require("graphics.texturemanager")
local EntityManager = require("entity.entitymanager")

function Bob.create(gridX, gridY)
	local instance = require("entity.turnbasedentity").create(gridX, gridY, TextureManager.getTexture("sprites", 10, 3))

	instance.turnMarker = 0

	function instance.onTurn(turnCount)
		if instance.turnMarker + 2 == turnCount then
			instance.moveGrid("right")
			instance.turnMarker = turnCount
		end
	end

	function instance.onEntityBump(entity)
		print("bob: bump?")
		if entity == EntityManager.player then
			print("bob: bump!")
		end
	end

	return instance
end

return Bob
