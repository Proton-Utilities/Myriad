--!nocheck
--!nolint

return function()
	local gameRefs = require("@gameRefs")

	if type(cansignalreplicate) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local valid = gameRefs.Baseplate.Touched
	local isReplicating = cansignalreplicate(valid)
	if type(isReplicating) ~= "boolean" then
		return {
			status = 500,
			message = "Return type is not a boolean",
		}
	end

	if isReplicating then
		return {
			status = 500,
			message = "Expected false for Baseplate Touched event",
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
