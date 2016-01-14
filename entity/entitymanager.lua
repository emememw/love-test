local EntityManager = {}

EntityManager.entities = {}
EntityManager.turnBasedEntities = {}
EntityManager.player = {}

function EntityManager.add(entity)
  table.insert(EntityManager.entities, entity)
	if entity.turn ~= nil then
		table.insert(EntityManager.turnBasedEntities, entity)
	end
end

function EntityManager.entityAt(gridX, gridY)
	local result = nil
	if EntityManager.player.gridX == gridX and EntityManager.player.gridY == gridY then
		result = EntityManager.player
	else
		for key,value in pairs(EntityManager.entities) do
			if value.gridX == gridX and value.gridY == gridY then
				result = value
			end
		end
	end
	return result
end

function EntityManager.addPlayer(player)
	EntityManager.player = player
end

function EntityManager.update(delta)
	EntityManager.player.update(delta)
  for key,value in pairs(EntityManager.entities) do
    value.update(delta);
  end
end

function EntityManager.render()
	EntityManager.player.render()
  for key,value in pairs(EntityManager.entities) do
    value.render();
  end
end

return EntityManager
