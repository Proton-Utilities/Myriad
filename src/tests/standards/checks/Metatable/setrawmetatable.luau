--!nocheck
--!nolint

return function()
	if not getfenv(0).setrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalObject = setmetatable({}, {
		__index = function()
			return false
		end,
		__metatable = "Locked",
	})
	local returnedObject = setrawmetatable(originalObject, {
		__index = function()
			return true
		end,
	})

	if not originalObject then
		return {
			status = 500,
			message = "Original object not given",
		}
	elseif originalObject.MYRI ~= true then
		return {
			status = 500,
			message = "Return function gave true, MYRI not found",
		}
	elseif not returnedObject then
		return {
			status = 500,
			message = "Returned object not given",
		}
	elseif returnedObject ~= originalObject then
		return {
			status = 500,
			message = "Returned object isn't same as original",
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
