--!nocheck
--!nolint

return function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	if not getfenv(0).getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not Animate then
		return {
			status = 400,
			message = "Testing dependency not found. Try testing on 'a literal baseplate'",
		}
	end

	local enironment = getsenv(Animate)
	if not enironment.onSwimming or not typeof(enironment.onSwimming) == "function" then
		return {
			status = 500,
			message = "Global in test script wasn't found, or didn't return the right type",
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
