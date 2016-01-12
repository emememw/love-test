local Tile = {}

function Tile.create(texture, accessible)
	local instance = {}
	instance.texture = texture
	instance.accessible = accessible
	return instance
end

return Tile
