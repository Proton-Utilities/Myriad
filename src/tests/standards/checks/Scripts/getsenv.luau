--!nocheck
--!nolint

return function()
	local indexedAnimate, Animate = pcall(function() return game.Players.LocalPlayer.Character.Animate end)
	if not getfenv(0).getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedAnimate then
		return {
			status = 401,
			message = "Testing dependency 'Animate' not found. Try testing on 'a literal baseplate'",
		}
	end

	local enironment = getsenv(Animate)
	if not enironment.onSwimming or not typeof(enironment.onSwimming) == "function" then
		return {
			status = 500,
			message = "Global in test script wasn't found, or didn't return the right type",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
