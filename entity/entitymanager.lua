local EntityManager = {}

EntityManager.entities = {}

function EntityManager.add(entity)
  table.insert(EntityManager.entities, entity)
end

function EntityManager.update(delta)
  for key,value in pairs(EntityManager.entities) do
    value.update(delta);
  end
end

function EntityManager.render()
  for key,value in pairs(EntityManager.entities) do
    value.render();
  end
end

return EntityManager
