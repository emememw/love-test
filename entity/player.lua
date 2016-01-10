local Player = {};

local TextureManager = require("graphics.texturemanager")

function Player.create()
  local instance = require("entity.entity").create(10, 10, TextureManager.getTexture("sprites", 5, 0))

  function instance.onUpdate(delta)
    local speed = 500;
    if love.keyboard.isDown("right") then
      instance.move("right", speed, delta)
    end
    if love.keyboard.isDown("left") then
      instance.move("left", speed, delta)
    end
    if love.keyboard.isDown("up") then
      instance.move("up", speed, delta)
    end
    if love.keyboard.isDown("down") then
      instance.move("down", speed, delta)
    end
  end

  return instance;
end

return Player;
