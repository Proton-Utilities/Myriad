--!nocheck
--!nolint

return function()
	if type(replicatesignal) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local s, err = pcall(function()
		replicatesignal(Instance.new("ProximityPrompt").Triggered, game:GetService("Players").LocalPlayer)
	end)

	if not s and not string.find(string.lower(tostring(err)), "replicate") then
		return {
			status = 0,
			message = `Ambiguous error: {err}`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})
	
	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
