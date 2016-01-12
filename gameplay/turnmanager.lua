local TurnManager = {}

local EntityManager = require("entity.entitymanager")

TurnManager.turnCount = 1
TurnManager.started = false
TurnManager.waiting = false
TurnManager.turnTimeout = 0.2
TurnManager.waitCounter = 0

function TurnManager.update(delta)
	if TurnManager.waiting then
		TurnManager.waitCounter = TurnManager.waitCounter + delta
		print(TurnManager.waitCounter)
		if TurnManager.waitCounter >= TurnManager.turnTimeout then
			TurnManager.waiting = false
			TurnManager.started = false
			TurnManager.waitCounter = 0
		end
	end
end

function TurnManager.start()
	TurnManager.started = true
	for key,value in pairs(EntityManager.turnBasedEntities) do
		value.onTurn(TurnManager.turnCount)
	end
	TurnManager.turnCount = TurnManager.turnCount + 1
	TurnManager.waiting = true
end

return TurnManager
