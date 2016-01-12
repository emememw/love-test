local EntityManager = require("entity.entitymanager");
local TextureManager = require("graphics.texturemanager");
local MapManager = require("map.mapmanager")
local TurnManager = require("gameplay.turnmanager")



function love.load()
  love.graphics.setDefaultFilter("nearest")
  TextureManager.addSheet("sprites.png", "sprites", 16);
	-- EntityManager.add(require("entity.entity").create(0, 0, TextureManager.getTexture("sprites", 5, 0)));
  EntityManager.addPlayer(require("entity.player").create());
	MapManager.loadMap()
end

function love.draw()
	MapManager.render()
  EntityManager.render();
end

function love.update(delta)
	TurnManager.update(delta);
  EntityManager.update(delta);
end
