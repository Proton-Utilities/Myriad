--!nocheck
--!nolint

return function()
	if not getfenv(0).setscriptable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")

	setscriptable(originalPart, "BottomParamA", true)
	if not originalPart.BottomParamA then
		return {
			status = 500,
			message = "BottomParamA not accessible after being set as scriptable",
		}
	end

	setscriptable(originalPart, "BottomParamA", false)
	if pcall(function() local _ = originalPart.BottomParamA end) then
		return {
			status = 500,
			message = "BottomParamA accessible after being set as unscriptable",
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
