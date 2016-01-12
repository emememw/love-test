local Texture = {};

local Config = require("config.config")

function Texture.create(image, quad, size)
  local instance = {}
  instance.image = image
  instance.quad = quad
	instance.size = size

  function instance.draw(x, y, rotation)
		if Config.debug then
			love.graphics.rectangle("line", x, y, size*Config.scale, size*Config.scale)
		end
    love.graphics.draw(instance.image, instance.quad, x, y, rotation, Config.scale);
  end

  return instance
end

return Texture;
