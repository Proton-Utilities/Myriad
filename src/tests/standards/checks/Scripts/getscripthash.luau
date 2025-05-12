--!nocheck
--!nolint

return function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	if not getfenv(0).getscripthash then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not Animate then
		return {
			status = 400,
			message = "Testing dependency 'Animate' not found. Try testing on 'a literal baseplate'",
		}
	end

	local noBytecodeScript = Instance.new("LocalScript")
	local animateSuccess, animateReturned = pcall(function()
		return getscripthash(Animate)
	end)
	local noBytecodeSuccess, noBytecodeReturned = pcall(function()
		return getscripthash(hashNoBytecode)
	end)

	if not animateSuccess then
		return {
			status = 500,
			message = "Failed to get bytecode of 'Animate'",
		}
	elseif not noBytecodeSuccess then
		return {
			status = 500,
			message = "Failed to get script w/ no bytecode. Errored instead of returning nil.",
		}
	elseif typeof(animateReturned) ~= "string" then
		return {
			status = 500,
			message = "Did not return a hash string",
		}
	elseif hashNoBytecode ~= nil then
		return {
			status = 500,
			message = "A script with no bytecode returned non-nil data",
		}
	end

	local newAnimate = Animate:Clone()
	local oldSource = Animate.Source

	return {
		status = 200,
		message = `Passed`,
	}
end
