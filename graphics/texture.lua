local Texture = {};

local Config = require("config.config")

function Texture.create(image, quad)
  local instance = {}
  instance.image = image
  instance.quad = quad

  function instance.draw(x, y, rotation)
    love.graphics.draw(instance.image, instance.quad, x, y, rotation, Config.scale);
  end

  return instance
end

return Texture;
