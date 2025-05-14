--!nocheck
--!nolint

return function()
	local env = getfenv(0)

	if not env.newcclosure then
		return {
			status = 400,
			message = "Global not found",
		}
    elseif not env.iscclosure then
        return {
            status = 500,
            message = "iscclosure required to test newcclosure",
        }
	end
        
    local originalFunction = function(...)
        return ...
    end
    local cFunction = newcclosure(originalFunction)

    if iscclosure(originalFunction) then
        return {
            status = 500,
            message = "iscclosure returned true a lua closure",
        }
    elseif not iscclosure(cFunction) then
        return {
            status = 500,
            message = "Returned false for a C closure",
        }
    elseif cFunction(1) ~= 1 then
        return {
            status = 500,
            message = "C closure did not return the expected value",
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
		message = "Passed",
	}
end