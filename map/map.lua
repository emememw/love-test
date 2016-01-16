local Map = {}

local Tile = require("map.tile")
local TextureManager = require("graphics.texturemanager")
local Config = require("config.config")

function Map.create()
	local instance = {}
	instance.width = 10
	instance.height = 10
	instance.tiles = {}
	instance.collisionMap = nil

	for x = 0, instance.width-1, 1 do
		instance.tiles[x] = {}
    for y = 0, instance.height-1, 1 do
			if x == 0 or y == 0 or x == instance.width-1 or y == instance.height-1 or (x == 4 and y == 4) then
				instance.tiles[x][y] = Tile.create(TextureManager.getTexture("sprites", 7, 4), false)
			else
				instance.tiles[x][y] = Tile.create(TextureManager.getTexture("sprites", 6, 1), true)
			end
		end
	end

	function instance.getCollisionMap()
		local result = instance.collisionMap
		if result == nil then
			result = {}
			for x = 0, instance.width-1, 1 do
				result[x] = {}
    		for y = 0, instance.height-1, 1 do
					if instance.tiles[x][y].accessible then
						result[x][y] = 0
					else
						result[x][y] = 1
					end
				end
			end
			instance.collisionMap = result
		end
		return result
	end

	function instance.tileAt(gridX, gridY)
		return instance.tiles[gridX][gridY]
	end

	function instance.render()
		for x = 0, instance.width-1, 1 do
    	for y = 0, instance.height-1, 1 do
				local texture = instance.tiles[x][y].texture
				texture.draw(x*texture.size*Config.scale, y*texture.size*Config.scale)
			end
		end
	end

	return instance
end


return Map
