local TurnManager = {}

local EntityManager = require("entity.entitymanager")

TurnManager.turnCount = 1
TurnManager.started = false
TurnManager.waiting = false
TurnManager.turnTimeout = 0.2
TurnManager.waitCounter = 0
TurnManager.paused = false

TurnManager.turnQueue = {}

function TurnManager.update(delta)
	if TurnManager.started and not TurnManager.paused then
		if next(TurnManager.turnQueue) ~= nil then
			local entity = table.remove(TurnManager.turnQueue)
			entity.onTurn(TurnManager.turnCount)
		end
		if next(TurnManager.turnQueue) == nil then
			if TurnManager.waitCounter < TurnManager.turnTimeout then
				TurnManager.waitCounter = TurnManager.waitCounter + delta
			else
				TurnManager.started = false
			end
		end
	end
end

function TurnManager.start()
	TurnManager.started = true
	for key,value in pairs(EntityManager.turnBasedEntities) do
			--- value.onTurn(TurnManager.turnCount)
			table.insert(TurnManager.turnQueue, value)
	end
	TurnManager.turnCount = TurnManager.turnCount + 1
	TurnManager.waitCounter = 0
end

return TurnManager
