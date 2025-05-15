--!nocheck
--!nolint

return function()
	if not getfenv(0).debug or not getfenv(0).debug.getstack then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getstack"
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
