local TurnBasedEntity = {}

local Config = require("config.config")

function TurnBasedEntity.create(x, y, texture)
	local instance = require("entity.entity").create(x, y, texture)

	instance.gridX = math.floor(x/Config.gridSize)
	instance.gridY = math.floor(y/Config.gridSize)
	instance.speed = 400

	function instance.moveGrid(direction)
		if direction == "right" then
			instance.gridX = instance.gridX + 1
    elseif direction == "left" then
      instance.gridX = instance.gridX - 1
    elseif direction == "down" then
      instance.gridY = instance.gridY + 1
    else
      instance.gridY = instance.gridY - 1
    end
	end

	function instance.onTurn(turnCount)
	end

	function instance.turn(turnCount)
		instance.onTurn(turnCount)
	end

	function instance.onUpdate(delta)
		local gridX = math.floor((instance.x+Config.gridSize/2) / Config.gridSize)
		local gridY = math.floor((instance.y+Config.gridSize/2) / Config.gridSize)

		if gridX < instance.gridX then
			instance.move("right", instance.speed, delta)
		elseif gridX > instance.gridX then
			instance.move("left", instance.speed, delta)
		else
			instance.x = instance.gridX * Config.gridSize
		end

		if gridY < instance.gridY then
			instance.move("down", instance.speed, delta)
		elseif gridY > instance.gridY then
			instance.move("up", instance.speed, delta)
		else
			instance.y = instance.gridY * Config.gridSize
		end
	end

	return instance
end

return TurnBasedEntity
