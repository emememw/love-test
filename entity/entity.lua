local Entity = {};

function Entity.create()
  local instance = {};

  instance.x = 400;

  instance.y = 200;

  function instance.test(delta)
    instance.x = instance.x + 100 * delta;
  end

  function instance.update(delta, callbackFunction)
    instance.test(delta);
    if instance.x > 800 then
      instance.x = 0;
      callbackFunction()
    end
  end

  return instance;

end

return Entity;
