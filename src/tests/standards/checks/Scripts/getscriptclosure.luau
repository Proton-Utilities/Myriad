--!nocheck
--!nolint

return function()
	local cryptReference = require("dependencies/crypt/crypt.luau")
	if not getfenv(0).getscriptclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalScript = game.Players.LocalPlayer.Character:FindFirstChild("maybeisdtc")
	local closure = getscriptclosure(originalScript)

	if typeof(closure) ~= "function" then
		return {
			status = 500,
			message = "Expected a closure"
		}
	elseif closure() ~= "GOT A DROP ON THIS FLEXING FELLA" then
		return {
			status = 500,
			message = "Closure did not return the expected value"
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getscriptfunction"
	})

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
