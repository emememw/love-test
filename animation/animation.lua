local Animation = {}

function Animation.create()
	local instance = {}

	instance.dead = false

	function instance.update(delta)
	end

	function instance.render()
	end

	return instance
end

return Animation
