--!nocheck
--!nolint

return function()
	if not getfenv(0).mouse1release then
		return {
			status = 400,
			message = "Global not found",
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
