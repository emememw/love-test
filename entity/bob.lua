local Bob = {}

local TextureManager = require("graphics.texturemanager")
local EntityManager = require("entity.entitymanager")
local AnimationManager = require("animation.animationmanager")
local AiManager = require("ai.aimanager")

function Bob.create(gridX, gridY)
	local instance = require("entity.turnbasedentity").create(gridX, gridY, TextureManager.getTexture("sprites", 10, 3))

	instance.turnMarker = 0

	instance.test = false
	instance.onUpdateSuper = instance.onUpdate

	function instance.onUpdate(delta)
			instance.onUpdateSuper(delta)
	end

	function instance.onTurn(turnCount)
		---if instance.turnMarker + 1 == turnCount then
			local pathNode = AiManager.pathTo(EntityManager.player.gridX, EntityManager.player.gridY, instance)
			if pathNode ~= nil then
				local direction = AiManager.chooseDirection(pathNode.gridX, pathNode.gridY, instance)
				if direction ~= nil then
					instance.moveGrid(direction)
					instance.turnMarker = turnCount
					AnimationManager.add(require("animation.testanimation").create(instance))
				end
			end
		---end
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
