local AiManager = {}

local MapManager = require("map.mapmanager")
local Grid = require("libs.jumper.grid")
local Pathfinder = require("libs.jumper.pathfinder")

function AiManager.chooseDirection(gridX, gridY, entity)
	result = nil
	local directions = {}
	if gridX > entity.gridX then
		table.insert(directions, "right")
	elseif gridX < entity.gridX then
		table.insert(directions, "left")
	end
	if gridY > entity.gridY then
		table.insert(directions, "down")
	elseif gridY < entity.gridY then
		table.insert(directions, "up")
	end

	if next(directions) ~= nil then
		result = directions[math.random(#directions)]
	end

	return result
end

function AiManager.pathTo(gridX, gridY, entity)
	local result = nil

	local walkable = 0
	local grid = Grid(MapManager.currentMap.getCollisionMap())
	local finder = Pathfinder(grid, "JPS", walkable)
	local path = finder:getPath(entity.gridX, entity.gridY, gridX, gridY)

	if path and path._nodes[2] ~= nil then
		local pathNode = path._nodes[2]
		result = {
			gridX = pathNode:getX(),
			gridY = pathNode:getY()
		}
	end

	return result
end

return AiManager
