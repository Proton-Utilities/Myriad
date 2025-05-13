--!nocheck
--!nolint

return function()
	if not getfenv(0).rconsoleerr then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 500,
			message = `Alias not found: {failedIndex}`,
		}
	end
	
	return {
		status = 200,
		message = `Passed`,
	}
end
