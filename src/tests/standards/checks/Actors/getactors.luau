--!nocheck
--!nolint

return function()
	if not getfenv(0).getactors then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local found = false
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	for i, v in pairs(getactors()) do
		if v == actor then
			found = true
		end
	end

	if not found then
		return {
			status = 500,
			message = "Didn't find a game actor"
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
