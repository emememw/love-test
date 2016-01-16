local AnimationManager = {}

AnimationManager.animations = {}

function AnimationManager.update(delta)
	for key,value in pairs(AnimationManager.animations) do
		if not value.dead then
			value.update(delta)
		else
			AnimationManager.animations[key] = nil
		end
	end
end

function AnimationManager.render()
	for key,value in pairs(AnimationManager.animations) do
		value.render()
	end
end

function AnimationManager.add(animation)
	table.insert(AnimationManager.animations, animation)
end

function AnimationManager.remove(animation)
	animation.dead = true
end

return AnimationManager
