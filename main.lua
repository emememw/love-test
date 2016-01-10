
local test = require("entity.entity").create();
test.x = 100;

local test2 = require("entity.player").create();
test2.x = 400;
test2.y = 400;

function love.load()
end

function love.draw()
  love.graphics.print("____________", test.x, test.y);
  love.graphics.print("hello world2", test2.x, test2.y);
end

function love.update(delta)
  test.update(delta, callback);
  test2.update(delta, callback);
end

function callback()
  print("wow");
end
