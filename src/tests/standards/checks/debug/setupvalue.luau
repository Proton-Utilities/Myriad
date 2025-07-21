--!nocheck
--!nolint

return function()
	if not debug or not debug.setupvalue then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"setupvalue"
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
