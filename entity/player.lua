local Player = {};

function Player.create()
  local instance = require("entity.entity").create();

  function instance.test(delta)
    instance.x = instance.x + 1000 * delta;
  end

  return instance;
end

return Player;
