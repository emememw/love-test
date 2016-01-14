local Map = {}

local Tile = require("map.tile")
local TextureManager = require("graphics.texturemanager")
local Config = require("config.config")

function Map.create()
	local instance = {}
	local width = 10
	local height = 10
	instance.tiles = {}

	for x = 0, width-1, 1 do
		instance.tiles[x] = {}
    for y = 0, height-1, 1 do
			if x == 0 or y == 0 or x == width-1 or y == height-1 or (x == 4 and y == 4) then
				instance.tiles[x][y] = Tile.create(TextureManager.getTexture("sprites", 7, 4), false)
			else
				instance.tiles[x][y] = Tile.create(TextureManager.getTexture("sprites", 6, 1), true)
			end
		end
	end

	function instance.tileAt(gridX, gridY)
		return instance.tiles[gridX][gridY]
	end

	function instance.render()
		for x = 0, width-1, 1 do
    	for y = 0, height-1, 1 do
				local texture = instance.tiles[x][y].texture
				texture.draw(x*texture.size*Config.scale, y*texture.size*Config.scale)
			end
		end
	end

	return instance
end


return Map
