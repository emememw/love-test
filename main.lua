local EntityManager = require("entity.entitymanager");
local TextureManager = require("graphics.texturemanager");


function love.load()
  love.graphics.setDefaultFilter("nearest")
  TextureManager.addSheet("sprites.png", "sprites", 16);
  EntityManager.add(require("entity.entity").create(0, 0, TextureManager.getTexture("sprites", 5, 0)));
  EntityManager.add(require("entity.player").create());
end

function love.draw()
  EntityManager.render();
end

function love.update(delta)
  EntityManager.update(delta);
end
