--!nocheck
--!nolint

--[[
	@deprecated This check is deprecated due to being unsafe
]]

return function()
	if not setfflag then
		return {
			status = 400,
			message = "Global not found",
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
		message = `Passed`,
	}
end
