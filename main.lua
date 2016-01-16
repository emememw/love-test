local EntityManager = require("entity.entitymanager");
local TextureManager = require("graphics.texturemanager");
local MapManager = require("map.mapmanager")
local TurnManager = require("gameplay.turnmanager")
local AnimationManager = require("animation.animationmanager")


function love.load()
  love.graphics.setDefaultFilter("nearest")
  TextureManager.addSheet("sprites.png", "sprites", 16);
	EntityManager.add(require("entity.bob").create(2, 2));
	EntityManager.add(require("entity.bob").create(2, 3));
  EntityManager.addPlayer(require("entity.player").create(8, 8));
	MapManager.loadMap()
end

function love.draw()
	MapManager.render()
  EntityManager.render()
	AnimationManager.render()
end

function love.update(delta)
	TurnManager.update(delta)
  EntityManager.update(delta)
	AnimationManager.update(delta)
end
