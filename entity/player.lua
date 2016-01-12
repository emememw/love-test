local Player = {};

local TextureManager = require("graphics.texturemanager")
local TurnManager = require("gameplay.turnmanager")

function Player.create()
  local instance = require("entity.turnbasedentity").create(0, 0, TextureManager.getTexture("sprites", 5, 0))
	instance.turn = nil
	instance.onUpdateSuper = instance.onUpdate

  function instance.onUpdate(delta)
		instance.onUpdateSuper(delta)
		if not TurnManager.started then
			local playerTurnEnded = false
			local moveDirection = nil
    	if love.keyboard.isDown("right") then
				moveDirection = "right"
			elseif love.keyboard.isDown("left") then
      	moveDirection = "left"
    	elseif love.keyboard.isDown("up") then
      	moveDirection = "up"
    	elseif love.keyboard.isDown("down") then
      	moveDirection = "down"
    	end

			if moveDirection ~= nil then
				instance.moveGrid(moveDirection)
				playerTurnEnded = true
			end

			if playerTurnEnded then
				TurnManager.start()
			end

		end
  end

  return instance;
end

return Player
