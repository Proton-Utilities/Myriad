--!nocheck
--!nolint

return function()
	if not getfenv(0).getthreadidentity then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	if typeof(getthreadidentity()) ~= "number" then
		return {
			status = 500,
			message = "Did not return a number",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getidentity",
		"getthreadcontext"
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
