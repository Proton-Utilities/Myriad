--!nocheck
--!nolint

return function()
	if not getfenv(0).getfpscap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	if not typeof(getfpscap()) == "number" then
		return {
			status = 500,
			message = `Did not return a number`,
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
