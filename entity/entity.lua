local Entity = {};


function Entity.create(x, y, texture)
  local instance = {};

  instance.x = x
  instance.y = y

  instance.texture = texture

  function instance.onUpdate(delta)
  end

  function instance.move(direction, speed, delta)
    if direction == "right" then
      instance.x = instance.x + speed * delta
    elseif direction == "left" then
      instance.x = instance.x - speed * delta
    elseif direction == "down" then
      instance.y = instance.y + speed * delta
    else
      instance.y = instance.y - speed * delta
    end
  end

  function instance.update(delta)
    instance.onUpdate(delta);
  end

  function instance.render()
    instance.texture.draw(instance.x, instance.y);
  end

  return instance;

end

return Entity;
