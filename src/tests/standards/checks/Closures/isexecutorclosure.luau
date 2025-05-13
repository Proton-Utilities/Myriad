--!nocheck
--!nolint

return function()
	if not getfenv(0).isexecutorclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end

	if not isexecutorclosure(isexecutorclosure)	then
		return {
			status = 500,
			message = "Failed to identify an executor closure",
		}
	elseif not isexecutorclosure(luaClosure) then
		return {
			status = 500,
			message = "Did not identify an lua closure as an executor closure",
		}
	elseif isexecutorclosure(print) then
		return {
			status = 500,
			message = "Identified a lua standard closure as an executor closure",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"checkclosure",
		"isourclosure"
	})

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
