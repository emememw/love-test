local TurnBasedEntity = {}

local Config = require("config.config")
local MapManager = require("map.mapmanager")
local EntityManager = require("entity.entitymanager")

function TurnBasedEntity.create(gridX, gridY, texture)
	local instance = require("entity.entity").create(gridX*Config.gridSize, gridY*Config.gridSize, texture)

	instance.gridX = gridX
	instance.gridY = gridY
	instance.speed = 400

	function instance.moveGrid(direction)
		local validMove = false
		local newGridX = instance.gridX
		local newGridY = instance.gridY

		if direction == "right" then
			newGridX = newGridX + 1
    elseif direction == "left" then
      newGridX = newGridX - 1
    elseif direction == "down" then
      newGridY = newGridY + 1
    else
      newGridY = newGridY - 1
    end

		if MapManager.currentMap.tileAt(newGridX, newGridY).accessible then
			validMove = true
		end

		local entityAtPosition = EntityManager.entityAt(newGridX, newGridY)
		if entityAtPosition ~= nil then
			if validMove then
				validMove = false
			end
			instance.onEntityBump(entityAtPosition)
		end


		if validMove then
			instance.gridX = newGridX
			instance.gridY = newGridY
		end

	end

	function instance.onTurn(turnCount)
	end

	function instance.onEntityBump(entity)
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
