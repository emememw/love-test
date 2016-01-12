local MapManager = {}

MapManager.currentMap = nil

function MapManager.loadMap()
	MapManager.currentMap = require("map.map").create()
end

function MapManager.render()
	MapManager.currentMap.render()
end

return MapManager
